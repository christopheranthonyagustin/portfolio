using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Net.Security;
using System.Runtime.InteropServices;
using System.Security.Cryptography.X509Certificates;
using System.ServiceModel;
using System.ServiceProcess;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading;
using System.Xml;
using System.Xml.Linq;
using FMSWinSvc.Properties;
using FMSWinSvc.FmsWcfApi;
using System.Net.Sockets;
using System.Threading.Tasks;
using System.Net.Http;
using System.Net.Http.Headers;
using HelperTools;
using Protocols;

namespace FMSWinSvc
{
    public partial class Service1 : ServiceBase
    {
        private FmsWcfClient m_svcClient = new FmsWcfClient("BasicHttpBinding_IFmsWcf");
        private List<Service1> m_arrServices = new List<Service1>();
        private static List<RawData> m_arrData = new List<RawData>();
        private SocketServer m_sockServer = null;
        private Timer tmrStatus = null;        
        private string m_strPort = "";
        private bool m_bMain = false;
        private int m_iType = 0;
        private Stopwatch stopwatch2ndEndpt; //[Dan:05Jun14]

        /// <summary>
        /// class constructor
        /// </summary>
        public Service1(string strPort)
        {
            // initialize class
            InitializeComponent();
            ServicePointManager.ServerCertificateValidationCallback = delegate(object s, X509Certificate certificate,
                X509Chain chain, SslPolicyErrors sslPolicyErrors) { return true; };

            // initialize settings
            string[] arrTemp = strPort.Split(":".ToCharArray());
            m_strPort = arrTemp[0].Trim();
            if (arrTemp.Length > 1) m_iType = Convert.ToInt32(arrTemp[1].Trim());
            m_bMain = (strPort == "");
        }

        /// <summary>
        /// event called on start of service
        /// </summary>
        /// <param name="args"></param>
        protected override void OnStart(string[] args)
        {
            // start service
            RunService();
        }

        /// <summary>
        /// starts the service
        /// </summary>
        public void RunService()
        {
            try
            {
                // check if first instance of service
                if (m_bMain)
                {
                    // parse device ports, get first one
                    string[] arrPorts = Settings.Default.DataPort.Split(",".ToCharArray());
                    string[] arrTemp = arrPorts[0].Split(":".ToCharArray());
                    m_strPort = arrTemp[0].Trim();
                    if (arrTemp.Length > 1) m_iType = Convert.ToInt32(arrTemp[1].Trim());

                    // loop through other device ports
                    for (int i = 1; i < arrPorts.Length; i++)
                    {
                        // run other instances of the service
                        Service1 svcInstance = new Service1(arrPorts[i]);
                        svcInstance.RunService();
                        m_arrServices.Add(svcInstance);
                    }
                }

                // log start of service
                LogEvent(3, String.Format("{0} service started (Port {1}).", Settings.Default.ProjectName, m_strPort));
                

                // open tcp/ip server
                m_sockServer = new SocketServer(this, Convert.ToInt32(m_strPort), m_iType);
                m_sockServer.RunServer(true);

                // check if first instance
                if (m_bMain)
                {
                    // start running service processes
                    tmrStatus = new System.Threading.Timer(this.OnTimerTick, null, 3000, Timeout.Infinite);                  
                }
            }
            catch (Exception ex)
            {
                // log error
                LogError("RunService", ex.Message);
            }
        }

        /// <summary>
        /// periodically checks all assets' status
        /// </summary>
        /// <param name="stateInfo"></param>
        public void OnTimerTick(Object stateInfo)
        {
            long iElapsed = 0;
            try
            {
                // record start time
                Stopwatch stopWatch = new Stopwatch();
                stopWatch.Start();

                // run periodic processes
                ProcessData();
                m_sockServer.CheckConnections();
                CheckOutbox();
                // get elapsed time
                iElapsed = stopWatch.ElapsedMilliseconds;
            }
            catch (Exception ex)
            {
                // log error
                LogError("OnTimerTick", ex.Message);
            }

            // restart timer
            tmrStatus.Change(Math.Max(0, 3000 - iElapsed), Timeout.Infinite);
        }

