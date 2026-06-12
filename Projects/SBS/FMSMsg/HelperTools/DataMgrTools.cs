using MySql.Data.MySqlClient;
using FMSWebApi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using HelperTools;


namespace FMSWebApi
{
    public class DataMgrTools
    {
        private static string mProjName = "SBS";

        public static AssetInfo BuildAsset(MySqlDataReader dbRdr)
        {
            AssetInfo udtAsset = new AssetInfo();
            //List<AssetInfo> arrAssets = new List<AssetInfo>();
            //AssetRepository assetRepo = new AssetRepository();
            
            try
            {
                // check assigned tag
                string strTag = dbRdr.ToString("tag");
                if (strTag == "") strTag = "--";

                // get curfew times
                DateTime dtStart = dbRdr.ToDateTime("curfew_start");
                DateTime dtEnd = dbRdr.ToDateTime("curfew_end");

                // adjust curfew times
                dtStart = Convert.ToDateTime(String.Format("{0:dd-MMM-yy} {1:HH:mm:ss}", DateTime.Now, dtStart));
                dtEnd = Convert.ToDateTime(String.Format("{0:dd-MMM-yy} {1:HH:mm:ss}", DateTime.Now, dtEnd));
                if (dtStart > dtEnd)
                    dtEnd = dtEnd.AddDays(1.0);

                // set asset parameters
                udtAsset.AssetID = dbRdr.ToInt32("asset_id");
                udtAsset.Name = dbRdr.ToString("name");
                udtAsset.CategoryID = dbRdr.ToInt32("category_id");
                udtAsset.Category = dbRdr.ToString("category_desc");
                udtAsset.Phone = dbRdr.ToString("phone");
                udtAsset.Email = dbRdr.ToString("email");
                udtAsset.Home = dbRdr.ToInt32("home");
                udtAsset.AlertZones = dbRdr.ToString("restricted");

                udtAsset.Category = dbRdr.ToString("category_desc");
                udtAsset.TagID = dbRdr.ToInt32("tag_id");
                udtAsset.Tag = strTag;
                udtAsset.Phone = dbRdr.ToString("tagphone");
                //udtAsset.IdleLimit = dbRdr.ToDouble("idle_limit");
                udtAsset.SpeedLimit = dbRdr.ToDouble("speed_limit");
                //udtAsset.BaseMileage = dbRdr.ToDouble("base_mileage");
                udtAsset.Mileage = dbRdr.ToDouble("mileage");
                //udtAsset.MileageDist = Math.Abs(dbRdr.ToDouble("mileage_dist"));
                //udtAsset.MileageDate = dbRdr.ToDateTime("mileage_date");
                udtAsset.CompanyID = dbRdr.ToInt32("company_id");
                udtAsset.Company = dbRdr.ToString("company");
                udtAsset.DriverID = dbRdr.ToInt32("driver_id");
                udtAsset.Driver = dbRdr.ToString("driver_name");
                //udtAsset.Email = dbRdr.ToString("email");
                //udtAsset.Notifications = dbRdr.ToString("notifications");
                udtAsset.InstallDate = dbRdr.ToDateTime("install_date");
                udtAsset.Port = dbRdr.ToInt32("port");
                udtAsset.TagType = dbRdr.ToString("tag_type");
                udtAsset.CurfewStart = dtStart;
                udtAsset.CurfewEnd = dtEnd;
                // udtAsset.Timestamp = dbRdr.ToDateTime("timestamp");
                udtAsset.Temperature = 0.0;
                udtAsset.Temperature2 = 0.0;
                udtAsset.RFID = "";

               

                try
                {
                    udtAsset.Temperature = dbRdr.ToDouble("temperature");
                    udtAsset.Temperature2 = dbRdr.ToDouble("temperature2");
                    udtAsset.RFID = dbRdr.ToString("rfid");
                }
                catch { }

                // get asset image
                //string strFill = "";
                //udtAsset.Image = assetRepo.GetImage(String.Format("drivers/{0}", udtAsset.DriverID), ref strFill);
                //udtAsset.ImageFill = strFill;

                // initialize asset status
                udtAsset.StatusID = dbRdr.ToInt32("status_id");
                udtAsset.Status = dbRdr.ToString("status_desc");
                udtAsset.StatusEx = dbRdr.ToString("status_ex");
                udtAsset.Remarks = "";
                udtAsset.AlertLevel = 0;
                udtAsset.Ignition = dbRdr.ToInt32("ignition");
                //udtAsset.Gps = (int)Enums.StatusColorInt.RED;
                //udtAsset.Gprs = (int)Enums.StatusColorInt.RED;
                udtAsset.Gps = 0;
                udtAsset.Gprs = 0;

                // initialize last event / position
                try
                {
                    udtAsset.LastEventID = dbRdr.ToInt64("last_event");
                    udtAsset.LastEnterID = dbRdr.ToInt64("last_enter");
                    udtAsset.LastExitID = dbRdr.ToInt64("last_exit");
                    udtAsset.LastPosID = dbRdr.ToInt64("last_pos");
                    udtAsset.LastFixID = dbRdr.ToInt64("last_fix");
                    udtAsset.LastGpsID = dbRdr.ToInt64("last_gps");
                    udtAsset.LastIdle = dbRdr.ToDateTime("last_idle");
                    udtAsset.LastMove = dbRdr.ToDateTime("last_move"); //GetAssetInfoTimeStamp(PosInfoType.Move, udtAsset.AssetID);
                }
                catch (Exception ex)
                {
                    Logger.LogToEvent(mProjName, "BuildAsset(initialize last event / position) ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                    //DatabaseMgr.LogError(ex.Message, "Initialize Event/Position");
                }

                //// initialize activity list
                //udtAsset.Activities = new List<ActivityInfo>();
                //udtAsset.Trips = new List<TripInfo>();
                ////udtAsset.TapInfo = GetZoneTapInfo(udtAsset.Tag);
                //udtAsset.RFID_Status = 0;
                //udtAsset.InstallDate = dbRdr.ToDateTime("install_date");
                //udtAsset.InstallRemarks = dbRdr.ToString("asset_remarks");


            }
            catch (Exception ex)
            {
                //// log error
                Logger.LogToEvent(mProjName, "BuildAsset ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);

            }
            return udtAsset;
        }

        public static EventInfo BuildEvent(MySqlDataReader dbRdr)
        {
            EventInfo udtEvent = new EventInfo();
            try
            {
                // set event parameters
                udtEvent.EventID = dbRdr.ToInt64("event_id");
                udtEvent.TagID = dbRdr.ToInt32("tag_id");
                udtEvent.Tag = dbRdr.ToString("tag");
                udtEvent.AssetID = dbRdr.ToInt32("asset_id");
                udtEvent.Asset = dbRdr.ToString("asset");
                udtEvent.StatusID = dbRdr.ToInt32("status_id");
                udtEvent.Event = dbRdr.ToString("status_desc");
                udtEvent.Remarks = dbRdr.ToString("remarks");
                //udtEvent.AlertLevel = dbRdr.ToInt32("alert_level_ex");
                udtEvent.AlertLevel = dbRdr.ToInt32("alert_level");
                udtEvent.Flag = dbRdr.ToInt32("flag");
                udtEvent.Timestamp = dbRdr.ToDateTime("timestamp");
                udtEvent.RxTime = dbRdr.ToDateTime("rx_time");
                udtEvent.AckUser = dbRdr.ToString("user_ack");
                udtEvent.AckTime = dbRdr.ToDateTime("ack_time");
                udtEvent.PosID = dbRdr.ToInt64("pos_id");
                udtEvent.Location = dbRdr.ToString("loc");
                udtEvent.CompanyID = dbRdr.ToInt32("company_id");
                udtEvent.ZoneID = dbRdr.ToInt32("zone_id");


            }
            catch (Exception ex)
            {
                // log error
                Logger.LogToEvent(mProjName + "-BuildEvent", ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtEvent;
        }

        public static PosInfo BuildPosition(MySqlDataReader dbRdr)
        {
            PosInfo newPos = new PosInfo();
            try
            {
                // initialize fix
                int iFix = dbRdr.ToInt32("fix");
                string strFix = iFix.ToString();

                // check fix
                switch (iFix)
                {
                    case -1:
                        {
                            // cell id fix
                            strFix = "Cell ID";
                            if (dbRdr.ToString("remarks") != "")
                            {
                                // format cell id
                                string strCellID = dbRdr.ToString("remarks");
                                if (strCellID.Contains(":")) strCellID = strCellID.Substring(strCellID.IndexOf(":") + 1);
                                strFix += String.Format(" ({0})", strCellID);
                            }
                        }
                        break;
                    case 0: strFix = "No Fix"; break;
                    case 1:
                    case 2: strFix = "GPS Fix"; break;
                    case 3:
                    case 4: strFix = "Last Known GPS"; break;
                }

                // set position parameters
                newPos.PosID = dbRdr.ToInt64("pos_id");
                newPos.RxTime = dbRdr.ToDateTime("rx_time");
                newPos.Timestamp = dbRdr.ToDateTime("timestamp");
                newPos.TagID = dbRdr.ToInt32("tag_id");
                newPos.Tag = dbRdr.ToString("tag");
                newPos.AssetID = dbRdr.ToInt32("asset_id");
                newPos.Asset = dbRdr.ToString("asset");
                newPos.FixID = iFix;
                newPos.Fix = strFix;
                newPos.Satellites = dbRdr.ToInt32("satellites");
                newPos.PosX = dbRdr.ToDouble("pos_x");
                newPos.PosY = dbRdr.ToDouble("pos_y");
                newPos.PosZ = dbRdr.ToDouble("pos_z");
                newPos.Speed = Math.Round(dbRdr.ToDouble("speed"), 1);
                newPos.Course = Math.Round(dbRdr.ToDouble("course"), 1);
                newPos.HDOP = Math.Round(dbRdr.ToDouble("hdop"), 1);
                newPos.Mileage = Math.Round(dbRdr.ToDouble("mileage") / 100, 2);
                newPos.Driver = (dbRdr.ToString("driver") != "" ? dbRdr.ToString("driver") : dbRdr.ToString("driver_default"));
                newPos.CompanyID = dbRdr.ToInt32("company_id");
                newPos.Headway = dbRdr.ToString("headway");
                newPos.Event = dbRdr.ToString("event");
                newPos.EventValue = dbRdr.ToString("event_value");
                try
                {
                    // get other position parameters
                    newPos.Battery = dbRdr.ToDouble("battery");
                    newPos.Fuel = dbRdr.ToDouble("fuel");
                    newPos.ZoneID = dbRdr.ToInt32("zone_id");
                    newPos.Zone = dbRdr.ToString("zone_name");
                    newPos.Location = dbRdr.ToString("loc");
                    newPos.Location = newPos.Location;

                    if (((newPos.Location) == "" || (newPos.Location == "Singapore")) && (newPos.FixID > 0))
                        newPos.Location = "No Address from Google Maps";

                    if (((newPos.Location) == "ZERO_RESULTS") && (newPos.FixID > 0))
                        newPos.Location = "No Address from Google Maps";
                    if (((newPos.Location) == "" || (newPos.Location == "Singapore")) && (newPos.FixID == 0))
                        newPos.Location = "No GPS Signal Detected";

                    // get 2 status
                    switch (dbRdr.ToInt32("engine"))
                    {
                        case 0: newPos.Engine = "STOP";
                            break;
                        case 1: newPos.Engine = "IDLE";
                            break;
                        case 2: newPos.Engine = "MOVE";
                            break;
                    }

                    //Status:Move; Speed < 6kph
                    newPos.Ignition = dbRdr.ToInt32("ignition");
                    if (newPos.Ignition == 0)
                    {
                        newPos.Speed = 0;
                    }
                    else
                    {
                        if (newPos.Engine == "IDLE" && newPos.Speed > 0)
                            newPos.Speed = 0;
                        if (newPos.Engine == "MOVE" && newPos.Speed < 6)
                        {
                            newPos.Speed = 0;
                            newPos.Engine = "IDLE";
                        }
                    }

                }
                catch (Exception ex)
                {
                    Logger.LogToEvent("BuildPos(other position parameters): " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                }
            }
            catch (Exception ex)
            {

                // log error
                Logger.LogToEvent("BuildPos: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);

            }
            return newPos;
        }

        public static SafetyEventsInfo BuildSafetyEvents(MySqlDataReader dbRdr)
        {
            SafetyEventsInfo udtSafety = new SafetyEventsInfo();
            try
            {
                // set status parameters
                udtSafety.SafetyEventsID = dbRdr.ToInt64("safetyevents_id");
                udtSafety.AssetID = dbRdr.ToInt32("asset_id");
                udtSafety.Driver = dbRdr.ToString("driver");
                udtSafety.Date = dbRdr.ToDateTimeMin("date");
                udtSafety.StartTime = dbRdr.ToDateTimeMin("start_time");
                udtSafety.EndTime = dbRdr.ToDateTimeMin("end_time");           
                udtSafety.FCWCount = dbRdr.ToInt32("fcw_count");
                udtSafety.PCWCount = dbRdr.ToInt32("pcw_count");
                udtSafety.HMWCount = dbRdr.ToInt32("hmw_count");
                udtSafety.LDWCount = dbRdr.ToInt32("ldw_count");
                udtSafety.Mileage = dbRdr.ToDouble("mileage");
                udtSafety.DriverID = dbRdr.ToInt32("driver_id");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogToEvent(mProjName + "-BuildSafetyEvents", ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtSafety;
        }

        public static SummaryInfo BuildSummary(MySqlDataReader dbRdr)
        {
            SummaryInfo udtSummary = new SummaryInfo();
            try
            {
                // set status parameters
                udtSummary.SummaryID = dbRdr.ToInt64("summary_id");
                udtSummary.AssetID = dbRdr.ToInt32("asset_id");
                udtSummary.Driver = dbRdr.ToString("driver");
                udtSummary.Date = dbRdr.ToDateTimeMin("date");
                udtSummary.StartTime = dbRdr.ToDateTimeMin("start_time");
                udtSummary.EndTime = dbRdr.ToDateTimeMin("end_time");
                udtSummary.FCWCount = dbRdr.ToInt32("fcw_count");
                udtSummary.PCWCount = dbRdr.ToInt32("pcw_count");
                udtSummary.HMWCount = dbRdr.ToInt32("hmw_count");
                udtSummary.LDWCount = dbRdr.ToInt32("ldw_count");
                udtSummary.Mileage = dbRdr.ToDouble("mileage");
                udtSummary.DriverID = dbRdr.ToInt32("driver_id");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogToEvent(mProjName + "-BuildSummary", ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtSummary;
        }

        public static DriverInfo BuildDriver(MySqlDataReader dbRdr)
        {
            DriverInfo udtDriver = new DriverInfo();
            try
            {
                // set company parameters
                udtDriver.DriverID = dbRdr.ToInt32("driver_id");
                udtDriver.Name = dbRdr.ToString("driver_name");
                udtDriver.AssetID = dbRdr.ToInt32("asset_id");
                udtDriver.Asset = dbRdr.ToString("asset");
                udtDriver.Address = dbRdr.ToString("address");
                udtDriver.Phone = dbRdr.ToString("phone");
                //udtDriver.DateOfBirth = dbRdr.ToDateTime("birthdate");
                if (dbRdr["birthdate"] != DBNull.Value)
                    udtDriver.DateOfBirth = dbRdr.ToDateTime("birthdate");

                udtDriver.RelativePhone = dbRdr.ToString("relative_phone");
                udtDriver.RelativeName = dbRdr.ToString("relative_name");
                udtDriver.RFIDID = dbRdr.ToInt32("rfid_id");
                udtDriver.RFID = dbRdr.ToString("rfid");
                udtDriver.ResellerID = dbRdr.ToInt32("reseller_id");
                udtDriver.CompanyID = dbRdr.ToInt32("company_id");
                udtDriver.Company = dbRdr.ToString("company");
                udtDriver.BloodType = dbRdr.ToInt32("bloodtype");
                udtDriver.LastTap = dbRdr.ToDateTime("last_tap");
                udtDriver.Remarks = dbRdr.ToString("remarks");
                udtDriver.CreatedDate = dbRdr.ToDateTime("created_date");
                udtDriver.ModifiedDate = dbRdr.ToDateTime("modified_date");
                udtDriver.CreatedBy = dbRdr.ToInt32("created_by");
                udtDriver.ModifiedBy = dbRdr.ToInt32("modified_by");
                udtDriver.CreatedByName = dbRdr.ToString("created_byName");
                udtDriver.ModifiedByName = dbRdr.ToString("modified_byName");
                udtDriver.Email = dbRdr.ToString("email");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogToEvent("BuildDriver: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtDriver;
        }

        public static UserInfo BuildUser(MySqlDataReader dbRdr)
        {
            UserInfo udtUser = new UserInfo();

            try
            {
                // set users parameters
                udtUser.UserID = dbRdr.ToInt32("user_id");
                udtUser.Name = dbRdr.ToString("name");
                udtUser.User = dbRdr.ToString("user_name");
                udtUser.Password = dbRdr.ToString("password");
                udtUser.RoleID = dbRdr.ToInt32("role_id");
                udtUser.Phone = dbRdr.ToString("phone");
                udtUser.Email = dbRdr.ToString("email");
                udtUser.CompanyID = dbRdr.ToInt32("company_id");
                udtUser.Assets = dbRdr.ToString("assets");
                udtUser.Notifications = dbRdr.ToString("notifications");
                udtUser.Reports = dbRdr.ToString("reports");
                udtUser.LanguageID = dbRdr.ToInt32("language_id");
                udtUser.Company = dbRdr.ToString("company");
                udtUser.Language = dbRdr.ToString("language");
                udtUser.Culture = dbRdr.ToString("culture");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogToEvent("BuildUser: ", ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtUser;
        }

    }
}