using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.NetworkInformation;
using System.Net.Sockets;
using System.Text;
using FMSWinSvc.Properties;
using HelperTools;

namespace FMSWinSvc
{
    class SocketServer
    {
        private Dictionary<string, SocketInfo> m_arrClients = new Dictionary<string, SocketInfo>();
        private Service1 m_frmMain = null;
        private Socket m_sockServer;
        private string m_strServerIP = "127.0.0.1";
        private int m_iPort = 9000;
        private int m_iType = 0;
        private string mLogFile = DateTime.Now.ToString("ddMMMyy") + "_logs.txt";
        private string mDeviceId = "";//[Dan:17Dec15]
        private string mDeviceIdSBS = "";//[King:17Dec15]

        /// <summary>
        /// class definition for client socket data
        /// </summary>
        public class SocketInfo
        {
            public Socket Socket { get; set; }
            public DateTime Timestamp { get; set; }
            public DateTime LastPing { get; set; }
            public DateTime LastData { get; set; }
            public int PingCount { get; set; }
            public string ID { get; set; }
            public string Name { get; set; }
            public byte[] m_szBuffer = new byte[1024];
            public string m_strBuffer = "";


            // class constructor
            public SocketInfo(Socket sockClient, string strID)
            {
                // initialize socket packet
                this.Socket = sockClient;
                this.ID = strID;
                this.Timestamp = DateTime.Now;
                this.LastPing = DateTime.Now;
                this.LastData = DateTime.Now;
                this.PingCount = 0;
            }
        }

        /// <summary>
        /// class constructor
        /// </summary>        
        public SocketServer(Service1 frmMain, int iPort, int iType)
        {
            // initialize class
            m_frmMain = frmMain;
            m_iPort = iPort;
            m_iType = iType;
        }

        /// <summary>
        /// opens/closes the server socket
        /// </summary>
        /// <param name="bStart"></param>
        /// <returns></returns>
        public bool RunServer(bool bStart)
        {
            try
            {
                // check start flag
                if (bStart)
                {
                    // create server socket
                    m_sockServer = new Socket(AddressFamily.InterNetwork, (m_iType == 0 ? SocketType.Stream : SocketType.Dgram),
                        (m_iType == 0 ? ProtocolType.Tcp : ProtocolType.Udp));
                    IPEndPoint ipLocal = new IPEndPoint(IPAddress.Any, m_iPort);
                    m_sockServer.Bind(ipLocal);

                    // log port opened
                    m_strServerIP = GetServerIP();
                    if (m_strServerIP == "") m_strServerIP = ipLocal.Address.ToString();
                    Service1.QueueData(String.Format("SERVER {0} PORT OPEN", (m_iType == 0 ? "TCP/IP" : "UDP")),
                        DateTime.UtcNow, false, String.Format("{0}:{1}", m_strServerIP, m_iPort), m_strServerIP, m_iPort);

                    // check socket type
                    if (m_iType == 0)
                    {
                        // listen for clients
                        m_sockServer.Listen(4);
                        m_sockServer.BeginAccept(new AsyncCallback(OnClientConnect), null);
                    }
                    else
                    {
                        // accept data from all clients
                        BeginReceiveUdp(ipLocal);
                    }
                }
                else
                {
                    // loop through client sockets
                    int iCount = m_arrClients.Count - 1;
                    foreach (KeyValuePair<string, SocketInfo> kvClient in m_arrClients)
                    {
                        try
                        {
                            // close client socket
                            kvClient.Value.Socket.Shutdown(SocketShutdown.Both);
                            kvClient.Value.Socket.Close();
                            Service1.QueueData(String.Format("CLOSED BY SERVER - Service Stopped ({0})", iCount--),
                                DateTime.UtcNow, false, kvClient.Key, m_strServerIP, m_iPort);
                        }
                        catch { }
                    }

                    // clear client socket list
                    m_arrClients.Clear();

                    // check server socket
                    if (m_sockServer != null)
                    {
                        // close server socket
                        m_sockServer.Shutdown(SocketShutdown.Both);
                        m_sockServer.Close();
                        m_sockServer = null;
                    }
                }
                return true;
            }
            catch (Exception ex)
            {
                // log error
                if (bStart) Service1.LogError("SocketServer.RunServer", ex.Message);
            }
            return false;
        }

        /// <summary>
        /// starts receiving data from udp clients
        /// </summary>
        private void BeginReceiveUdp(IPEndPoint ipLocal)
        {
            // get server
            string strServer = GetServerIP();
            if (strServer == "") strServer = ipLocal.Address.ToString();

            // accept data from any client
            IPEndPoint ipRemote = new IPEndPoint(IPAddress.Any, 0);
            EndPoint epRemote = (EndPoint)ipRemote;
            SocketInfo sockServer = new SocketInfo(m_sockServer, String.Format("{0}:{1}", strServer, m_iPort));

            // start receiving data
            m_sockServer.BeginReceiveFrom(sockServer.m_szBuffer, 0, sockServer.m_szBuffer.Length,
                SocketFlags.None, ref epRemote, new AsyncCallback(OnDataReceived), sockServer);
        }

        /// <summary>
        /// gets the ip address of the server
        /// </summary>
        /// <returns></returns>
        private string GetServerIP()
        {
            try
            {
                // check if connected to network
                if (NetworkInterface.GetIsNetworkAvailable())
                {
                    // get ip address
                    IPHostEntry host = Dns.GetHostEntry(Dns.GetHostName());
                    return host.AddressList.FirstOrDefault(ip => ip.AddressFamily == AddressFamily.InterNetwork).ToString();
                }
            }
            catch { }
            return "";
        }

