using FMSWebApi.Models;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Http;

namespace FMSWebApi.Repository
{
    public class EventRepository : IEventRepository
    {

        private string mConnStr = "server=103.237.168.119;uid=root;pwd=@c3c0M;database=trackliteprodev;max pool size=500;";
        private string mProjName = "TRACKLitePro";


        public IEnumerable<EventInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<EventInfo> arrEvents = new List<EventInfo>(); 

            try
            {
                conn.ConnectionString = mConnStr;
                conn.Open();

                cmd.CommandText = "view_events";
                cmd.Connection = conn;
                cmd.CommandType = CommandType.TableDirect;
                MySqlDataReader reader = cmd.ExecuteReader();

                //Console.WriteLine(String.Format("Total Data: {0}", dbRdr.FieldCount));
                if ((reader != null) && (reader.HasRows))
                {
                    while (reader.Read())
                    {
  
                        EventInfo currEvent = DataMgrTools.BuildEvent(reader);
                        arrEvents.Add(currEvent);
                    }
                }

                conn.Close();
            }
            catch (MySqlException ex)
            {
                Logger.LogEvent(ex.Message + "-GetAll(EventRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            try
            {
                conn.Open();
                for (int i = 0; i < arrEvents.Count; i++)
                {
                    GetPosByPosID(conn, cmd, arrEvents, i);
                    GetZoneByZoneID(conn, cmd, arrEvents, i);
                }
                conn.Close();
            }
            catch (Exception ex)
            {
                Logger.LogEvent("GetAll-view_positions: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }

          

            if (conn != null)
                conn.Close();

            return arrEvents.ToArray();
        }

        private static void GetZoneByZoneID(MySqlConnection conn, MySqlCommand cmd, List<EventInfo> arrEvents, int i)
        {
            try
            {
                // cmd.CommandText = string.Format("SELECT * FROM view_positions where asset_id = {0}", arrAssets[i].AssetID);
                string strSql = string.Format("SELECT * FROM view_zones where zone_id = {0}", arrEvents[i].ZoneID);

                cmd.CommandText = strSql;
                cmd.Connection = conn;
                cmd.CommandType = CommandType.Text;
                using (MySqlDataReader reader = cmd.ExecuteReader())
                {
                    ZoneInfo currZone = new ZoneInfo();
                    if ((reader != null) && (reader.HasRows))
                    {
                        while (reader.Read())
                        {


                            currZone = DataMgrTools.BuildZone(reader);
                            arrEvents[i].Zone = currZone;
                        }
                    }
                    else
                    {
                        arrEvents[i].Zone = currZone;

                    }

                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent("GetZoneByZoneID: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
        }

        private static void GetPosByPosID(MySqlConnection conn, MySqlCommand cmd, List<EventInfo> arrEvents, int i)
        {
            try { 
            // cmd.CommandText = string.Format("SELECT * FROM view_positions where asset_id = {0}", arrAssets[i].AssetID);
            string strSql = string.Format("SELECT * FROM view_positions where pos_id = {0}", arrEvents[i].PosID);

            cmd.CommandText = strSql;
            cmd.Connection = conn;
            cmd.CommandType = CommandType.Text;
            using (MySqlDataReader reader = cmd.ExecuteReader())
            {
                PosInfo currPos = new PosInfo();
                if ((reader != null) && (reader.HasRows))
                {
                    while (reader.Read())
                    {
                        currPos = DataMgrTools.BuildPosition(reader);
                        arrEvents[i].Position = currPos;
                    }
                }
                else
                {
                    arrEvents[i].Position = currPos;

                }

              }
           }
            catch (Exception ex)
            {
                Logger.LogEvent("GetPosByPosID: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
        }

        public IEnumerable<EventInfo> Get([FromUri]EventInfo value)
        {
            //SELECT * FROM view_positions WHERE timestamp between '2015-05-31' and '2015-06-01'
            List<EventInfo> arrEvent = new List<EventInfo>();
            EventInfo currEvent = new EventInfo();
            string query = "SELECT * FROM view_events WHERE (timestamp between @StartTS and @EndTS)";


            if (value.StatusID > 0) query += " and status_id = @StatusID";
            if (value.CompanyID > 0) query += " and company_id = @CompanyID";
            if (value.AckRoleID > 0) query += " and ack_user >= @AckRoleID";

            if (value.AssetID > 0) query += " and asset_id = @AssetID";
            else if (!string.IsNullOrEmpty(value.Asset)) query += " and asset_id = (SELECT asset_id FROM view_assets WHERE name = @AssetName)";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@StartTS", value.Timestamp);
                        cmd.Parameters.AddWithValue("@EndTS", value.RxTime);
                        if (value.StatusID > 0) cmd.Parameters.AddWithValue("@StatusID", value.StatusID);
                        if (value.CompanyID > 0) cmd.Parameters.AddWithValue("@CompanyID", value.CompanyID);
                        if (value.AckRoleID > 0) cmd.Parameters.AddWithValue("@AckRoleID", value.AckRoleID);
                        if (value.AssetID > 0) cmd.Parameters.AddWithValue("@AssetID", value.AssetID);
                        else if (!string.IsNullOrEmpty(value.Asset)) cmd.Parameters.AddWithValue("@AssetName", value.Asset);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currEvent = DataMgrTools.BuildEvent(reader);
                                    arrEvent.Add(currEvent);
                                }
                            }
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(mProjName, "Get Events: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                  
                }

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        for (int i = 0; i < arrEvent.Count; i++)
                        {
                            // cmd.CommandText = string.Format("SELECT * FROM view_positions where asset_id = {0}", arrAssets[i].AssetID);
                            query = string.Format("SELECT * FROM view_positions where pos_id = {0}", arrEvent[i].PosID);

                            cmd.CommandText = query;
                            cmd.Connection = conn;
                            cmd.CommandType = CommandType.Text;
                            using (MySqlDataReader reader = cmd.ExecuteReader())
                            {
                                PosInfo currPos = new PosInfo();
                                if ((reader != null) && (reader.HasRows))
                                {
                                    while (reader.Read())
                                    {
                                        currPos = DataMgrTools.BuildPosition(reader);
                                        arrEvent[i].Position = currPos;
                                    }
                                }
                                else
                                {
                                    arrEvent[i].Position = currPos;

                                }

                            }
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent("GetAll-view_positions: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                }

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        for (int i = 0; i < arrEvent.Count; i++)
                        {
                            // cmd.CommandText = string.Format("SELECT * FROM view_positions where asset_id = {0}", arrAssets[i].AssetID);
                            query = string.Format("SELECT * FROM view_zones where zone_id = {0}", arrEvent[i].ZoneID);

                            cmd.CommandText = query;
                            cmd.Connection = conn;
                            cmd.CommandType = CommandType.Text;
                            using (MySqlDataReader reader = cmd.ExecuteReader())
                            {
                                ZoneInfo currZone = new ZoneInfo();
                                if ((reader != null) && (reader.HasRows))
                                {
                                    while (reader.Read())
                                    {
                                        currZone = DataMgrTools.BuildZone(reader);
                                        arrEvent[i].Zone = currZone;
                                    }
                                }
                                else
                                {
                                    arrEvent[i].Zone = currZone;

                                }

                            }
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent("GetAll-view_zones: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                }


            }

            return arrEvent.ToArray();
        }

        public EventInfo Get(int eventID)
        {
            EventInfo currEvent = new EventInfo();
            string query = string.Format("SELECT * FROM view_events WHERE event_id = {0}", eventID);

            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        MySqlDataReader reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            currEvent = DataMgrTools.BuildEvent(reader);
                        }

                    }
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Get(EventRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return currEvent;
        }

        public EventInfo GetByEvent(string eventName)
        {

            EventInfo currEvent = new EventInfo();
            string query = string.Format("SELECT * FROM view_events WHERE status_desc = @Event");

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
                        cmd.Parameters.AddWithValue("@Event", eventName);
                        MySqlDataReader reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            currEvent = DataMgrTools.BuildEvent(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-GetByEvent(EventRepository)", System.Diagnostics.EventLogEntryType.Error);
                    conn.Close();
                }
            }
            return currEvent;
        }

        public EventInfo Add(EventInfo currEvent)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO events (`asset_id`, `tag_id`, `timestamp`, `rx_time`, `status_id`, " +
                                        "`remarks`, `alert_level`, `alert_level_ex`, `flag`, `ack_user`, `ack_time`, `pos_id`, `company_id`) " +
                                        "VALUES (@AssetID, @TagID, @Timestamp, @RxTime, @StatusID, @Remarks, " +
                                        "@AlertLevel, @AlertLevelEx, @Flag, @AckUserID, UTC_DATE(), @PosID, @CompanyID)";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@AssetID", currEvent.AssetID);
                        cmd.Parameters.AddWithValue("@TagID", currEvent.TagID);
                        cmd.Parameters.AddWithValue("@Timestamp", currEvent.Timestamp);
                        cmd.Parameters.AddWithValue("@RxTime", currEvent.RxTime);
                        cmd.Parameters.AddWithValue("@StatusID", currEvent.StatusID);
                        cmd.Parameters.AddWithValue("@Remarks", currEvent.Remarks);
                        cmd.Parameters.AddWithValue("@AlertLevel", currEvent.AlertLevel);
                        cmd.Parameters.AddWithValue("@AlertLevelEx", currEvent.AlertLevelEx);
                        cmd.Parameters.AddWithValue("@Flag", currEvent.Flag);
                        cmd.Parameters.AddWithValue("@AckUserID", currEvent.AckUserID);
                        cmd.Parameters.AddWithValue("@AckTime", currEvent.AckTime);
                        cmd.Parameters.AddWithValue("@PosID", currEvent.PosID);
                        cmd.Parameters.AddWithValue("@CompanyID", currEvent.CompanyID);
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(EventRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return currEvent;
        }

        public EventInfo SaveLoginEvent(EventInfo currEvent)
        {
            AssetInfo currAsset = new AssetInfo();
            AssetRepository assetRepo = new AssetRepository();
            string strError = "";

            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {

                    #region GET THE LINKED ASSET
                    try
                    {
                        currAsset = assetRepo.GetByTagName(currEvent.Tag);
                        if (currEvent == null) currAsset.Name = "Asset Not Found";
                        //Logger.LogEvent("Check Asset:" + currAsset.Name, System.Diagnostics.EventLogEntryType.Warning);

                    }
                    catch (Exception ex)
                    {
                        Logger.LogEvent("GET THE LINKED ASSET: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                    }
                    #endregion

                    //get tag id
                    int tagId = currAsset.TagID;
                    if (tagId <= 0)
                    {
                        tagId = RepoHelpers.GetTagId(currAsset.Tag);
                        if (tagId <= 0)
                        {
                            currAsset.ErrorMessage = Consts.ERR_ASSET_DEVICEINUSE;
                        }
                    }

                    // extract client ip from username if any
                    string[] arrTemp = currEvent.Driver.Split("\r".ToCharArray());
                    currEvent.Driver = arrTemp[0];
                    //Logger.LogEvent("Check Driver:" + currEvent.Driver, System.Diagnostics.EventLogEntryType.Error);

                    string strClientIP = (arrTemp.Length > 1 ? arrTemp[1] : "");

                    // check client ip
                    if (strClientIP == "")
                    {
                        // get client ip
                        strClientIP = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
                        if (String.IsNullOrEmpty(strClientIP)) strClientIP = HttpContext.Current.Request.UserHostAddress;
                    }

                    currEvent.Remarks = String.Format("{0}{1}", (currEvent.Driver != null ? "Login Success" : "Login Failed"), strError);
                    if (strClientIP != "") currEvent.Remarks += String.Format(" (Driver Name: {0})", currEvent.Driver);


                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO events (`asset_id`, `tag_id`, `timestamp`, `rx_time`, `status_id`, " +
                                        "`remarks`, `alert_level`, `alert_level_ex`, `flag`, `ack_user`, `ack_time`, `pos_id`, `company_id`) " +
                                        "VALUES (@AssetID, @TagID, @Timestamp, @RxTime, @StatusID, @Remarks, " +
                                        "@AlertLevel, @AlertLevelEx, @Flag, @AckUserID, UTC_DATE(), @PosID, @CompanyID)";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@AssetID", currAsset.AssetID);
                        cmd.Parameters.AddWithValue("@TagID", tagId);
                        cmd.Parameters.AddWithValue("@Timestamp", DateTime.UtcNow);
                        cmd.Parameters.AddWithValue("@RxTime", DateTime.UtcNow);
                        cmd.Parameters.AddWithValue("@StatusID", 13);
                        cmd.Parameters.AddWithValue("@Remarks", currEvent.Remarks);
                        cmd.Parameters.AddWithValue("@AlertLevel", 0);
                        cmd.Parameters.AddWithValue("@AlertLevelEx", 0);
                        cmd.Parameters.AddWithValue("@Flag", 1);
                        cmd.Parameters.AddWithValue("@AckUserID", 3);
                        cmd.Parameters.AddWithValue("@AckTime", DateTime.UtcNow);
                        cmd.Parameters.AddWithValue("@PosID", currAsset.PosID);
                        cmd.Parameters.AddWithValue("@CompanyID", currAsset.CompanyID);
                        cmd.ExecuteNonQuery();
                        //Logger.LogEvent("Login Event Success", System.Diagnostics.EventLogEntryType.Error);
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add Login(EventRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return currEvent;
        }

        public EventInfo SaveLogoutEvent(EventInfo currEvent)
        {
            AssetInfo currAsset = new AssetInfo();
            AssetRepository assetRepo = new AssetRepository();
            string strError = "";

            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {

                    #region GET THE LINKED ASSET
                    try
                    {
                        currAsset = assetRepo.GetByTagName(currEvent.Tag);
                        if (currEvent == null) currAsset.Name = "Asset Not Found";
                        //Logger.LogEvent("Check Asset:" + currAsset.Name, System.Diagnostics.EventLogEntryType.Warning);

                    }
                    catch (Exception ex)
                    {
                        Logger.LogEvent("GET THE LINKED ASSET: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                    }
                    #endregion

                    //get tag id
                    int tagId = currAsset.TagID;
                    if (tagId <= 0)
                    {
                        tagId = RepoHelpers.GetTagId(currAsset.Tag);
                        if (tagId <= 0)
                        {
                            currAsset.ErrorMessage = Consts.ERR_ASSET_DEVICEINUSE;
                        }
                    }

                    // extract client ip from username if any
                    string[] arrTemp = currEvent.Driver.Split("\r".ToCharArray());
                    currEvent.Driver = arrTemp[0];
                    //Logger.LogEvent("Check Driver:" + currEvent.Driver, System.Diagnostics.EventLogEntryType.Error);

                    string strClientIP = (arrTemp.Length > 1 ? arrTemp[1] : "");

                    // check client ip
                    if (strClientIP == "")
                    {
                        // get client ip
                        strClientIP = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
                        if (String.IsNullOrEmpty(strClientIP)) strClientIP = HttpContext.Current.Request.UserHostAddress;
                    }

                    currEvent.Remarks = String.Format("{0}{1}", (currEvent.Driver != null ? "Logout Success" : "Login Failed"), strError);
                    if (strClientIP != "") currEvent.Remarks += String.Format(" (Driver Name: {0})", currEvent.Driver);


                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO events (`asset_id`, `tag_id`, `timestamp`, `rx_time`, `status_id`, " +
                                        "`remarks`, `alert_level`, `alert_level_ex`, `flag`, `ack_user`, `ack_time`, `pos_id`, `company_id`) " +
                                        "VALUES (@AssetID, @TagID, @Timestamp, @RxTime, @StatusID, @Remarks, " +
                                        "@AlertLevel, @AlertLevelEx, @Flag, @AckUserID, UTC_DATE(), @PosID, @CompanyID)";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@AssetID", currAsset.AssetID);
                        cmd.Parameters.AddWithValue("@TagID", tagId);
                        cmd.Parameters.AddWithValue("@Timestamp", DateTime.UtcNow);
                        cmd.Parameters.AddWithValue("@RxTime", DateTime.UtcNow);
                        cmd.Parameters.AddWithValue("@StatusID", 12);
                        cmd.Parameters.AddWithValue("@Remarks", currEvent.Remarks);
                        cmd.Parameters.AddWithValue("@AlertLevel", 0);
                        cmd.Parameters.AddWithValue("@AlertLevelEx", 0);
                        cmd.Parameters.AddWithValue("@Flag", 1);
                        cmd.Parameters.AddWithValue("@AckUserID", 3);
                        cmd.Parameters.AddWithValue("@AckTime", DateTime.UtcNow);
                        cmd.Parameters.AddWithValue("@PosID", currAsset.PosID);
                        cmd.Parameters.AddWithValue("@CompanyID", currAsset.CompanyID);
                        cmd.ExecuteNonQuery();
                        //Logger.LogEvent("Login Event Success", System.Diagnostics.EventLogEntryType.Error);
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add Login(EventRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return currEvent;
        }

        public bool Remove(int eventID)
        {
            bool retVal = false;
            string query = string.Format("DELETE FROM events WHERE event_id = {0}", eventID);

            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        if (cmd.ExecuteNonQuery() == 1)
                            retVal = true;
                        else
                            retVal = false;
                    }
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Remove(EventRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }

        public bool Update(EventInfo currEvent)
        {
            bool retVal = false;
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "UPDATE events SET asset_id = @AssetID, tag_id = @TagID, timestamp = @Timestamp,  rx_time = @RxTime, status_id = @StatusID, " +
                                            "remarks = @Remarks, alert_level = @AlertLevel, alert_level_ex = @AlertLevelEx, flag = @Flag, ack_user = @AckUserID, pos_id = @PosID, company_id = @CompanyID WHERE event_id = @EventID";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@AssetID", currEvent.AssetID);
                        cmd.Parameters.AddWithValue("@TagID", currEvent.TagID);
                        cmd.Parameters.AddWithValue("@Timestamp", currEvent.Timestamp);
                        cmd.Parameters.AddWithValue("@RxTime", currEvent.RxTime);
                        cmd.Parameters.AddWithValue("@StatusID", currEvent.StatusID);
                        cmd.Parameters.AddWithValue("@Remarks", currEvent.Remarks);
                        cmd.Parameters.AddWithValue("@AlertLevel", currEvent.AlertLevel);
                        cmd.Parameters.AddWithValue("@AlertLevelEx", currEvent.AlertLevel);
                        cmd.Parameters.AddWithValue("@Flag", currEvent.Flag);
                        cmd.Parameters.AddWithValue("@AckUserID", currEvent.AckUserID);
                        cmd.Parameters.AddWithValue("@PosID", currEvent.PosID);
                        cmd.Parameters.AddWithValue("@CompanyID", currEvent.CompanyID);
                        cmd.Parameters.AddWithValue("@EventID", currEvent.EventID);

                        if (cmd.ExecuteNonQuery() == 1)
                            retVal = true;
                        else
                            retVal = false;
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Update(EventRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }

        /// <summary>
        /// updates event flag
        /// </summary>
        /// <param name="udtEvent"></param>
        /// <returns></returns>
        public string FlagEvent(EventInfo udtEvent)
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
                Logger.LogEvent(ex.Message, "FlagEvent", System.Diagnostics.EventLogEntryType.Error);
            }

            return strRet;
        }

        /// <summary>
        /// updates event flag
        /// </summary>
        /// <param name="udtEvent"></param>
        /// <returns></returns>
        public string FlagEvent(ref DataMgrTools dbMgr, EventInfo udtEvent)
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
                    Logger.LogEvent(ex.Message, "FlagEvent", System.Diagnostics.EventLogEntryType.Error);
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
        public string CancelEvent(EventInfo udtEvent, bool bResetFlag)
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
                Logger.LogEvent(mProjName, "CancelEvent: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }

            // close database
            return strRet;
        }

        /// <summary>
        /// saves event record
        /// </summary>
        /// <param name="udtEvent"></param>
        /// <returns></returns>
        public string SaveEvent(EventInfo udtEvent)
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
                Logger.LogEvent("SaveEvent: ", ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }

            return strRet;
        }

        /// <summary>
        /// saves event record
        /// </summary>
        /// <param name="udtEvent"></param>
        /// <returns></returns>
        public string SaveEvent(EventInfo udtEvent, bool bRemarks, bool bNotify)
        {

            string strRet = "";
            object objTemp = null;

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    // check tag
                    if (udtEvent.Tag != "")
                    {
                        // get asset
                        AssetRepository assetRepo = new AssetRepository();
                        AssetInfo udtAsset = assetRepo.GetByTagName(udtEvent.Tag);
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
                        AssetInfo udtAsset = new AssetInfo();

                        //// check status id
                        if (udtEvent.StatusID == 0)
                        {
                           
                            // get status id
                            string query = string.Format("SELECT status_id FROM status WHERE status_desc = @Event AND flag = 1", udtEvent.Event);

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

                        cmd.ExecuteNonQuery();

                        if (objTemp != null) udtEvent.EventID = Convert.ToInt32(objTemp);



                        // check event
                        if (udtEvent.EventID > 0)
                        {
                            // check alert
                            try { 
                                    if (udtEvent.AlertLevel != 0)
                                    {
                                        
                                        // update asset status
                                        cmd.CommandText = string.Format("UPDATE assets SET status_id = {0}, last_event = {1} " +
                                                          "WHERE asset_id = {2}", udtEvent.StatusID, udtEvent.EventID, udtEvent.AssetID);

                                        cmd.Prepare();
                                        cmd.Parameters.AddWithValue("@Assets", udtEvent.Asset);
                                        cmd.ExecuteNonQuery();

                                        AssetRepository assetRepo = new AssetRepository();
                                        assetRepo.SaveAssetInfo(Enums.PosInfoType.Event, udtEvent.EventID, udtEvent.AssetID, udtEvent.Timestamp);
                                    }
                                }
                            catch (Exception ex)
                            {
                                Logger.LogEvent(" Check alert Exception: ", ex.Message, System.Diagnostics.EventLogEntryType.Error);
                            }

                            // check event
                            switch (udtEvent.Event)
                            {
                                //case "Mileage Report":
                                //    {
                                //        // update asset's mileage
                                //        string[] arrTemp = udtEvent.Remarks.Split(":".ToCharArray());
                                //        if (arrTemp.Length > 2)
                                //        {
                                //            //query = string.Format("UPDATE assets SET mileage = @Mileage WHERE asset_id = @AssetID",
                                //            //new object[] { Convert.ToDouble(arrTemp[2].Trim()), udtEvent.AssetID });

                                //            cmd.CommandText = "UPDATE assets SET mileage = @Mileage WHERE asset_id = @AssetID";
                                //            cmd.Prepare();
                                //            cmd.Parameters.AddWithValue("@Mileage", udtAsset.Mileage);
                                //            cmd.Parameters.AddWithValue("@AssetID", udtEvent.AssetID);

                                //            cmd.ExecuteNonQuery();

                                //            AssetRepository assetRepo = new AssetRepository();
                                //            assetRepo.SaveAssetInfo(Enums.PosInfoType.Mileage, Convert.ToInt64(arrTemp[2].Trim()), udtEvent.AssetID, udtEvent.Timestamp);

                                //        }
                                //    }
                                //    break;
                                    case "Zone Enter":
                                    case "Zone Exit":
                                    {
                                        try 
                                        {
                                            // update asset's last enter/exit
                                            string query = string.Format("UPDATE assets SET {0} = {1} WHERE asset_id = {2}",
                                               (udtEvent.Event == "Zone Enter" ? "last_enter" : "last_exit"), udtEvent.EventID, udtEvent.AssetID);

                                            cmd.CommandText = query;
                                            cmd.Prepare();
                                            cmd.Parameters.AddWithValue("@Assets", udtEvent.Asset);                                     
                                            cmd.ExecuteNonQuery();

                                            Stopwatch stopWatch = new Stopwatch();
                                         
                                            if (udtEvent.Event == "Zone Enter")
                                            {
                                                AssetRepository assetRepo = new AssetRepository();
                                                JobInfo currJobs = new JobInfo();
                                                JobRepository jobRepo = new JobRepository();

                                                assetRepo.SaveAssetInfo(Enums.PosInfoType.Enter, udtEvent.EventID, udtEvent.AssetID, udtEvent.Timestamp);

                                                #region GET THE LINKED ASSET FOR JOBS
                                                try
                                                {
                                                    currJobs = jobRepo.GetByAssetID(udtEvent.AssetID);
                                                }
                                                catch (Exception ex)
                                                {
                                                    Logger.LogEvent("GET THE LINKED ASSET FOR JOBS:" + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                                                }
                                                #endregion  

                                                if (currJobs.JobID != 0 && currJobs.JobStatus == "In Progress" && currJobs.Flag == 3)
                                                {
                                                    
                                                    stopWatch.Start();
                                                    System.Threading.Thread.Sleep(TimeSpan.FromMinutes(30));
                                                    //System.Threading.Thread.Sleep(TimeSpan.FromSeconds(5));
                                                    stopWatch.Stop();
                                                    // Get the elapsed time as a TimeSpan value.
                                                    TimeSpan ts = stopWatch.Elapsed;

                                                    // Format and display the TimeSpan value. 
                                                    string elapsedTime = String.Format("{0:00}:{1:00}:{2:00}.{3:00}",
                                                        ts.Hours, ts.Minutes, ts.Seconds,
                                                        ts.Milliseconds / 10);

                                                    Logger.LogEvent("Check Timer: " + elapsedTime, System.Diagnostics.EventLogEntryType.Error);
                                                    jobRepo.UpdateJobByZone(currJobs);
                                                }    
                                                else if  (currJobs.JobID != 0 && currJobs.JobStatus == "In Progress" && currJobs.Flag == 3)
                                                {
                                                    stopWatch.Start();
                                                    System.Threading.Thread.Sleep(TimeSpan.FromMinutes(30));
                                                    //System.Threading.Thread.Sleep(TimeSpan.FromSeconds(5));
                                                    stopWatch.Stop();
                                                    // Get the elapsed time as a TimeSpan value.
                                                    TimeSpan ts = stopWatch.Elapsed;

                                                    // Format and display the TimeSpan value. 
                                                    string elapsedTime = String.Format("{0:00}:{1:00}:{2:00}.{3:00}",
                                                        ts.Hours, ts.Minutes, ts.Seconds,
                                                        ts.Milliseconds / 10);

                                                    Logger.LogEvent("Check Timer: " + elapsedTime, System.Diagnostics.EventLogEntryType.Error);
                                                    jobRepo.UpdateJobByZone(currJobs);
                                                }
                                            }
                                            else
                                            {
                                                AssetRepository assetRepo = new AssetRepository();
                                                assetRepo.SaveAssetInfo(Enums.PosInfoType.Exit, udtEvent.EventID, udtEvent.AssetID, udtEvent.Timestamp);
                                                stopWatch.Stop();
                                            }
                                        }
                                        catch (Exception ex)
                                        {
                                            Logger.LogEvent("Enter/Exit Zone Check Event Exception", ex.Message, System.Diagnostics.EventLogEntryType.Error);
                                        }
                                    }
                                    break;
                                    //case "Ignition":
                                    //{
                                    //    // update asset's ignition

                                    //    //query = string.Format("UPDATE assets SET ignition = @Ignition WHERE asset_id = @AssetID",
                                    //    //    new object[] { (udtEvent.Remarks.ToUpper().Contains("OFF") ? 0 : 1), udtEvent.AssetID });


                                    //    cmd.CommandText = "UPDATE assets SET ignition = @Ignition WHERE asset_id = @AssetID";
                                    //    cmd.Prepare();
                                    //    cmd.Parameters.AddWithValue("@Ignition", udtAsset.Ignition);
                                    //    cmd.Parameters.AddWithValue("@Remarks", udtEvent.Remarks.ToUpper().Contains("OFF") ? 0 : 1);
                                    //    cmd.Parameters.AddWithValue("@AssetID", udtEvent.AssetID);
                                    //    cmd.ExecuteNonQuery();

                                    //    AssetRepository assetRepo = new AssetRepository();
                                    //    assetRepo.SaveAssetInfo(Enums.PosInfoType.Ignition, (udtEvent.Remarks.ToUpper().Contains("OFF") ? 0 : 1), udtEvent.AssetID, udtEvent.Timestamp);
                                    //}
                                    //break;
                            }

                            // send event notifications
                            if (bNotify)
                                NotifyEvent(udtEvent);
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    // log error
                   // strRet = Logger.LogError(ex.Message + "::\r\n" + udtEvent.Event, "SaveEvent");
                    Logger.LogEvent("SaveEvent: ", ex.Message, System.Diagnostics.EventLogEntryType.Error);
                }

            }
            return strRet;
        }

        /// <summary>
        /// sends event notifications
        /// </summary>
        /// <param name="udtEvent"></param>
        public void NotifyEvent(EventInfo udtEvent)
        {

            List<string> arrEmail = new List<string>();
            List<string> arrSms = new List<string>();
           // List<UserInfo> arrUsers = new List<UserInfo>();
           // UserInfo currUser = new UserInfo();
           // List<AssetInfo> arrAssets = new List<AssetInfo>();
           // AssetInfo currAsset = new AssetInfo();

            string query = "";

            // check alert level
            string strSender = "TRACKLitePro";
            switch (udtEvent.AlertLevel)
            {
                case 1: strSender += " WARNING"; break;
                case 2: strSender += " ALERT"; break;
            }

            // initialize message
            //string strMessage = string.Format("{0}\r\n{1}\r\n{2}\r\n{3}\r\n{4:dd-MMM-yyyy HH:mm:ss}",
            //                    strSender, udtEvent.Event,
            //                    udtEvent.Remarks, udtEvent.Asset, udtEvent.Timestamp.ToLocalTime());

            string strMessage = string.Format("{0}\r\n{1}-{2}\r\n{3:dd-MMM-yyyy HH:mm:ss}",
                             udtEvent.Event,
                             udtEvent.Remarks, udtEvent.Asset, udtEvent.Timestamp.AddHours(8.0));

           // Logger.LogEvent("String message: " + strMessage, System.Diagnostics.EventLogEntryType.Error);  

                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    try
                    {
                        query = string.Format("SELECT email, phone, notifications, assets FROM users " +
                                                      "WHERE company_id = {0} AND notifications LIKE '%{1}:%'",
                                                      udtEvent.CompanyID, udtEvent.StatusID);

                        //Logger.LogEvent("Query Users: " + query, System.Diagnostics.EventLogEntryType.Error);

                        using (MySqlCommand cmd = new MySqlCommand(query, conn))
                        {                                                                                          
                            try
                            {
                                conn.Open();
                                using (MySqlDataReader reader = cmd.ExecuteReader())
                                {
                                    if ((reader != null) && (reader.HasRows))
                                    {
                                        while (reader.Read())
                                        {                                          
                                            bool isToSend = false;
                                            string vehList = reader.ToString("assets");

                                            //Logger.LogEvent("Check vehList" + vehList, System.Diagnostics.EventLogEntryType.Error);

                                            string[] arrVehicle = new string[1];
                                            if (!string.IsNullOrEmpty(vehList))
                                            {
                                                //Logger.LogEvent("Count arrVehicle" + arrVehicle.Count(), System.Diagnostics.EventLogEntryType.Error);

                                                arrVehicle = vehList.Split(",".ToCharArray());
                                                foreach (string currVeh in arrVehicle)
                                                {
                                                    //Logger.LogEvent("Check AssetID: " + udtEvent.AssetID, System.Diagnostics.EventLogEntryType.Error);

                                                    if (currVeh == udtEvent.AssetID.ToString())
                                                    {
                                                        //Logger.LogEvent("Check isToSend: true", System.Diagnostics.EventLogEntryType.Error);
                                                        isToSend = true;
                                                        break;//found vehicle to send to
                                                    }
                                                    else
                                                        isToSend = false;
                                                }
                                            }
                                            else//no restrictions on vehicles
                                            {
                                                isToSend = true;
                                            }

                                            if (isToSend)
                                            {
                                                // get event notification setting
                                                string[] arrNotify = reader.ToString("notifications").Split(",".ToCharArray());

                                               // Logger.LogEvent("Count ArrNotify" + arrNotify.Count(), System.Diagnostics.EventLogEntryType.Error);

                                                foreach (string strNotify in arrNotify)
                                                {
                                                    // check event notification
                                                    string[] arrTemp = strNotify.Split(":".ToCharArray());

                                                   // Logger.LogEvent("check event notification" + arrTemp.Count(), System.Diagnostics.EventLogEntryType.Error);

                                                    if ((arrTemp[0] == udtEvent.StatusID.ToString()) && (arrTemp.Length > 1) && (arrTemp[1].Length > 1))
                                                    {
                                                        // get contact info
                                                        string strEmail = reader.ToString("email");
                                                        string strPhone = reader.ToString("phone");

                                                       // Logger.LogEvent("get contact info email: " + strEmail, System.Diagnostics.EventLogEntryType.Error);
                                                        //Logger.LogEvent("get contact info phone: " + strPhone, System.Diagnostics.EventLogEntryType.Error);

                                                        // include user to recipients
                                                        if ((arrTemp[1].Substring(0, 1) == "1") && (strEmail != ""))
                                                            ListContactInfo(ref arrEmail, strEmail);
                                                        if ((arrTemp[1].Substring(1, 1) == "1") && (strPhone != ""))
                                                            ListContactInfo(ref arrSms, strPhone);
                                                        break;
                                                    }
                                                }
                                            }
                                        }

                                    }

                                if (reader != null) reader.Close();

                                // get asset contact info
                                //dbRdr = dbMgr.ExecuteReader(String.Format("SELECT email, phone, notifications FROM assets " +
                                //"WHERE asset_id = {0} AND notifications LIKE '%{1}:%'", udtEvent.AssetID, udtEvent.StatusID));
                                //query = string.Format("SELECT email, phone, notifications FROM assets " +
                                //    "WHERE asset_id = {0} AND notifications LIKE '%{1}:%'", udtEvent.AssetID, udtEvent.StatusID);

                                //Logger.LogEvent("Query Assets: " + query, System.Diagnostics.EventLogEntryType.Error);
                                                   
                                //if ((reader != null) && reader.HasRows && reader.Read())
                                //{
                                //    // get event notification setting
                                //    string[] arrNotify = reader.ToString("notifications").Split(",".ToCharArray());
                                //    foreach (string strNotify in arrNotify)
                                //    {
                                //        // check event notification
                                //        string[] arrTemp = strNotify.Split(":".ToCharArray());
                                //        if ((arrTemp[0] == udtEvent.StatusID.ToString()) && (arrTemp.Length > 1) && (arrTemp[1].Length > 1))
                                //        {
                                //            // get contact info
                                //            string strEmail = reader.ToString("email");
                                //            string strPhone = reader.ToString("phone");

                                //            // include asset to recipients
                                //            if ((arrTemp[1].Substring(0, 1) == "1") && (strEmail != ""))
                                //                ListContactInfo(ref arrEmail, strEmail);
                                //            if ((arrTemp[1].Substring(1, 1) == "1") && (strPhone != ""))
                                //                ListContactInfo(ref arrSms, strPhone);
                                //            break;
                                //        }
                                //    }
                                //}


                                if (reader != null) reader.Close();

                                // save message
                                MessageInfo udtMessage = new MessageInfo();
                                udtMessage.Sender = "TRACK Lite";
                                udtMessage.Message = strMessage;
                                udtMessage.Timestamp = DateTime.Now.ToUniversalTime();
                                udtMessage.RxTime = DateTime.Now.ToUniversalTime();
                                udtMessage.StatusID = 1;
                                udtMessage.CompanyID = udtEvent.CompanyID;
                                udtMessage.AssetID = udtEvent.AssetID;

                                MessageRepository messageRepo = new MessageRepository();

                                // loop through phone numbers
                                foreach (string strPhone in arrSms)
                                {
                                    // send notification
                                    udtMessage.Recipients = strPhone;                                
                                    messageRepo.SaveMessage(udtMessage);
                                }

                                // loop through emails
                                foreach (string strEmail in arrEmail)
                                {
                                    // send notification
                                    udtMessage.Recipients = strEmail;                                  
                                    messageRepo.SaveMessage(udtMessage);
                                }

                               }

                             conn.Close();
                            }
                           catch (Exception ex)
                           {
                             Logger.LogEvent("Build User Exception: ", ex.Message, System.Diagnostics.EventLogEntryType.Error);
                           }
                        
                        }
                    }
                    catch (Exception ex)
                    {
                        Logger.LogEvent("Notify Event: ", ex.Message, System.Diagnostics.EventLogEntryType.Error);
                    }
              }

            // close database
            //if (dbRdr != null) dbRdr.Close();
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

            //Logger.LogEvent("Enter ListContactInfo: " + arrContact.Count() + strContact, System.Diagnostics.EventLogEntryType.Error);

            foreach (string strTemp in arrContact)
            {
                // check contact info
                if (strTemp != "")
                {

                    //Logger.LogEvent("check contact info: " + strContact, System.Diagnostics.EventLogEntryType.Error);
                    // check contact if already added
                    if (!arrRecipients.Contains(strContact))
                        arrRecipients.Add(strContact);
                }
            }
        }

        //Not used
        public EventInfo GetByAssetID(int assetID, DateTime getTimestamp)
        {
            //Logger.LogEvent("tagName: " + tagName, System.Diagnostics.EventLogEntryType.Error);//testing
            EventInfo currEvent = new EventInfo();
            string query = string.Format("SELECT * FROM view_events WHERE asset_id = @AssetID and timestamp like @Timestamp LIMIT 1");


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
                        cmd.Parameters.AddWithValue("@AssetID", assetID);
                        cmd.Parameters.AddWithValue("@Timestamp", getTimestamp);
                        Logger.LogEvent("Check Timestamp: " + getTimestamp, System.Diagnostics.EventLogEntryType.Error);
                        MySqlDataReader reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            currEvent = DataMgrTools.BuildEvent(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-GetByAssetID", System.Diagnostics.EventLogEntryType.Error);
                    conn.Close();
                }
            }
            return currEvent;
        }


    }
}