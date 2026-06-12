using FMSWebApi.Models;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Timers;

namespace FMSWebApi.Repository
{
    public class PosInfoRepository : IPosRepository
    {
        private string mConnStr = "server=103.237.168.119;uid=root;pwd=@c3c0M;database=trackliteprodev;Charset=utf8;max pool size=500;";
        private string mProjName = "TRACKLitePro";
        public IEnumerable<PosInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<PosInfo> arrPos = new List<PosInfo>();

            return arrPos.ToArray();
        }

        public PosInfo Get(int posID)
        {
            PosInfo currPos = new PosInfo();
            string query = string.Format("SELECT * FROM view_positions WHERE pos_id = {0}", posID);

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
                    Logger.LogEvent(mProjName, "Get: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                    conn.Close();
                }
            }
            return currPos;
        }

        public IEnumerable<PosInfo> Get([FromUri]PosInfo value)
        {
            //SELECT * FROM view_positions WHERE timestamp between '2015-05-31' and '2015-06-01'
            List<PosInfo> arrPos = new List<PosInfo>();
            PosInfo currPos = new PosInfo();
            object objTemp = new object();

            string query = "SELECT * FROM view_positions WHERE (timestamp between @StartTS and @EndTS)";

            if (value.CompanyID > 0) query += " and company_id = @CompanyID";
            if (value.Speed > 0) query += " and speed > @Speed";
            if (value.BarLight > 0) query += " and bar_light = @Barlight";
            if (!string.IsNullOrEmpty(value.Engine)) query += " and engine = @Engine";

      
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
                        if (value.Speed > 0) cmd.Parameters.AddWithValue("@Speed", value.Speed);
                        if (value.BarLight > 0) cmd.Parameters.AddWithValue("@BarLight", value.BarLight);
                        if (!string.IsNullOrEmpty(value.Engine)) cmd.Parameters.AddWithValue("@Engine", value.Engine);

                        if (value.CompanyID > 0) cmd.Parameters.AddWithValue("@CompanyID", value.CompanyID);
                        if (value.AssetID > 0) cmd.Parameters.AddWithValue("@AssetID", value.AssetID);
                        else if (!string.IsNullOrEmpty(value.Asset)) cmd.Parameters.AddWithValue("@AssetName", value.Asset);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currPos = DataMgrTools.BuildPosition(reader);
                                    arrPos.Add(currPos);
                                }
                            }
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(mProjName, "Get: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                    
                }


            }

            return arrPos.ToArray();
        }

        public IEnumerable<PosInfo> GetCvr([FromUri]PosInfo value)
        {
            //SELECT * FROM view_positions WHERE timestamp between '2015-05-31' and '2015-06-01'
            List<PosInfo> arrPos = new List<PosInfo>();
            PosInfo currPos = new PosInfo();
            object objTemp = new object();

            string query = "SELECT * FROM view_positions_cvr WHERE (timestamp between @StartTS and @EndTS)";

            if (value.CompanyID > 0) query += " and company_id = @CompanyID";
            if (value.Speed > 0) query += " and speed > @Speed";
            if (value.BarLight > 0) query += " and bar_light = @Barlight";

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
                        if (value.Speed > 0) cmd.Parameters.AddWithValue("@Speed", value.Speed);
                        if (value.BarLight > 0) cmd.Parameters.AddWithValue("@BarLight", value.BarLight);

                        if (value.CompanyID > 0) cmd.Parameters.AddWithValue("@CompanyID", value.CompanyID);
                        if (value.AssetID > 0) cmd.Parameters.AddWithValue("@AssetID", value.AssetID);
                        else if (!string.IsNullOrEmpty(value.Asset)) cmd.Parameters.AddWithValue("@AssetName", value.Asset);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currPos = DataMgrTools.BuildPosition(reader);
                                    arrPos.Add(currPos);
                                }
                            }
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(mProjName, "Get: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);

                }


            }

            return arrPos.ToArray();
        }

        public PosInfo Add(PosInfo item)
        {
            AssetInfo currAsset = new AssetInfo();
            DriverInfo currDriver = new DriverInfo();
            EventRepository eventRepo = new EventRepository();
            AssetRepository assetRepo = new AssetRepository();

            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {

                    #region GET THE LINKED ASSET
                    try
                    {
                        currAsset = assetRepo.GetByTagName(item.Tag);
                        if (item == null) item.Asset =  "Asset Not Found";
                        if (item.Ignition == -1) item.Ignition = item.Ignition;
                        if (item.Mileage == 0) item.Mileage = item.Mileage;
                    }
                    catch (Exception ex)
                    {
                        Logger.LogEvent(mProjName, ex.Message, System.Diagnostics.EventLogEntryType.Error);
                    }
                    #endregion                

                    //check for duplicate data

                    //apply reverse geocode
                    VehTools.ApplyReverseGeocode(currAsset, item, null);
                    Logger.LogToFile(DateTime.Now + "\t" + String.Format("AssetID: {0}  Lat: {1}  Lon: {2}  Device: {3}  Location: {4}", 
                        currAsset.AssetID, item.PosY, item.PosX, item.Tag, item.Location), "RevGeocodeResultsLog.txt");

                    //set engine value
                    int iEngine = (item.Ignition == 0 ? 0 : (item.Speed > 0 ? 2 : 1));
                    item.Engine = iEngine.ToString();

                    //get asset drivers
                    try
                    {
                        DriverRepository driverRepo = new DriverRepository();
                        currDriver = driverRepo.GetDriver(currAsset.AssetID);
                        item.Driver = currDriver.Name;    
                    }
                    catch (Exception ex)
                    {
                        Logger.LogEvent(mProjName, ex.Message, System.Diagnostics.EventLogEntryType.Error);
                    }

                    // check valid limits for speed and altitude
                    if ((item.Speed > 200.0))
                        item.FixID = 0;

                    // check valid limits for fix type
                    if ((item.FixID < -1) || (item.FixID > 4))
                    {
                        // check satellite count
                        if (item.Satellites > 3) item.FixID = 2;
                        else if (item.Satellites > 2) item.FixID = 1;
                        else item.FixID = 0;
                    }

                    // set to no fix if L2D or L3D fix (0,3,4 - not reliable)
                    if ((item.FixID == 3) || (item.FixID == 4))
                        item.FixID = 0;

                    // check timestamp if invalid (device issue?)
                    if ((item.Timestamp.Year != item.RxTime.Year) && (item.Timestamp.Month == item.RxTime.Month))
                    {
                        // override year
                        item.Timestamp = new DateTime(item.RxTime.Year, item.Timestamp.Month, item.Timestamp.Day,
                            item.Timestamp.Hour, item.Timestamp.Minute, item.Timestamp.Second);
                    }


                    // check timestamp if ahead of server time
                    if (item.Timestamp > item.RxTime)
                    {
                        // check if ahead by more than 10 minutes
                        TimeSpan tsDiff = item.Timestamp - item.RxTime;
                        if (tsDiff.TotalMinutes > 10) item.Timestamp = item.RxTime;
                    }

                    // check position if already in database
                    try
                    {

                        using (MySqlCommand cmd = new MySqlCommand())
                        {
                            conn.Open();
                            cmd.Connection = conn;
                            cmd.CommandText = string.Format("SELECT pos_id FROM positions WHERE asset_id = @AssetID " +
                                           "AND timestamp = @Timestamp LIMIT 1");
                            cmd.Prepare();
                            cmd.Parameters.AddWithValue("@AssetID", currAsset.AssetID);
                            cmd.Parameters.AddWithValue("@Timestamp", item.Timestamp);
                            MySqlDataReader reader = cmd.ExecuteReader();
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    PosInfo currPos = DataMgrTools.BuildPosition(reader);
                                }
                            } 
                            conn.Close();
                        }
                    }
                    catch (Exception ex)
                    {
                        Logger.LogEvent("check position if already in database - " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                    }


                    // get company zones
                    List<ZoneInfo> arrZones = new List<ZoneInfo>();
                    try
                    {
                        ZoneRepository zoneRepo = new ZoneRepository();
                        arrZones = zoneRepo.GetAssetZones(item.AssetID, currAsset.CompanyID);
                    }
                    catch (Exception ex)
                    {
                        Logger.LogEvent(mProjName, ex.Message, System.Diagnostics.EventLogEntryType.Error);
                    }


                    foreach (ZoneInfo udtZone in arrZones)
                    {
                        // check if position is inside zone
                        if (udtZone.Perimeter == null) continue;
                        if (IsPointInLoc(new PointF((float)item.PosX, (float)item.PosY), udtZone.Perimeter))
                        {
                            // asset is inside zone
                            item.ZoneID = udtZone.ZoneID;
                            item.Zone = udtZone.Name;
                            break;
                        }
                    }


                    // get previous zone
                    PosInfo udtPrev = GetPosition(currAsset.LastFixID);
                    int iPrevZone = (udtPrev != null ? udtPrev.ZoneID : 0);

                    // check last position
                    int iLastEngine = 0;
                    if (udtPrev != null)
                    {
                        // get last engine status
                        switch (udtPrev.Engine)
                        {
                            case "STOP": iLastEngine = 0; break;
                            case "IDLE": iLastEngine = 1; break;
                            case "MOVE": iLastEngine = 2; break;
                        }

                    }

                    // Fix Jumping
                    if (item.ZoneID == 0 && item.Speed < 20 && udtPrev.ZoneID > 0)
                    {
                        item.ZoneID = udtPrev.ZoneID;
                        item.Zone = udtPrev.Zone;
                    }

                    // check engine status
                    int iSpeed = 5;
                    if ((iEngine == 2) && (item.Speed < iSpeed))
                    {
                        // check if idling
                        TimeSpan tsDiff = item.Timestamp - currAsset.LastMove;
                        if (tsDiff.TotalMinutes < 3)
                            iEngine = 1;
                    }


                    // cancel pending cell id not found alert
                    EventInfo udtEvent = new EventInfo();
                    udtEvent.AssetID = item.AssetID;
                    udtEvent.Asset = item.Asset;
                    udtEvent.TagID = item.TagID;
                    udtEvent.Tag = item.Tag;
                    udtEvent.AckUserID = 1;
                    /*
                    udtEvent.Event = "Cell ID";
                    CancelEvent(udtEvent, true);
                    */
                    // initialize event
                    udtEvent.PosID = item.PosID;
                    udtEvent.AlertLevel = 0;
                    udtEvent.Timestamp = item.Timestamp;
                    udtEvent.RxTime = item.RxTime;

                    IdlingInfo udtIdling = new IdlingInfo();
                    udtIdling.AssetID = item.AssetID;

                    #region ZONE ENTER/EXIT

                    // check if zone changed
                    int iExitZone = 0;
                    if (iPrevZone != item.ZoneID)
                    {

                        udtEvent.Remarks = "";//initialize remarks
                        //EventRepository eventRepo = new EventRepository();

                        // check previous zone
                        string[] arrAlertZones = currAsset.AlertZones.Split(",".ToCharArray());
                        if (iPrevZone != 0)
                        {                                 
                            //bool found = false;
                            // loop through zones
                            foreach (ZoneInfo udtZone in arrZones)
                            {

                                // check zone id
                                if (udtZone.ZoneID == iPrevZone)
                                {                         
                                    //found = true;
                                    // asset has left the zone
                                    iExitZone = iPrevZone;
                                    udtEvent.Event = "Zone Exit";
                                    udtEvent.Remarks = udtZone.Name;
                                    udtEvent.Flag = 1;
                                    string retval = eventRepo.SaveEvent(udtEvent, true, arrAlertZones.Contains(iPrevZone.ToString()));
                                    if (retval != "") Logger.LogEvent(String.Format("SavePos - ZoneExit Event: {0}", retval), 1);
                                    break;
                                }
                            }
                        }

                        // check current zone
                        if (item.ZoneID != 0)
                        {                       
                            string ret = "";
                            try
                            {                   
                                // asset has entered the zone
                                udtEvent.Event = "Zone Enter";
                                udtEvent.Remarks = item.Zone;
                                udtEvent.Flag = 1;
                                ret = eventRepo.SaveEvent(udtEvent, true, arrAlertZones.Contains(item.ZoneID.ToString()));

                                //Start Timer
                                if (ret != "") Logger.LogEvent(String.Format("Save Position - Zone Enter Event: {0}", ret), 1);
                            }
                            catch (Exception ex)
                            {
                                Logger.LogEvent(mProjName, ex.Message, System.Diagnostics.EventLogEntryType.Error);
                            }
                        }
                    }
                    #endregion

                    #region TRIPS REPORT

                    // check zone exit event
                    //if (iExitZone > 0)
                    //{
                    //    // save trips matching destination
                    //    List<PlanInfo> arrPlans = GetPlans(iExitZone, currAsset.Company);

                    //    Logger.LogEvent(mProjName, "arrPlans: " + arrPlans, System.Diagnostics.EventLogEntryType.Warning);

                    //    if (arrPlans.Count > 0)
                    //    {
                    //        //SaveTrips(item, arrPlans);

                    //        TripZoneInfo newTripZone = new TripZoneInfo();
                    //        newTripZone.ZoneName = udtEvent.Remarks;
                    //        newTripZone.ZoneID = iExitZone;
                    //        newTripZone.AssetID = item.AssetID;
                    //        newTripZone.AssetName = item.Asset;
                    //        newTripZone.CompanyID = currAsset.CompanyID;
                    //        newTripZone.CompanyName = currAsset.Company;
                    //        newTripZone.Timestamp = item.Timestamp;

                    //        //save to trips zone report [Dan:23DEC12]
                    //        //SaveTripsZone(newTripZone);
                    //    }
                    //}
                    #endregion

                    #region UTILIZATION REPORT

                    // get engine status
                    switch (iEngine)
                    {
                        case 0: item.Engine = "STOP"; break;
                        case 1: item.Engine = "IDLE"; break;
                        case 2: item.Engine = "MOVE"; break;
                    }

                    // check previous position
                    if (udtPrev != null)
                        SaveUtilization(udtPrev, item);
                    #endregion

                    //#region EXCESSIVE IDLING
                    ////Cancel Excessive Idling Alert when engine is turned off
                    //udtEvent.Event = "Excessive Idling";
                    //udtEvent.Remarks = "";

                    //if (item.Ignition == 0 && (udtPrev != null && udtPrev.Ignition == 1))
                    //{
                    //    //Cancel Excessive Idling alert when engine off
                    //    eventRepo.CancelEvent(udtEvent, true);
                    //    Logger.LogEvent(currAsset.Name + " : Ignition Off>>Cancel Excessive Idling alert", System.Diagnostics.EventLogEntryType.Warning);
                    //}
                    //#endregion

              		//Stop Saving Zero Position
                    if (item.PosY != 0 && item.PosX != 0)
                    {
                        using (MySqlCommand cmd = new MySqlCommand())
                        {
                            conn.Open();
                            cmd.Connection = conn;
                            cmd.CommandText = "INSERT INTO positions (asset_id, tag_id, timestamp, rx_time, fix, " +
                                "satellites, pos_x, pos_y, pos_z, speed, course, hdop, ignition, mileage, battery, fuel, " +
                                "loc, loc_id, zone_id, remarks, engine, driver, siren, bar_light) VALUES " +
                                "(@AssetID, @TagID, @Timestamp, @RxTime, @FixID, @Satellites, @PosX, @PosY, @PosZ, @Speed, " +
                                "@Course, @Hdop, @Ignition, @Mileage, @Battery, @Fuel, @Location, @LocID, @ZoneID, @Remarks, " +
                                "@Engine, @Driver, @Siren, @BarLight)";
                            cmd.Prepare();
                            cmd.Parameters.AddWithValue("@AssetID", currAsset.AssetID);
                            cmd.Parameters.AddWithValue("@TagID", currAsset.TagID);
                            cmd.Parameters.AddWithValue("@Timestamp", item.Timestamp);
                            cmd.Parameters.AddWithValue("@RxTime", item.RxTime);
                            cmd.Parameters.AddWithValue("@FixID", item.FixID);
                            cmd.Parameters.AddWithValue("@Satellites", item.Satellites);
                            cmd.Parameters.AddWithValue("@PosX", item.PosX);
                            cmd.Parameters.AddWithValue("@PosY", item.PosY);
                            cmd.Parameters.AddWithValue("@PosZ", item.PosZ);
                            cmd.Parameters.AddWithValue("@Speed", item.Speed);
                            cmd.Parameters.AddWithValue("@Course", item.Course);
                            cmd.Parameters.AddWithValue("@Hdop", item.HDOP);
                            cmd.Parameters.AddWithValue("@Ignition", item.Ignition);
                            cmd.Parameters.AddWithValue("@Mileage", item.Mileage);
                            cmd.Parameters.AddWithValue("@Battery", item.Battery);
                            cmd.Parameters.AddWithValue("@Fuel", item.Fuel);
                            cmd.Parameters.AddWithValue("@Location", item.Location);
                            cmd.Parameters.AddWithValue("@LocID", item.LocID);
                            cmd.Parameters.AddWithValue("@ZoneID", item.ZoneID);
                            cmd.Parameters.AddWithValue("@Remarks", item.Remarks);
                            cmd.Parameters.AddWithValue("@Engine", iEngine);
                            cmd.Parameters.AddWithValue("@Driver", currDriver.Name);
                            cmd.Parameters.AddWithValue("@Siren", item.Siren);
                            cmd.Parameters.AddWithValue("@BarLight", item.BarLight);
                            cmd.ExecuteNonQuery();

                            // update asset position
                            long id = cmd.LastInsertedId;
                            item.PosID = id;

                            cmd.CommandText = "UPDATE assets SET last_pos = @LastPosID, last_fix = @LastFixID, last_gps = @LastGpsID WHERE asset_id = @AssetID2";
                            cmd.Prepare();
                            cmd.Parameters.AddWithValue("@LastPosID", item.PosID);
                            cmd.Parameters.AddWithValue("@LastFixID", item.PosID);
                            cmd.Parameters.AddWithValue("@LastGpsID", item.PosID);
                            cmd.Parameters.AddWithValue("@AssetID2", currAsset.AssetID);
                            cmd.ExecuteNonQuery();
                            //assetRepo.SaveAssetInfo(Enums.PosInfoType.GPS, item.PosID, item.AssetID, item.Timestamp);
                            //Logger.LogEvent(mProjName, "Last PosID: " + item.PosID + "AssetID: " + currAsset.AssetID, System.Diagnostics.EventLogEntryType.Information);

                            // check if good fix
                            if (item.FixID != 0)
                            {
                                // update asset's last fix
                                List<object> arrValues = new List<object>();
                                string strParams = "last_fix = @PosID";
                                arrValues.Add(item.PosID);
                                assetRepo.SaveAssetInfo(Enums.PosInfoType.Fix, item.PosID, currAsset.AssetID, item.Timestamp);

                                // check speed
                                if (item.Speed >= iSpeed)
                                {
                                    // update last move
                                    strParams += ", last_move = @LastMove";
                                    arrValues.Add(item.Timestamp);

                                    cmd.CommandText = "UPDATE assets SET last_move = @LastMove WHERE asset_id = @AssetID3";
                                    cmd.Prepare();
                                    cmd.Parameters.AddWithValue("@LastMove", item.Timestamp);
                                    cmd.Parameters.AddWithValue("@AssetID3", currAsset.AssetID);
                                    cmd.ExecuteNonQuery();

                                    assetRepo.SaveAssetInfo(Enums.PosInfoType.Move, item.PosID, currAsset.AssetID, item.Timestamp);
                                }

                                // check engine if idling
                                if ((iLastEngine != 1) && (iEngine == 1))
                                {
                                    // update last idle
                                    strParams += ", last_idle = @LastIdle";
                                    arrValues.Add(item.Timestamp);

                                    cmd.CommandText = "UPDATE assets SET last_idle = @LastIdle WHERE asset_id = @AssetID4";
                                    cmd.Prepare();
                                    cmd.Parameters.AddWithValue("@LastIdle", item.Timestamp);
                                    cmd.Parameters.AddWithValue("@AssetID4", currAsset.AssetID);
                                    cmd.ExecuteNonQuery();

                                    assetRepo.SaveAssetInfo(Enums.PosInfoType.Idle, item.PosID, currAsset.AssetID, item.Timestamp);
                                }

                                try
                                {
                                    SaveIdlingReport(udtPrev, item);
                                }
                                catch (Exception ex)
                                {
                                    Logger.LogEvent("Save Idle Report", ex.Message, System.Diagnostics.EventLogEntryType.Error);
                                }

                                try
                                {
                                    SaveCvrReport(udtPrev, item);
                                    SaveMoveIdleReport(udtPrev, item);
                                }
                                catch (Exception ex)
                                {
                                    Logger.LogEvent("Save CVR Report", ex.Message, System.Diagnostics.EventLogEntryType.Error);
                                }

                            }

                            conn.Close();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(mProjName, ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }

            return item;
        }

        public bool Remove(int posID)
        {
            bool retVal = false;
            string query = string.Format("DELETE FROM positions WHERE pos_id = {0}", posID);

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        if (cmd.ExecuteNonQuery() == 1)
                            retVal = true;
                        else
                            retVal = false;
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    conn.Close();
                    Logger.LogEvent(mProjName, ex.Message, System.Diagnostics.EventLogEntryType.Error);
                }
            }

            return retVal;
        }

        public bool Update(PosInfo item)
        {
            bool retVal = false;
            
            return retVal;
        }


        /// <summary>
        /// checks point in location
        /// </summary>
        /// <param name="ptPos"></param>
        /// <param name="strPts"></param>
        /// <returns></returns>
        private bool IsPointInLoc(PointF ptPos, string strPts)
        {
            try
            {
                List<PointF> arrPts = new List<PointF>();
                string[] arrTemp = strPts.Split();

                // loop through points
                foreach (string strTemp in arrTemp)
                {
                    // add point to list
                    string[] arrCoord = strTemp.Split(",".ToCharArray());
                    arrPts.Add(new PointF((float)Convert.ToDouble(arrCoord[1]), (float)Convert.ToDouble(arrCoord[0])));
                }

                // check if circle
                if (arrPts.Count < 3)
                {
                    // check if circler
                    if (arrPts.Count == 2)
                    {
                        // get map rectangle
                        double lRadius = Math.Sqrt(Math.Pow(arrPts[0].X - arrPts[1].X, 2) + Math.Pow(arrPts[0].Y - arrPts[1].Y, 2));
                        return ((Math.Abs(arrPts[0].X - ptPos.X) < lRadius) && (Math.Abs(arrPts[0].Y - ptPos.Y) < lRadius));
                    }
                    return true;
                }

                // get first point
                PointF ptOld = new PointF(arrPts[arrPts.Count - 1].X, arrPts[arrPts.Count - 1].Y);
                PointF ptTemp1, ptTemp2;
                bool bInside = false;

                // loop through zone points
                for (int i = 0; i < arrPts.Count; i++)
                {
                    // get pair of points
                    PointF ptNew = new PointF(arrPts[i].X, arrPts[i].Y);
                    if (ptNew.X > ptOld.X)
                    {
                        ptTemp1 = ptOld;
                        ptTemp2 = ptNew;
                    }
                    else
                    {
                        ptTemp1 = ptNew;
                        ptTemp2 = ptOld;
                    }

                    // check point if inbetween
                    if ((ptNew.X < ptPos.X) == (ptPos.X <= ptOld.X) &&
                        ((double)ptPos.Y - (double)ptTemp1.Y) * (double)(ptTemp2.X - ptTemp1.X) <
                        ((double)ptTemp2.Y - (double)ptTemp1.Y) * (double)(ptPos.X - ptTemp1.X))
                        bInside = !bInside;

                    // move to next point
                    ptOld = ptNew;
                }
                return bInside;
            }
            catch (Exception ex)
            {
                // log error
                //Logger.LogEvent(mProjName, "IsPointInLoc: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return false;
        }


        /// <summary>
        /// gets assets' last positions
        /// </summary>
        /// <param name="dbMgr"></param>
        /// <param name="iPosID"></param>
        private PosInfo GetPosition(long iPosID)
        {
            PosInfo currPos = new PosInfo();
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
                    Logger.LogEvent(mProjName, "Get Position: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                }
            }
            return currPos;
        }

        /// <summary>
        /// saves utilization record
        /// </summary>
        /// <param name="dbMgr"></param>
        /// <param name="udtPrev"></param>
        /// <param name="udtPos"></param>
        /// <returns></returns>
        public string SaveUtilization(PosInfo udtPrev, PosInfo udtPos)
        {

            string strRet = "";
            object objTemp = null;
            try
            {
                // open database
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {              
                            // initialize utilization report
                            UtilizeReport udtUtilize = new UtilizeReport();
                            udtUtilize.UtilID = 0;
                            udtUtilize.Date = udtPos.Timestamp.ToLocalTime().Date;
                            udtUtilize.Mileage = 0;
                            udtUtilize.StartTime = DateTime.MinValue;
                            udtUtilize.EndTime = DateTime.MinValue;
                            udtUtilize.LastIgnition = udtUtilize.Date;

                            // check if record is already existing
                            //dbRdr = dbMgr.ExecuteReader("SELECT * FROM utilization WHERE date = @Date AND asset_id = @AssetID",
                            //    new object[] { udtUtilize.Date, udtPos.AssetID });
    
                            try
                            {
                                string strDate = (udtUtilize.Date != DateTime.MinValue ? String.Format("{0:yyyy-MM-dd HH:mm:ss}" + ".000000", udtUtilize.Date) : "NULL");

                                using (MySqlCommand cmd = new MySqlCommand())
                                {
                                    conn.Open();
                                    cmd.Connection = conn;                
                                    cmd.CommandText = "SELECT * FROM utilization WHERE date = @Date AND asset_id = @AssetID";
                                    cmd.Prepare();
                                    cmd.Parameters.AddWithValue("@Date", strDate);
                                    cmd.Parameters.AddWithValue("@AssetID", udtPrev.AssetID);
                                    MySqlDataReader reader = cmd.ExecuteReader();
                                    if ((reader != null) && (reader.HasRows))
                                    {
                                        while (reader.Read())
                                        {
                                            udtUtilize = DataMgrTools.BuildUtilization(reader);
                                        }                         
                                    }
                                    conn.Close();
                                }
                            }
                            catch (Exception ex)
                            {
                                Logger.LogEvent(mProjName, "check if record is already existing: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                            }


                            // check engine status
                            TimeSpan tsDiff = udtPos.Timestamp - udtPrev.Timestamp;
                            switch (udtPrev.Engine)
                            {
                                case "STOP":
                                    {
                                        // update engine stop duration
                                        udtUtilize.Stop1 += tsDiff.TotalMinutes;
                                        if (udtUtilize.StartTime != DateTime.MinValue)
                                            udtUtilize.Stop2 += tsDiff.TotalMinutes;
                                    }
                                    break;
                                case "IDLE": udtUtilize.Idle += tsDiff.TotalMinutes; break;
                                case "MOVE": udtUtilize.Move += tsDiff.TotalMinutes; break;
                            }

                            // check if vehicle stopped
                            if ((udtPrev.Engine != "STOP") && (udtPos.Engine == "STOP"))
                                udtUtilize.StopCount++;

                            // check ignition
                            if (udtPrev.Ignition == 1)
                            {
                                // check if no recorded time yet
                                if (udtUtilize.StartTime == DateTime.MinValue)
                                {
                                    // set first ignition of the day
                                    udtUtilize.StartTime = udtPrev.Timestamp;
                                    udtUtilize.EndTime = udtPrev.Timestamp;
                                }

                                // update last ignition of the day
                                udtUtilize.LastIgnition = udtPos.Timestamp;
                                if (udtUtilize.EndTime < udtPrev.Timestamp)
                                    udtUtilize.EndTime = udtPrev.Timestamp;
                            }

                            // update mileage
                            udtPos.Mileage /= 100;
                            if (udtPos.Mileage > udtPrev.Mileage)
                                udtUtilize.Mileage += (udtPos.Mileage - udtPrev.Mileage);

                            // format start and end times
                            string strStart = (udtUtilize.StartTime != DateTime.MinValue ? String.Format("'{0:dd-MMM-yyyy HH:mm:ss}'", udtUtilize.StartTime) : "NULL");
                            string strEnd = (udtUtilize.EndTime != DateTime.MinValue ? String.Format("'{0:dd-MMM-yyyy HH:mm:ss}'", udtUtilize.EndTime) : "NULL");

                            // 
                            if (udtUtilize.UtilID == 0)
                            {
                                if (udtPrev.AssetID > 0)
                                {
                                    try
                                    {
                                        using (MySqlCommand cmd = new MySqlCommand())
                                        {

                                            conn.Open();
                                            cmd.Connection = conn;
                                            cmd.CommandText = "INSERT INTO utilization (asset_id, driver, date, start_time, " +
                                                                    "end_time, stop, stop_ex, idle, move, stop_count, mileage, last_ignition, location) VALUES " +
                                                                    "(@AssetID, @Driver, @Date, @StartTime, @EndTime, @Stop, @StopEx, @Idle, @Move, @StopCount, @Mileage, @LastIgnition, @Location)";

                                            cmd.Prepare();
                                            cmd.Parameters.AddWithValue("@AssetID", udtPrev.AssetID);
                                            cmd.Parameters.AddWithValue("@Driver", udtPrev.Driver);
                                            cmd.Parameters.AddWithValue("@Date", udtUtilize.Date);
                                            cmd.Parameters.AddWithValue("@StartTime", udtUtilize.StartTime);
                                            cmd.Parameters.AddWithValue("@EndTime", udtUtilize.EndTime);
                                            cmd.Parameters.AddWithValue("@Stop", udtUtilize.Stop1);
                                            cmd.Parameters.AddWithValue("@StopEx", udtUtilize.Stop2);
                                            cmd.Parameters.AddWithValue("@Idle", udtUtilize.Idle);
                                            cmd.Parameters.AddWithValue("@Move", udtUtilize.Move);
                                            cmd.Parameters.AddWithValue("@StopCount", udtUtilize.StopCount);
                                            cmd.Parameters.AddWithValue("@Mileage", udtUtilize.Mileage);
                                            cmd.Parameters.AddWithValue("@LastIgnition", udtUtilize.LastIgnition);
                                            cmd.Parameters.AddWithValue("@Location", udtPrev.Location);
                                            //cmd.ExecuteNonQuery();
                                            //Logger.LogEvent("save utilization record: " + udtPrev.AssetID, System.Diagnostics.EventLogEntryType.Warning);//testing   
                                            objTemp = cmd.ExecuteScalar();
                                            if (objTemp != null) udtUtilize.UtilID = Convert.ToInt64(objTemp);

                                            conn.Close();
                                        }
                                    }
                                    catch (Exception ex)
                                    {
                                        Logger.LogEvent(mProjName, "save utilization record: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                                    }
                                }                                                   
							}
                            else
                            {
                                // update utilization record
                                //    dbMgr.ExecuteScalar(String.Format("UPDATE utilization SET start_time = {0}, end_time = {1}, stop = @Stop, " +
                                //        "stop_ex = @StopEx, idle = @Idle, move = @Move, stop_count = @StopCount, mileage = @Mileage, " +
                                //        "last_ignition = @LastIgnition WHERE util_id = @UtilID", strStart, strEnd), new object[] { udtUtilize.Stop1, 
                                //udtUtilize.Stop2, udtUtilize.Idle, udtUtilize.Move, udtUtilize.StopCount, udtUtilize.Mileage, 
                                //udtUtilize.LastIgnition, udtUtilize.UtilID });

                                try
                                {
                                    using (MySqlCommand cmd = new MySqlCommand())
                                    {
                                        conn.Open();
                                        cmd.Connection = conn;
                                        cmd.CommandText = string.Format("UPDATE utilization SET start_time = @StartTime, end_time = @EndTime, stop = @Stop,  " +
                                                                "stop_ex = @StopEx, idle = @Idle, move = @Move, stop_count = @StopCount, mileage = @Mileage, " +
                                                                "last_ignition = @LastIgnition, location = @Location WHERE util_id = @UtilID");
                                        cmd.Prepare();
                                        cmd.Parameters.AddWithValue("@StartTime", udtUtilize.StartTime);
                                        cmd.Parameters.AddWithValue("@EndTime", udtUtilize.EndTime);
                                        cmd.Parameters.AddWithValue("@Stop", udtUtilize.Stop1);
                                        cmd.Parameters.AddWithValue("@StopEx", udtUtilize.Stop2);
                                        cmd.Parameters.AddWithValue("@Idle", udtUtilize.Idle);
                                        cmd.Parameters.AddWithValue("@Move", udtUtilize.Move);
                                        cmd.Parameters.AddWithValue("@StopCount", udtUtilize.StopCount);
                                        cmd.Parameters.AddWithValue("@Mileage", udtUtilize.Mileage);
                                        cmd.Parameters.AddWithValue("@LastIgnition", udtUtilize.LastIgnition);
                                        cmd.Parameters.AddWithValue("@Location", udtPrev.Location);
                                        cmd.Parameters.AddWithValue("@UtilID", udtUtilize.UtilID);
                                        objTemp = cmd.ExecuteScalar();
                                        if (objTemp != null) udtUtilize.UtilID = Convert.ToInt64(objTemp);
                                        //cmd.ExecuteNonQuery();
                                        conn.Close();
                                    }
                                }
                                catch (Exception ex)
                                {
                                    Logger.LogEvent(mProjName, "edit utilization record: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                                  
                                }
                            }
                                   
                }

            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent("SaveUtilization: ", ex.Message, System.Diagnostics.EventLogEntryType.Error);

            }

            // close database
           // if (dbRdr != null) dbRdr.Close();
            return strRet;
        }

        /// <summary>
        /// save idling report
        /// </summary>
        /// <param name="dbMgr"></param>
        /// <param name="udtPos"></param>
        /// <returns></returns>
        public string SaveIdlingReport(PosInfo udtPrev, PosInfo udtPos)
        {
            object objTemp = null;
            string strRet = "";
            try
            {
                // open database
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    IdlingInfo udtIdling = new IdlingInfo();
                    udtIdling.IdleReportID = 0;

                    // get existing record
                    //object objTemp = dbMgr.ExecuteScalar("SELECT TOP(1) idlereport_id FROM idlereport WHERE idle_start = @Timestamp " +
                    //    "AND asset_id = @AssetID AND idle_end IS NULL", new object[] { udtPos.Timestamp, udtPos.AssetID });

                    try
                    {

                        using (MySqlCommand cmd = new MySqlCommand())
                        {
                            conn.Open();
                            cmd.Connection = conn;
                            cmd.CommandText = "SELECT idlereport_id FROM idlereport WHERE asset_id = @AssetID AND idle_end IS NULL LIMIT 1";
                            cmd.Prepare();

                            //cmd.Parameters.AddWithValue("@IdleStart", idleStart);
                            //Logger.LogEvent("Get Timestamp: " + idleStart, System.Diagnostics.EventLogEntryType.Warning);
                            cmd.Parameters.AddWithValue("@AssetID", udtPrev.AssetID);
                            //Logger.LogEvent("Get AssetID: " + udtPrev.AssetID, System.Diagnostics.EventLogEntryType.Warning);

                            MySqlDataReader reader = cmd.ExecuteReader();
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    udtIdling = DataMgrTools.BuildIdling(reader);
                                }
                            }

                            conn.Close();
                        }

                    }
                    catch (Exception ex)
                    {
                        Logger.LogEvent(ex.Message + " check if record is already existing", System.Diagnostics.EventLogEntryType.Error);
                    }

                    //Logger.LogEvent("Get idleReportID: " + idleReportID, System.Diagnostics.EventLogEntryType.Warning);

                    // check if record already exists
                    if (udtIdling.IdleReportID > 0)
                    {
                        // check engine status
                        if (udtPos.Engine != "IDLE")
                        {
                            // update latest data of asset
                            //dbMgr.ExecuteNonQuery("UPDATE idlereport SET idle_end = @IdleEnd WHERE idlereport_id = @IdleReportID",
                            //    new object[] { udtPos.Timestamp, idleReportID });
                            try
                            {
                                using (MySqlCommand cmd = new MySqlCommand())
                                {
                                    conn.Open();
                                    cmd.Connection = conn;
                                    cmd.CommandText = "UPDATE idlereport SET idle_end = @IdleEnd WHERE idlereport_id = @IdleReportID";
                                    cmd.Prepare();

                                    cmd.Parameters.AddWithValue("@IdleEnd", udtPos.Timestamp);
                                    cmd.Parameters.AddWithValue("@IdleReportID", udtIdling.IdleReportID);
                                    cmd.ExecuteNonQuery();
                                    conn.Close();
                                }
                            }
                            catch (Exception ex)
                            {
                                Logger.LogEvent(mProjName, " update latest data of asset: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                            }
                        }
                    }
                    else
                    {
                        // check engine status
                        if (udtPos.Engine == "IDLE")
                        {
                            // save new data
                            //dbMgr.ExecuteNonQuery("INSERT INTO idlereport (driver, asset_id, idle_start, location) " +
                            //    "VALUES (@Driver, @AssetID, @IdleStart, @Location)",
                            //    new object[] { udtPos.Driver, udtPos.AssetID, udtPos.Timestamp, udtPos.Location });
                            try
                            {
                                using (MySqlCommand cmd = new MySqlCommand())
                                {
                                    conn.Open();
                                    cmd.Connection = conn;
                                    cmd.CommandText = "INSERT INTO idlereport (driver, asset_id, idle_start, location) " +
                                                                   "VALUES (@Driver, @AssetID, @IdleStart, @Location)";
                                    cmd.Prepare();

                                    

                                    cmd.Parameters.AddWithValue("@Driver", udtPos.Driver);
                                    cmd.Parameters.AddWithValue("@AssetID", udtPrev.AssetID);
                                    cmd.Parameters.AddWithValue("@IdleStart", udtPos.Timestamp);
                                    cmd.Parameters.AddWithValue("@Location", udtPos.Location);
                                    cmd.ExecuteNonQuery();
                                    conn.Close();
                                }
                            }
                            catch (Exception ex)
                            {
                                Logger.LogEvent(mProjName, " save new data: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "SaveIdlingReport: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }

            return strRet;
        }

        /// <summary>
        /// save cvr report
        /// </summary>
        /// <param name="dbMgr"></param>
        /// <param name="udtPos"></param>
        /// <returns></returns>
        public string SaveCvrReport(PosInfo udtPrev, PosInfo udtPos)
        {
            string strRet = "";
            try
            {
                // open database
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    PosInfo udtPosCvr = new PosInfo();
                    udtPos.PosID = 0;

                    int iEngine = 0;
                    // get last engine status
                    switch (udtPos.Engine)
                    {
                        case "STOP": iEngine = 0; break;
                        case "IDLE": iEngine = 1; break;
                        case "MOVE": iEngine = 2; break;
                    }

                    try
                    {

                        using (MySqlCommand cmd = new MySqlCommand())
                        {
                            conn.Open();
                            cmd.Connection = conn;
                            cmd.CommandText = "SELECT pos_id FROM positions_cvr WHERE asset_id = @AssetID AND engine = 0 AND rx_time IS NULL LIMIT 1";
                            cmd.Prepare();
                            cmd.Parameters.AddWithValue("@AssetID", udtPrev.AssetID);

                            MySqlDataReader reader = cmd.ExecuteReader();
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    udtPosCvr = DataMgrTools.BuildPosition(reader);
                                }
                            }

                            conn.Close();
                        }

                    }
                    catch (Exception ex)
                    {
                        Logger.LogEvent(ex.Message + " check if record is already existing", System.Diagnostics.EventLogEntryType.Error);
                    }

                    //Logger.LogEvent("Get idleReportID: " + idleReportID, System.Diagnostics.EventLogEntryType.Warning);

                    // check if record already exists
                    if (udtPosCvr.PosID > 0)
                    {
                        // check engine status
                        if (udtPos.Engine != "STOP")
                        {

                            try
                            {
                                using (MySqlCommand cmd = new MySqlCommand())
                                {
                                    conn.Open();
                                    cmd.Connection = conn;
                                    cmd.CommandText = "UPDATE positions_cvr SET rx_time = @RxTime WHERE pos_id = @PosID";
                                    cmd.Prepare();
                                    cmd.Parameters.AddWithValue("@RxTime", udtPos.Timestamp);
                                    cmd.Parameters.AddWithValue("@PosID", udtPosCvr.PosID);
                                    cmd.ExecuteNonQuery();
                                    conn.Close();
                                }
                            }
                            catch (Exception ex)
                            {
                                Logger.LogEvent(mProjName, " update latest data of asset: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                            }

                        }
                    }
                    else
                    {
                        // check engine status
                        if (udtPos.Engine == "STOP")
                        {

                            try
                            {

                                using (MySqlCommand cmd = new MySqlCommand())
                                {
                                    conn.Open();
                                    cmd.Connection = conn;
                                    cmd.CommandText = "INSERT INTO positions_cvr (asset_id, tag_id, timestamp, rx_time, fix, " +
                                                        "satellites, pos_x, pos_y, pos_z, speed, course, hdop, ignition, mileage, battery, fuel, " +
                                                        "loc, loc_id, zone_id, remarks, engine, driver, siren, bar_light) VALUES " +
                                                        "(@AssetID, @TagID, @Timestamp, @RxTime, @FixID, @Satellites, @PosX, @PosY, @PosZ, @Speed, " +
                                                        "@Course, @Hdop, @Ignition, @Mileage, @Battery, @Fuel, @Location, @LocID, @ZoneID, @Remarks, " +
                                                        "@Engine, @Driver, @Siren, @BarLight)";
                                    cmd.Prepare();
                                    cmd.Parameters.AddWithValue("@AssetID", udtPrev.AssetID);
                                    cmd.Parameters.AddWithValue("@TagID", udtPrev.TagID);
                                    cmd.Parameters.AddWithValue("@Timestamp", udtPos.Timestamp);
                                    cmd.Parameters.AddWithValue("@RxTime", DBNull.Value);
                                    cmd.Parameters.AddWithValue("@FixID", udtPos.FixID);
                                    cmd.Parameters.AddWithValue("@Satellites", udtPos.Satellites);
                                    cmd.Parameters.AddWithValue("@PosX", udtPos.PosX);
                                    cmd.Parameters.AddWithValue("@PosY", udtPos.PosY);
                                    cmd.Parameters.AddWithValue("@PosZ", udtPos.PosZ);
                                    cmd.Parameters.AddWithValue("@Speed", udtPos.Speed);
                                    cmd.Parameters.AddWithValue("@Course", udtPos.Course);
                                    cmd.Parameters.AddWithValue("@Hdop", udtPos.HDOP);
                                    cmd.Parameters.AddWithValue("@Ignition", udtPos.Ignition);
                                    cmd.Parameters.AddWithValue("@Mileage", udtPos.Mileage);
                                    cmd.Parameters.AddWithValue("@Battery", udtPos.Battery);
                                    cmd.Parameters.AddWithValue("@Fuel", udtPos.Fuel);
                                    cmd.Parameters.AddWithValue("@Location", udtPos.Location);
                                    cmd.Parameters.AddWithValue("@LocID", udtPos.LocID);
                                    cmd.Parameters.AddWithValue("@ZoneID", udtPos.ZoneID);
                                    cmd.Parameters.AddWithValue("@Remarks", udtPos.Remarks);
                                    cmd.Parameters.AddWithValue("@Engine", iEngine);
                                    cmd.Parameters.AddWithValue("@Driver", udtPos.Driver);
                                    cmd.Parameters.AddWithValue("@Siren", udtPos.Siren);
                                    cmd.Parameters.AddWithValue("@BarLight", udtPos.BarLight);
                                    cmd.ExecuteNonQuery();
                                    conn.Close();
                                }
                            }
                            catch (Exception ex)
                            {
                                Logger.LogEvent(mProjName, " save stop data cvr: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                            }

                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "SaveCvrReport: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }

            return strRet;
        }

        public string SaveMoveIdleReport(PosInfo udtPrev, PosInfo udtPos)
        {
            string strRet = "";
            try
            {
                // open database
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    PosInfo udtPosCvr = new PosInfo();
                    udtPos.PosID = 0;

                    int iEngine = 0;
                    // get last engine status
                    switch (udtPos.Engine)
                    {
                        case "STOP": iEngine = 0; break;
                        case "IDLE": iEngine = 1; break;
                        case "MOVE": iEngine = 2; break;
                    }

                        // check engine status
                    if (udtPos.Engine != "STOP")
                    {

                        try
                        {

                            using (MySqlCommand cmd = new MySqlCommand())
                            {
                                conn.Open();
                                cmd.Connection = conn;
                                cmd.CommandText = "INSERT INTO positions_cvr (asset_id, tag_id, timestamp, rx_time, fix, " +
                                                    "satellites, pos_x, pos_y, pos_z, speed, course, hdop, ignition, mileage, battery, fuel, " +
                                                    "loc, loc_id, zone_id, remarks, engine, driver, siren, bar_light) VALUES " +
                                                    "(@AssetID, @TagID, @Timestamp, @RxTime, @FixID, @Satellites, @PosX, @PosY, @PosZ, @Speed, " +
                                                    "@Course, @Hdop, @Ignition, @Mileage, @Battery, @Fuel, @Location, @LocID, @ZoneID, @Remarks, " +
                                                    "@Engine, @Driver, @Siren, @BarLight)";
                                cmd.Prepare();
                                cmd.Parameters.AddWithValue("@AssetID", udtPrev.AssetID);
                                cmd.Parameters.AddWithValue("@TagID", udtPrev.TagID);
                                cmd.Parameters.AddWithValue("@Timestamp", udtPos.Timestamp);
                                cmd.Parameters.AddWithValue("@RxTime", udtPos.RxTime);
                                cmd.Parameters.AddWithValue("@FixID", udtPos.FixID);
                                cmd.Parameters.AddWithValue("@Satellites", udtPos.Satellites);
                                cmd.Parameters.AddWithValue("@PosX", udtPos.PosX);
                                cmd.Parameters.AddWithValue("@PosY", udtPos.PosY);
                                cmd.Parameters.AddWithValue("@PosZ", udtPos.PosZ);
                                cmd.Parameters.AddWithValue("@Speed", udtPos.Speed);
                                cmd.Parameters.AddWithValue("@Course", udtPos.Course);
                                cmd.Parameters.AddWithValue("@Hdop", udtPos.HDOP);
                                cmd.Parameters.AddWithValue("@Ignition", udtPos.Ignition);
                                cmd.Parameters.AddWithValue("@Mileage", udtPos.Mileage);
                                cmd.Parameters.AddWithValue("@Battery", udtPos.Battery);
                                cmd.Parameters.AddWithValue("@Fuel", udtPos.Fuel);
                                cmd.Parameters.AddWithValue("@Location", udtPos.Location);
                                cmd.Parameters.AddWithValue("@LocID", udtPos.LocID);
                                cmd.Parameters.AddWithValue("@ZoneID", udtPos.ZoneID);
                                cmd.Parameters.AddWithValue("@Remarks", udtPos.Remarks);
                                cmd.Parameters.AddWithValue("@Engine", iEngine);
                                cmd.Parameters.AddWithValue("@Driver", udtPos.Driver);
                                cmd.Parameters.AddWithValue("@Siren", udtPos.Siren);
                                cmd.Parameters.AddWithValue("@BarLight", udtPos.BarLight);
                                cmd.ExecuteNonQuery();
                                conn.Close();
                            }
                        }
                        catch (Exception ex)
                        {
                            Logger.LogEvent(mProjName, " save move/idle data cvr: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                        }


                    } 
                    
                }
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "SaveMoveIdleReport: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }

            return strRet;
        }


        public List<PlanInfo> GetPlans(int iDestID, string strCompany)
        {

            List<PlanInfo> arrPlans = new List<PlanInfo>();
            object objTemp = null;
            string query = "";

            try
            {
                // initialize query
                List<object> arrParams = new List<object>();
                string strSql = "SELECT plans.*, zones.name AS origin, companies.name AS company FROM plans " +
                                "INNER JOIN zones ON plans.origin_id = zones.zone_id " +
                                "INNER JOIN companies ON plans.company_id = companies.company_id " +
                                "WHERE plans.company_id = (SELECT company_id FROM companies WHERE name = @Company)";
                arrParams.Add(strCompany);

                // check destination zone
                if (iDestID > 0)
                {
                    // filter by specified destination zone
                    strSql += " AND plans.destination_id = @DestinationID";
                    arrParams.Add(iDestID);
                }

                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    try
                    {
                        query = string.Format(strSql + " ORDER BY origin", arrParams.ToArray());

                        using (MySqlCommand cmd = new MySqlCommand(query, conn))
                        {
                            conn.Open();
                            cmd.Prepare();
                            cmd.Parameters.AddWithValue("@Company", strCompany);
                            cmd.Parameters.AddWithValue("@DestinationID", iDestID);

                            MySqlDataReader reader = cmd.ExecuteReader();
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    PlanInfo currPlan = DataMgrTools.BuildPlan(reader);
                                    arrPlans.Add(currPlan);
                                }
                            }
                            conn.Close();
                        }
                    }
                    catch (Exception ex)
                    {
                        Logger.LogEvent(ex.Message + "  get trip plans", System.Diagnostics.EventLogEntryType.Error);
                    }

                    if (conn != null) conn.Close();

                    // loop through trip plans
                    foreach (PlanInfo udtPlan in arrPlans)
                    {
                        // get destination zone name
                        //object objTemp = dbMgr.ExecuteScalar(String.Format("SELECT TOP(1) name FROM zones " +
                        //    "WHERE zone_id = {0}", udtPlan.DestinationID));
                        try
                        {
                            query = string.Format("SELECT name FROM zones WHERE zone_id = {0} LIMIT 1");
                            using (MySqlCommand cmd = new MySqlCommand(query, conn))
                            {
                                conn.Open();
                                //cmd.CommandText = query;
                                cmd.Prepare();
                                cmd.Parameters.AddWithValue("@ZoneID", udtPlan.DestinationID);
                                objTemp = cmd.ExecuteScalar();
                                if (objTemp != null) udtPlan.Destination = objTemp.ToString();
                                Logger.LogEvent("Get Query" + query, System.Diagnostics.EventLogEntryType.Warning);
                                Logger.LogEvent("Get objTemp" + udtPlan.Destination, System.Diagnostics.EventLogEntryType.Warning);
                                conn.Close();
                            }

                        }
                        catch (Exception ex)
                        {
                            Logger.LogEvent(ex.Message + "  loop through trip plans", System.Diagnostics.EventLogEntryType.Error);
                        }
                    }

                }
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(ex.Message + " -GetPlans", System.Diagnostics.EventLogEntryType.Error);
            }

            return arrPlans;
        }

        /// <summary>
        /// generates trips from zone exit event
        /// </summary>
        /// <param name="dbMgr"></param>
        /// <param name="udtPos"></param>
        /// <param name="arrPlans"></param>
        /// <returns></returns>
        private List<TripInfo> SaveTrips(PosInfo udtPos, List<PlanInfo> arrPlans)
        {
            List<TripInfo> arrTrips = new List<TripInfo>();
            object objTemp = null;
            string query = "";
            int iZoneExit = 0;
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    // get zone enter id
                    //object objTemp = cmd.ExecuteScalar("SELECT status_id FROM status WHERE status_desc = 'Zone Enter'");
                    try
                    {
                        query = String.Format("SELECT status_id FROM status WHERE status_desc = 'Zone Enter'");
                        using (MySqlCommand cmd = new MySqlCommand(query, conn))
                        {
                            conn.Open();
                            objTemp = cmd.ExecuteScalar();
                            int iZoneEnter = (objTemp != null ? Convert.ToInt32(objTemp) : 0);
                            conn.Close();

                        }
                    }
                    catch (Exception ex)
                    {
                        Logger.LogEvent(ex.Message + " get zone enter id", System.Diagnostics.EventLogEntryType.Error);
                    }


                    // get zone exit id
                   // objTemp = dbMgr.ExecuteScalar("SELECT status_id FROM status WHERE status_desc = 'Zone Exit'");
                    try
                    {
                        query = String.Format("SELECT status_id FROM status WHERE status_desc = 'Zone Exit'");
                        using (MySqlCommand cmd = new MySqlCommand(query, conn))
                        {
                            conn.Open();
                            objTemp = cmd.ExecuteScalar();
                            iZoneExit = (objTemp != null ? Convert.ToInt32(objTemp) : 0);
                            conn.Close();

                        }
                    }
                    catch (Exception ex)
                    {
                        Logger.LogEvent(ex.Message + " get zone enter id", System.Diagnostics.EventLogEntryType.Error);
                    }

                  

                    // loop trough plans
                    foreach (PlanInfo udtPlan in arrPlans)
                    {
                        try
                        {
                            // check presence in origin zone
                            //objTemp = dbMgr.ExecuteScalar("SELECT MAX(timestamp) FROM events WHERE asset_id = @AssetID AND " +
                            //    "status_id = @ZoneExit AND remarks = @Origin AND timestamp BETWEEN @StartTime AND @EndTime",
                            //    new object[] { udtPos.AssetID, iZoneExit, udtPlan.Origin, udtPos.Timestamp.AddHours(-12), udtPos.Timestamp });

                            query = String.Format("SELECT MAX(timestamp) FROM events WHERE asset_id = @AssetID AND " +
                                                  "status_id = @ZoneExit AND remarks = @Origin AND timestamp BETWEEN @StartTime AND @EndTime");
                            using (MySqlCommand cmd = new MySqlCommand(query, conn))
                            {
                                conn.Open();
                                cmd.Parameters.AddWithValue("@AssetID", udtPos.AssetID);
                                cmd.Parameters.AddWithValue("@ZoneExit", iZoneExit);
                                cmd.Parameters.AddWithValue("@asset_id", udtPlan.Origin);
                                cmd.Parameters.AddWithValue("@StartTime", udtPos.Timestamp.AddHours(-12));
                                cmd.Parameters.AddWithValue("@EndTime", udtPos.Timestamp);
                                objTemp = cmd.ExecuteScalar();
                                conn.Close();

                            }

                            if ((objTemp != null) && (objTemp.ToString() != ""))
                            {
                                // initialize trip
                                TripInfo udtTrip = new TripInfo();
                                udtTrip.PlanID = udtPlan.PlanID;
                                udtTrip.AssetID = udtPos.AssetID;
                                udtTrip.OriginEnter = DateTime.MinValue;
                                udtTrip.OriginExit = Convert.ToDateTime(objTemp);
                                udtTrip.DestinationEnter = DateTime.MinValue;
                                udtTrip.DestinationExit = udtPos.Timestamp;
                                udtTrip.Mileage = udtPos.Mileage;

                                // check if trip has already been saved
                                //if (dbMgr.Exists("SELECT TOP(1) trip_id FROM view_trips WHERE asset_id = @AssetID " +
                                //    "AND origin_id = @OriginID AND origin_exit = @OriginExit",
                                //    new object[] { udtTrip.AssetID, udtPlan.OriginID, udtTrip.OriginExit }))
                                //    continue;



                                // get entry time to origin zone
                                //long lStartPos = 0;
                                //dbRdr = dbMgr.ExecuteReader("SELECT timestamp, pos_id FROM events WHERE asset_id = @AssetID " +
                                //    "AND status_id = @ZoneEnter AND remarks = @Origin AND timestamp BETWEEN @EntryTime AND @OriginExit",
                                //    new object[] { udtTrip.AssetID, iZoneEnter, udtPlan.Origin, udtTrip.OriginExit.AddHours(-12), 
                                //udtTrip.OriginExit });

                                //if ((dbRdr != null) && dbRdr.HasRows)
                                //{
                                //    // loop through events
                                //    while (dbRdr.Read())
                                //    {
                                //        // check timestamp
                                //        DateTime dtOriginEnter = dbRdr.ToDateTime("timestamp");
                                //        if (udtTrip.OriginEnter < dtOriginEnter && (udtTrip.OriginExit - dtOriginEnter).TotalMinutes > 2) //Alrey: Added checking if duration from origin is > 2 mins
                                //        {
                                //            // get entry time to origin zone
                                //            udtTrip.OriginEnter = dtOriginEnter;
                                //            lStartPos = dbRdr.ToInt64("pos_id");
                                //        }
                                //    }
                                //}
                                //if (dbRdr != null) dbRdr.Close();

                                // check start position
                                //if (lStartPos > 0)
                                //{
                                //    // get starting mileage
                                //    objTemp = dbMgr.ExecuteScalar("SELECT TOP(1) mileage FROM positions WHERE pos_id = @PosID",
                                //        new object[] { lStartPos });
                                //    if (objTemp != null) udtTrip.Mileage = (udtPos.Mileage - Convert.ToDouble(objTemp)) / 100;

                                //    // get entry time to destination zone
                                //    objTemp = dbMgr.ExecuteScalar("SELECT MAX(timestamp) FROM events WHERE asset_id = @AssetID AND " +
                                //        "status_id = @ZoneEnter AND remarks = @Destination AND timestamp BETWEEN @OriginExit AND @DestinationExit",
                                //        new object[] { udtTrip.AssetID, iZoneEnter, udtPlan.Destination, udtTrip.OriginExit, udtTrip.DestinationExit });
                                //    if ((objTemp != null) && (objTemp.ToString() != ""))
                                //    {
                                //        // save trip event
                                //        udtTrip.DestinationEnter = Convert.ToDateTime(objTemp);
                                //        //Create trip if vehicle stayed for more than 2 hrs.
                                //        if ((udtTrip.DestinationExit - udtTrip.DestinationEnter).TotalMinutes > 2 && (udtTrip.OriginExit - udtTrip.OriginEnter).TotalMinutes > 2)
                                //        {
                                //            objTemp = dbMgr.ExecuteScalar("INSERT INTO trips (plan_id, asset_id, origin_enter, origin_exit, " +
                                //                "destination_enter, destination_exit, mileage) OUTPUT INSERTED.trip_id VALUES (@PlanID, @AssetID, " +
                                //                "@OriginEnter, @OriginExit, @DestinationEnter, @DestinationExit, @Mileage)", new object[] { udtTrip.PlanID, 
                                //        udtTrip.AssetID, udtTrip.OriginEnter, udtTrip.OriginExit, udtTrip.DestinationEnter, 
                                //        udtTrip.DestinationExit, udtTrip.Mileage});
                                //            if (objTemp != null)
                                //            {
                                //                // add trip to list
                                //                udtTrip.TripID = Convert.ToInt32(objTemp);
                                //                arrTrips.Add(udtTrip);
                                //            }
                                //        }
                                //    }
                                //}
                            }
                        }
                        catch (Exception ex)
                        {
                            // log error
                            Logger.LogEvent(mProjName, "SaveTrips" + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "SaveTrips" + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
      
            return arrTrips;
        }

    }
}