        /// <summary>
        /// checks client connections and drops disconnected clients
        /// </summary>
        public void CheckConnections()
        {
            try
            {
                // check socket type if udp
                if (m_iType == 1)
                    return;

                // loop through client sockets
                Dictionary<string, string> arrDrop = new Dictionary<string, string>();
                foreach (KeyValuePair<string, SocketInfo> kvClient in m_arrClients)
                {
                    // check last data received
                    TimeSpan tsDiff = DateTime.Now - kvClient.Value.LastData;
                    string strRemarks = "";
                    if (tsDiff.TotalHours >= 1) strRemarks = "Connection expired.";
                    else
                    {
                        // check connection timestamp
                        tsDiff = DateTime.Now - kvClient.Value.Timestamp;
                        if (tsDiff.TotalMinutes >= 2)
                        {
                            // drop connection if no longer open
                            if (!kvClient.Value.Socket.IsConnected(true))
                                strRemarks = "Socket disconnected.";
                            else
                            {
                                // check ip address if external
                                IPEndPoint ipEndpoint = (IPEndPoint)kvClient.Value.Socket.RemoteEndPoint;
                                if (!ipEndpoint.Address.IsIPLocal())
                                {
                                    // check last ping
                                    tsDiff = DateTime.Now - kvClient.Value.LastPing;
                                    if (tsDiff.TotalSeconds > 30)
                                    {
                                        // ping client
                                        string strPing = kvClient.Key.Ping();
                                        kvClient.Value.LastPing = DateTime.Now;
                                        kvClient.Value.PingCount++;

                                        // check ping status
                                        if (strPing == "")
                                        {
                                            // ping is ok
                                            Service1.QueueData(String.Format("PING {0} OK", kvClient.Value.PingCount), DateTime.UtcNow,
                                                false, kvClient.Key, m_strServerIP, m_iPort);
                                            kvClient.Value.PingCount = 0;
                                            kvClient.Value.Timestamp = DateTime.Now;
                                        }
                                        else
                                        {
                                            // drop connection on fifth failed ping
                                            if (kvClient.Value.PingCount >= 5) strRemarks = strPing;
                                            else
                                            {
                                                // log failed ping
                                                Service1.QueueData(String.Format("PING {0} FAILED ({1})", kvClient.Value.PingCount, strPing),
                                                    DateTime.UtcNow, false, kvClient.Key, m_strServerIP, m_iPort);
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }

                    // drop client
                    if (strRemarks != "")
                        arrDrop.Add(kvClient.Key, strRemarks);
                }

                // loop through dropped client
                foreach (KeyValuePair<string, string> kvClient in arrDrop)
                    DropClient(kvClient.Key, String.Format("BY SERVER - {0}", kvClient.Value));
            }
            catch { }
        }

        /// <summary>
        /// event triggered when a client socket connects
        /// </summary>
        /// <param name="iaResult"></param>
        public void OnClientConnect(IAsyncResult iaResult)
        {
            try
            {
                // accept client socket
                Socket sockClient = m_sockServer.EndAccept(iaResult);
                IPEndPoint ipClient = sockClient.RemoteEndPoint as IPEndPoint;
                string strID = String.Format("{0}:{1}", ipClient.Address, ipClient.Port);

                // add socket to list
                WaitForData(sockClient, strID);
                m_sockServer.BeginAccept(new AsyncCallback(OnClientConnect), null);
            }
            catch (Exception ex)
            {
                // log error
                Service1.LogError("SocketServer.OnClientConnect", ex.Message);
            }
        }

        /// <summary>
        /// waits for incoming data from client socket
        /// </summary>
        /// <param name="sockClient"></param>
        /// <param name="strID"></param>
        private AsyncCallback pfnWorkerCallBack;
        private void WaitForData(Socket sockClient, string strID)
        {
            try
            {
                // create client thread callback
                if (pfnWorkerCallBack == null)
                    pfnWorkerCallBack = new AsyncCallback(OnDataReceived);

                // drop existing connection
                if (m_arrClients.ContainsKey(strID))
                    DropClient(strID, "BY SERVER - Duplicate Connection");

                // receive data from client
                SocketInfo sockInfo = new SocketInfo(sockClient, strID);
                m_arrClients.Add(strID, sockInfo);
                sockClient.BeginReceive(sockInfo.m_szBuffer, 0, sockInfo.m_szBuffer.Length,
                    SocketFlags.None, pfnWorkerCallBack, sockInfo);

                //Device.IMEI = "359710048615695";
                //Logger.LogToFile(mLogFile, "Check for IMEI: " + Device.IMEI, true);
                //if (!string.IsNullOrEmpty(Device.IMEI))
                //{
                //    //**,imei:359710048615695;,100
                //    string cmdToDevice = string.Format("**,imei:{0},101,10s;", Device.IMEI);
                //    Send(cmdToDevice, sockInfo.Socket, false);//[Dan:18May15]
                //    Logger.LogToFile(mLogFile, cmdToDevice, true);
                //}

                // log connection
                Service1.QueueData(String.Format("CONNECTED (Active Connections = {0})", m_arrClients.Count),
                    DateTime.UtcNow, false, strID, m_strServerIP, m_iPort);
            }
            catch (Exception ex)
            {
                // log error
                Service1.LogError("SocketServer.WaitForData", ex.Message);
            }
        }

        /// <summary>
        /// event triggered when data is received from client
        /// </summary>
        /// <param name="iaResult"></param>
        public void OnDataReceived(IAsyncResult iaResult)
        {
            // receive data
            DateTime dtRxTime = DateTime.Now.ToUniversalTime();
            SocketInfo sockInfo = (SocketInfo)iaResult.AsyncState;

            Device.Interval = "10s";//10sec
            //value = "15s";//15sec
            //value = "60s";//1min

            string cmdToDevice = "";
            try
            {
                // check connection
                bool bConnected = true;
                if (m_iType == 0) bConnected = sockInfo.Socket.IsConnected(false);
                if (bConnected)
                {
                    // update timestamp
                    sockInfo.Timestamp = DateTime.Now;
                    sockInfo.LastData = DateTime.Now;

                    // read data from socket
                    int iLen = 0;
                    if (m_iType == 0) iLen = sockInfo.Socket.EndReceive(iaResult);
                    else
                    {
                        // receive udp data
                        IPEndPoint ipRemote = new IPEndPoint(IPAddress.Any, 0);
                        EndPoint epRemote = (EndPoint)ipRemote;
                        iLen = sockInfo.Socket.EndReceiveFrom(iaResult, ref epRemote);
                    }

                    // check data if any
                    if (iLen > 0)
                    {
                        // read data from client
                        string strTemp = Encoding.ASCII.GetString(sockInfo.m_szBuffer, 0, iLen);

                        //[Dan:18May15]
                        Logger.LogToFile(mLogFile, strTemp, true);

                        if (strTemp.StartsWith("##"))
                        {
                            Send("LOAD", sockInfo.Socket, false);//[Dan:18May15]
                            //Logger.LogToFile(Consts.LOGFILE, "LOAD", true);

                            //assign the IMEI to static variable
                            string[] dataStr = strTemp.Split(",".ToCharArray());
                            if (dataStr.Length > 2)
                            {
                                string[] dataStrSub = dataStr[1].Split(":".ToCharArray());
                                Device.IMEI = dataStrSub[1];
                            }
                        }

                        //if (strTemp.Length == 16)
                        //{
                        //    Send("ON", sockInfo.Socket, false);//[Dan:18May15]
                        //    //Logger.LogToFile(Consts.LOGFILE, "ON", true);
                        //}


                        #region PROTOCOL CHECKING

                        // check if china edusafety
                        bool bNonAscii = (strTemp.Contains("?") || strTemp.HasNonAscii());
                        if ((strTemp.Contains("#") || strTemp.Contains("&")) && bNonAscii)
                            strTemp = Encoding.UTF8.GetString(sockInfo.m_szBuffer, 0, iLen);
                        strTemp = strTemp.Replace("###", "##\r#");
                        if (strTemp.EndsWith("##")) strTemp += "\r";
                        strTemp = strTemp.Replace("&&&", "&&\r&");
                        if (strTemp.EndsWith("&&")) strTemp += "\r";

                        // check if startrack encrypted message
                        if (strTemp.Contains("^") && bNonAscii)
                        {
                            string strUnencrypted = strTemp;
                            string strDecrypted = "";
                            int iIndex = 0;
                            try
                            {
                                // decrypt all encrypted messages
                                while (strTemp.Contains("^") && (strTemp.Contains("?") || strTemp.HasNonAscii()))
                                {
                                    // get preceding unencrypted messages
                                    int iStart = strTemp.IndexOf("^");
                                    string strPrefix = strTemp.Substring(0, iStart);
                                    strTemp = strTemp.Substring(iStart);

                                    // get message header
                                    string strHeader = strTemp.Substring(0, 7);
                                    iStart += 7;
                                    iIndex += iStart;

                                    // get payload
                                    List<byte> szPayload = new List<byte>();
                                    for (int i = 0; i < 32; i++)
                                        szPayload.Add(sockInfo.m_szBuffer[iIndex++]);

                                    // get encryption key
                                    string strKey = m_frmMain.GetEncryptKey(strHeader.Substring(1, 5));
                                    if (strKey != "")
                                    {
                                        // get encrypted message
                                        strDecrypted += String.Format("{0}{1}{2}", strPrefix, strHeader,
                                            Encryption.Decrypt(szPayload.ToArray(), strKey, true));
                                    }

                                    // move to next packet
                                    strTemp = Encoding.ASCII.GetString(sockInfo.m_szBuffer, iIndex, iLen - iIndex);
                                }

                                // check decrypted text
                                if (strDecrypted != "")
                                {
                                    // get subsequent unencrypted messages
                                    strDecrypted += strTemp;
                                    strTemp = strDecrypted;
                                }
                                else strTemp = strUnencrypted;
                            }
                            catch { strTemp = strUnencrypted; }
                        }

                        // check if ts109; send ack response
                        if (strTemp.Contains("$GPS")) Send("$GPS!", sockInfo.Socket);
                        else if (strTemp.Contains("$ALT")) Send("$ALT!", sockInfo.Socket);
                        else if (strTemp.Contains("$OPEN")) Send("$OPEN!", sockInfo.Socket);
                        else if (strTemp.StartsWith("##")) Send("LOAD", sockInfo.Socket, false);//[Dan:18May15]
                        //else if (strTemp.Length == 16) Send("ON", sockInfo.Socket, false);//[Dan:18May15]

                        // check if ncs gosafe
                        if (strTemp.StartsWith("*") && strTemp.Contains(";") && strTemp.Contains("#"))
                            strTemp = strTemp.Replace("#", "\r");

                        // check if smartcom
                        if (strTemp.StartsWith("&,") && strTemp.Contains("%"))
                        {
                            // send ack response
                            strTemp += "\r";
                            sockInfo.Socket.Send(Encoding.ASCII.GetBytes("&,99,1,%"));
                        }

                        //[Dan:17Nov14] Add Support for GG450-UDP (Smartcom)
                        if (strTemp.StartsWith("20") || strTemp.IndexOf("20") == 0)
                        {
                            //[Dan:12Jan14] Added support for buffered data, separated by "\r"
                            string[] strTempArr = strTemp.Split("\r".ToCharArray());
                            if (strTempArr.Length > 1)
                            {
                                for (int i = 0; i < strTempArr.Length - 1; i++)
                                    strTempArr[i] = string.Format("&,{0}", strTempArr[i]);
                                strTemp = String.Join("\r", strTempArr);
                            }
                            else
                            {
                                strTemp = string.Format("&,{0}\r", strTemp);
                            }
                        }

                        // check COBAN103A [Dan:26May15]
                        if (strTemp.StartsWith("imei:") && strTemp.Contains(";"))
                        {
                            strTemp = strTemp.Replace(";", "\r");
                            Logger.LogToEvent("COBAN103A: " + strTemp, System.Diagnostics.EventLogEntryType.Information);//testing
                        }

                        // check GG900
                        if (strTemp.Contains("$MG") && strTemp.Contains("!"))
                        {
                            strTemp = strTemp.Replace("!", "\r");
                            Logger.LogToEvent("GG900: " + strTemp, System.Diagnostics.EventLogEntryType.Information);//testing
                        }


                        //Check N32A
                        if (strTemp.StartsWith("$$KHN$"))
                        {
                            strTemp = String.Format("{0}\r", strTemp);
                            Logger.LogToEvent("N32A: " + strTemp, System.Diagnostics.EventLogEntryType.Warning);//testing
                        }

                        //Logger.LogToEvent("MobileEye strTemp: " + strTemp, System.Diagnostics.EventLogEntryType.Warning);//testing

                        //Mobile Eye
                        if (strTemp.StartsWith("I"))
                        {
                            //Send Ack
                            const char CR = (char)13;  //Cr
                            string utf8_String = String.Format("A,I" + CR);
                            Send(utf8_String, sockInfo.Socket);

                            try
                            {
                                DateTime dateTime = DateTime.UtcNow;
                                dateTime = dateTime.AddHours(8);
                                string dt = String.Format("T,{0:ddMMyy,HHmmss}" + CR, dateTime);
                                Send(dt + "\r", sockInfo.Socket);
                                Logger.LogToEvent("Time Syncronization I: " + dt, System.Diagnostics.EventLogEntryType.Information);//testing
                            }
                            catch (Exception ex)
                            {
                                Logger.LogToEvent("Date I: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                            }

                            //strTemp = String.Format("~{0}\r", strTemp);
                            //get the device id here
                            //mDeviceIdSBS = Protocols.MobileEye.GetDeviceID(strTemp);

                            string[] arrData = strTemp.Split(",".ToCharArray());
                            mDeviceIdSBS = arrData[1].Substring(0,5);


                            string[] strTempArr = strTemp.Split("\r".ToCharArray());
                            if (strTempArr.Length > 1)
                            {
                                for (int i = 0; i < strTempArr.Length - 1; i++)
                                    strTempArr[i] = string.Format("&,{0}", strTempArr[i]);
                                string splitStr = String.Join("\r", strTempArr);
                                strTemp = splitStr.Replace("&,", "\r" + mDeviceIdSBS + ";" + "L");

                            }
                            else
                            {
                                string splitStr = string.Format("&,{0}\r", strTemp);
                                strTemp = splitStr.Replace("&,", "\r" + mDeviceIdSBS + ";" + "L");
                                Logger.LogToEvent("Else Test I: " + strTemp, System.Diagnostics.EventLogEntryType.Error);//testing
                            }

                            Logger.LogToEvent("Get AI Device ID " + mDeviceIdSBS, System.Diagnostics.EventLogEntryType.Warning);//testing
                            Logger.LogToEvent("MobileEye Packet I strTemp: " + strTemp, System.Diagnostics.EventLogEntryType.Warning);//testing
                            Logger.LogToEvent("This is a AI ", System.Diagnostics.EventLogEntryType.Warning);//testing
                           

                        }
                        //else if (strTemp.StartsWith("L") && strTemp.Contains("\r"))
                        else if (strTemp.StartsWith("L"))
                        {
                            //Send Ack
                            const char CR = (char)13;  //Cr
                            string utf8_String = String.Format("A,L" + CR);
                            Send(utf8_String, sockInfo.Socket);

                            string[] strTempArr = strTemp.Split("\r".ToCharArray());

                            if (strTempArr.Length > 1)
                            {
                                for (int i = 0; i < strTempArr.Length; i++)
                                    strTempArr[i] = string.Format("{0}", strTempArr[i]);
                                    strTemp = String.Join("{0}", ";" + mDeviceIdSBS);
                            }
                            else
                            {
                                string splitStr = string.Format("&,{0}\r", strTemp);
                                strTemp = splitStr.Replace("&,", "\r" + mDeviceIdSBS + ";" + "L");

                                Logger.LogToEvent("Else Test L: " + strTemp, System.Diagnostics.EventLogEntryType.Error);//testing
                            }

                            Logger.LogToEvent("Get AL Device ID " + mDeviceIdSBS, System.Diagnostics.EventLogEntryType.Warning);//testing
                            Logger.LogToEvent("MobileEye Packet L strTemp: " + strTemp, System.Diagnostics.EventLogEntryType.Warning);//testing
                            Logger.LogToEvent("This is a AL ", System.Diagnostics.EventLogEntryType.Warning);//testing

                        }
                        else if (strTemp.StartsWith("K"))
                        {
                            //Send Ack
                            const char CR = (char)13;  //Cr
                            string utf8_String = String.Format("A,K" + CR);


                            Logger.LogToEvent("MobileEye Packet K strTemp: " + strTemp, System.Diagnostics.EventLogEntryType.Warning);//testing
                            Logger.LogToEvent("This is a K", System.Diagnostics.EventLogEntryType.Warning);//testing
                        }
                       
                        //else if (strTemp.Contains("\r") || strTemp.IndexOf("\r") == 0)
                        //{

                        //    //Send Ack
                        //    const char CR = (char)13;  //Cr
                        //    string utf8_String = String.Format("A,L" + CR);
                        //    Send(utf8_String, sockInfo.Socket);

                        //    string[] strTempArr = strTemp.Split("\r".ToCharArray());

                        //    if (strTempArr.Length > 1)
                        //    {
                        //        for (int i = 0; i < strTempArr.Length - 1; i++)
                        //        {
                        //            strTempArr[i] = string.Format("{0}", strTempArr[i]);
                        //            strTemp = String.Join("{0}", ";" + mDeviceIdSBS + CR);
                        //            //strTemp = mDeviceIdSBS + String.Join(mDeviceIdSBS + ";" + "L" + strTemp, CR, "");
                        //            //strTemp = String.Format(",{1};{0}\r", strTemp, mDeviceIdSBS);
                        //            Logger.LogToEvent("Get strTemp Test: " + strTemp, System.Diagnostics.EventLogEntryType.Error);//testing
                                                                                                      
                        //        }
                        //    }


                        //    Logger.LogToEvent("Get AL Con Device ID " + mDeviceIdSBS, System.Diagnostics.EventLogEntryType.Warning);//testing
                        //    Logger.LogToEvent("MobileEye Packet L Continuation strTemp: " + strTemp, System.Diagnostics.EventLogEntryType.Warning);//testing
                        //    Logger.LogToEvent("This is a AL Continuation", System.Diagnostics.EventLogEntryType.Warning);//testing
                        //}
                        else if (strTemp.Contains("\r") || strTemp.IndexOf("\r") == 0)
                        {
                            //Send Ack
                            const char CR = (char)13;  //Cr
                            string utf8_String = String.Format("A,L" + CR);
                            Send(utf8_String, sockInfo.Socket);

                            string[] strTempArr = strTemp.Split("\r".ToCharArray());
                            if (strTempArr.Length > 1)
                            {
                                for (int i = 0; i < strTempArr.Length - 1; i++)
                                strTempArr[i] = string.Format("&,{0}", strTempArr[i]);
                                string splitStr = String.Join("\r", strTempArr);
                                strTemp = splitStr.Replace("&,", "\r" + mDeviceIdSBS + ";" + "L");

                            }
                            else
                            {
                                string splitStr = string.Format("&,{0}\r", strTemp);
                                strTemp = splitStr.Replace("&,", "\r" + mDeviceIdSBS + ";" + "L");

                                Logger.LogToEvent("Else Test L: " + strTemp, System.Diagnostics.EventLogEntryType.Error);//testing
                            }

                               

                            Logger.LogToEvent("MobileEye Packet L Continuation2 strTemp: " + strTemp, System.Diagnostics.EventLogEntryType.Error);//testing
                            Logger.LogToEvent("This is a AL Continuation2", System.Diagnostics.EventLogEntryType.Error);//testing
                        } 


                        //MDVR
                        //if (strTemp.StartsWith("") && strTemp.Contains("#"))
                        //{
                        //    Send("$$hb,1#", sockInfo.Socket, false);
                        //    strTemp = strTemp.Replace("#", "\r");
                        //    Logger.LogToEvent("MDVR Server Reply: " + strTemp, System.Diagnostics.EventLogEntryType.Warning);//testing
                        //}



                        string strHex = sockInfo.m_szBuffer.ToHexString();

                        //[Dan:17Dec15]
                        //Logger.LogToEvent("AVL301 to strHex: " + strHex, System.Diagnostics.EventLogEntryType.Error);//testing

                        //if (strHex.StartsWith("2424"))
                        //{
                        //    if (!String.IsNullOrEmpty(mDeviceId))
                        //        strTemp = String.Format("{1};{0}\r", strHex, mDeviceId);
                        //    else
                        //        strTemp = String.Format("~;{0}\r", strHex);
                        //    Send("$H#", sockInfo.Socket);
                        //    Logger.LogToEvent("AVL301 to strHex GPS Data: " + strTemp, System.Diagnostics.EventLogEntryType.Error);//testing
                        //}
                        //else if (strHex.StartsWith("24"))
                        //{
                        //    strTemp = String.Format("~{0}\r", strHex);
                        //    //get the device id here
                        //    mDeviceId = Protocols.AVL301.GetDeviceID(strHex);
                        //    Send("$L#", sockInfo.Socket);
                        //    Logger.LogToEvent("AVL301 to strHex Login: " + strTemp, System.Diagnostics.EventLogEntryType.Error);//testing
                        //}



                        //if (strTemp.HasNonAscii() || (m_iType == 1))
                        if (strTemp.HasNonAscii() && strHex.StartsWith("00"))
                            strTemp = String.Format("~{0}\r", strHex.Substring(0, (strHex.Length > 90 ? 90 : strHex.Length)));

                        // check if sce ion300
                        if (strHex.StartsWith("6767"))
                        {
                            // append custom start flag
                            int iPacketLen = Convert.ToInt32(strHex.Substring(6, 4), 16);
                            if (strHex.Length < iPacketLen) iPacketLen = strHex.Length;
                            strTemp = String.Format("~{0}\r", strHex.Substring(0, iPacketLen + 10));

                            //get the message type
                            string msgType = strHex.Substring(4, 2);

                            //send ACK check if NOT gps (0x02) OR NOT Ordinary messages data packets (0x81) 
                            if (msgType != "02" || msgType != "81")
                            {
                                // send ack response
                                string strAck = String.Format("6767{0}0002{1}", msgType, strHex.Substring(10, 4));
                                sockInfo.Socket.Send(strAck.ToByteArray());
                            }

                            // check message type
                            switch (msgType)
                            {
                                case "01":
                                    {
                                        // name client socket
                                        string strTag = strHex.Substring(14, 16);
                                        sockInfo.Name = strTag;
                                        NameClient(sockInfo.ID, strTag);
                                        strTemp = String.Format("~{0}|{1}\r", strHex, strTag);
                                    }
                                    break;
                                default:
                                    {
                                        // append device name
                                        strTemp = String.Format("~{0}|{1}\r", strHex, sockInfo.Name);
                                    }
                                    break;
                            }
                        }

                        // check if mu-201
                        // imei=353816053366441&rmc=$GPRMC,012709.00,V,0121.11929,N,10350.58035,E,0.292,,241114,,,A*6C,MOVE,4106,100,21,0,99.9,C0,0,0,0,M1
                        if (strTemp.ToUpper().StartsWith("IMEI=") && strTemp.Contains("$GPRMC"))
                        {
                            // move imei to last parameter
                            string[] arrTemp = strTemp.Split('&');
                            strTemp = String.Format("{0},{1}\r", arrTemp[1].Substring(arrTemp[1].IndexOf("$")).Trim(),
                                arrTemp[0].Substring(arrTemp[0].IndexOf("=") + 1));
                        }

                        #endregion


                        // append data to buffer
                        string strBuffer = sockInfo.m_strBuffer + strTemp;
                        string strData = "";

                        // loop through messages
                        while (strBuffer.Contains("\r"))
                        {
                            try
                            {
                                // get message
                                iLen = strBuffer.IndexOf("\r") + 1;
                                strData += strBuffer.Substring(0, iLen);
                                strBuffer = strBuffer.Substring(iLen);
                            }
                            catch { strBuffer = ""; }
                        }

                        // check messages
                        sockInfo.m_strBuffer = strBuffer;
                        if (strData != "")
                        {
                            // loop through messages
                            string[] arrData = strData.Split("\r".ToCharArray(), StringSplitOptions.RemoveEmptyEntries);
                            for (int i = 0; i < arrData.Length; i++)
                            {
                                // process data
                                strData = arrData[i];
                                if (strData.Trim() != "")
                                    Service1.QueueData(strData.Trim(), dtRxTime, true, sockInfo.ID, m_strServerIP, m_iPort);
                            }
                        }


                        // check socket type
                        if (m_iType == 0)
                        {
                            // wait for data again from client
                            sockInfo.Socket.BeginReceive(sockInfo.m_szBuffer, 0, sockInfo.m_szBuffer.Length,
                                SocketFlags.None, pfnWorkerCallBack, sockInfo);
                        }
                        else
                        {
                            // accept data from any client
                            IPEndPoint ipLocal = new IPEndPoint(IPAddress.Any, m_iPort);
                            BeginReceiveUdp(ipLocal);
                        }
                        return;
                    }
                }
            }
            catch { }
            // catch (Exception ex) { Service1.LogEvent(1, String.Format("SocketServer.OnDataReceived: {0}", ex.Message)); }

            // disconnect client
            DropClient(sockInfo.ID, String.Format("BY CLIENT - {0}", sockInfo.Name));
        }



        /// <summary>
        /// disconnects client socket
        /// </summary>
        /// <param name="strID"></param>
        private void DropClient(string strID, string strRemarks)
        {
            try
            {
                // check client socket
                if (m_arrClients.ContainsKey(strID) && (m_arrClients[strID] != null))
                {
                    // close client socket
                    m_arrClients[strID].Socket.Shutdown(SocketShutdown.Both);
                    m_arrClients[strID].Socket.Close();
                    m_arrClients.Remove(strID);
                    Service1.QueueData(String.Format("CLOSED {0} (Active Connections = {1})", strRemarks, m_arrClients.Count),
                        DateTime.UtcNow, false, strID, m_strServerIP, m_iPort);
                }
            }
            catch { }
        }

        /// <summary>
        /// names client socket
        /// </summary>
        /// <param name="strID"></param>
        public void NameClient(string strID, string strName)
        {
            try
            {
                // check socket type if udp
                if (m_iType == 1)
                    return;

                // loop through client sockets
                List<string> arrConnections = new List<string>();
                foreach (KeyValuePair<string, SocketInfo> kvClient in m_arrClients)
                {
                    // check name
                    if (kvClient.Value.Name == strName)
                    {
                        // check if duplicate connection
                        if (kvClient.Key != strID)
                            arrConnections.Add(kvClient.Key);
                    }
                }

                // check if multiple connections
                if (arrConnections.Count > 1)
                {
                    // drop first connection
                    DropClient(arrConnections[0], String.Format("BY SERVER - Multiple Connections {0} > {1}, {2}", strName,
                        String.Join(", ", arrConnections), strID));
                }

                // update client name
                if (m_arrClients.ContainsKey(strID) && (m_arrClients[strID] != null))
                {
                    // check is second connection
                    if (String.IsNullOrEmpty(m_arrClients[strID].Name) && (arrConnections.Count == 1))
                    {
                        // log duplicate connections (do not drop yet)
                        Service1.QueueData(String.Format("DUPLICATE CONNECTION - {0} > {1}, {2}", strName,
                            arrConnections[0], strID), DateTime.UtcNow, false, strID, m_strServerIP, m_iPort);
                    }

                    // update client name
                    m_arrClients[strID].Name = strName;
                }
            }
            catch (Exception ex)
            {
                // log error
                Service1.LogError("SocketServer.NameClient", ex.Message);
            }
        }

        /// <summary>
        /// gets client socket id
        /// </summary>
        /// <param name="strName"></param>
        public string GetClientID(string strName)
        {
            string strClientIds = "";
            try
            {
                // loop through client sockets
                string[] arrNames = strName.Split("\r".ToCharArray());
                foreach (KeyValuePair<string, SocketInfo> kvClient in m_arrClients)
                {
                    // loop through client names
                    foreach (string strTemp in arrNames)
                    {
                        // check client name
                        if (kvClient.Value.Name == strTemp)
                        {
                            // get client id
                            strClientIds += String.Format("{0},", kvClient.Key);
                            break;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                Service1.LogError("SocketServer.GetClientID", ex.Message);
            }
            return strClientIds.Trim(",".ToCharArray());
        }

        /// <summary>
        /// sends message to client
        /// </summary>
        /// <param name="strData"></param>
        /// <param name="strClientIds"></param>
        public void Send(string strData, string strClientIds)
        {
            try
            {
                // loop through client sockets
                string[] arrTemp = strClientIds.Split(",".ToCharArray());
                foreach (string strID in arrTemp)
                {
                    // check client socket
                    if (m_arrClients.ContainsKey(strID))
                    {
                        // send data packet to client socket
                        Send(strData, m_arrClients[strID].Socket);
                        Service1.QueueData(String.Format("COMMAND SENT - {0}", strData.Replace("\r", " ")).Trim(),
                            DateTime.UtcNow, false, strID, m_strServerIP, m_iPort);
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                Service1.LogError("SocketServer.Send", ex.Message);
            }
        }

        /// <summary>
        /// sends message to client
        /// </summary>
        /// <param name="strData"></param>
        /// <param name="sockClient"></param>
        private void Send(string strData, Socket sockClient)
        {
            try
            {
                // send sata packet to client socket
                if (sockClient != null)
                    //sockClient.Send(Encoding.ASCII.GetBytes(strData + "\r"));
                    sockClient.Send(Encoding.ASCII.GetBytes(strData));
            }
            catch (Exception ex)
            {
                // log error
                Service1.LogError("SocketServer.Send*", ex.Message);
            }
        }


        /// <summary>
        /// sends message to client
        /// </summary>
        /// <param name="strData"></param>
        /// <param name="sockClient"></param>
        private void Send(string strData, Socket sockClient, bool isNextLine)
        {
            try
            {
                // send sata packet to client socket
                if (sockClient != null)
                    sockClient.Send(Encoding.ASCII.GetBytes(strData));
            }
            catch (Exception ex)
            {
                // log error
                Service1.LogError("SocketServer.Send*", ex.Message);
            }
        }

        /// <summary>
        /// sends message to client
        /// </summary>
        /// <param name="strData"></param>
        /// <param name="sockClient"></param>
        private void SendTo(string strData, Socket sockClient, bool isNextLine)
        {
            try
            {
                // send sata packet to client socket
                if (sockClient != null)
                    sockClient.SendTo(Encoding.ASCII.GetBytes(strData), sockClient.RemoteEndPoint);
            }
            catch (Exception ex)
            {
                // log error
                Service1.LogError("SocketServer.SendTo*", ex.Message);
            }
        }

        /// <summary>
        /// sends data to all clients
        /// </summary>
        /// <param name="strData"></param>
        public void Broadcast(string strData)
        {
            try
            {
                // broadcast message to all client sockets
                foreach (KeyValuePair<string, SocketInfo> kvClient in m_arrClients)
                    kvClient.Value.Socket.Send(Encoding.ASCII.GetBytes(strData + "\r"));
            }
            catch (Exception ex)
            {
                // log error
                Service1.LogError("SocketServer.Broadcast", ex.Message);
            }
        }
    }

    /// <summary>
    /// socket class extensions
    /// </summary>
    static class SocketExtensions
    {
        /// <summary>
        /// checks socket connection if still active
        /// </summary>
        /// <param name="socket"></param>
        /// <returns></returns>
        public static bool IsConnected(this Socket sockClient, bool bLog)
        {
            // save blocking state
            bool bBlocking = sockClient.Blocking;
            bool bConnected = true;
            try
            {
                // check socket if connected
                byte[] szTemp = { 0x00 };
                sockClient.Blocking = true;
                sockClient.Send(szTemp, 0, 0);
            }
            catch (Exception ex)
            {
                // socket is not connected
                bConnected = false;
                if (bLog) Service1.LogError("SocketServer.IsConnected", ex.Message);
            }
            finally
            {
                // restore blocking state
                sockClient.Blocking = bBlocking;
            }
            return bConnected;
        }

        /// <summary>
        /// checks ip address if online
        /// </summary>
        /// <param name="strIPAddress"></param>
        /// <returns></returns>
        public static string Ping(this string strIPAddress)
        {
            string strRet = "";
            try
            {
                // check port
                if (strIPAddress.Contains(":"))
                {
                    // extract ip address
                    string[] arrTemp = strIPAddress.Split(":".ToCharArray());
                    strIPAddress = arrTemp[0].Trim();
                }

                // check ip address
                if (strIPAddress == "")
                    return "No IP address to ping.";

                // ping target host
                Ping pngHost = new Ping();
                PingReply pngReply = pngHost.Send(strIPAddress, 500);

                // check host if online
                if (pngReply.Status != IPStatus.Success)
                    return String.Format("Failed to ping {0} - {1}.", strIPAddress, pngReply.Status);
            }
            catch (Exception ex)
            {
                // log error
                Service1.LogError("SocketServer.Ping", ex.Message);
                strRet = ex.Message;
            }
            return strRet;
        }

        /// <summary>
        /// sets the periodic checking of the client's heartbeat
        /// </summary>
        /// <param name="sockClient"></param>
        /// <param name="lTime"></param>
        /// <param name="lInterval"></param>
        /// <returns></returns>
        public static bool SetKeepAlive(this Socket sockClient, ulong lTime, ulong lInterval)
        {
            try
            {
                const int BYTES_PER_LONG = 4;
                const int BITS_PER_BYTE = 8;
                byte[] SIO_KEEPALIVE_VALS = new byte[3 * BYTES_PER_LONG];
                ulong[] arrInput = new ulong[3];

                // enable/disable keepalive
                arrInput[0] = ((lTime == 0) || (lInterval == 0) ? 0UL : 1UL);
                arrInput[1] = lTime;
                arrInput[2] = lInterval;

                // convert input array to struct
                for (int i = 0; i < arrInput.Length; i++)
                {
                    SIO_KEEPALIVE_VALS[i * BYTES_PER_LONG + 3] = (byte)(arrInput[i] >> ((BYTES_PER_LONG - 1) * BITS_PER_BYTE) & 0xff);
                    SIO_KEEPALIVE_VALS[i * BYTES_PER_LONG + 2] = (byte)(arrInput[i] >> ((BYTES_PER_LONG - 2) * BITS_PER_BYTE) & 0xff);
                    SIO_KEEPALIVE_VALS[i * BYTES_PER_LONG + 1] = (byte)(arrInput[i] >> ((BYTES_PER_LONG - 3) * BITS_PER_BYTE) & 0xff);
                    SIO_KEEPALIVE_VALS[i * BYTES_PER_LONG + 0] = (byte)(arrInput[i] >> ((BYTES_PER_LONG - 4) * BITS_PER_BYTE) & 0xff);
                }

                // set socket keepalive
                byte[] arrResult = BitConverter.GetBytes(0);
                sockClient.IOControl(IOControlCode.KeepAliveValues, SIO_KEEPALIVE_VALS, arrResult);
                return true;
            }
            catch { }
            return false;
        }

        /// <summary>
        /// checks ip address if local
        /// </summary>
        /// <param name="ipaddress"></param>
        /// <returns></returns>
        public static bool IsIPLocal(this IPAddress ipaddress)
        {
            // parse ip address string
            String[] straryIPAddress = ipaddress.ToString().Split(new String[] { "." }, StringSplitOptions.RemoveEmptyEntries);
            int[] iaryIPAddress = new int[] { int.Parse(straryIPAddress[0]), int.Parse(straryIPAddress[1]), int.Parse(straryIPAddress[2]), int.Parse(straryIPAddress[3]) };

            // check if local
            return (iaryIPAddress[0] == 10 || (iaryIPAddress[0] == 192 && iaryIPAddress[1] == 168) ||
                (iaryIPAddress[0] == 172 && (iaryIPAddress[1] >= 16 && iaryIPAddress[1] <= 31)));
        }

        /// <summary>
        /// checks if text has non-ascii character
        /// </summary>
        /// <param name="strText"></param>
        /// <returns></returns>
        public static bool HasNonAscii(this string strText)
        {
            // check if text has non-ascii character
            return strText.Any(c => c > 128);
        }

        /// <summary>
        /// checks if text has no alphanumeric characters
        /// </summary>
        /// <param name="strText"></param>
        /// <returns></returns>
        public static bool HasAlphaNum(this string strText)
        {
            // loop through text characters
            for (int i = 0; i < strText.Length; i++)
            {
                // check if alphanumeric
                if (Char.IsLetterOrDigit(strText, i))
                    return true;
            }
            return false;
        }

        /// <summary>
        /// converts hex string to byte array
        /// </summary>
        /// <param name="strHex"></param>
        /// <returns></returns>
        public static byte[] ToByteArray(this string strHex)
        {
            // convert hex string to byte array
            return Enumerable.Range(0, strHex.Length).Where(x => x % 2 == 0)
                .Select(x => Convert.ToByte(strHex.Substring(x, 2), 16)).ToArray();
        }
    }
}