        /// <summary>
        /// processes pending data
        /// </summary>
        private void ProcessData()
        {
            try
            {
                
                
                // check pending data
                if (m_arrData.Count > 0)
                {
                   
                    // process received data
                    List<RawData> arrData = new List<RawData>();
                    List<RawData> arrDevice = new List<RawData>();
                  
                    lock (m_arrData)
                    {
                        // loop through pending data
                        foreach (RawData udtTemp in m_arrData)
                        {
                            //LogEvent(0, String.Format("DeviceName Before: {0}\r\n", BUC.GetDeviceID(udtTemp.Data)));

                            //SendDataToOtherServer(udtTemp);//[Dan:05Aug14]
                            //LogEvent(0, String.Format("DeviceName After: {0}\r\n", BUC.GetDeviceID(udtTemp.Data)));

                            SavePositionRunAsync(udtTemp.Data).Wait();

                            // copy raw data
                            RawData udtData = new RawData();
                            udtData.DataID = udtTemp.DataID;
                            udtData.Data = udtTemp.Data;
                            udtData.Tag = udtTemp.Tag;
                            udtData.ServerIP = udtTemp.ServerIP;
                            udtData.ServerPort = udtTemp.ServerPort;
                            udtData.Timestamp = udtTemp.Timestamp;
                            udtData.RxTime = udtTemp.RxTime;
                            arrData.Add(udtData);

                            // check if device data
                            if (udtData.DataID == 0)
                                arrDevice.Add(udtData);
                            
                        }

                        // clear pending data list
                        m_arrData.Clear();
                       
                    }

                    // log all data to file
                    LogData(arrData);

                    
                    //// check device data
                    //if (arrDevice.Count > 0)
                    //{
                    //    try
                    //    {
                    //        // process device data
                            
                    //        Response udtRet = m_svcClient.ProcessRawData(Settings.Default.MasterKey, arrDevice);
                            
                    //        if ((udtRet != null) && !String.IsNullOrEmpty(udtRet.ErrMessage) && (m_sockServer != null))
                    //        {
                    //            // check gps devices
                    //            string[] arrDevs = udtRet.ErrMessage.Split(",".ToCharArray());
                    //            foreach (string strDev in arrDevs)
                    //            {
                    //                // name client - checking of duplicate connection
                    //                string[] arrTemp = strDev.Split("=".ToCharArray());
                    //                if (arrTemp.Length > 1) m_sockServer.NameClient(arrTemp[0].Trim(), arrTemp[1].Trim());
                    //            }
                    //        }
                    //    }
                    //    catch (Exception ex)
                    //    {
                    //        LogError("Process Data-ProcessRawData", ex.Message);
                    //    }
                    //}

                    // release memory
                    arrData.Clear();
                    arrDevice.Clear();             
                    arrData = null;
                    arrDevice = null;
                    GC.Collect();

                   
                }
            }
          
            catch (Exception ex)
            {
                // log error
                LogError("ProcessData-Main", ex.Message);
            }
        }

