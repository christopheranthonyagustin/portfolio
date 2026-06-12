using System;
using System.Collections.Generic;
using System.IO;
using System.IO.Ports;
using System.Linq;
using System.Text;
using System.Threading;
using System.Net;
using System.Web;
using FMSMsg.Properties;

namespace FMSMsg
{
    class Modem
    {
        public SerialPort hPort = null;
        private Service1 m_frmMain = null;
        private string m_strModem = "";
        private string m_strBuffer = "";

        /// <summary>
        /// class constructor
        /// </summary>
        public Modem(Service1 frmMain)
        {
            // get parent window
            m_frmMain = frmMain;
            m_strModem = Settings.Default.ModemPort;

            // check modem
            if (m_strModem.Contains("COM"))
            {
                // initialize sms modem port
                hPort = new SerialPort(m_strModem, Settings.Default.BaudRate);
                hPort.Handshake = Handshake.RequestToSend;
                hPort.RtsEnable = true;
                hPort.DtrEnable = true;
                hPort.WriteTimeout = 1000;
                hPort.ReadTimeout = 3000;
                hPort.DataReceived += new SerialDataReceivedEventHandler(hPort_DataReceived);
            }
        }

        /// <summary>
        /// opens/closes the serial port
        /// </summary>
        /// <param name="bConnect"></param>
        /// <returns></returns>
        public bool DoConnect(bool bConnect)
        {
            // check modem
            if (hPort == null)
                return bConnect;
            try
            {
                // check connect flag
                if (bConnect)
                {
                    // open port
                    if (!hPort.IsOpen)
                    {
                        // initialize modem
                        hPort.Open();
                        InitModem();
                    }
                }
                else
                {
                    // close port
                    if (hPort.IsOpen)
                        hPort.Close();
                }
            }
            catch { }
            return (hPort != null ? hPort.IsOpen : false);
        }

        /// <summary>
        /// hangs up the modem
        /// </summary>
        public void HangupModem()
        {
            // check connection
            if ((hPort != null) && hPort.IsOpen)
            {
                // hang up modem
                System.Threading.Thread.Sleep(2000);
                SendMessage("+++", 0, "\r");
                System.Threading.Thread.Sleep(2000);
                SendMessage("ATH", 10, "\r");
            }
        }

        /// <summary>
        /// initializes modem
        /// </summary>
        public void InitModem()
        {
            // check connection
            if ((hPort != null) && hPort.IsOpen)
            {
                // initialize modem
                SendMessage("AT&FE0", 5, "\r");
                SendMessage("AT+CMEE=1", 5, "\r");
                SendMessage("AT+CMGF=1", 5, "\r");
                SendMessage("AT+CNMI=1,1,0,0,0", 5, "\r");
            }
        }

        /// <summary>
        /// reads sms message from modem
        /// </summary>
        /// <param name="iIndex"></param>
        /// <returns></returns>
        public string ReadSms(int iIndex)
        {
            // check index
            string strRet = (SendMessage(iIndex == 0 ? "AT+CMGL=\"ALL\"" :
                String.Format("AT+CMGR={0}", iIndex), 60, "OK") ? m_strBuffer : "");

            // check modem
            if (m_strBuffer.Trim() == "")
            {
                // reset modem
                HangupModem();
                InitModem();
            }
            return strRet;
        }

        /// <summary>
        /// deletes sms
        /// </summary>
        /// <param name="iIndex"></param>
        public string DeleteSms(int iIndex)
        {
            // delete message
            SendMessage(String.Format("AT+CMGD={0}", iIndex), 10, "\r");
            return m_strBuffer;
        }

        /// <summary>
        /// sends sms notification
        /// </summary>
        /// <param name="strPhone"></param>
        /// <param name="strMessage"></param>
        public bool SendSms(string strPhone, string strMessage)
        {
            bool bSent = false;
            try
            {
                // check phone number
                if ((strPhone == "") || (strMessage.Trim() == "")) return bSent;
                string[] arrNums = strPhone.Split(",".ToCharArray());

                // check sms mode
                bool bPdu = strMessage.StartsWith("PDU~");
                if (hPort != null)
                {
                    // initialize sms mode
                    if (bPdu) strMessage = strMessage.Substring(strMessage.IndexOf("~") + 1);
                    SendMessage(String.Format("AT+CMGF={0}", bPdu ? "0" : "1"), 5, "\r");
                }

                // loop through recipients
                foreach (string strNum in arrNums)
                {
                    // check modem
                    if (hPort != null)
                    { 
                        // initialize sms-submit message
                        string strMsg = (bPdu ? ConvertToPdu(strNum, strMessage) : strMessage);
                        int iLen = (strMsg.Length / 2) - 1;
                        string strTemp = String.Format("AT+CMGS={0}\r{1}", (bPdu ? iLen.ToString() :
                            String.Format("\"{0}\"", strNum.Trim())), strMsg);

                        // loop through message lines
                        string[] arrLines = strTemp.Split("\r".ToCharArray());
                        foreach (string strLine in arrLines)
                        {
                            // write message line
                            if (SendMessage(strLine, 5, ">"))
                            {
                                // check response
                                if (!m_strBuffer.Contains(">"))
                                    break;
                            }
                            else break;
                        }

                        // send sms message
                        byte[] szBuffer = new byte[1] { 0x1A };
                        SendMessage(szBuffer, 10, "+CMGS");
                    }
                    else
                    {
                        // create web request
                        string strPost = String.Format("tar_num={0}&tar_msg={1}&tar_mode={2}",
                            HttpUtility.UrlEncode(strNum), HttpUtility.UrlEncode(strMessage), bPdu ? "pdu" : "text");
                        HttpWebRequest webRequest = (HttpWebRequest)WebRequest.Create(m_strModem);
                        webRequest.Timeout = 10000;
                        webRequest.Method = "POST";
                        webRequest.ContentType = "application/x-www-form-urlencoded";
                        webRequest.ContentLength = strPost.Length;

                        // send sms via web
                        StreamWriter fWriter = new StreamWriter(webRequest.GetRequestStream());
                        fWriter.Write(strPost);
                        fWriter.Close();

                        // wait for response
                        HttpWebResponse webResponse = (HttpWebResponse)webRequest.GetResponse();
                        using (StreamReader fReader = new StreamReader(webResponse.GetResponseStream()))
                        {
                            // get response
                            string strRet = fReader.ReadToEnd();
                            fReader.Close();
                        }
                    }

                    // message sent
                    bSent = true;
                }
            }
            catch { }
            return bSent;
        }

