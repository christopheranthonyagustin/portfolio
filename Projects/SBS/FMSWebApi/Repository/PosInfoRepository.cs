using FMSWebApi.Models;
using FMSWebApi.Properties;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Http;

namespace FMSWebApi.Repository
{
    public class PosInfoRepository : IPosRepository
    {
        private string mConnStr = Settings.Default.DB;
        private string mProjName = "SBS";
        public IEnumerable<PosInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<PosInfo> arrPos = new List<PosInfo>();

            try
            {
                conn.ConnectionString = mConnStr;
                conn.Open();

                cmd.CommandText = "view_positions";
                cmd.Connection = conn;
                cmd.CommandType = CommandType.TableDirect;
                MySqlDataReader reader = cmd.ExecuteReader();

                //Console.WriteLine(String.Format("Total Data: {0}", dbRdr.FieldCount));

                if ((reader != null) && (reader.HasRows))
                {
                    while (reader.Read())
                    {
                        PosInfo currPos = DataMgrTools.BuildPosition(reader);
                        arrPos.Add(currPos);
                    }
                }
                conn.Close();
            }
            catch (MySqlException ex)
            {
                Logger.LogEvent(mProjName, "GetAll: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }

            if (conn != null)
                conn.Close();

            return arrPos.ToArray();
        }

        public IEnumerable<PosInfo> GetAllEx()
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

            double tempCounter = 0;
            tempCounter = Math.Round((value.RxTime - value.Timestamp).TotalDays, 0);

            //Logger.LogEvent("tempCounter: " + tempCounter, System.Diagnostics.EventLogEntryType.Information);

            DateTime tempStart = value.Timestamp;
            DateTime tempEndDate = DateTime.MaxValue;

            for (int a = 0; a <= tempCounter; a++)
            {
                string query = "SELECT * FROM view_positions WHERE timestamp between @StartTS and @EndTS";

                if (value.Speed > 0) query += " and speed > @Speed";

                if (!string.IsNullOrEmpty(value.Engine)) query += " and engine = @Engine";

                if (value.CompanyID > 0) query += " and company_id = @CompanyID";
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
                            //cmd.Parameters.AddWithValue("@StartTS", value.Timestamp);
                            //cmd.Parameters.AddWithValue("@EndTS", value.Timestamp.AddDays(a));         
                            //Logger.LogEvent("Value.TImestamp: " + value.Timestamp.AddDays(addDay), System.Diagnostics.EventLogEntryType.Information);
                            string strEnd = string.Format("{0:dd-MMM-yyyy} {1:HH:mm:ss}", value.Timestamp.AddDays(a), value.RxTime);
                            Logger.LogEvent("tempEndDate: " + strEnd, System.Diagnostics.EventLogEntryType.Information);
                            tempEndDate = Convert.ToDateTime(strEnd);
                            cmd.Parameters.AddWithValue("@StartTS", tempStart);
                            cmd.Parameters.AddWithValue("@EndTS", tempEndDate);

                            Logger.LogEvent("query: " + query, System.Diagnostics.EventLogEntryType.Information);

                            if (value.Speed > 0) cmd.Parameters.AddWithValue("@Speed", value.Speed);
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
                        Logger.LogEvent("Get Pos: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                    }
                }
          
                string strStart = string.Format("{0:dd-MMM-yyyy} {1:HH:mm:ss}", tempEndDate.AddDays(1), value.Timestamp);
                tempStart = Convert.ToDateTime(strStart);
                Logger.LogEvent("tempStart: " + strStart, System.Diagnostics.EventLogEntryType.Information);
                
            }

            return arrPos.ToArray();
        }

        public IEnumerable<PosInfo> GetEx([FromUri]PosInfo value)
        {           
            List<PosInfo> arrPos = new List<PosInfo>();
            PosInfo currPos = new PosInfo();
            object objTemp = new object();

                string query = "SELECT * FROM view_positions WHERE timestamp between @StartTS and @EndTS";

                if (value.CompanyID > 0) query += " and company_id = @CompanyID";

                query += " and (asset_id IN (" + value.Asset + "))";

                //Logger.LogEvent("Check Query: " + query, System.Diagnostics.EventLogEntryType.Warning);

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
                            if (value.CompanyID > 0) cmd.Parameters.AddWithValue("@CompanyID", value.CompanyID);

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
                        Logger.LogEvent("Get Pos All: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                    }
                }

            return arrPos.ToArray();
        }

        public IEnumerable<PosInfo> GetTriggerData([FromUri]PosInfo value)
        {
            List<PosInfo> arrPos = new List<PosInfo>();
            PosInfo currPos = new PosInfo();
            object objTemp = new object();

            string query = "SELECT * FROM view_positions WHERE timestamp between @StartTS and @EndTS";

            if (value.CompanyID > 0) query += " and company_id = @CompanyID";

            query += " and (drv_no IN (" + value.Drv + "))";

            query += " and event != 77"; 
            query += " and event != 84";
            query += " and event != 83"; //Speed
            query += " and event != 68"; //PDZ
            //Logger.LogEvent("Check Query: " + query, System.Diagnostics.EventLogEntryType.Warning);

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
                        if (value.CompanyID > 0) cmd.Parameters.AddWithValue("@CompanyID", value.CompanyID);

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
                    Logger.LogEvent("Get Trigger Data: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                }
            }

            return arrPos.ToArray();
        }

        public PosInfo Add(PosInfo item)
        {
            AssetInfo currAsset = new AssetInfo();

            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {

                    #region GET THE LINKED ASSET
                    //AssetInfo currAsset = new AssetInfo();
                    try
                    {
                        AssetRepository assetRepo = new AssetRepository();
                        currAsset = assetRepo.GetByTagName(item.Tag);                 
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


                    // get company zones
                    //List<ZoneInfo> arrZones = GetAssetZones(item.AssetID, currAsset.CompanyID);

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


                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
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
                        cmd.Parameters.AddWithValue("@Driver", item.Driver);
                        cmd.Parameters.AddWithValue("@Headway", item.Headway);
                        cmd.Parameters.AddWithValue("@Event", item.Event);
                        cmd.Parameters.AddWithValue("@EventValue", item.EventValue);
                        cmd.ExecuteNonQuery();

                        long id = cmd.LastInsertedId;
                        item.PosID = id;

                        cmd.CommandText = "UPDATE assets SET last_pos = @LastPosID, last_fix = @LastFixID, last_gps = @LastGpsID WHERE asset_id = @AssetID2";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@LastPosID", item.PosID);
                        cmd.Parameters.AddWithValue("@LastFixID", item.PosID);
                        cmd.Parameters.AddWithValue("@LastGpsID", item.PosID);
                        cmd.Parameters.AddWithValue("@AssetID2", currAsset.AssetID);
                        cmd.ExecuteNonQuery();
                        //Logger.LogEvent(mProjName, "Last PosID: " + item.PosID + "AssetID: " + currAsset.AssetID, System.Diagnostics.EventLogEntryType.Information);

                        conn.Close();
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
        /// 
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
                Logger.LogEvent("IsPointInLoc: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
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
                    conn.Close();
                }
            }
            return currPos;
        }


    }
}