        private async Task SavePositionRunAsync(string rawData)
        {
            var posData = new object();

            try
            {
                Enums.DeviceType currType = Device.GetType(rawData);
                //if (rawData.Contains(Consts.GG400WT_HEAD))
                //Logger.LogToEvent("RawData: " + rawData + "-Type: " + currType.ToString(), EventLogEntryType.Warning);

                switch (currType)
                {
                    case Enums.DeviceType.GG400:
                        {
                            GG400 devGg = new GG400();
                            posData = devGg.ParseData(rawData);
                        }
                        break;

                    case Enums.DeviceType.COBAN103A:
                        {
                            Coban103A devCobanA = new Coban103A();
                            posData = devCobanA.ParseData(rawData);
                        }
                        break;

                    case Enums.DeviceType.GG900:
                        {
                            GG900 devGG900 = new GG900();
                            posData = devGG900.ParseData(rawData);
                        }
                        break;

                    case Enums.DeviceType.MDT:
                        {
                            MDT devMDT = new MDT();
                            posData = devMDT.ParseData(rawData);
                        }
                        break;

                    case Enums.DeviceType.AT07:
                        {
                            AT07 devAT07 = new AT07();
                            posData = devAT07.ParseData(rawData);
                        }
                        break;

                    //case Enums.DeviceType.N32A:
                    //    {
                    //        N32A devN32A = new N32A();
                    //        posData = devN32A.ParseData(rawData);
                    //    }
                    //    break;

                    //case Enums.DeviceType.AVL301:
                    //    {
                    //        AVL301 devAVL301 = new AVL301();
                    //        posData = devAVL301.ParseData(rawData);
                    //    }
                    //    break;

                    //case Enums.DeviceType.GT06N:
                    //    {
                    //        GT06N devGT06N = new GT06N();
                    //        posData = devGT06N.ParseData(rawData);
                    //    }
                    //    break;
                   

                    //case Enums.DeviceType.MobileEye:
                    //    {
                    //        MobileEye devMobileEye = new MobileEye();
                    //        posData = devMobileEye.ParseData(rawData);
                    //    }
                    //    break;

                    case Enums.DeviceType.MDVR:
                        {
                            MDVR devMDVR = new MDVR();
                            posData = devMDVR.ParseData(rawData);
                        }
                        break;

                    //case Enums.DeviceType.iRevo:
                    //    {
                    //        iRevo deviRevo = new iRevo();
                    //        posData = deviRevo.ParseData(rawData);
                    //    }
                    //    break;

                    default:
                        return;
                }   

                using (var client = new HttpClient())
                {
                    client.BaseAddress = new Uri("http://103.237.168.119/adswebapi/");
                    //client.BaseAddress = new Uri("http://103.237.168.119/trackdemowebapi/");
                    //client.BaseAddress = new Uri("http://103.237.168.119/trackvnwebapi/");
                    //client.BaseAddress = new Uri("http://103.237.168.119/tracksgwebapi/");
                    //client.BaseAddress = new Uri("http://103.237.168.119/trackwebapi/");
                    client.DefaultRequestHeaders.Accept.Clear();
                    client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                    HttpResponseMessage response = await client.PostAsJsonAsync("api/posinfo/", posData);
                    string webapiResult = response.Content.ReadAsStringAsync().Result;
                    if (response.IsSuccessStatusCode)
                    {
                        // Get the URI of the created resource.
                        
                        //Logger.LogToEvent(webapiResult, EventLogEntryType.Information);
                        //LogEvent(3, "SavePositionRunAsync INFO: " + webapiResult);

                    }
                    else
                    {
                        LogEvent(3, "SavePositionRunAsync Failed: " + webapiResult);

                    }

                    ///Console.ReadLine();
                }
            }
            catch (Exception ex)
            {
                Logger.LogToEvent("SavePositionRunSync ERROR: " + ex.Message, EventLogEntryType.Error);
            }
        }
      

        /// <summary>
        /// checks messages queued for sending
        /// </summary>
        private int CheckOutbox()
        {
            List<MessageInfo> arrMessages = null;
            List<long> arrSent = new List<long>();
            /*
            try
            {
                // get pending messages               
                arrMessages = m_svcClient.GetMessagesEx(Settings.Default.MasterKey, -1, -1);
                foreach (MessageInfo udtMessage in arrMessages)
                {
                    // check if gps device
                    if (udtMessage.Mode == 2)
                    {
                        // check client
                        string strID = m_sockServer.GetClientID(udtMessage.Recipients);
                        if (strID != "")
                        {
                            // check if time synchronization
                            string strMessage = udtMessage.Message;
                            if (strMessage.StartsWith("#TIM") || strMessage.StartsWith("#510"))
                            {
                                try
                                {
                                    // update server time
                                    string[] arrTemp = strMessage.Split("#".ToCharArray());
                                    udtMessage.Message = String.Format("#{0}#{1:yyMMdd}#{1:HHmmss}#{2}##",
                                        arrTemp[1], DateTime.UtcNow, arrTemp[4]);
                                }
                                catch { }
                            }

                            // send command to gps device
                            m_sockServer.Send(udtMessage.Message, strID);
                            arrSent.Add(udtMessage.MessageID);
                        }
                    }
                }

                // check sent messages
                if (arrSent.Count > 0)
                {
                    // update sent messages
                    arrSent.Sort();
                    m_svcClient.SentMessages(Settings.Default.MasterKey, String.Join(",", arrSent));
                }
            }
            catch (Exception ex)
            {
                // log error
                LogError(ex.Message, "CheckOutbox");
                CheckService();
            }
            */
            // clear lists to release memory
            int iCount = arrSent.Count;
            if (arrMessages != null) arrMessages.Clear();
            if (arrSent != null) arrSent.Clear();
            arrMessages = null;
            arrSent = null;
            return iCount;
        }

