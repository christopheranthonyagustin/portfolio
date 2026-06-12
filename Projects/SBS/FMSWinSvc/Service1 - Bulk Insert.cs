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
using MySql.Data.MySqlClient;
using FMSWebApi;

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
        private Stopwatch stopwatch2ndEndpt; 
        private string mConnStr = "server=103.237.168.119;uid=root;pwd=@c3c0M;database=trackdemo;Charset=utf8;";
        private string mProjName = "FMS-PSA";

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

                            //SavePositionRunAsync(udtTemp.Data).Wait();
                            Task.Run(() => SavePosRunAsync(udtTemp.Data)).Wait();


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

                    case Enums.DeviceType.MobileEye:
                        {
                            MobileEye devMobileEye = new MobileEye();
                            posData = devMobileEye.ParseData(rawData);
                        }
                        break;



                    default:
                        return;
                }   


                //CALL API
                using (var client = new HttpClient())
                {
                    client.BaseAddress = new Uri("http://103.237.168.119/trackdemowebapi/");
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

        public async Task SavePosRunAsync(string rawData)
        {

            FMSWebApi.Models.PosInfo newPos = new FMSWebApi.Models.PosInfo();
            FMSWebApi.Models.AssetInfo currAsset = new FMSWebApi.Models.AssetInfo();

           string Command = "INSERT INTO positions (asset_id, tag_id, timestamp, rx_time, fix, " +
                                                    "satellites, pos_x, pos_y, pos_z, speed, course, hdop, ignition, mileage, battery, fuel, " +
                                                    "loc, loc_id, zone_id, remarks, engine, driver, headway, event, event_value) VALUES " +
                                                    "(@AssetID, @TagID, @Timestamp, @RxTime, @FixID, @Satellites, @PosX, @PosY, @PosZ, @Speed, " +
                                                    "@Course, @Hdop, @Ignition, @Mileage, @Battery, @Fuel, @Location, @LocID, @ZoneID, @Remarks, " +
                                                    "@Engine, @Driver, @Headway, @Event, @EventValue)";
            try
            {

                //MySql.Data.MySqlClient.MySqlConnection sqConnection = new MySql.Data.MySqlClient.MySqlConnection(mConnStr);
                //await sqConnection.OpenAsync();
                //sqConnection.Close();

                                     
                        string deviceID = "";

                        if (rawData.Contains(Consts.MobileEye_HEAD))
                        {
                            string[] arrData = rawData.Split(",".ToCharArray());

                            DateTime tmpDT = new DateTime();
                            DateTime.TryParse(String.Format("{0}-{1}-{2} {3}:{4}:{5}",
                                arrData[2].Substring(0, 2), arrData[2].Substring(2, 2), arrData[2].Substring(4, 2),
                                arrData[3].Substring(0, 2), arrData[3].Substring(2, 2), arrData[3].Substring(4, 2)),
                                out tmpDT);

                            if (arrData.Length > 0)
                            {
                                //get IMEI/Device ID
                                deviceID = arrData[1].Substring(arrData[0].IndexOf(':') + 1);
                                newPos.Tag = deviceID;
                                //Logger.LogToEvent("Get deviceID: " + deviceID, EventLogEntryType.Error);
                                newPos.RxTime = DateTime.UtcNow;
                                newPos.FixID = (arrData[0] == "L" ? 2 : 4);
                                newPos.Satellites = 0;
                                newPos.Timestamp = tmpDT;
                                //Logger.LogToEvent("Get Timestamp: " + newPos.Timestamp, System.Diagnostics.EventLogEntryType.Warning);
                                newPos.PosY = 0;//parse latitude
                                newPos.PosX = 0;//parse longitude                          
                                newPos.Speed = ConvertDoubleHexToDecimal(arrData[4]);
                                //Logger.LogToEvent("Get Speed: " + newPos.Speed, System.Diagnostics.EventLogEntryType.Warning);
                                newPos.Headway = ConvertHexToDecimal(arrData[5]);  //parse headway
                                //Logger.LogToEvent("Get Headway: " + newPos.Headway, System.Diagnostics.EventLogEntryType.Warning);
                                newPos.Event = ConvertHexToASCII(arrData[6]); //parse event
                                //Logger.LogToEvent("Get Event: " + newPos.Event, System.Diagnostics.EventLogEntryType.Warning);
                                newPos.EventValue = ConvertHexToDecimal(arrData[7].Substring(0, 2));//parse event value
                                //Logger.LogToEvent("Get Event Value: " + newPos.EventValue, System.Diagnostics.EventLogEntryType.Warning);


                                #region GET THE LINKED ASSET
                                try
                                {
                                    currAsset = GetByTagName(deviceID);
                                }
                                catch (Exception ex)
                                {
                                    Logger.LogToEvent(mProjName, ex.Message, System.Diagnostics.EventLogEntryType.Error);
                                }
                                #endregion

                                int AssetID = currAsset.AssetID;
                                //Logger.LogToEvent("Get AssetID: " + currAsset.AssetID, System.Diagnostics.EventLogEntryType.Error);

                                //set engine value
                                int iEngine = (newPos.Ignition == 0 ? 0 : (newPos.Speed > 0 ? 2 : 1));
                                newPos.Engine = iEngine.ToString();

                                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                                {
                                    await conn.OpenAsync();
                                    MySqlTransaction transaction = conn.BeginTransaction();

                                    //Obtain a dataset, obviously a "select *" is not the best way...
                                    var mySqlDataAdapterSelect = new MySqlDataAdapter("select * from positions", conn);

                                    var ds = new DataSet();

                                    mySqlDataAdapterSelect.Fill(ds, "positions");

                                    var mySqlDataAdapter = new MySqlDataAdapter();

                                    mySqlDataAdapter.InsertCommand = new MySqlCommand(Command, conn);

                                    mySqlDataAdapter.InsertCommand.Parameters.Add("@AssetID", MySqlDbType.Int64, 64, "asset_id");
                                    mySqlDataAdapter.InsertCommand.Parameters.Add("@TagID", MySqlDbType.Int32, 32, "tag_id");
                                    mySqlDataAdapter.InsertCommand.Parameters.Add("@Timestamp", MySqlDbType.DateTime, 6, "timestamp");
                                    mySqlDataAdapter.InsertCommand.Parameters.Add("@RxTime", MySqlDbType.DateTime, 6, "rx_time");
                                    mySqlDataAdapter.InsertCommand.Parameters.Add("@FixID", MySqlDbType.Int32, 32, "fix");
                                    mySqlDataAdapter.InsertCommand.Parameters.Add("@Satellites", MySqlDbType.Int32, 32, "satellites");
                                    mySqlDataAdapter.InsertCommand.Parameters.Add("@PosX", MySqlDbType.Double, 16, "pos_x");
                                    mySqlDataAdapter.InsertCommand.Parameters.Add("@PosY", MySqlDbType.Double, 16, "pos_y");
                                    mySqlDataAdapter.InsertCommand.Parameters.Add("@PosZ", MySqlDbType.Double, 16, "pos_z");
                                    mySqlDataAdapter.InsertCommand.Parameters.Add("@Speed", MySqlDbType.Double, 16, "speed");
                                    mySqlDataAdapter.InsertCommand.Parameters.Add("@Course", MySqlDbType.Double, 16, "course");
                                    mySqlDataAdapter.InsertCommand.Parameters.Add("@Hdop", MySqlDbType.Double, 16, "hdop");
                                    mySqlDataAdapter.InsertCommand.Parameters.Add("@Ignition", MySqlDbType.Int32, 32, "ignition");
                                    mySqlDataAdapter.InsertCommand.Parameters.Add("@Mileage", MySqlDbType.Double, 16, "mileage");
                                    mySqlDataAdapter.InsertCommand.Parameters.Add("@Battery", MySqlDbType.Double, 16, "battery");
                                    mySqlDataAdapter.InsertCommand.Parameters.Add("@Fuel", MySqlDbType.Double, 16, "fuel");
                                    mySqlDataAdapter.InsertCommand.Parameters.Add("@Location", MySqlDbType.VarChar, 500, "loc");
                                    mySqlDataAdapter.InsertCommand.Parameters.Add("@LocID", MySqlDbType.Int32, 32, "loc_id");
                                    mySqlDataAdapter.InsertCommand.Parameters.Add("@ZoneID", MySqlDbType.Int32, 32, "zone_id");
                                    mySqlDataAdapter.InsertCommand.Parameters.Add("@Remarks", MySqlDbType.VarChar, 200, "remarks");
                                    mySqlDataAdapter.InsertCommand.Parameters.Add("@Engine", MySqlDbType.Int32, 32, "engine");
                                    mySqlDataAdapter.InsertCommand.Parameters.Add("@Driver", MySqlDbType.VarChar, 100, "driver");
                                    mySqlDataAdapter.InsertCommand.Parameters.Add("@Headway", MySqlDbType.VarChar, 100, "headway");
                                    mySqlDataAdapter.InsertCommand.Parameters.Add("@Event", MySqlDbType.VarChar, 100, "event");
                                    mySqlDataAdapter.InsertCommand.Parameters.Add("@EventValue", MySqlDbType.VarChar, 100, "event_value");
                                    mySqlDataAdapter.InsertCommand.UpdatedRowSource = UpdateRowSource.None;

                                    var stopwatch = new Stopwatch();
                                    stopwatch.Start();

                                    for (int i = 0; i < 50000; i++)
                                    {
                                        DataRow row = ds.Tables["positions"].NewRow();
                                        row["asset_id"] = AssetID;
                                        row["tag_id"] = deviceID;
                                        row["timestamp"] = tmpDT;
                                        row["rx_time"] = newPos.RxTime;
                                        row["fix"] = newPos.FixID;
                                        row["satellites"] = newPos.Satellites;
                                        row["pos_x"] = newPos.PosX;
                                        row["pos_y"] = newPos.PosY;
                                        row["pos_z"] = 0;
                                        row["speed"] = newPos.Speed;
                                        row["course"] = 0;
                                        row["hdop"] = 0;
                                        row["ignition"] = 0;
                                        row["mileage"] = 0;
                                        row["battery"] = 0;
                                        row["fuel"] = 0;
                                        row["loc"] = "";
                                        row["loc_id"] = 0;
                                        row["zone_id"] = 0;
                                        row["remarks"] = "Test King";
                                        row["engine"] = iEngine;
                                        row["driver"] = "";
                                        row["headway"] = newPos.Headway;
                                        row["event"] = newPos.Event;
                                        row["event_value"] = newPos.EventValue;
                                        ds.Tables["positions"].Rows.Add(row);
                                    }

                                    mySqlDataAdapter.UpdateBatchSize = 100;
                                    mySqlDataAdapter.Update(ds, "positions");

                                    transaction.Commit();

                                    stopwatch.Stop();

                                    Logger.LogToEvent("Inserts took " + stopwatch.ElapsedMilliseconds + "ms", System.Diagnostics.EventLogEntryType.Warning);

                                  
                                   conn.Close();
                               }
                                              
                    }
                }

            }
            catch (Exception ex)
            {
                Logger.LogToEvent("SavePositionRunSync ERROR: " + ex.Message, EventLogEntryType.Error);
            }

        }

        public FMSWebApi.Models.AssetInfo GetByTagName(string tagName)
        {

            FMSWebApi.Models.AssetInfo currAsset = new FMSWebApi.Models.AssetInfo();
            string query = string.Format("SELECT * FROM view_assets WHERE tag = @Tag");


            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = query;
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@Tag", tagName);
                        MySqlDataReader reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            currAsset = DataMgrTools.BuildAsset(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogToEvent(ex.Message + "-GetByTagName", System.Diagnostics.EventLogEntryType.Error);
                    conn.Close();
                }
            }
            return currAsset;
        }


        private double ConvertDoubleHexToDecimal(string HexValue)
        {
            int decValue = Convert.ToInt32(HexValue, 16);
            double retVal = System.Convert.ToDouble(decValue);

            return retVal;
        }

        private string ConvertHexToDecimal(string HexValue)
        {
            int decValue = Convert.ToInt32(HexValue, 16);
            string StrValue = decValue.ToString();

            return StrValue;
        }


        private string ConvertHexToASCII(string HexValue)
        {
            string StrValue = "";
            foreach (char c in HexValue)
            {
                int IntValue = System.Convert.ToInt32(c);
                StrValue = IntValue.ToString();
            }

            return StrValue;
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