        /// <summary>
        /// converts plain text string to pdu format
        /// </summary>
        /// <param name="strCentre"></param>
        /// <param name="strPhone"></param>
        /// <param name="strMessage"></param>
        /// <returns></returns>
        private string ConvertToPdu(string strPhone, string strMessage)
        {
            // format phone number
            bool bUnknown = !strPhone.Contains("+");
            strPhone = strPhone.Trim("+".ToCharArray());

            // formate message in pdu format
            string strPdu = "00";                                           // length of message centre number (00 - implicit)
            strPdu += "01";                                                 // first octet for message deliver
            strPdu += "00";                                                 // tp message reference number
            strPdu += String.Format("{0:X2}", strPhone.Length);             // length of receiver phone number
            strPdu += (bUnknown ? "81" : "91");                             // 91 for international format, 81 for unknown
            strPdu += strPhone.ToSemiOctet();                               // recipient number in decimal half-octet
            strPdu += "00";                                                 // protocol identifier
            strPdu += "F6";                                                 // data coding scheme
            strPdu += String.Format("{0:X2}", strMessage.Length / 2);       // message length
            strPdu += strMessage;                                           // message body in octet
            return strPdu;
        }

        /// <summary>
        /// sends message to modem
        /// </summary>
        /// <param name="strMessage"></param>
        /// <param name="iWait"></param>
        public bool SendMessage(string strMessage, int iWait, string strResponse)
        {
            // send message
            return SendMessage(Encoding.ASCII.GetBytes(strMessage + "\r"), iWait, strResponse);
        }

        /// <summary>
        /// sends message to modem
        /// </summary>
        /// <param name="strMessage"></param>
        /// <param name="iWait"></param>
        /// <param name="strResponse"></param>
        private bool SendMessage(byte[] szBuffer, int iWait, string strResponse)
        {
            // check mode
            if (hPort == null) return false;
            m_strBuffer = "";
            try
            {
                // send message
                if (!hPort.IsOpen) return false;
                hPort.Write(szBuffer, 0, szBuffer.Length);

                // wait for response
                for (int i = 0; i < iWait; i++)
                {
                    // check response
                    if (strResponse != "")
                    {
                        // check terminator
                        if (m_strBuffer.Contains(strResponse))
                        {
                            // data received
                            m_strBuffer = m_strBuffer.Trim("\r\n".ToCharArray());
                            break;
                        }
                    }

                    // wait for a second
                    System.Threading.Thread.Sleep(500);
                }
            }
            catch { }

            // check error codes
            return CheckResponse();
        }

        /// <summary>
        /// checks response from modem
        /// </summary>
        /// <returns></returns>
        private bool CheckResponse()
        {
            // check error codes
            return ((m_strBuffer.Trim() != "") &&
                !m_strBuffer.Contains("NO CONNECT") &&
                !m_strBuffer.Contains("BUSY") &&
                !m_strBuffer.Contains("NO DIALTONE") &&
                !m_strBuffer.Contains("NO CARRIER") &&
                !m_strBuffer.Contains("ERROR"));
        }

        /// <summary>
        /// event handler when data is received from serial port.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void hPort_DataReceived(object sender, SerialDataReceivedEventArgs e)
        {
            try
            {
                // read data from port
                int iLen = hPort.BytesToRead;
                byte[] szData = new byte[iLen];
                hPort.Read(szData, 0, szData.Length);
                m_strBuffer += Encoding.ASCII.GetString(szData);

                // check if message notification
                if (m_strBuffer.Contains("+CMT") && m_strBuffer.Contains(","))
                {
                    // get message index
                    string strTemp = m_strBuffer.Substring(m_strBuffer.IndexOf("+CMT"));
                    string[] arrTemp = strTemp.Split(",".ToCharArray());
                    int iIndex = (arrTemp.Length > 1 ? Convert.ToInt32(arrTemp[1].Trim()) : 0);

                    // check modem sms
                    m_strBuffer = "";
                    m_frmMain.m_iReadIndex = iIndex;
                }
            }
            catch { }
        }
    }
}