        /// <summary>
        /// checks web service connection
        /// </summary>
        private void CheckService()
        {
            // close connection
            if (m_svcClient.State == CommunicationState.Faulted)
                m_svcClient.Abort();

            // check connection
            if ((m_svcClient.State != CommunicationState.Opening) &&
                (m_svcClient.State != CommunicationState.Opened))
            {
                // reopen connection
                m_svcClient = new FmsWcfClient("BasicHttpBinding_IFmsWcf");
                m_svcClient.Open();
            }
        }

        /// <summary>
        /// processes message packets received from devices
        /// </summary>
        /// <param name="strData"></param>
        /// <param name="dtRxTime"></param>
        /// <param name="bData"></param>
        /// <param name="strID"></param>
        /// <param name="strServerIP"></param>
        /// <param name="iServerPort"></param>
        public static void QueueData(string strData, DateTime dtRxTime, bool bData, string strID, string strServerIP, int iServerPort)
        {
            // build raw data
            RawData udtData = new RawData();
            udtData.DataID = (bData ? 0 : -1);
            udtData.Data = strData;
            udtData.Tag = strID;
            udtData.ServerIP = strServerIP;
            udtData.ServerPort = iServerPort;
            udtData.Timestamp = new DateTime(2000, 1, 1, 0, 0, 0);
            udtData.RxTime = dtRxTime;

            // add data to list
            lock (m_arrData)
                m_arrData.Add(udtData);
        }

        /// <summary>
        /// An array that contains the devices and their endpoint
        /// </summary>
        /// <param name="strData"></param>SavePositionRunAsync
        /// <param name="dtRxTime"></param>
        /// <param name="bData"></param>
        /// <param name="strID"></param>
        /// <param name="strServerIP"></param>
        /// <param name="iServerPort"></param>
        public static void QueueDevices(string cmdToDevice, string endpoint)
        {
            //// build raw data
            //RawData udtData = new RawData();
            //udtData.DataID = (bData ? 0 : -1);
            //udtData.Data = strData;
            //udtData.Tag = strID;
            //udtData.ServerIP = strServerIP;
            //udtData.ServerPort = iServerPort;
            //udtData.Timestamp = new DateTime(2000, 1, 1, 0, 0, 0);
            //udtData.RxTime = dtRxTime;

            //// add data to list
            //lock (m_arrData)
            //    m_arrData.Add(udtData);
        }


        /// <summary>
        /// logs raw data
        /// </summary>
        /// <param name="arrData"></param>
        private void LogData(List<RawData> arrData)
        {
            try
            {
                // check log path
                if ((Settings.Default.LogPath != "") && Directory.Exists(Settings.Default.LogPath) && (arrData.Count > 0))
                {
                    // get server ports
                    List<int> arrPorts = new List<int>();
                    foreach (RawData udtData in arrData)
                    {
                        // check server port
                        if (!arrPorts.Contains(udtData.ServerPort))
                            arrPorts.Add(udtData.ServerPort);
                    }

                    // loop through server ports
                    foreach (int iPort in arrPorts)
                    {
                        // open log file
                        string strFile = String.Format("{0}\\{1:dd-MMM-yyyy}_{2}.txt",
                            Settings.Default.LogPath, arrData[0].RxTime.ToLocalTime(), iPort);
                        using (StreamWriter fWriter = new StreamWriter(strFile, true))
                        {
                            // log all data
                            foreach (RawData udtData in arrData)
                            {
                                // check server port
                                if (udtData.ServerPort == iPort)
                                {
                                    // log socket data
                                    fWriter.WriteLine(String.Format("{0:HH:mm:ss}\t{1}\t{2}", udtData.RxTime.ToLocalTime(),
                                        udtData.Tag, udtData.Data));
                                }
                            }

                            // save file
                            fWriter.Flush();
                            fWriter.Close();
                        }
                    }
                }
                else//[Dan:08Jan15] Create default logpath if not available 
                {
                    if(!Directory.Exists(Settings.Default.LogPath))
                        Directory.CreateDirectory(@".\RawData");
                }
            }
            catch (Exception ex)
            {
                // log error
                LogError("LogData", ex.Message);
            }
        }

