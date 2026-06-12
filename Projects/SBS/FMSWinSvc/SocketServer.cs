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
using System.Text.RegularExpressions;
using MySql.Data.MySqlClient;
using FMSWebApi;
using mobileyeOTA;
using Microsoft.VisualBasic;

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
        private bool firstData = true;
        private string getDevice = "";
        private string mConnStr = "server=66.96.208.81;uid=root;pwd=$B$Transit888;database=trackdemo;charset=utf8;max pool size=500;default command timeout=99999999;";
        private NetworkStream netstream;
        private BinFileReader rBinFile;
        private UInt16 curFirmwareCRC16 = 0;
        private long curFirmwareLength;
        private string curFirmwareSendStr = "";
        private int SendFirmwareRetry = 0;
        private long Address = 0;
        private string Data = "";
        private string strSend = null;
        private bool firmwareData = true;
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
            //public byte[] m_szBuffer = new byte[1024];

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
            FMSWebApi.Models.DeviceInfo currDevice = new FMSWebApi.Models.DeviceInfo();
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

                        //Logger.LogToFile(mLogFile, strTemp, true);
                        if (Settings.Default.ProjectName == "Chuanfa") Logger.LogToFile(mLogFile, "Buffer: " + sockInfo.m_szBuffer.Length + " Len: " + iLen + "; " + strTemp, true);
                        //Logger.LogToEvent("Gateway started", System.Diagnostics.EventLogEntryType.Warning);

                        const char CR = (char)13;  //Cr
                    
                        // append data to buffer
                        string strBuffer = sockInfo.m_strBuffer + strTemp + CR;
                        string strData = "";
                        string tempData = "";

                        // loop through messages
                        while (strBuffer.Contains("\r"))
                        {
                            try
                            {    
                                // get message
                                iLen = strBuffer.IndexOf("\r") + 1;
                                //strData += strBuffer.Substring(0, iLen);
                                tempData = strBuffer.Substring(0, iLen);
                                strData += tempData;
                                strBuffer = strBuffer.Substring(iLen);

                                string deviceID = "";
                                string finalDeviceID = "";
                                string[] arrData = tempData.Split(",".ToCharArray());                                           

                                //get IMEI/Device ID
                                deviceID = Regex.Replace(arrData[1], @"\s+", "");
                               
                                if (tempData.StartsWith("L")) // ack data
                                {
                                    if (firstData)
                                    {
                                        if (deviceID.Length == 5)
                                        {
                                            string input = arrData[1].Substring(4, 1);

                                            foreach (char letter in input)
                                            {
                                                bool isLetterOrDigit = char.IsLetterOrDigit(letter);
                                                if (isLetterOrDigit)
                                                {
                                                    finalDeviceID = arrData[1].Substring(0, 5);
                                                }
                                                else
                                                {
                                                    finalDeviceID = arrData[1].Substring(0, 4);
                                                }
                                            }
                                        }
                                        else if (deviceID.Length == 4)
                                        {
                                            finalDeviceID = arrData[1].Substring(0, 4);
                                        }

                                        if (Settings.Default.ProjectName == "SBS")
                                        {
                                            #region GET DEVICE INFO
                                            try
                                            {
                                                currDevice = GetDeviceInfo(finalDeviceID);
                                            }
                                            catch (Exception ex)
                                            {
                                                Logger.LogToEvent("GET DEVICE INFO: ", ex.Message, System.Diagnostics.EventLogEntryType.Error);
                                            }
                                            #endregion

                                            if (currDevice.isSentOut == 1)
                                            {
                                                string zero = "0";
                                                string ipSSID1 = "00B2";
                                                string ipSSID2 = "0106";
                                                string ipSSID3 = "015A";
                                                string ipSSID4 = "01AE";
                                                string ipSSID5 = "0202";
                                                string portSSID1 = "00B6";
                                                string portSSID2 = "010A";
                                                string portSSID3 = "015E";
                                                string portSSID4 = "01B2";
                                                string portSSID5 = "0206";
                                                string usernameSSID1 = "0064";
                                                string usernameSSID2 = "00B8";
                                                string usernameSSID3 = "010C";
                                                string usernameSSID4 = "0160";
                                                string usernameSSID5 = "01B4";
                                                string passwordSSID1 = "0084";
                                                string passwordSSID2 = "00D8";
                                                string passwordSSID3 = "012C";
                                                string passwordSSID4 = "0180";
                                                string passwordSSID5 = "01D4";

                                                string securitySSID1 = "00A4";
                                                string securitySSID2 = "00F8";
                                                string securitySSID3 = "014C";
                                                string securitySSID4 = "01A0";
                                                string securitySSID5 = "01F4";
                                                string modeSSID1 = "00A5";
                                                string modeSSID2 = "00F9";
                                                string modeSSID3 = "014D";
                                                string modeSSID4 = "01A1";
                                                string modeSSID5 = "01F5";

                                                string ipAddSSID1 = "00A6";
                                                string ipAddSSID2 = "00FA";
                                                string ipAddSSID3 = "014E";
                                                string ipAddSSID4 = "01A2";
                                                string ipAddSSID5 = "01F6";

                                                string ipMaskSSID1 = "00AA";
                                                string ipMaskSSID2 = "00FE";
                                                string ipMaskSSID3 = "0152";
                                                string ipMaskSSID4 = "01A6";
                                                string ipMaskSSID5 = "01FA";

                                                string ipGatewaySSID1 = "00AE";
                                                string ipGatewaySSID2 = "0102";
                                                string ipGatewaySSID3 = "0156";
                                                string ipGatewaySSID4 = "01AA";
                                                string ipGatewaySSID5 = "01FE";

                                                string port = DecimalToHexadecimal(currDevice.Port);
                                                string otaPort = port.Substring(2, 2) + port.Substring(0, 2);
                                                if (currDevice.SSID == 1) Send("S," + portSSID1 + "," + otaPort + "\r", sockInfo.Socket); //Port 1
                                                else if (currDevice.SSID == 2) Send("S," + portSSID2 + "," + otaPort + "\r", sockInfo.Socket); //Port 2
                                                else if (currDevice.SSID == 3) Send("S," + portSSID3 + "," + otaPort + "\r", sockInfo.Socket); //Port 3
                                                else if (currDevice.SSID == 4) Send("S," + portSSID4 + "," + otaPort + "\r", sockInfo.Socket); //Port 4
                                                else if (currDevice.SSID == 5) Send("S," + portSSID5 + "," + otaPort + "\r", sockInfo.Socket); //Port 5

                                                string ip = currDevice.IP;
                                                string[] arrIP = ip.Split(".".ToCharArray());
                                                if (arrIP.Length > 0)
                                                {
                                                    string otaIP1 = DecimalToHexadecimal(Convert.ToInt32(arrIP[0]));
                                                    string otaIP2 = DecimalToHexadecimal(Convert.ToInt32(arrIP[1]));
                                                    string otaIP3 = DecimalToHexadecimal(Convert.ToInt32(arrIP[2]));
                                                    string otaIP4 = DecimalToHexadecimal(Convert.ToInt32(arrIP[3]));
                                                    if (currDevice.SSID == 1) Send("S," + ipSSID1 + "," + otaIP1 + otaIP2 + otaIP3 + otaIP4 + "\r", sockInfo.Socket); //IP 1
                                                    else if (currDevice.SSID == 2) Send("S," + ipSSID2 + "," + otaIP1 + otaIP2 + otaIP3 + otaIP4 + "\r", sockInfo.Socket); //IP 2
                                                    else if (currDevice.SSID == 3) Send("S," + ipSSID3 + "," + otaIP1 + otaIP2 + otaIP3 + otaIP4 + "\r", sockInfo.Socket); //IP 3
                                                    else if (currDevice.SSID == 4) Send("S," + ipSSID4 + "," + otaIP1 + otaIP2 + otaIP3 + otaIP4 + "\r", sockInfo.Socket); //IP 4
                                                    else if (currDevice.SSID == 5) Send("S," + ipSSID5 + "," + otaIP1 + otaIP2 + otaIP3 + otaIP4 + "\r", sockInfo.Socket); //IP 5

                                                }

                                                if (currDevice.SSID == 1) Send("S," + usernameSSID1 + "," + AsciiToHexadecimal(currDevice.Username) + "\r", sockInfo.Socket); //Username 1
                                                else if (currDevice.SSID == 2) Send("S," + usernameSSID2 + "," + AsciiToHexadecimal(currDevice.Username) + "\r", sockInfo.Socket); //Username 2
                                                else if (currDevice.SSID == 3) Send("S," + usernameSSID3 + "," + AsciiToHexadecimal(currDevice.Username) + "\r", sockInfo.Socket); //Username 3
                                                else if (currDevice.SSID == 4) Send("S," + usernameSSID4 + "," + AsciiToHexadecimal(currDevice.Username) + "\r", sockInfo.Socket); //Username 4
                                                else if (currDevice.SSID == 5) Send("S," + usernameSSID5 + "," + AsciiToHexadecimal(currDevice.Username) + "\r", sockInfo.Socket); //Username 5

                                                if (currDevice.SSID == 1) Send("S," + passwordSSID1 + "," + AsciiToHexadecimal(currDevice.Password) + "\r", sockInfo.Socket); //Password 1
                                                else if (currDevice.SSID == 2) Send("S," + passwordSSID2 + "," + AsciiToHexadecimal(currDevice.Password) + "\r", sockInfo.Socket); //Password 2
                                                else if (currDevice.SSID == 3) Send("S," + passwordSSID3 + "," + AsciiToHexadecimal(currDevice.Password) + "\r", sockInfo.Socket); //Password 3
                                                else if (currDevice.SSID == 4) Send("S," + passwordSSID4 + "," + AsciiToHexadecimal(currDevice.Password) + "\r", sockInfo.Socket); //Password 4
                                                else if (currDevice.SSID == 5) Send("S," + passwordSSID5 + "," + AsciiToHexadecimal(currDevice.Password) + "\r", sockInfo.Socket); //Password 5

                                                if (currDevice.SSID == 1) Send("S," + securitySSID1 + "," + zero + DecimalToHexadecimal(currDevice.SecurityType) + "\r", sockInfo.Socket); //Security Type 1
                                                else if (currDevice.SSID == 2) Send("S," + securitySSID2 + "," + zero + DecimalToHexadecimal(currDevice.SecurityType) + "\r", sockInfo.Socket); //Security Type 2
                                                else if (currDevice.SSID == 3) Send("S," + securitySSID3 + "," + zero + DecimalToHexadecimal(currDevice.SecurityType) + "\r", sockInfo.Socket); //Security Type 3
                                                else if (currDevice.SSID == 4) Send("S," + securitySSID4 + "," + zero + DecimalToHexadecimal(currDevice.SecurityType) + "\r", sockInfo.Socket); //Security Type 4
                                                else if (currDevice.SSID == 5) Send("S," + securitySSID5 + "," + zero + DecimalToHexadecimal(currDevice.SecurityType) + "\r", sockInfo.Socket); //Security Type 5

                                                if (currDevice.SSID == 1) Send("S," + modeSSID1 + "," + zero + DecimalToHexadecimal(currDevice.Mode) + "\r", sockInfo.Socket); //Mode 1
                                                else if (currDevice.SSID == 2) Send("S," + modeSSID2 + "," + zero + DecimalToHexadecimal(currDevice.Mode) + "\r", sockInfo.Socket); //Mode 2
                                                else if (currDevice.SSID == 3) Send("S," + modeSSID3 + "," + zero + DecimalToHexadecimal(currDevice.Mode) + "\r", sockInfo.Socket); //Mode 3
                                                else if (currDevice.SSID == 4) Send("S," + modeSSID4 + "," + zero + DecimalToHexadecimal(currDevice.Mode) + "\r", sockInfo.Socket); //Mode 4
                                                else if (currDevice.SSID == 5) Send("S," + modeSSID5 + "," + zero + DecimalToHexadecimal(currDevice.Mode) + "\r", sockInfo.Socket); //Mode 5

                                                string ipAdd = currDevice.IPAddress;
                                                string[] arrIPAdd = ipAdd.Split(".".ToCharArray());
                                                if (arrIPAdd.Length > 0)
                                                {
                                                    string otaIPAdd1 = DecimalToHexadecimal(Convert.ToInt32(arrIPAdd[0]));
                                                    string otaIPAdd2 = DecimalToHexadecimal(Convert.ToInt32(arrIPAdd[1]));
                                                    string otaIPAdd3 = DecimalToHexadecimal(Convert.ToInt32(arrIPAdd[2]));
                                                    string otaIPAdd4 = DecimalToHexadecimal(Convert.ToInt32(arrIPAdd[3]));
                                                    if (currDevice.SSID == 1) Send("S," + ipAddSSID1 + "," + otaIPAdd1 + otaIPAdd2 + otaIPAdd3 + otaIPAdd4 + "\r", sockInfo.Socket); //IP Address 1
                                                    else if (currDevice.SSID == 2) Send("S," + ipAddSSID2 + "," + otaIPAdd1 + otaIPAdd2 + otaIPAdd3 + otaIPAdd4 + "\r", sockInfo.Socket); //IP Address 2
                                                    else if (currDevice.SSID == 3) Send("S," + ipAddSSID3 + "," + otaIPAdd1 + otaIPAdd2 + otaIPAdd3 + otaIPAdd4 + "\r", sockInfo.Socket); //IP Address 3
                                                    else if (currDevice.SSID == 4) Send("S," + ipAddSSID4 + "," + otaIPAdd1 + otaIPAdd2 + otaIPAdd3 + otaIPAdd4 + "\r", sockInfo.Socket); //IP Address 4
                                                    else if (currDevice.SSID == 5) Send("S," + ipAddSSID5 + "," + otaIPAdd1 + otaIPAdd2 + otaIPAdd3 + otaIPAdd4 + "\r", sockInfo.Socket); //IP Address 5

                                                }

                                                string ipMask = currDevice.IPMask;
                                                string[] arrIPMask = ipMask.Split(".".ToCharArray());
                                                if (arrIPMask.Length > 0)
                                                {
                                                    string otaIPMask1 = DecimalToHexadecimal(Convert.ToInt32(arrIPMask[0]));
                                                    string otaIPMask2 = DecimalToHexadecimal(Convert.ToInt32(arrIPMask[1]));
                                                    string otaIPMask3 = DecimalToHexadecimal(Convert.ToInt32(arrIPMask[2]));
                                                    string otaIPMask4 = DecimalToHexadecimal(Convert.ToInt32(arrIPMask[3]));
                                                    if (currDevice.SSID == 1) Send("S," + ipMaskSSID1 + "," + otaIPMask1 + otaIPMask2 + otaIPMask3 + otaIPMask4 + "\r", sockInfo.Socket); //IP Mask 1
                                                    else if (currDevice.SSID == 2) Send("S," + ipMaskSSID2 + "," + otaIPMask1 + otaIPMask2 + otaIPMask3 + otaIPMask4 + "\r", sockInfo.Socket); //IP Mask 2
                                                    else if (currDevice.SSID == 3) Send("S," + ipMaskSSID3 + "," + otaIPMask1 + otaIPMask2 + otaIPMask3 + otaIPMask4 + "\r", sockInfo.Socket); //IP Mask 3
                                                    else if (currDevice.SSID == 4) Send("S," + ipMaskSSID4 + "," + otaIPMask1 + otaIPMask2 + otaIPMask3 + otaIPMask4 + "\r", sockInfo.Socket); //IP Mask 4
                                                    else if (currDevice.SSID == 5) Send("S," + ipMaskSSID5 + "," + otaIPMask1 + otaIPMask2 + otaIPMask3 + otaIPMask4 + "\r", sockInfo.Socket); //IP Mask 5

                                                }

                                                string ipGateway = currDevice.IPGateway;
                                                string[] arrIPGateway = ipGateway.Split(".".ToCharArray());
                                                if (arrIPGateway.Length > 0)
                                                {
                                                    string otaIPGateway1 = DecimalToHexadecimal(Convert.ToInt32(arrIPGateway[0]));
                                                    string otaIPGateway2 = DecimalToHexadecimal(Convert.ToInt32(arrIPGateway[1]));
                                                    string otaIPGateway3 = DecimalToHexadecimal(Convert.ToInt32(arrIPGateway[2]));
                                                    string otaIPGateway4 = DecimalToHexadecimal(Convert.ToInt32(arrIPGateway[3]));
                                                    if (currDevice.SSID == 1) Send("S," + ipGatewaySSID1 + "," + otaIPGateway1 + otaIPGateway2 + otaIPGateway3 + otaIPGateway4 + "\r", sockInfo.Socket); //IP Gateway 1
                                                    else if (currDevice.SSID == 2) Send("S," + ipGatewaySSID2 + "," + otaIPGateway1 + otaIPGateway2 + otaIPGateway3 + otaIPGateway4 + "\r", sockInfo.Socket); //IP Gateway 2
                                                    else if (currDevice.SSID == 3) Send("S," + ipGatewaySSID3 + "," + otaIPGateway1 + otaIPGateway2 + otaIPGateway3 + otaIPGateway4 + "\r", sockInfo.Socket); //IP Gateway 3
                                                    else if (currDevice.SSID == 4) Send("S," + ipGatewaySSID4 + "," + otaIPGateway1 + otaIPGateway2 + otaIPGateway3 + otaIPGateway4 + "\r", sockInfo.Socket); //IP Gateway 4
                                                    else if (currDevice.SSID == 5) Send("S," + ipGatewaySSID5 + "," + otaIPGateway1 + otaIPGateway2 + otaIPGateway3 + otaIPGateway4 + "\r", sockInfo.Socket); //IP Gateway 5

                                                }

                                                string id = "0005";
                                                Send("S," + id + "," + currDevice.Imei.ToHex() + "\r", sockInfo.Socket); //Device ID

                                                string interval = "03F4";
                                                string timeInterval = DecimalToHexadecimal(currDevice.Interval);
                                                if (currDevice.Interval <= 15) Send("S," + interval + "," + zero + timeInterval + "\r", sockInfo.Socket); //Time Interval
                                                else if (currDevice.Interval > 15) Send("S," + interval + "," + timeInterval + "\r", sockInfo.Socket); //Time Interval

                                                Logger.LogToEvent("OTA sent: " + finalDeviceID, System.Diagnostics.EventLogEntryType.Information);

                                                firstData = false;
                                            }

                                            //if (currDevice.Remarks == "1")
                                            //{
                                            //    if (firmwareData)
                                            //    {
                                                      //Do Code

                                            //        firmwareData = false;
                                            //    }
                                            //}
                                        }
                                    }
                                }

                                if (firmwareData == true && Settings.Default.ProjectName == "SBS")
                                {
                                    try
                                    {
                                        switch (tempData.Substring(0, 1))
                                        {
                                            case "A":
                                                // Ack
                                                if (tempData.Substring(2, 1) == "F")
                                                {

                                                    firmwareData = false;

                                                    try
                                                    {
                                                        if (rBinFile.ReadNextBlock(ref Address, ref Data) == true)
                                                        {

                                                            int b = 0;
                                                            int CheckSum = 0;
                                                            strSend = "F,";

                                                            strSend += LongToHex(Address);
                                                            strSend += ",";
                                                            strSend += Data;
                                                            for (int i = 0; i <= Data.Length - 1; i += 2)
                                                            {
                                                                b = HexToInt(Data.Substring(i, 2));
                                                                curFirmwareCRC16 = (UInt16)((curFirmwareCRC16 + b) & 0xffff);
                                                                CheckSum = CheckSum + b;
                                                                CheckSum = CheckSum % 256;
                                                            }
                                                            // Append checksum at last
                                                            strSend += ByteToHex((byte)CheckSum);
                                                            curFirmwareLength += Data.Length / 2;
                                                            Send(strSend + "\r", sockInfo.Socket); //strSend
                                                            Logger.LogToEvent("Check AF send: " + strSend, System.Diagnostics.EventLogEntryType.Warning);
                                                            curFirmwareSendStr = strSend;
                                                        }
                                                        else
                                                        {
                                                            strSend = "V,";
                                                            strSend += LongToHexCRC(curFirmwareLength);
                                                            strSend += ",";
                                                            strSend += ShortToHex(curFirmwareCRC16);
                                                            Send(strSend + "\r", sockInfo.Socket); //strSend
                                                            //SendCommand(strSend);
                                                            Logger.LogToEvent("Check AV send: " + strSend, System.Diagnostics.EventLogEntryType.Warning);
                                                        }
                                                    }
                                                    catch (Exception ex)
                                                    {
                                                        Logger.LogToFile(mLogFile, "SendFirmware Exception" + ex.ToString(), true);
                                                        Logger.LogToEvent("SendFirmware: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                                                    }
                                                }
                                                else if (tempData.Substring(2, 1) == "V")
                                                {
                                                    Logger.LogToEvent("Check Send V", System.Diagnostics.EventLogEntryType.Warning);
                                                    Logger.LogToFile(mLogFile, "Firmware upgrade sucesssfully", true);
                                                }
                                                break;
                                            case "N":
                                                // NAck
                                                if (tempData.Substring(2, 1) == "F")
                                                {
                                                    try
                                                    {
                                                        SendFirmwareRetry += 1;
                                                        if ((SendFirmwareRetry <= 3)) Send(curFirmwareSendStr + "\r", sockInfo.Socket); //strSend
                                                        Logger.LogToEvent("Check AF resend: " + curFirmwareSendStr, System.Diagnostics.EventLogEntryType.Warning);
                                                    }
                                                    catch (Exception ex)
                                                    {
                                                        Logger.LogToFile(mLogFile, "SendFirmware Exception" + ex.ToString(), true);
                                                        Logger.LogToEvent("SendFirmware: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                                                    }
                                                    Logger.LogToEvent("Check Send N", System.Diagnostics.EventLogEntryType.Warning);
                                                }
                                                break;
                                        }

                                        //string sourceFile = @"D:\\data\\MobileyeDPU_0203IAP.dpu";
                                        string sourceFile = @"D:\\data\\MobileyeDPU_0202IAP_FastLED.dpu";
                                        rBinFile = new BinFileReader(sourceFile);

                                        if (rBinFile.ReadIntoMemory() == true)
                                        {
                                            rBinFile.Rewind();
                                            curFirmwareCRC16 = 0;
                                            curFirmwareLength = 0;

                                            try
                                            {
                                                try
                                                {
                                                    if (rBinFile.ReadNextBlock(ref Address, ref Data) == true)
                                                    {
                                                        int b = 0;
                                                        int CheckSum = 0;
                                                        strSend = "F,";

                                                        strSend += LongToHex(Address);
                                                        strSend += ",";
                                                        strSend += Data;
                                                        for (int i = 0; i <= Data.Length - 1; i += 2)
                                                        {
                                                            b = HexToInt(Data.Substring(i, 2));
                                                            curFirmwareCRC16 = (UInt16)((curFirmwareCRC16 + b) & 0xffff);
                                                            CheckSum = CheckSum + b;
                                                            CheckSum = CheckSum % 256;
                                                        }
                                                        // Append checksum at last
                                                        strSend += ByteToHex((byte)CheckSum);
                                                        curFirmwareLength += Data.Length / 2;
                                                        Send(strSend + "\r", sockInfo.Socket); //strSend
                                                        Logger.LogToEvent("First sending: " + strSend, System.Diagnostics.EventLogEntryType.Warning);
                                                        curFirmwareSendStr = strSend;
                                                    }
                                                    else
                                                    {
                                                        strSend = "V,";
                                                        strSend += LongToHexCRC(curFirmwareLength);
                                                        strSend += ",";
                                                        strSend += ShortToHex(curFirmwareCRC16);
                                                        Send(strSend + "\r", sockInfo.Socket); //strSend
                                                        Logger.LogToEvent("length: " + curFirmwareLength, System.Diagnostics.EventLogEntryType.Information);

                                                    }
                                                }
                                                catch (Exception ex)
                                                {
                                                    Logger.LogToFile(mLogFile, "SendFirmware Exception" + ex.ToString(), true);
                                                    Logger.LogToEvent("SendFirmware: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                                                }

                                                //else
                                                //{
                                                //    SendFirmwareRetry += 1;
                                                //    if ((SendFirmwareRetry <= 3))
                                                //    {
                                                //        Send(curFirmwareSendStr, sockInfo.Socket); //strSend
                                                //        //SendCommand(curFirmwareSendStr);
                                                //    }
                                                //}
                                            }
                                            catch (Exception ex)
                                            {
                                                Logger.LogToEvent("SendFirmware Exception" + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                                            }
                                        }
                                        else
                                        {
                                            Logger.LogToFile(mLogFile, "Firmware load fail", true);
                                            Logger.LogToEvent("Firmware load fail", System.Diagnostics.EventLogEntryType.Error);
                                        }
                                    }
                                    catch (Exception ex)
                                    {
                                        Logger.LogToEvent("OTA Exception: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                                    }
                                }
                              
                                //find the header
                                if (tempData.Contains("K")) // ack data
                                {
                                    Send("A,K\r", sockInfo.Socket);
                                    //Send("E,\r", sockInfo.Socket);
                                    if (Settings.Default.ProjectName == "Chuanfa") Logger.LogToFile(mLogFile, "ACK SENT", true);
                                }
                                //else if (tempData.Contains("F")) // send ack in ota
                                //{
                                //    //Logger.LogToEvent("Count SendFirmwareRetry: " + SendFirmwareRetry, System.Diagnostics.EventLogEntryType.Information);
                                //    if ((SendFirmwareRetry <= 3)) Send(strSend + "\r", sockInfo.Socket); //strSend
                                //}

                                //else if (tempData.Contains("E")) //check firmware
                                //{
                                //    Logger.LogToEvent("Firmware version: " + arrData[1].Substring(0, 4), System.Diagnostics.EventLogEntryType.Warning);
                                //}
                                else
                                {
                                    if (Settings.Default.ProjectName == "Chuanfa") Logger.LogToFile(mLogFile, "K NOT FOUND", true);
                                }
                            }
                            catch { strBuffer = ""; }
                        }

                        // loop through messages
                        //while (strBuffer.Contains("\r"))
                        //{
                        //    try
                        //    {
                        //        // get message
                        //        iLen = strBuffer.IndexOf("\r") + 1;
                        //        strData += strBuffer.Substring(0, iLen);
                        //        strBuffer = strBuffer.Substring(iLen);
                        //    }
                        //    catch { strBuffer = ""; }
                        //}

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

                                //SendACK(strData, sockInfo.Socket);

                                //if (strData.Trim() != "")
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
            //DropClient(sockInfo.ID, String.Format("BY CLIENT - {0}", sockInfo.Name));
        }

        public static string DecimalToHexadecimal(int dec)
        {
            if (dec < 1) return "0";

            int hex = dec;
            string hexStr = string.Empty;

            while (dec > 0)
            {
                hex = dec % 16;

                if (hex < 10)
                    hexStr = hexStr.Insert(0, Convert.ToChar(hex + 48).ToString());
                else
                    hexStr = hexStr.Insert(0, Convert.ToChar(hex + 55).ToString());

                dec /= 16;
            }

            return hexStr;
        }

        public static string AsciiToHexadecimal(string str)
        {
            char[] charValues = str.ToCharArray();
            string hexOutput = "";
            foreach (char _eachChar in charValues)
            {
                // Get the integral value of the character.
                int value = Convert.ToInt32(_eachChar);
                // Convert the decimal value to a hexadecimal value in string form.
                hexOutput += String.Format("{0:X}", value);
                // to make output as your eg 
                //  hexOutput +=" "+ String.Format("{0:X}", value);

            }
            return hexOutput;
        }

        public FMSWebApi.Models.DeviceInfo GetDeviceInfo(string itag)
        {
            FMSWebApi.Models.DeviceInfo currDevice = new FMSWebApi.Models.DeviceInfo();
            string query = string.Format("SELECT * FROM view_tags WHERE name = @Tag");

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                using (MySqlCommand cmd = new MySqlCommand())
                {
                    conn.Open();
                    cmd.Connection = conn;
                    cmd.CommandText = query;
                    cmd.Prepare();
                    cmd.Parameters.AddWithValue("@Tag", itag);
                    MySqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        currDevice = DataMgrTools.BuildDevice(reader);
                    }
                    conn.Close();
                }
            }
            return currDevice;
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
        /// ACK for MobileEye Device
        /// [Dan:09Feb16] 
        /// </summary>
        /// <param name="strData"></param>
        /// <param name="sockClient"></param>
        private string SendACK(string strData, Socket sockClient)
        {
            string strACK = "";
            try
            {
                const char CR = (char)13;  //Cr

                if (strData.StartsWith("K"))
                    strACK = "A,K" + CR;

                Send(strACK, sockClient);
            }
            catch (Exception ex)
            {
                // log error
                Service1.LogError("SendACK", ex.Message);
            }

            return strACK;
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

        #region "OTA functions"
        public static string LongToHex(long Value)
        {
            return string.Format("0{0:X}", Value);
        }
        private int HexToInt(string str)
        {
            int ret = 0;
            int i = 0;
            int b = 0;

            for (i = 0; i <= str.Length - 1; i++)
            {
                ret *= 16;
                b = Strings.Asc(str[i]);
                if (b >= Strings.Asc("0") & b <= Strings.Asc("9"))
                {
                    ret += b - Strings.Asc("0");
                }
                else
                {
                    ret += b - Strings.Asc("A") + 10;
                }
            }

            return ret;
        }
        public static string ByteToHex(byte b)
        {
            string ret = b.ToString("X2");

            return ret;
        }
        public static string ShortToHex(int nValue)
        {
            int i = 0;
            string ret = null;

            i = Conversion.Fix(nValue / 256);
            if (i > 256)
            {
                i = i % 256;
            }

            ret = ByteToHex((byte)i);
            i = nValue % 256;
            ret = ret + ByteToHex((byte)i);

            return ret;
        }
        public static string LongToHexCRC(long Value)
        {

            return string.Format("0000{0:X}", Value);
        }
        private void SendFirmware(bool prevSendOk)
        {
            long Address = 0;
            string Data = "";
            string strSend = null;

            try
            {
                if (prevSendOk == true)
                {
                    SendFirmwareRetry = 0;
                    try
                    {
                        if (rBinFile.ReadNextBlock(ref Address, ref Data) == true)
                        {
                            int b = 0;
                            int CheckSum = 0;
                            strSend = "F,";

                            /*proof that address ref is indeed moved
                            if (Address != 0)
                            {
                                strSend += "ok,";
                            }
                            */
                            strSend += LongToHex(Address);
                            strSend += ",";
                            strSend += Data;
                            for (int i = 0; i <= Data.Length - 1; i += 2)
                            {
                                b = HexToInt(Data.Substring(i, 2));
                                curFirmwareCRC16 = (UInt16)((curFirmwareCRC16 + b) & 0xffff);
                                CheckSum = CheckSum + b;
                                CheckSum = CheckSum % 256;
                            }
                            // Append checksum at last
                            strSend += ByteToHex((byte)CheckSum);
                            curFirmwareLength += Data.Length / 2;
                            SendCommand(strSend);
                            curFirmwareSendStr = strSend;
                        }
                        else
                        {
                            strSend = "V,";
                            strSend += LongToHexCRC(curFirmwareLength);
                            strSend += ",";
                            strSend += ShortToHex(curFirmwareCRC16);
                            SendCommand(strSend);
                            Logger.LogToFile(mLogFile, "length " + curFirmwareLength, true);
                            Logger.LogToEvent("length" + curFirmwareLength, System.Diagnostics.EventLogEntryType.Information);

                        }
                    }
                    catch (Exception ex)
                    {
                        Logger.LogToFile(mLogFile, "SendFirmware Exception" + ex.ToString(), true);
                        Logger.LogToEvent("SendFirmware: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                    }
                }
                else
                {
                    SendFirmwareRetry += 1;
                    if ((SendFirmwareRetry <= 3))
                    {
                       SendCommand(curFirmwareSendStr);
                    }
                }
            }
            catch(Exception ex)
            {
                Logger.LogToEvent("SendFirmware Exception" + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }

        }
        private void SendCommand(string str)
        {
            try
            {
                byte[] b = Encoding.ASCII.GetBytes(str + Constants.vbCr);
                netstream.Write(b, 0, b.Length);
                Logger.LogToFile(mLogFile, "Send Command-->" + str, true);
                Logger.LogToEvent("Send Command--> " + str, System.Diagnostics.EventLogEntryType.Information);
            }
            catch(Exception ex)
            {
                Logger.LogToEvent("SendCommand Exception: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }

            if (netstream == null)
            {
                return;
            }

        }

        #endregion

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


        public static string ToHex(this string input)
        {
            StringBuilder sb = new StringBuilder();
            foreach (char c in input)
                sb.AppendFormat("{0:X2}", (int)c);
            return sb.ToString().Trim();
        }       
    }
}
