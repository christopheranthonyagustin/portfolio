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

        //private string mConnStr = "server=localhost;uid=root;pwd=@c3c0M;database=trackdemo;Charset=utf8;";
        private string mConnStr = Settings.Default.mConnStr;
        private string mProjName = "SBS";

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
                            //SavePositionRunAsync(udtTemp.Data).Wait();
                            if (Settings.Default.ProjectName == "Chuanfa") Task.Run(() => SavePosRunAsync(udtTemp.Data)).Wait();

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
                    if (Settings.Default.ProjectName == "Chuanfa") LogData(arrData);
                    if (Settings.Default.ProjectName == "Chuanfa") LogRawData(arrData);

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
            FMSWebApi.Models.DriverInfo currDriver = new FMSWebApi.Models.DriverInfo();

            try
            {

                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        await conn.OpenAsync();


                        string deviceID = "";

                        if (rawData.Contains(Consts.MobileEye_HEAD))
                        {
                            string[] arrData = rawData.Split(",".ToCharArray());

                            DateTime tmpDT = new DateTime();

                            if (Settings.Default.IP == "103.237.168.119")
                            {
                                DateTime.TryParse(String.Format("{0}-{1}-{2} {3}:{4}:{5}", //Acecom server
                                arrData[2].Substring(0, 2), arrData[2].Substring(2, 2), arrData[2].Substring(4, 2),
                                arrData[3].Substring(0, 2), arrData[3].Substring(2, 2), arrData[3].Substring(4, 2)),
                                out tmpDT);
                            }
                            else if (Settings.Default.IP == "66.96.208.81")
                            {
                                string date = String.Format("{0}{1}{2}", arrData[2].Substring(0, 2), arrData[2].Substring(2, 2), arrData[2].Substring(4, 2));
                                string time = String.Format("{0}{1}{2}", arrData[3].Substring(0, 2), arrData[3].Substring(2, 2), arrData[3].Substring(4, 2));                         
                                tmpDT = BuildTimestamp(date, time);
                            }


                            if (arrData.Length > 0)
                            {
                                //get IMEI/Device ID
                                deviceID = Regex.Replace(arrData[1], @"\s+", "");

                                if (deviceID.Length == 5)
                                {
                                    string input = arrData[1].Substring(4, 1);

                                    foreach (char letter in input)
                                    {
                                        bool isLetterOrDigit = char.IsLetterOrDigit(letter);
                                        if (isLetterOrDigit)
                                        {
                                            newPos.Tag = arrData[1].Substring(0, 5);
                                        }
                                        else
                                        {
                                            newPos.Tag = arrData[1].Substring(0, 4);
                                        }
                                    }
                                }
                                else if (deviceID.Length == 4)
                                {
                                    newPos.Tag = arrData[1].Substring(0, 4);
                                }

                                newPos.RxTime = DateTime.UtcNow;
                                newPos.FixID = (arrData[7] == "1" ? 2 : 4);
                                newPos.Satellites = 0;
                                newPos.Timestamp = tmpDT;
                                newPos.PosY = ConvertLatLong(arrData[4]);//parse latitude
                                newPos.PosX = ConvertLatLong(arrData[5]);//parse longitude
                                newPos.Course = BuildCourse(arrData[6]); //parse course
                                newPos.Speed = ConvertDoubleHexToDecimal(arrData[8]);
                                newPos.Headway = ConvertHexToDecimal(arrData[9]);  //parse headway
                                newPos.Event = ConvertHexToASCII(arrData[10]); //parse event
                                newPos.EventValue = ConvertHexToDecimal(arrData[11].Substring(0, 2));//parse event value

                                #region GET THE LINKED ASSET

                                try
                                {
                                    currAsset = GetByTagName(newPos.Tag);
                                }
                                catch (Exception ex)
                                {
                                    Logger.LogToEvent(mProjName, ex.Message, System.Diagnostics.EventLogEntryType.Error);
                                }
                                #endregion
                          
                                if (currAsset.AssetID != 0)
                                {
                                    //set engine value
                                    int iEngine = (newPos.Ignition == 0 ? 0 : (newPos.Speed > 0 ? 2 : 1));
                                    newPos.Engine = iEngine.ToString();

                                    //get asset drivers
                                    try
                                    {
                                        currDriver = GetDriver(currAsset.AssetID);
                                        newPos.Driver = currDriver.Name;
                                        newPos.DriverID = currDriver.DriverID;
                                    }
                                    catch (Exception ex)
                                    {
                                        Logger.LogToEvent("Get Driver: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                                    }

                                    // get previous position
                                    FMSWebApi.Models.PosInfo udtPrev = GetPosition(currAsset.LastFixID);

                                    cmd.Connection = conn;
                                    cmd.CommandText = "INSERT INTO positions (asset_id, tag_id, timestamp, rx_time, fix, " +
                                                        "satellites, pos_x, pos_y, pos_z, speed, course, hdop, ignition, mileage, battery, fuel, " +
                                                        "loc, loc_id, zone_id, remarks, engine, driver, headway, event, event_value) VALUES " +
                                                        "(@AssetID, @TagID, @Timestamp, @RxTime, @FixID, @Satellites, @PosX, @PosY, @PosZ, @Speed, " +
                                                        "@Course, @Hdop, @Ignition, @Mileage, @Battery, @Fuel, @Location, @LocID, @ZoneID, @Remarks, " +
                                                        "@Engine, @Driver, @Headway, @Event, @EventValue)";
                                    cmd.Prepare();
                                    cmd.Parameters.AddWithValue("@AssetID", currAsset.AssetID);
                                    cmd.Parameters.AddWithValue("@TagID", currAsset.TagID);
                                    cmd.Parameters.AddWithValue("@Timestamp", tmpDT);
                                    cmd.Parameters.AddWithValue("@RxTime", newPos.RxTime);
                                    cmd.Parameters.AddWithValue("@FixID", newPos.FixID);
                                    cmd.Parameters.AddWithValue("@Satellites", newPos.Satellites);
                                    cmd.Parameters.AddWithValue("@PosX", newPos.PosX);
                                    cmd.Parameters.AddWithValue("@PosY", newPos.PosY);
                                    cmd.Parameters.AddWithValue("@PosZ", 0);
                                    cmd.Parameters.AddWithValue("@Speed", newPos.Speed);
                                    cmd.Parameters.AddWithValue("@Course", newPos.Course);
                                    cmd.Parameters.AddWithValue("@Hdop", 0);
                                    cmd.Parameters.AddWithValue("@Ignition", 0);
                                    cmd.Parameters.AddWithValue("@Mileage", 0);
                                    cmd.Parameters.AddWithValue("@Battery", 0);
                                    cmd.Parameters.AddWithValue("@Fuel", 0);
                                    cmd.Parameters.AddWithValue("@Location", "");
                                    cmd.Parameters.AddWithValue("@LocID", 0);
                                    cmd.Parameters.AddWithValue("@ZoneID", 0);
                                    cmd.Parameters.AddWithValue("@Remarks", "");
                                    cmd.Parameters.AddWithValue("@Engine", iEngine);
                                    cmd.Parameters.AddWithValue("@Driver", currAsset.Driver);
                                    cmd.Parameters.AddWithValue("@Headway", newPos.Headway);
                                    cmd.Parameters.AddWithValue("@Event", newPos.Event);
                                    cmd.Parameters.AddWithValue("@EventValue", newPos.EventValue);
                                    //Logger.LogToEvent("Position Saved: ", System.Diagnostics.EventLogEntryType.Warning);
                                    cmd.ExecuteNonQuery();

                                    // update asset position
                                    long id = cmd.LastInsertedId;
                                    newPos.PosID = id;

                                    cmd.CommandText = "UPDATE assets SET last_pos = @LastPosID, last_fix = @LastFixID, last_gps = @LastGpsID WHERE asset_id = @AssetID2";
                                    cmd.Prepare();
                                    cmd.Parameters.AddWithValue("@LastPosID", newPos.PosID);
                                    cmd.Parameters.AddWithValue("@LastFixID", newPos.PosID);
                                    cmd.Parameters.AddWithValue("@LastGpsID", newPos.PosID);
                                    cmd.Parameters.AddWithValue("@AssetID2", currAsset.AssetID);
                                    cmd.ExecuteNonQuery();
                                }
                            }
                        }


                        conn.Close();
                    }
                }

            }
            catch (Exception ex)
            {
                //Logger.LogToEvent("SavePosRunSync ERROR: " + ex.Message, EventLogEntryType.Error);
            }

        }

        private DateTime BuildTimestamp(string date, string time)
        {
            //mm/dd/yy hh:MM:ss
            try
            {
                string strTimestamp = String.Format("{0}/{1}/{2} {3}:{4}:{5}",
                       date.Substring(2, 2), date.Substring(0, 2), date.Substring(4, 2),
                       time.Substring(0, 2), time.Substring(2, 2), time.Substring(4, 2));
                return DateTime.Parse(strTimestamp, System.Globalization.CultureInfo.CreateSpecificCulture("en-US"));
            }
            catch
            {
                return new DateTime(2000, 1, 1, 0, 0, 0);
            }
        }

        /// <summary>
        /// gets assets' last positions
        /// </summary>
        /// <param name="dbMgr"></param>
        /// <param name="iPosID"></param>
        private FMSWebApi.Models.PosInfo GetPosition(long iPosID)
        {
            FMSWebApi.Models.PosInfo currPos = new FMSWebApi.Models.PosInfo();
            string query = string.Format("SELECT * FROM view_positions WHERE pos_id = {0}", iPosID);

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        MySqlDataReader reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            currPos = DataMgrTools.BuildPosition(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogToEvent(mProjName, "Get Position: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                    conn.Close();
                }
            }
            return currPos;
        }

        public FMSWebApi.Models.DriverInfo GetDriver(long iAssetID)
        {
            FMSWebApi.Models.DriverInfo currDriver = new FMSWebApi.Models.DriverInfo();
            string query = string.Format("SELECT * FROM view_drivers WHERE asset_id = {0}", iAssetID);

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        MySqlDataReader reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            currDriver = DataMgrTools.BuildDriver(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogToEvent(mProjName, "Get Driver: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                    conn.Close();
                }
            }
            return currDriver;
        }

        public string SaveSafetyEvents(FMSWebApi.Models.PosInfo udtPrev, FMSWebApi.Models.PosInfo udtPos)
        {

            string strRet = "";

            object objTemp = null;
            try
            {
                // open database
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    // initialize safety events report
                    FMSWebApi.Models.SafetyEventsInfo udtSafety = new FMSWebApi.Models.SafetyEventsInfo();
                    udtSafety.SafetyEventsID = 0;
                    udtSafety.Date = udtPos.Timestamp.ToLocalTime().Date;
                    udtSafety.Mileage = 0;

                    try
                    {
                        string strDate = (udtSafety.Date != DateTime.MinValue ? String.Format("{0:yyyy-MM-dd HH:mm:ss}" + ".000000", udtSafety.Date) : "NULL");                    

                        using (MySqlCommand cmd = new MySqlCommand())
                        {
                            conn.Open();
                            cmd.Connection = conn;
                            cmd.CommandText = "SELECT * FROM safetyevents WHERE date = @Date AND asset_id = @AssetID order by date desc LIMIT 1";
                            cmd.Prepare();
                            cmd.Parameters.AddWithValue("@Date", strDate);
                            cmd.Parameters.AddWithValue("@AssetID", udtPrev.AssetID);
                            MySqlDataReader reader = cmd.ExecuteReader();
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    udtSafety = DataMgrTools.BuildSafetyEvents(reader);                                  
                                }
                            }
                            conn.Close();
                        }
                    }
                    catch (Exception ex)
                    {
                        Logger.LogToEvent(mProjName, "check if record is already existing: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                    }


                    //Logger.LogToEvent(mProjName, "check udtPrev.Event: " + udtPrev.Event, System.Diagnostics.EventLogEntryType.Warning);


                    // check if fcw
                    if ((udtPrev.Event == "70"))
                        udtSafety.FCWCount++;
                    // check if pcw
                    if ((udtPrev.Event == "80"))
                        udtSafety.PCWCount++;
                    // check if hmw
                    if ((udtPrev.Event == "72"))
                        udtSafety.HMWCount++;
                    // check if ldw
                    if ((udtPrev.Event == "76"))
                        udtSafety.LDWCount++;

                    // update mileage
                    udtPos.Mileage /= 100;
                    if (udtPos.Mileage > udtPrev.Mileage)
                        udtPos.Mileage += (udtPos.Mileage - udtPrev.Mileage);


                    if (udtSafety.SafetyEventsID == 0)
                    {
                        // save new utilization record
                        if (udtPrev.AssetID > 0)
                        {
                            try
                            {
                                using (MySqlCommand cmd = new MySqlCommand())
                                {

                                    conn.Open();
                                    cmd.Connection = conn;
                                    cmd.CommandText = "INSERT INTO safetyevents (asset_id, driver, date, start_time, " +
                                                            "end_time, fcw_count, pcw_count, hmw_count, ldw_count, mileage, driver_id) VALUES " +
                                                            "(@AssetID, @Driver, @Date, @StartTime, @EndTime, @FCWCount, @PCWCount, @HMWCount, @LDWCount, @Mileage, @DriverID)";

                                    cmd.Prepare();
                                    cmd.Parameters.AddWithValue("@AssetID", udtPrev.AssetID);
                                    cmd.Parameters.AddWithValue("@Driver", udtPos.Driver);
                                    cmd.Parameters.AddWithValue("@Date", udtSafety.Date);
                                    cmd.Parameters.AddWithValue("@StartTime", DateTime.UtcNow);
                                    cmd.Parameters.AddWithValue("@EndTime", DateTime.UtcNow);
                                    cmd.Parameters.AddWithValue("@FCWCount", udtSafety.FCWCount);
                                    cmd.Parameters.AddWithValue("@PCWCount", udtSafety.PCWCount);
                                    cmd.Parameters.AddWithValue("@HMWCount", udtSafety.HMWCount);
                                    cmd.Parameters.AddWithValue("@LDWCount", udtSafety.LDWCount);
                                    cmd.Parameters.AddWithValue("@Mileage", udtSafety.Mileage);
                                    cmd.Parameters.AddWithValue("@DriverID", udtPos.DriverID);
                                    //cmd.ExecuteNonQuery();
                                    //Logger.LogEvent("save safetyevents record: " + udtPrev.AssetID, System.Diagnostics.EventLogEntryType.Warning);//testing   
                                    objTemp = cmd.ExecuteScalar();
                                    if (objTemp != null) udtSafety.SafetyEventsID = Convert.ToInt64(objTemp);

                                    conn.Close();
                                }
                            }
                            catch (Exception ex)
                            {
                                Logger.LogToEvent(mProjName, "save safetyevents record: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                            }
                        }
                    }
                    else
                    {
                        try
                        {
                            using (MySqlCommand cmd = new MySqlCommand())
                            {

                                conn.Open();
                                cmd.Connection = conn;
                                cmd.CommandText = string.Format("UPDATE safetyevents SET end_time = @EndTime, " +
                                                                "fcw_count = @FCWCount, pcw_count = @PCWCount, hmw_count = @HMWCount, ldw_count = @LDWCount, mileage = @Mileage " +
                                                                "WHERE safetyevents_id = @SafetyEventsID");
                                cmd.Prepare();
                                cmd.Parameters.AddWithValue("@EndTime", DateTime.UtcNow);
                                cmd.Parameters.AddWithValue("@FCWCount", udtSafety.FCWCount);
                                cmd.Parameters.AddWithValue("@PCWCount", udtSafety.PCWCount);
                                cmd.Parameters.AddWithValue("@HMWCount", udtSafety.HMWCount);
                                cmd.Parameters.AddWithValue("@LDWCount", udtSafety.LDWCount);
                                cmd.Parameters.AddWithValue("@Mileage", udtSafety.Mileage);
                                cmd.Parameters.AddWithValue("@SafetyEventsID", udtSafety.SafetyEventsID);
                                objTemp = cmd.ExecuteScalar();
                                if (objTemp != null) udtSafety.SafetyEventsID = Convert.ToInt64(objTemp);
                                conn.Close();
                            }
                        }
                        catch (Exception ex)
                        {
                            Logger.LogToEvent(mProjName, "edit safety events record: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);

                        }
                    }

                }

            }
            catch (Exception ex)
            {
                // log error
                Logger.LogToEvent("SaveSafetyEvents: ", ex.Message, System.Diagnostics.EventLogEntryType.Error);

            }

            // close database
            // if (dbRdr != null) dbRdr.Close();
            return strRet;
        }

        public string SaveSummary(FMSWebApi.Models.PosInfo udtPrev, FMSWebApi.Models.PosInfo udtPos)
        {

            string strRet = "";

            object objTemp = null;
            try
            {
                // open database
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    // initialize summary report
                    FMSWebApi.Models.SummaryInfo udtSummary = new FMSWebApi.Models.SummaryInfo();
                    udtSummary.SummaryID = 0;
                    udtSummary.Date = udtPos.Timestamp.ToLocalTime().Date;
                    udtSummary.Mileage = 0;

                    try
                    {
                        string strMonth = (udtSummary.Date != DateTime.MinValue ? String.Format("{0:MM}", udtSummary.Date) : "NULL");
                        string strYear = (udtSummary.Date != DateTime.MinValue ? String.Format("{0:yyyy}", udtSummary.Date) : "NULL");

                        using (MySqlCommand cmd = new MySqlCommand())
                        {
                            conn.Open();
                            cmd.Connection = conn;
                            cmd.CommandText = "SELECT * FROM summary WHERE MONTH(date) = @Month AND YEAR(date) = @Year AND asset_id = @AssetID order by date desc LIMIT 1";
                            cmd.Prepare();
                            cmd.Parameters.AddWithValue("@Month", strMonth);
                            cmd.Parameters.AddWithValue("@Year", strYear);
                            cmd.Parameters.AddWithValue("@AssetID", udtPrev.AssetID);
                            MySqlDataReader reader = cmd.ExecuteReader();
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    udtSummary = DataMgrTools.BuildSummary(reader);
                                }
                            }
                            conn.Close();
                        }
                    }
                    catch (Exception ex)
                    {
                        Logger.LogToEvent(mProjName, "check if record is already existing: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                    }


                    //Logger.LogToEvent(mProjName, "check udtPrev.Event: " + udtPrev.Event, System.Diagnostics.EventLogEntryType.Warning);


                    // check if fcw
                    if ((udtPrev.Event == "70"))
                        udtSummary.FCWCount++;
                    // check if pcw
                    if ((udtPrev.Event == "80"))
                        udtSummary.PCWCount++;
                    // check if hmw
                    if ((udtPrev.Event == "72"))
                        udtSummary.HMWCount++;
                    // check if ldw
                    if ((udtPrev.Event == "76"))
                        udtSummary.LDWCount++;

                    // update mileage
                    udtPos.Mileage /= 100;
                    if (udtPos.Mileage > udtPrev.Mileage)
                        udtPos.Mileage += (udtPos.Mileage - udtPrev.Mileage);


                    if (udtSummary.SummaryID == 0)
                    {
                        // save new utilization record
                        if (udtPrev.AssetID > 0)
                        {
                            try
                            {
                                using (MySqlCommand cmd = new MySqlCommand())
                                {

                                    conn.Open();
                                    cmd.Connection = conn;
                                    cmd.CommandText = "INSERT INTO summary (asset_id, driver, date, start_time, " +
                                                            "end_time, fcw_count, pcw_count, hmw_count, ldw_count, mileage, driver_id) VALUES " +
                                                            "(@AssetID, @Driver, @Date, @StartTime, @EndTime, @FCWCount, @PCWCount, @HMWCount, @LDWCount, @Mileage, @DriverID)";

                                    cmd.Prepare();
                                    cmd.Parameters.AddWithValue("@AssetID", udtPrev.AssetID);
                                    cmd.Parameters.AddWithValue("@Driver", udtPos.Driver);
                                    cmd.Parameters.AddWithValue("@Date", udtSummary.Date);
                                    cmd.Parameters.AddWithValue("@StartTime", DateTime.UtcNow);
                                    cmd.Parameters.AddWithValue("@EndTime", DateTime.UtcNow);
                                    cmd.Parameters.AddWithValue("@FCWCount", udtSummary.FCWCount);
                                    cmd.Parameters.AddWithValue("@PCWCount", udtSummary.PCWCount);
                                    cmd.Parameters.AddWithValue("@HMWCount", udtSummary.HMWCount);
                                    cmd.Parameters.AddWithValue("@LDWCount", udtSummary.LDWCount);
                                    cmd.Parameters.AddWithValue("@Mileage", udtSummary.Mileage);
                                    cmd.Parameters.AddWithValue("@DriverID", udtPos.DriverID);
                                    //cmd.ExecuteNonQuery();
                                    //Logger.LogEvent("save safetyevents record: " + udtPrev.AssetID, System.Diagnostics.EventLogEntryType.Warning);//testing   
                                    objTemp = cmd.ExecuteScalar();
                                    if (objTemp != null) udtSummary.SummaryID = Convert.ToInt64(objTemp);

                                    conn.Close();
                                }
                            }
                            catch (Exception ex)
                            {
                                Logger.LogToEvent(mProjName, "save summary safetyevents record: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                            }
                        }
                    }
                    else
                    {
                        try
                        {
                            using (MySqlCommand cmd = new MySqlCommand())
                            {

                                conn.Open();
                                cmd.Connection = conn;
                                cmd.CommandText = string.Format("UPDATE summary SET end_time = @EndTime, " +
                                                                "fcw_count = @FCWCount, pcw_count = @PCWCount, hmw_count = @HMWCount, ldw_count = @LDWCount, mileage = @Mileage " +
                                                                "WHERE summary_id = @SummaryID");
                                cmd.Prepare();
                                cmd.Parameters.AddWithValue("@EndTime", DateTime.UtcNow);
                                cmd.Parameters.AddWithValue("@FCWCount", udtSummary.FCWCount);
                                cmd.Parameters.AddWithValue("@PCWCount", udtSummary.PCWCount);
                                cmd.Parameters.AddWithValue("@HMWCount", udtSummary.HMWCount);
                                cmd.Parameters.AddWithValue("@LDWCount", udtSummary.LDWCount);
                                cmd.Parameters.AddWithValue("@Mileage", udtSummary.Mileage);
                                cmd.Parameters.AddWithValue("@SummaryID", udtSummary.SummaryID);
                                objTemp = cmd.ExecuteScalar();
                                if (objTemp != null) udtSummary.SummaryID = Convert.ToInt64(objTemp);
                                conn.Close();
                            }
                        }
                        catch (Exception ex)
                        {
                            Logger.LogToEvent(mProjName, "edit summary safety events record: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);

                        }
                    }

                }

            }
            catch (Exception ex)
            {
                // log error
                Logger.LogToEvent("SaveSummarySafetyEvents: ", ex.Message, System.Diagnostics.EventLogEntryType.Error);

            }

            // close database
            // if (dbRdr != null) dbRdr.Close();
            return strRet;
        }

        /// <summary>
        /// saves event record
        /// </summary>
        /// <param name="udtEvent"></param>
        /// <returns></returns>
        public string SaveEvent(FMSWebApi.Models.EventInfo udtEvent)
        {
            string strRet = "";
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    // save event
                    strRet = SaveEvent(udtEvent, true, true);
                }
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogToEvent("SaveEvent: ", ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }

            return strRet;
        }

        /// <summary>
        /// saves event record
        /// </summary>
        /// <param name="udtEvent"></param>
        /// <returns></returns>
        public string SaveEvent(FMSWebApi.Models.EventInfo udtEvent, bool bRemarks, bool bNotify)
        {

            string strRet = "";
            object objTemp = null;
            string strRecipient = "";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    // check tag
                    if (udtEvent.Tag != "")
                    {
                        // get asset
                        FMSWebApi.Models.AssetInfo udtAsset = GetByTagName(udtEvent.Tag);
                        //Logger.LogToEvent("Get Asset: " + udtAsset.Name, System.Diagnostics.EventLogEntryType.Warning);
                        strRecipient = udtAsset.Email;

                        if (udtAsset != null)
                        {                    
                            // update asset info
                            udtEvent.Asset = udtAsset.Name;
                            udtEvent.AssetID = udtAsset.AssetID;
                            udtEvent.TagID = udtAsset.TagID;
                            udtEvent.CompanyID = udtAsset.CompanyID;
                            udtEvent.PosID = udtAsset.LastFixID;
                        }
                    }

                    // check timestamp if invalid (device issue?)
                    if ((udtEvent.Timestamp.Year != udtEvent.RxTime.Year) &&
                        (udtEvent.Timestamp.Month == udtEvent.RxTime.Month))
                    {
                        // override year
                        udtEvent.Timestamp = new DateTime(udtEvent.RxTime.Year, udtEvent.Timestamp.Month, udtEvent.Timestamp.Day,
                        udtEvent.Timestamp.Hour, udtEvent.Timestamp.Minute, udtEvent.Timestamp.Second);
                    }

                    // open database
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        FMSWebApi.Models.AssetInfo udtAsset = new FMSWebApi.Models.AssetInfo();
                        //// check status id
                        if (udtEvent.StatusID == 0)
                        {

                            // get status id
                            string query = string.Format("SELECT status_id FROM status WHERE status_desc = @Event AND flag = 1", udtEvent.Event);
                            //Logger.LogToEvent("get status id: " + query, System.Diagnostics.EventLogEntryType.Warning);
                            cmd.CommandText = query;
                            cmd.Prepare();
                            cmd.Parameters.AddWithValue("@Event", udtEvent.Event);
                            objTemp = cmd.ExecuteScalar();


                            objTemp = objTemp = cmd.ExecuteScalar();
                            if (objTemp != null) udtEvent.StatusID = Convert.ToInt32(objTemp);
                            else return String.Format("{0} not supported.", udtEvent.Event);

                        }

                        // check if cell id network
                        if ((udtEvent.Event == "Cell ID") && udtEvent.Remarks.Contains("Network Info"))
                        {
                            // clear last cell id network
                            string strTemp = udtEvent.Remarks;
                            udtEvent.Remarks = "%Network Info%";
                            udtEvent.Flag = 0;
                            FlagEvent(udtEvent);

                            // continue saving new cell id network
                            udtEvent.Remarks = strTemp;
                            udtEvent.Flag = 1;
                        }


                        // initialize sql query
                        cmd.CommandText = "INSERT INTO events (`asset_id`, `tag_id`, `timestamp`, `rx_time`, `status_id`, " +
                            "`remarks`, `alert_level`, `alert_level_ex`, `flag`, `ack_user`, `ack_time`, `pos_id`) " +
                            "VALUES (@AssetID, @TagID, @Timestamp, @RxTime, @StatusID, @Remarks, " +
                            "@AlertLevel, @AlertLevelEx, @Flag, @AckUserID, UTC_DATE(), @PosID)";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@AssetID", udtEvent.AssetID);
                        cmd.Parameters.AddWithValue("@TagID", udtEvent.TagID);
                        cmd.Parameters.AddWithValue("@Timestamp", udtEvent.Timestamp);
                        cmd.Parameters.AddWithValue("@RxTime", udtEvent.RxTime);
                        cmd.Parameters.AddWithValue("@StatusID", udtEvent.StatusID);
                        cmd.Parameters.AddWithValue("@Remarks", udtEvent.Remarks);
                        cmd.Parameters.AddWithValue("@AlertLevel", udtEvent.AlertLevel);
                        cmd.Parameters.AddWithValue("@AlertLevelEx", udtEvent.AlertLevelEx);
                        cmd.Parameters.AddWithValue("@Flag", udtEvent.Flag);
                        cmd.Parameters.AddWithValue("@AckUserID", udtEvent.AckUserID);
                        cmd.Parameters.AddWithValue("@AckTime", udtEvent.AckTime);
                        cmd.Parameters.AddWithValue("@PosID", udtEvent.PosID);
                        Logger.LogToEvent("Save Event: " + udtEvent.Remarks, System.Diagnostics.EventLogEntryType.Warning);
                        cmd.ExecuteNonQuery();




                        // Logger.LogEvent(mProjName, " After Execute Scalar:" + objTemp, System.Diagnostics.EventLogEntryType.Error);
                        if (objTemp != null) udtEvent.EventID = Convert.ToInt32(objTemp);

                        // Logger.LogEvent(mProjName, " Check objTemp is not null:" + udtEvent.EventID, System.Diagnostics.EventLogEntryType.Error);

                        // check event
                        if (udtEvent.EventID > 0)
                        {
                            // check alert

                            //Logger.LogToEvent("strRecipient: ", strRecipient, System.Diagnostics.EventLogEntryType.Error);
                            // send event notifications
                            if (bNotify)
                                NotifyEvent(udtEvent, strRecipient);
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    // log error
                    Logger.LogToEvent("SaveEvent: ", ex.Message, System.Diagnostics.EventLogEntryType.Error);
                }

            }
            return strRet;
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
                }
            }
            return currAsset;
        }

        /// <summary>
        /// updates event flag
        /// </summary>
        /// <param name="udtEvent"></param>
        /// <returns></returns>
        public string FlagEvent(FMSWebApi.Models.EventInfo udtEvent)
        {
            DataMgrTools dbMgr = new DataMgrTools();
            string strRet = "";
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {

                        conn.Open();
                        cmd.Prepare();

                        // flag event
                        strRet = FlagEvent(ref dbMgr, udtEvent);


                        cmd.ExecuteNonQuery();
                        conn.Close();

                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogToEvent(ex.Message, "FlagEvent", System.Diagnostics.EventLogEntryType.Error);
            }

            return strRet;
        }

        /// <summary>
        /// updates event flag
        /// </summary>
        /// <param name="udtEvent"></param>
        /// <returns></returns>
        public string FlagEvent(ref DataMgrTools dbMgr, FMSWebApi.Models.EventInfo udtEvent)
        {
            string strRet = "";

            // initialize sql command
            string strFilter = "WHERE asset_id = @AssetID AND flag <> @Flag AND status_id = " +
                "(SELECT status_id FROM status WHERE status_desc = @Event)";

            List<object> arrParams = new List<object>() { udtEvent.AssetID, udtEvent.Flag, udtEvent.Event };

            // check remarks
            if ((udtEvent.Remarks != null) && (udtEvent.Remarks != ""))
            {
                // check wildstring
                if (udtEvent.Remarks.Contains("%"))
                    strFilter += String.Format(" AND remarks LIKE '{0}'", udtEvent.Remarks);
                else
                {
                    // filter also by remarks
                    strFilter += " AND remarks = @Remarks";
                    arrParams.Add(udtEvent.Remarks);
                }
            }

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    // open database
                    using (MySqlCommand cmd = new MySqlCommand(strFilter, conn))
                    {
                        conn.Open();
                        MySqlDataReader reader = cmd.ExecuteReader();

                        cmd.CommandText = strFilter;
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@AssetID", udtEvent.AssetID);
                        cmd.Parameters.AddWithValue("@Flag", udtEvent.Flag);
                        cmd.Parameters.AddWithValue("@StatusID", udtEvent.StatusID);
                        cmd.Parameters.AddWithValue("@StatusDesc", udtEvent.Event);
                        cmd.Parameters.AddWithValue("@Remarks", udtEvent.Remarks);


                        while (reader.Read())
                        {
                            udtEvent = DataMgrTools.BuildEvent(reader);
                        }

                        conn.Close();

                    }
                }

                catch (Exception ex)
                {
                    // log error
                    Logger.LogToEvent(ex.Message, "FlagEvent", System.Diagnostics.EventLogEntryType.Error);
                    conn.Close();
                }
            }
            return strRet;
        }

        /// <summary>
        /// cancels event
        /// </summary>
        /// <param name="udtEvent"></param>
        /// <returns></returns>
        public string CancelEvent(FMSWebApi.Models.EventInfo udtEvent, bool bResetFlag)
        {
            string strRet = "";
            try
            {
                // open database
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    // cancel event
                    strRet = CancelEvent(udtEvent, bResetFlag);
                }
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogToEvent(mProjName, "CancelEvent: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }

            // close database
            return strRet;
        }

        /// <summary>
        /// sends event notifications
        /// </summary>
        /// <param name="udtEvent"></param>
        public void NotifyEvent(FMSWebApi.Models.EventInfo udtEvent, string udtAsset)
        {

            // check alert level
            string strSender = "SBS";
            switch (udtEvent.AlertLevel)
            {
                case 1: strSender += " WARNING"; break;
                case 2: strSender += " ALERT"; break;
            }


            string strMessage = string.Format("{0}\r\n{1}\r\n{2}\r\n{3}\r\n{4:dd-MMM-yyyy HH:mm:ss}",
                             strSender, udtEvent.Event,
                             udtEvent.Remarks, udtEvent.Asset, udtEvent.Timestamp.AddHours(8.0));

            // save message
            FMSWebApi.Models.MessageInfo udtMessage = new FMSWebApi.Models.MessageInfo();
            udtMessage.Sender = "SBS";
            udtMessage.Message = strMessage;
            udtMessage.Timestamp = DateTime.Now.ToUniversalTime();
            udtMessage.RxTime = DateTime.Now.ToUniversalTime();
            udtMessage.StatusID = 1;
            udtMessage.CompanyID = udtEvent.CompanyID;
            udtMessage.AssetID = udtEvent.AssetID;
            udtMessage.Recipients = udtAsset;
            //Logger.LogToEvent(" Check sender: " + udtMessage.Recipients, System.Diagnostics.EventLogEntryType.Error);
            SaveMessage(udtMessage);
        }

        /// <summary>
        /// adds contact info to list of message recipients
        /// </summary>
        /// <param name="arrRecipients"></param>
        /// <param name="strContact"></param>
        public void ListContactInfo(ref List<string> arrRecipients, string strContact)
        {
            // loop through contact info
            string[] arrContact = strContact.Split(",".ToCharArray(), StringSplitOptions.RemoveEmptyEntries);

            Logger.LogToEvent("Enter ListContactInfo: " + arrContact.Count() + strContact, System.Diagnostics.EventLogEntryType.Error);

            foreach (string strTemp in arrContact)
            {
                // check contact info
                if (strTemp != "")
                {

                    Logger.LogToEvent("check contact info: " + strContact, System.Diagnostics.EventLogEntryType.Error);
                    // check contact if already added
                    if (!arrRecipients.Contains(strContact))
                        arrRecipients.Add(strContact);
                }
            }
        }

        /// <summary>
        /// saves message for sending
        /// </summary>
        /// <param name="udtMessage"></param>
        /// <returns></returns>
        public string SaveMessage(FMSWebApi.Models.MessageInfo udtMessage)
        {

            string strRet = "";
            object objTemp = null;
            string query = "";

            //UserInfo udtUser = new UserInfo();
            //AssetInfo udtAsset = new AssetInfo();
            //CompanyRepository companyRepo = new CompanyRepository();
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {

                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();

                        //Logger.LogToEvent(" Enter SQL Save Message: ", System.Diagnostics.EventLogEntryType.Warning);
                        // check sender
                        if (Char.IsDigit(udtMessage.Sender, 0))
                        {
                            try
                            {
                                // get user name if user id is supplied
                                //int iUserID = Convert.ToInt32(udtMessage.Sender.Trim());
                                int iUserID = Convert.ToInt32(udtMessage.Sender.Trim());
                                //objTemp = dbMgr.ExecuteScalar("SELECT name FROM users WHERE user_id = @UserID", new object[] { iUserID });
                                query = string.Format("SELECT name FROM users WHERE user_id = @UserID");
                                Logger.LogToEvent(" Check user id: " + iUserID, System.Diagnostics.EventLogEntryType.Error);
                                cmd.CommandText = query;
                                cmd.Prepare();
                                cmd.Parameters.AddWithValue("@UserID", iUserID);
                                objTemp = cmd.ExecuteScalar();

                                if (objTemp != null) udtMessage.Sender = objTemp.ToString();
                            }

                            catch (Exception ex)
                            {
                                // log error
                                Logger.LogToEvent("check sender: ", ex.Message, System.Diagnostics.EventLogEntryType.Error);
                            }

                        }


                        try
                        {
                            // check company
                            if ((udtMessage.CompanyID == 0) && (udtMessage.Company != ""))
                            {
                                Logger.LogToEvent(" check company: " + udtMessage.CompanyID, System.Diagnostics.EventLogEntryType.Error);
                                udtMessage.CompanyID = GetCompanyID(udtMessage.Company);
                            }
                        }
                        catch (Exception ex)
                        {
                            Logger.LogToEvent(" check company: ", ex.Message, System.Diagnostics.EventLogEntryType.Error);

                        }

                        try
                        {
                            // check asset
                            if (udtMessage.AssetID == 0)
                            {
                                // check name
                                if ((udtMessage.Asset != null) && (udtMessage.Asset != ""))
                                {
                                    // get asset id                              
                                    query = string.Format("SELECT asset_id FROM assets WHERE name = @Asset", udtMessage.Asset);
                                    Logger.LogToEvent(" get asset id: " + udtMessage.Asset, System.Diagnostics.EventLogEntryType.Error);
                                    cmd.CommandText = query;
                                    cmd.Prepare();
                                    cmd.Parameters.AddWithValue("@Asset", udtMessage.Asset);
                                    objTemp = cmd.ExecuteScalar();


                                    if (objTemp != null) udtMessage.AssetID = Convert.ToInt32(objTemp);
                                }
                                else
                                {
                                    // get asset id using contact info

                                    //query = string.Format("SELECT asset_id FROM assets WHERE phone = @Phone OR email = @Email",
                                    //    new object[] { udtMessage.Recipients, udtMessage.Recipients });

                                    query = string.Format("SELECT asset_id FROM assets WHERE phone = @Phone OR email = @Email", udtMessage.Recipients, udtMessage.Recipients);
                                    Logger.LogToEvent(" get asset id using contact info: " + udtMessage.Recipients, System.Diagnostics.EventLogEntryType.Error);
                                    cmd.CommandText = query;
                                    cmd.Prepare();
                                    cmd.Parameters.AddWithValue("@Recipients", udtMessage.Recipients);
                                    objTemp = cmd.ExecuteScalar();


                                    if (objTemp != null) udtMessage.AssetID = Convert.ToInt32(objTemp);
                                }
                            }
                        }
                        catch (Exception ex)
                        {
                            Logger.LogToEvent("Error>> check asset: ", ex.Message, System.Diagnostics.EventLogEntryType.Error);
                        }

                        try
                        {

                            // check recipients
                            if ((udtMessage.Recipients != "") && (udtMessage.Message.Trim() != ""))
                            {
                                // add message to sms queue


                                //query = string.Format("INSERT INTO messages (sender, recipients, message, timestamp, flag, " +
                                //    "company_id, asset_id) VALUES (@Sender, @Recipients, @Message, @Timestamp, @Flag, @CompanyID, @AssetID)",
                                //    new object[] { udtMessage.Sender, udtMessage.Recipients, udtMessage.Message, udtMessage.Timestamp, 
                                //    udtMessage.StatusID, udtMessage.CompanyID, udtMessage.AssetID });


                                cmd.CommandText = "INSERT INTO messages (`sender`, `recipients`, `message`, `timestamp`, `rx_time`, `flag`, `company_id`, " +
                                                "`asset_id`) VALUES (@Sender, @Recipients, @Message, @Timestamp, @RxTime, @Flag, @CompanyID, @AssetID)";

                                //Logger.LogToEvent(" [Save Message]COMMAND Text " + cmd.CommandText, System.Diagnostics.EventLogEntryType.Warning);

                                cmd.Prepare();
                                cmd.Parameters.AddWithValue("@Sender", udtMessage.Sender);
                                //Logger.LogToEvent(" [Check Sender] " + udtMessage.Sender, System.Diagnostics.EventLogEntryType.Warning);
                                cmd.Parameters.AddWithValue("@Recipients", udtMessage.Recipients);
                                //Logger.LogToEvent(" [Check Recipients] " + udtMessage.Recipients, System.Diagnostics.EventLogEntryType.Warning);
                                cmd.Parameters.AddWithValue("@Message", udtMessage.Message);
                                //Logger.LogToEvent(" [Check Message] " + udtMessage.Message, System.Diagnostics.EventLogEntryType.Warning);
                                cmd.Parameters.AddWithValue("@Timestamp", udtMessage.Timestamp);
                                //Logger.LogToEvent(" [Check Timestamp] " + udtMessage.Timestamp, System.Diagnostics.EventLogEntryType.Warning);
                                cmd.Parameters.AddWithValue("@RxTime", udtMessage.RxTime);
                                //Logger.LogToEvent(" [Check RxTime] " + udtMessage.RxTime, System.Diagnostics.EventLogEntryType.Warning);
                                cmd.Parameters.AddWithValue("@Flag", udtMessage.StatusID);
                                //Logger.LogToEvent(" [Check StatusID] " + udtMessage.StatusID, System.Diagnostics.EventLogEntryType.Warning);
                                cmd.Parameters.AddWithValue("@CompanyID", udtMessage.CompanyID);
                                //Logger.LogToEvent(" [Check CompanyID] " + udtMessage.CompanyID, System.Diagnostics.EventLogEntryType.Warning);
                                cmd.Parameters.AddWithValue("@AssetID", udtMessage.AssetID);
                                //Logger.LogToEvent(" [Check AssetID] " + udtMessage.AssetID, System.Diagnostics.EventLogEntryType.Warning);

                                cmd.ExecuteNonQuery();
                                //Logger.LogToEvent(" [Save Message]successful " + udtMessage.Message, System.Diagnostics.EventLogEntryType.Warning);

                            }
                        }
                        catch (Exception ex)
                        {
                            Logger.LogToEvent("Error>> check recipients exception: ", ex.Message, System.Diagnostics.EventLogEntryType.Error);
                        }

                        conn.Close();

                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogToEvent(" Save Message Exception: ", ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return strRet;
        }

        /// <summary>
        /// gets company id
        /// </summary>
        /// <param name="strCompany"></param>
        /// <returns></returns>
        public int GetCompanyID(string strCompany)
        {
            int iCompanyID = 0;
            string query = "";
            try
            {
                // check company name
                if ((strCompany == null) || (strCompany == ""))
                    return 0;

                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {

                        conn.Open();
                        MySqlDataReader reader = cmd.ExecuteReader();
                        // get company id                    
                        query = string.Format("SELECT company_id FROM companies WHERE name = @Company");
                        cmd.CommandText = query;
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@Company", strCompany);

                        object objTemp = cmd.ExecuteScalar();
                        if (objTemp != null) iCompanyID = Convert.ToInt32(objTemp);
                        else
                        {
                            // save new company                        
                            query = string.Format("INSERT INTO companies (name, user_limit, zone_limit, asset_limit, sms_limit, reports) " +
                                "VALUES (@Company, 0, 0, 0, 0, '')", strCompany);
                            cmd.CommandText = query;
                            cmd.Prepare();
                            cmd.Parameters.AddWithValue("@Company", strCompany);
                            objTemp = cmd.ExecuteScalar();

                            if (objTemp != null) iCompanyID = Convert.ToInt32(objTemp);
                        }

                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                // log event
                Logger.LogToEvent("GetCompanyID: ", ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return iCompanyID;
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

        private double BuildCourse(string course)
        {
            double retVal = 0;
            double.TryParse(course, out retVal);
            return retVal;
        }

        private double ConvertLatLong(string latlong)
        {
            double retVal = 0;
            double.TryParse(latlong, out retVal);
            return retVal;
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
                    if (!Directory.Exists(Settings.Default.LogPath))
                        Directory.CreateDirectory(@".\RawData");
                }
            }
            catch (Exception ex)
            {
                // log error
                LogError("LogData", ex.Message);
            }
        }

        private void LogRawData(List<RawData> arrData)
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
                        string strFile = String.Format("{0}\\{1:dd-MMM-yyyy}_{2}_{3}.txt",
                            Settings.Default.LogPath, arrData[0].RxTime.ToLocalTime(), iPort, "logs");
                        using (StreamWriter fWriter = new StreamWriter(strFile, true))
                        {
                            // log all data
                            foreach (RawData udtData in arrData)
                            {
                                // check server port
                                if (udtData.ServerPort == iPort)
                                {
                                    if (udtData.Data.Substring(0, 1) == "L" && udtData.Data.EndsWith(";"))
                                    {
                                        // log socket data
                                        fWriter.WriteLine(String.Format("{0}", udtData.Data));
                                    }                              
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
                    if (!Directory.Exists(Settings.Default.LogPath))
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
                LogError("SocketServer.Send*", ex.Message);
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
            catch (Exception ex)
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


        /// <summary>
        /// Compute Mileage for vehicles without mileage using Haversine Formula
        /// [Dan:15Apr14]
        /// </summary>
        /// <param name="udtPos"></param>
        /// <param name="udtPrev"></param>
        /// <returns></returns>
        private double ComputeMileage(FMSWebApi.Models.PosInfo udtPos, FMSWebApi.Models.PosInfo udtPrev)
        {
            double mileage = 0;
            try
            {
                if (udtPos != null && udtPrev != null)
                {
                    if (udtPos.Mileage <= 0)//no mileage
                    {
                        //use haversine algorithm

                        //c2 = (xA - xB)2 + (yA - yB)2
                        //Math.Pow ( n, 2 )
                        //mileage = Math.Sqrt(Math.Pow((udtPos.PosX - udtPrev.PosX), 2) + Math.Pow((udtPos.PosY - udtPrev.PosY), 2));
                        mileage = GetDistanceKM(udtPrev.PosY, udtPos.PosY, udtPrev.PosX, udtPos.PosX);
                        mileage = (udtPrev.Mileage + Math.Round(mileage, 2)) * 100;// convert from km to units of 10 meters //like ts109 box
                        //DatabaseMgr.LogEvent(string.Format("ComputedMileage: {0}-{1}km, prevmileage:{2}km", udtPos.Asset, mileage, udtPrev.Mileage), 0);//testing
                    }
                    else//mileage already exist
                    {
                        mileage = Math.Round(udtPos.Mileage, 2);
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogToEvent(mProjName, "ComputeMileage: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }


            return mileage;
        }

        /// <summary>
        /// Calculates the distance between two geo-points in kilometers using the Haversine algorithm.
        /// [Dan:15Apr14] Source: http://damien.dennehy.me/blog/2011/01/15/haversine-algorithm-in-csharp/
        /// </summary>
        /// <param name="point1">The first point.</param>
        /// <param name="point2">The second point.</param>
        /// <returns>A double indicating the distance between the points in KM.</returns>
        private double GetDistanceKM(double lat1, double lat2, double lon1, double lon2)
        {
            const double EARTH_RADIUS_KM = 6371;//Radius of the Earth in Kilometers.

            double dLat = (lat2 - lat1) * (Math.PI / 180);
            double dLon = (lon2 - lon1) * (Math.PI / 180);

            double a = Math.Pow(Math.Sin(dLat / 2), 2) +
                       Math.Cos(lat1 * (Math.PI / 180)) * Math.Cos(lat2 * (Math.PI / 180)) *
                       Math.Pow(Math.Sin(dLon / 2), 2);

            double c = 2 * Math.Atan2(Math.Sqrt(a), Math.Sqrt(1 - a));

            double distance = EARTH_RADIUS_KM * c;
            return distance;
        }

    }
}