        /// <summary>
        /// logs error to event viewer
        /// </summary>
        /// <param name="strSource"></param>
        /// <param name="strError"></param>
        public static void LogError(string strSource, string strError)
        {
            // log error event
            LogEvent(0, String.Format("{0}\r{1}", strSource, strError));
        }

        /// <summary>
        /// logs event to event viewer
        /// </summary>
        /// <param name="iLevel"></param>
        /// <param name="strLog"></param>
        public static void LogEvent(int iLevel, string strLog)
        {
            try
            {
                // create event source
                string strSource = String.Format("FMSWin-{0}", Settings.Default.DataPort);
                string instanceDir = System.AppDomain.CurrentDomain.BaseDirectory;
                if (!EventLog.SourceExists(strSource))
                    EventLog.CreateEventSource(new EventSourceCreationData(strSource, Settings.Default.ProjectName));

                // check error type
                EventLogEntryType iType = EventLogEntryType.Information;
                switch (iLevel)
                {
                case 0: iType = EventLogEntryType.Error; break;
                case 1: iType = EventLogEntryType.Warning; break;
                }

                // log event
                strLog = String.Format("{0}:\r\n{1}", instanceDir, strLog);
                EventLog.WriteEntry(strSource, strLog, iType);
            }
            catch(Exception ex)
            {
                LogToFile(ex.Message, "error.logs");
            }
        }

        /// <summary>
        /// logs string to external file
        /// </summary>
        public static void LogToFile(string strData, string strName)
        {
            try
            {
                // check directory
                string strFile = String.Format(@"{0}\{1}", System.Windows.Forms.Application.StartupPath, strName);
                string strDir = Path.GetDirectoryName(strFile);
                if (!Directory.Exists(strDir))
                    Directory.CreateDirectory(strDir);

                // create error log file
                using (StreamWriter fWriter = new StreamWriter(strFile, true))
                {
                    // log sql command
                    fWriter.WriteLine(strData);
                    fWriter.Flush();
                    fWriter.Close();
                }
            }
            catch { }
        }

        /// <summary>
        /// gets the tag encryption key
        /// </summary>
        /// <param name="strTag"></param>
        /// <returns></returns>
        public string GetEncryptKey(string strTag)
        {
            // startrack feature; not needed yet
            return "";
        }

        /// <summary>
        /// event called when windows is shutting down
        /// </summary>
        protected override void OnShutdown()
        {
            // stop all running processes
            StopService();
        }

        /// <summary>
        /// event called when service stops running
        /// </summary>
        protected override void OnStop()
        {
            // stop all running processes
            StopService();
        }

        /// <summary>
        /// stops all processes
        /// </summary>
        public void StopService()
        {
            try
            {
                // stop tcp/ip server
                if (m_sockServer != null)
                    m_sockServer.RunServer(false);

                // check if main instance
                if (m_bMain)
                {
                    // stop service instance on other ports
                    foreach (Service1 svcInstance in m_arrServices)
                        svcInstance.StopService();
                }

                // process pending data
                ProcessData();
                m_svcClient.Close();

                // log end of service
                LogEvent(2, String.Format("{0} service stopped (Port {1}).", Settings.Default.ProjectName, m_strPort));
            }
            catch (Exception ex)
            {
                // log error
                LogError("OnStop", ex.Message);
            }
        }

        
    }
}