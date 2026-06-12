using MySql.Data.MySqlClient;
using FMSWebApi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using FMSWebApi.Repository;

namespace FMSWebApi
{
    public class DataMgrTools
    {
        private static string mProjName = "SP";

        /// <summary>
        /// builds asset info from database record
        /// </summary>
        /// <param name="dbRdr"></param>
        /// <returns></returns>
        public static AssetInfo BuildAsset(MySqlDataReader dbRdr)
        {
            AssetInfo udtAsset = new AssetInfo();
            //List<AssetInfo> arrAssets = new List<AssetInfo>();
            AssetRepository assetRepo = new AssetRepository();
            
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

                //udtAsset.Category = dbRdr.ToString("category_desc");
                udtAsset.TagID = dbRdr.ToInt32("tag_id");
                udtAsset.Tag = strTag;
                udtAsset.Phone = dbRdr.ToString("tagphone");
                udtAsset.IdleLimit = dbRdr.ToDouble("idle_limit");
                udtAsset.SpeedLimit = dbRdr.ToDouble("speed_limit");
                //udtAsset.BaseMileage = dbRdr.ToDouble("base_mileage");
                udtAsset.Mileage = dbRdr.ToDouble("mileage");
                //udtAsset.MileageDist = Math.Abs(dbRdr.ToDouble("mileage_dist"));
                //udtAsset.MileageDate = dbRdr.ToDateTime("mileage_date");
                udtAsset.CompanyID = dbRdr.ToInt32("company_id");
                udtAsset.Company = dbRdr.ToString("company");
                udtAsset.DriverID = dbRdr.ToInt32("driver_id");
                udtAsset.DriverName = dbRdr.ToString("driver_name");
                //udtAsset.Email = dbRdr.ToString("email");
                //udtAsset.Notifications = dbRdr.ToString("notifications");
                udtAsset.InstallDate = dbRdr.ToDateTime("install_date");

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
                string strFill = "";
                udtAsset.Image = assetRepo.GetImage(String.Format("drivers/{0}", udtAsset.DriverID), ref strFill);
                udtAsset.ImageFill = strFill;

                // initialize asset status
                udtAsset.StatusID = dbRdr.ToInt32("status_id");
                udtAsset.Status = dbRdr.ToString("status_desc");
                udtAsset.StatusEx = dbRdr.ToString("status_ex");
                udtAsset.Remarks = "";
                udtAsset.AlertLevel = 0;
                udtAsset.Ignition = dbRdr.ToInt32("ignition");
                udtAsset.Gps = (int)Enums.GPSStatusColorInt.RED;
                udtAsset.Gprs = (int)Enums.StatusColorInt.RED;
                udtAsset.Engine = "STOP";

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
                    Logger.LogEvent(mProjName, "BuildAsset(initialize last event / position) ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                    //DatabaseMgr.LogError(ex.Message, "Initialize Event/Position");
                }

                //// initialize activity list
                //udtAsset.Activities = new List<ActivityInfo>();
                //udtAsset.Trips = new List<TripInfo>();
                ////udtAsset.TapInfo = GetZoneTapInfo(udtAsset.Tag);
                //udtAsset.RFID_Status = 0;
                //udtAsset.InstallDate = dbRdr.ToDateTime("install_date");
                udtAsset.Flag = dbRdr.ToString("asset_remarks");
                udtAsset.Key = dbRdr.ToInt64("activation_key");

            }
            catch (Exception ex)
            {
                //// log error
                Logger.LogEvent(mProjName, "BuildAsset ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);

            }
            return udtAsset;
        }

        /// <summary>
        /// builds zone info from database record
        /// </summary>
        /// <param name="dbRdr"></param>
        /// <returns></returns>
        public static ZoneInfo BuildZone(MySqlDataReader dbRdr)
        {
            ZoneInfo udtZone = new ZoneInfo();
            try
            {
                // set zone parameters
                udtZone.ZoneID = dbRdr.ToInt32("zone_id");
                udtZone.Name = dbRdr.ToString("name");
                udtZone.Type = dbRdr.ToString("type");
                udtZone.TypeID = dbRdr.ToInt32("type_id");
                udtZone.Perimeter = dbRdr.ToString("perimeter");
                udtZone.CellIds = dbRdr.ToString("cell_ids");
                udtZone.Company = dbRdr.ToString("company");
                udtZone.CompanyID = dbRdr.ToInt32("company_id");
                udtZone.ResellerID = dbRdr.ToInt32("reseller_id");
                udtZone.Location = dbRdr.ToString("loc");
                udtZone.Color = dbRdr.ToString("color");

                //[Dan:30Apr14] Include date/time and id created/modified
                try
                {
                    udtZone.CreatedDate = dbRdr.ToDateTime("created_date");
                    udtZone.LastModified = dbRdr.ToDateTime("modified_date");
                    udtZone.Created_UserID = dbRdr.ToInt32("created_by");
                    udtZone.Modified_UserID = dbRdr.ToInt32("modified_by");
                    udtZone.Modified_User = dbRdr.ToString("modified_byName");
                    udtZone.Created_User = dbRdr.ToString("created_byName");

                }
                catch (Exception ex)
                {
                    Logger.LogEvent(mProjName, ex.Message, System.Diagnostics.EventLogEntryType.Error);
                }
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildZone ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtZone;
        }

        /// <summary>
        /// builds company info from database record
        /// </summary>
        /// <param name="dbRdr"></param>
        /// <returns></returns>
        public static CompanyInfo BuildCompany(MySqlDataReader dbRdr)
        {
            CompanyInfo udtCompany = new CompanyInfo();
            try
            {
                // set company parameters
                udtCompany.CompanyID = dbRdr.ToInt32("company_id");
                udtCompany.Name = dbRdr.ToString("name");
                udtCompany.Address = dbRdr.ToString("address");
                udtCompany.Email = dbRdr.ToString("email");
                udtCompany.Phone = dbRdr.ToString("phone");
                udtCompany.Reports = dbRdr.ToString("reports");
                udtCompany.Categories = dbRdr.ToString("categories");
                udtCompany.Flag = (dbRdr.ToInt32("flag") > 0 ? Enums.Status.Enabled : Enums.Status.Disabled);
                udtCompany.ResellerID = dbRdr.ToInt32("reseller_id");
                udtCompany.Reseller = dbRdr.ToString("reseller");
                //udtCompany.UserLimit = dbRdr.ToInt32("user_limit");
                //udtCompany.ZoneLimit = dbRdr.ToInt32("zone_limit");
                //udtCompany.AssetLimit = dbRdr.ToInt32("asset_limit");
                //udtCompany.SmsLimit = dbRdr.ToInt32("sms_limit");                                        
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildCompany ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtCompany;
        }
        
        /// <summary>
        /// builds company info from database record
        /// </summary>
        /// <param name="dbRdr"></param>
        /// <returns></returns>
        public static ResellerInfo BuildReseller(MySqlDataReader dbRdr)
        {
            ResellerInfo udtReseller = new ResellerInfo();
            try
            {
                // set company parameters
                udtReseller.ResellerID = dbRdr.ToInt32("reseller_id");
                udtReseller.Name = dbRdr.ToString("name");
                udtReseller.Flag = (dbRdr.ToInt32("flag") > 0 ? Enums.Status.Enabled : Enums.Status.Disabled);
                udtReseller.Address = dbRdr.ToString("address");
                udtReseller.Email = dbRdr.ToString("email");
                udtReseller.Phone = dbRdr.ToString("phone");
                                    
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildReseller ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtReseller;
        }

        /// <summary>
        /// builds driver info from database record
        /// </summary>
        /// <param name="dbRdr"></param>
        /// <returns></returns>
        public static DriverInfo BuildDriver(MySqlDataReader dbRdr)
        {
            DriverInfo udtDriver = new DriverInfo();
            DriverRepository driverRepo = new DriverRepository();
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
                udtDriver.Technician = dbRdr.ToString("technician");
                udtDriver.CreatedDate = dbRdr.ToDateTime("created_date");
                udtDriver.ModifiedDate = dbRdr.ToDateTime("modified_date");
                udtDriver.CreatedBy = dbRdr.ToInt32("created_by");
                udtDriver.ModifiedBy = dbRdr.ToInt32("modified_by");
                udtDriver.CreatedByName = dbRdr.ToString("created_byName");
                udtDriver.ModifiedByName = dbRdr.ToString("modified_byName");
                udtDriver.Email = dbRdr.ToString("email");
                udtDriver.Password = dbRdr.ToString("password");

            }
            catch (Exception ex)
            {
                // log error
                //Logger.LogEvent(mProjName, "BuildDriver ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtDriver;
        }

        /// <summary>
        /// builds user info from database record
        /// </summary>
        /// <param name="dbRdr"></param>
        /// <returns></returns>
        /// 
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
                udtUser.LoginRetry = (dbRdr.ToInt32("login_retry") > 0 ? "Active" : "Locked");
                udtUser.Reports = dbRdr.ToString("reports");
                udtUser.LanguageID = dbRdr.ToInt32("language_id");
                udtUser.ApiKey = dbRdr.ToString("api_key");
                udtUser.ResellerID = dbRdr.ToInt32("reseller_id");
                udtUser.ResellerDesc = dbRdr.ToString("reseller");
                udtUser.RoleDesc = dbRdr.ToString("role_desc");
                udtUser.Company = dbRdr.ToString("company");
                udtUser.Language = dbRdr.ToString("language");
                udtUser.Culture = dbRdr.ToString("culture");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildUser ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtUser;
        }

        /// <summary>
        /// builds device info from database record
        /// </summary>
        /// <param name="dbRdr"></param>
        /// <returns></returns>
        public static DeviceInfo BuildDevice(MySqlDataReader dbRdr)
        {
            DeviceInfo udtDevice = new DeviceInfo();
            try
            {

                // set users parameters
                udtDevice.DeviceID = dbRdr.ToInt32("tag_id");
                udtDevice.Name = dbRdr.ToString("name");
                udtDevice.Imei = dbRdr.ToString("imei");
                udtDevice.Phone = dbRdr.ToString("phone");
                udtDevice.Interval = dbRdr.ToInt32("interval");
                udtDevice.Port = dbRdr.ToInt32("port");
                udtDevice.APN = dbRdr.ToString("APN");
                udtDevice.InstallDate = dbRdr.ToDateTime("install_date");
                udtDevice.ModifiedTimestamp = dbRdr.ToDateTime("modified_timestamp");
                udtDevice.Remarks = dbRdr.ToString("remarks");
                udtDevice.isSentOut = dbRdr.ToInt32("isSentOut");
                udtDevice.Key = dbRdr.ToInt64("activation_key");
                udtDevice.AssetID = dbRdr.ToInt32("asset_id");
                udtDevice.Asset = dbRdr.ToString("asset");
                udtDevice.CompanyID = dbRdr.ToInt32("company_id");
                udtDevice.Company = dbRdr.ToString("company");
                udtDevice.ResellerID = dbRdr.ToInt32("reseller_id");
                //udtDevice.Reseller = dbRdr.ToString("reseller");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildDevice ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtDevice;
        }

        /// <summary>
        /// builds category info from database record
        /// </summary>
        /// <param name="dbRdr"></param>
        /// <returns></returns>
        public static CategoryInfo BuildCategory(MySqlDataReader dbRdr)
        {
            CategoryInfo udtCategory = new CategoryInfo();
            try
            {
                // set users parameters
                udtCategory.CategoryID = dbRdr.ToInt32("category_id");
                udtCategory.CategoryDesc = dbRdr.ToString("category_desc");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildCategory ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtCategory;
        }
        public static PestInfo BuildPest(MySqlDataReader dbRdr)
        {
            PestInfo udtPest = new PestInfo();
            try
            {
                // set users parameters
                udtPest.PestID = dbRdr.ToInt32("pest_id");
                udtPest.PestDesc = dbRdr.ToString("pest_desc");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildPest ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtPest;
        }
        public static TreatmentInfo BuildTreatment(MySqlDataReader dbRdr)
        {
            TreatmentInfo udtTreatment = new TreatmentInfo();
            try
            {
                // set users parameters
                udtTreatment.TreatmentID = dbRdr.ToInt32("treatment_id");
                udtTreatment.TreatmentDesc = dbRdr.ToString("treatment_desc");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildTreatment ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtTreatment;
        }
        public static PestTreatmentInfo BuildPestTreatment(MySqlDataReader dbRdr)
        {
            PestTreatmentInfo udtPest = new PestTreatmentInfo();
            try
            {
                // set users parameters
                udtPest.PestTreatmentID = dbRdr.ToInt64("pest_treatment_id");
                udtPest.JobID = dbRdr.ToInt64("job_id");
                udtPest.PestDesc = dbRdr.ToString("pest_desc");
                udtPest.TreatmentDesc = dbRdr.ToString("treatment_desc");
                udtPest.ItemNo = dbRdr.ToInt32("item_no");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildPestTreatment ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtPest;
        }
        public static MainPestTreatmentInfo BuildMainPestTreatment(MySqlDataReader dbRdr)
        {
            MainPestTreatmentInfo udtPest = new MainPestTreatmentInfo();
            try
            {
                // set users parameters
                udtPest.MainPestTreatmentID = dbRdr.ToInt64("main_pest_treatment_id");
                udtPest.MaintenanceJobID = dbRdr.ToInt64("maintenancejob_id");
                udtPest.PestDesc = dbRdr.ToString("pest_desc");
                udtPest.TreatmentDesc = dbRdr.ToString("treatment_desc");
                udtPest.ItemNo = dbRdr.ToInt32("item_no");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildPestTreatment ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtPest;
        }
        public static FindingsInfo BuildFindings(MySqlDataReader dbRdr)
        {
            FindingsInfo udtPest = new FindingsInfo();
            try
            {
                // set users parameters
                udtPest.FindingsID = dbRdr.ToInt64("findings_id");
                udtPest.JobID = dbRdr.ToInt64("job_id");
                udtPest.PestDesc = dbRdr.ToString("pest_desc");
                udtPest.AocDesc = dbRdr.ToString("aoc_desc");
                udtPest.Findings = dbRdr.ToString("findings");
                udtPest.ItemNo = dbRdr.ToInt32("item_no");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildFindings ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtPest;
        }
        public static FindingsMaintenanceInfo BuildFindingsMaintenance(MySqlDataReader dbRdr)
        {
            FindingsMaintenanceInfo udtPest = new FindingsMaintenanceInfo();
            try
            {
                // set users parameters
                udtPest.FindingsMaintenanceID = dbRdr.ToInt64("findingsmaintenance_id");
                udtPest.MaintenanceJobID = dbRdr.ToInt64("maintenancejob_id");
                udtPest.PestDesc = dbRdr.ToString("pest_desc");
                udtPest.AocDesc = dbRdr.ToString("aoc_desc");
                udtPest.Findings = dbRdr.ToString("findings");
                udtPest.ItemNo = dbRdr.ToInt32("item_no");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildFindingsMaintenance ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtPest;
        }
        public static AocInfo BuildAoc(MySqlDataReader dbRdr)
        {
            AocInfo udtAoc = new AocInfo();
            try
            {
                // set users parameters
                udtAoc.AocID = dbRdr.ToInt32("aoc_id");
                udtAoc.AocDesc = dbRdr.ToString("aoc_desc");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildAoc ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtAoc;
        }

        public static RecommendationsInfo BuildRecommendations(MySqlDataReader dbRdr)
        {
            RecommendationsInfo udtRecommendation = new RecommendationsInfo();
            try
            {
                // set users parameters
                udtRecommendation.RecommendationsID = dbRdr.ToInt32("recommendations_id");
                udtRecommendation.Recommendation = dbRdr.ToString("recommendation");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildRecommendations ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtRecommendation;
        }
        public static AcInfo BuildAc(MySqlDataReader dbRdr)
        {
            AcInfo udtAc = new AcInfo();
            try
            {
                // set users parameters
                udtAc.AcID = dbRdr.ToInt32("ac_id");
                udtAc.PostalDistrict = dbRdr.ToInt32("postal_district");
                udtAc.PostalSector = dbRdr.ToInt32("postal_sector");
                udtAc.GeneralLocation = dbRdr.ToString("general_location");
                udtAc.Groups = dbRdr.ToString("groups_ac");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildAc ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtAc;
        }
        public static AcMyInfo BuildAcMy(MySqlDataReader dbRdr)
        {
            AcMyInfo udtAc = new AcMyInfo();
            try
            {
                // set users parameters
                udtAc.RangeID = dbRdr.ToInt32("range_id");
                udtAc.Groups = dbRdr.ToString("groups_ac");
                udtAc.LowerBound = dbRdr.ToInt32("lower_bound");
                udtAc.UpperBound = dbRdr.ToInt32("upper_bound");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildAc Malaysia ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtAc;
        }
        public static EmailFlagInfo BuildEmailFlag(MySqlDataReader dbRdr)
        {
            EmailFlagInfo udtEmailFlag = new EmailFlagInfo();
            try
            {
                // set users parameters
                udtEmailFlag.EmailFlagID = dbRdr.ToInt32("flag");
                udtEmailFlag.FlagValue = dbRdr.ToString("flag_value");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildEmailFlag ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtEmailFlag;
        }
        /// <summary>
        /// builds zone type info from database record
        /// </summary>
        /// <param name="dbRdr"></param>
        /// <returns></returns>
        public static ZoneTypeInfo BuildZoneType(MySqlDataReader dbRdr)
        {
            ZoneTypeInfo udtZoneType = new ZoneTypeInfo();
            try
            {

                // set users parameters
                udtZoneType.ZoneTypeID = dbRdr.ToInt32("type_id");
                udtZoneType.Name = dbRdr.ToString("name");
                udtZoneType.Color = dbRdr.ToString("color");


                // get user image
                //string strFill = "";
                //udtUser.Image = GetImage(String.Format("users/{0}", udtUser.UserID), strImage, ref strFill);
                //udtUser.ImageFill = strFill;
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildZoneType ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtZoneType;
        }

        /// <summary>
        /// builds report info from database record
        /// </summary>
        /// <param name="dbRdr"></param>
        /// <returns></returns>
        public static ReportInfo BuildReport(MySqlDataReader dbRdr)
        {
            ReportInfo udtReport = new ReportInfo();
            try
            {

                // set users parameters
                udtReport.ReportID = dbRdr.ToInt32("report_id");
                udtReport.Name = dbRdr.ToString("name");



                // get user image
                //string strFill = "";
                //udtUser.Image = GetImage(String.Format("users/{0}", udtUser.UserID), strImage, ref strFill);
                //udtUser.ImageFill = strFill;
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildReport ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtReport;
        }

        /// <summary>
        /// builds role info from database record
        /// </summary>
        /// <param name="dbRdr"></param>
        /// <returns></returns>
        public static RoleInfo BuildRole(MySqlDataReader dbRdr)
        {
            RoleInfo udtRole = new RoleInfo();
            try
            {

                // set users parameters
                udtRole.RoleID = dbRdr.ToInt32("role_id");
                udtRole.RoleDesc = dbRdr.ToString("role_desc");

                // get user image
                //string strFill = "";
                //udtUser.Image = GetImage(String.Format("users/{0}", udtUser.UserID), strImage, ref strFill);
                //udtUser.ImageFill = strFill;
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildRole ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtRole;
        }

        public static LanguageInfo BuildLanguage(MySqlDataReader dbRdr)
        {
            LanguageInfo udtLanguage = new LanguageInfo();
            try
            {
                // set users parameters
                udtLanguage.LanguageID = dbRdr.ToInt32("language_id");
                udtLanguage.Name = dbRdr.ToString("name");
                udtLanguage.Culture = dbRdr.ToString("culture");

                // get user image
                //string strFill = "";
                //udtUser.Image = GetImage(String.Format("users/{0}", udtUser.UserID), strImage, ref strFill);
                //udtUser.ImageFill = strFill;
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildLanguage ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtLanguage;
        }

        public static PosInfo BuildPosition(MySqlDataReader dbRdr)
        {
            PosInfo newPos = new PosInfo();
            try
            {
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

                    newPos.FixID = iFix;
                    newPos.Fix = strFix;
                }
                catch (Exception ex)
                {
                    //Logger.LogEvent(mProjName, "BuildPosition get fix ID Error: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                }

                try
                {
                    // set position parameters
                    newPos.PosID = dbRdr.ToInt64("pos_id");
                    newPos.RxTime = dbRdr.ToDateTime("rx_time");
                    newPos.Timestamp = dbRdr.ToDateTime("timestamp");
                    newPos.TagID = dbRdr.ToInt32("tag_id");
                    newPos.Tag = dbRdr.ToString("tag");
                    newPos.AssetID = dbRdr.ToInt32("asset_id");
                    newPos.Asset = dbRdr.ToString("asset");
                    newPos.Satellites = dbRdr.ToInt32("satellites");
                    newPos.PosX = dbRdr.ToDouble("pos_x");
                    newPos.PosY = dbRdr.ToDouble("pos_y");
                    newPos.PosZ = dbRdr.ToDouble("pos_z");
                    newPos.Speed = Math.Round(dbRdr.ToDouble("speed"), 1);
                    newPos.Course = Math.Round(dbRdr.ToDouble("course"), 1);
                    newPos.HDOP = Math.Round(dbRdr.ToDouble("hdop"), 1);
                    //newPos.Mileage = Math.Round(dbRdr.ToDouble("mileage") / 100, 2);
                    newPos.Mileage = dbRdr.ToDouble("mileage");
                    newPos.Driver = (dbRdr.ToString("driver") != "" ? dbRdr.ToString("driver") : dbRdr.ToString("driver_default"));
                    newPos.CompanyID = dbRdr.ToInt32("company_id");

                    // get other position parameters
                    newPos.Battery = dbRdr.ToDouble("battery");
                    newPos.Fuel = dbRdr.ToDouble("fuel");
                    newPos.ZoneID = dbRdr.ToInt32("zone_id");
                    newPos.Zone = dbRdr.ToString("zone_name");
                    newPos.Location = dbRdr.ToString("loc");
                    newPos.Location = newPos.Location;

                    //if (((newPos.Location) == "" || (newPos.Location == "Singapore")) && (newPos.FixID > 0))
                    //    newPos.Location = "No Address from Google Maps";

                    if (((newPos.Location) == "ZERO_RESULTS") && (newPos.FixID > 0))
                        newPos.Location = "No Address from Google Maps";

                    if (((newPos.Location) == "" || (newPos.Location == "Singapore")) && (newPos.FixID == 0))
                        newPos.Location = "No GPS Signal Detected";

                    // get engine status
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

                    //try
                    //{
                    //    newPos.Temperature = dbRdr.ToDouble("fridge");
                    //    newPos.Temperature2 = dbRdr.ToDouble("product");
                    //}
                    //catch (Exception ex)
                    //{
                    //    // log error
                    //    FMSHelper.LogEvent(mProjName + "-BuildPos", ex.Message, System.Diagnostics.EventLogEntryType.Error);
                    //    DatabaseMgr.LogError(ex.Message, "BuildPosition-ReadTemp Error");
                    //}

                    //if (ConfigurationManager.AppSettings["Instance"] == "BUC")
                    //{
                    //    //Support for Ultralevel Water Sensor
                    //    try
                    //    {
                    //        newPos.FuelLevel = dbRdr.ToDouble("liquid_level");
                    //        newPos.ActualTemp = dbRdr.ToDouble("actual_temp");
                    //    }
                    //    catch (Exception ex)
                    //    {
                    //        //log error
                    //        DatabaseMgr.LogError(ex.Message, "BuildPosition-ReadFuel Error");
                    //    }
                    //}
                }
                catch(Exception ex) 
                {
                    //Logger.LogEvent(mProjName, "BuildPosition get parameters: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                }
            }
            catch (Exception ex)
            {
                // log error
                //Logger.LogEvent(mProjName, "BuildPosition ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);

            }
            return newPos;
        }
        public static InventoryInfo BuildInventory(MySqlDataReader dbRdr)
        {
            InventoryInfo udtInventory = new InventoryInfo();
            try
            {
                // set jobs parameters
                udtInventory.InventoryID = dbRdr.ToInt64("inventory_id");
                udtInventory.Name = dbRdr.ToString("name");
                udtInventory.Reference = dbRdr.ToString("reference");
                udtInventory.Quantity = dbRdr.ToInt32("quantity");
                udtInventory.Unit = dbRdr.ToString("unit");
                udtInventory.Price = dbRdr.ToDouble("price");
                udtInventory.CompanyID = dbRdr.ToInt32("company_id");
                udtInventory.Remarks = dbRdr.ToString("remarks");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildInventory ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtInventory;
        }
        public static InventoryHistoryInfo BuildInventoryHistory(MySqlDataReader dbRdr)
        {
            InventoryHistoryInfo udtInventory = new InventoryHistoryInfo();
            try
            {
                // set jobs parameters
                udtInventory.InventoryHistoryID = dbRdr.ToInt64("inventory_history_id");
                udtInventory.InventoryID = dbRdr.ToInt64("inventory_id");
                udtInventory.Timestamp = dbRdr.ToDateTime("timestamp");
                udtInventory.RxTime = dbRdr.ToDateTime("rx_time");
                udtInventory.StockType = dbRdr.ToInt32("stock_type");
                udtInventory.Name = dbRdr.ToString("name");
                udtInventory.Reference = dbRdr.ToString("reference");
                udtInventory.PreviousQuantity = dbRdr.ToInt32("previous_quantity");
                udtInventory.Quantity = dbRdr.ToInt32("quantity");
                udtInventory.TotalQuantity = dbRdr.ToInt32("total_quantity");
                udtInventory.DriverID = dbRdr.ToInt32("driver_id");
                udtInventory.AssetID = dbRdr.ToInt32("asset_id");
                udtInventory.CompanyID = dbRdr.ToInt32("company_id");
                udtInventory.UserID = dbRdr.ToInt32("user_id");
                udtInventory.Platform = dbRdr.ToInt32("platform");
                udtInventory.Asset = dbRdr.ToString("asset");
                udtInventory.DriverName = dbRdr.ToString("driver_name");
                udtInventory.UserName = dbRdr.ToString("user_name");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildInventoryHistory ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtInventory;
        }
        public static JobInfo BuildJob(MySqlDataReader dbRdr)
        {
            JobInfo udtJobs = new JobInfo();
            try
            {
                // set jobs parameters
                udtJobs.JobID = dbRdr.ToInt64("job_id");
                udtJobs.JobNumber = dbRdr.ToString("job_number");
                udtJobs.Company = dbRdr.ToString("company");
                udtJobs.AssetCompanyID = dbRdr.ToInt32("company_id");
                udtJobs.AssetCompany = dbRdr.ToString("company_name");
                udtJobs.AssetResellerID = dbRdr.ToInt32("reseller_id");
                udtJobs.AssetReseller = dbRdr.ToString("reseller_name");
                udtJobs.AssetID = dbRdr.ToInt32("asset_id");
                udtJobs.Asset = dbRdr.ToString("asset");
                udtJobs.Timestamp = dbRdr.ToDateTime("timestamp");
                udtJobs.RxTime = dbRdr.ToDateTime("rx_time");
                udtJobs.Amount = dbRdr.ToDouble("amount");
                udtJobs.Destination = dbRdr.ToString("destination");
                udtJobs.Phone = dbRdr.ToString("phone");
                udtJobs.Unit = dbRdr.ToString("unit");
                udtJobs.Remarks = dbRdr.ToString("remarks");
                udtJobs.Receipt = dbRdr.ToString("receipt_number");
                udtJobs.UserID = dbRdr.ToInt32("user_id");
                udtJobs.UserName = dbRdr.ToString("user_name");
                udtJobs.DriverID = dbRdr.ToInt32("driver_id");
                udtJobs.DriverName = dbRdr.ToString("driver_name");
                udtJobs.Technician = dbRdr.ToString("technician");
                udtJobs.Flag = dbRdr.ToInt32("flag");
                udtJobs.FlagValue = dbRdr.ToString("flag_value");
                udtJobs.PIC = dbRdr.ToString("pic");
                udtJobs.Postal = dbRdr.ToString("postal");
                udtJobs.JobAccepted = dbRdr.ToDateTime("job_accepted");
                udtJobs.JobCompleted = dbRdr.ToDateTime("job_completed");
                udtJobs.Site = dbRdr.ToString("site");
                udtJobs.CusEmail = dbRdr.ToString("cus_email");
                udtJobs.ReceivedAmount = dbRdr.ToDouble("received_amount");
                udtJobs.PaymentType = dbRdr.ToInt32("payment_type");
                udtJobs.Recommendations = dbRdr.ToString("recommendations");
                udtJobs.ReferenceNo = dbRdr.ToString("reference_no");
                udtJobs.FormType = dbRdr.ToInt32("form_type");
            }                      
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildJob ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtJobs;
        }
        public static JobOverviewInfo BuildJobOverviewSg(MySqlDataReader dbRdr)
        {
            JobOverviewInfo udtJobs = new JobOverviewInfo();
            try
            {
                // set jobs parameters
                udtJobs.JobID = dbRdr.ToInt64("job_id");
                udtJobs.JobNumber = dbRdr.ToString("job_number");
                udtJobs.Company = dbRdr.ToString("company");
                udtJobs.AssetCompanyID = dbRdr.ToInt32("company_id");
                udtJobs.AssetCompany = dbRdr.ToString("company_name");
                udtJobs.AssetResellerID = dbRdr.ToInt32("reseller_id");
                udtJobs.AssetReseller = dbRdr.ToString("reseller_name");
                udtJobs.AssetID = dbRdr.ToInt32("asset_id");
                udtJobs.Asset = dbRdr.ToString("asset");
                udtJobs.Timestamp = dbRdr.ToDateTime("timestamp");
                udtJobs.RxTime = dbRdr.ToDateTime("rx_time");
                udtJobs.Amount = dbRdr.ToDouble("amount");
                udtJobs.Destination = dbRdr.ToString("destination");
                udtJobs.Phone = dbRdr.ToString("phone");
                udtJobs.Unit = dbRdr.ToString("unit");
                udtJobs.Remarks = dbRdr.ToString("remarks");
                udtJobs.Receipt = dbRdr.ToString("receipt_number");
                udtJobs.UserID = dbRdr.ToInt32("user_id");
                udtJobs.UserName = dbRdr.ToString("user_name");
                udtJobs.DriverID = dbRdr.ToInt32("driver_id");
                udtJobs.DriverName = dbRdr.ToString("driver_name");
                udtJobs.Technician = dbRdr.ToString("technician");
                udtJobs.Flag = dbRdr.ToInt32("flag");
                udtJobs.FlagValue = dbRdr.ToString("flag_value");
                udtJobs.PIC = dbRdr.ToString("pic");
                udtJobs.Postal = dbRdr.ToString("postal");
                udtJobs.JobAccepted = dbRdr.ToDateTime("job_accepted");
                udtJobs.JobCompleted = dbRdr.ToDateTime("job_completed");
                udtJobs.Site = dbRdr.ToString("site");
                udtJobs.CusEmail = dbRdr.ToString("cus_email");
                udtJobs.ReceivedAmount = dbRdr.ToDouble("received_amount");
                udtJobs.PaymentType = dbRdr.ToInt32("payment_type");
                udtJobs.Recommendations = dbRdr.ToString("recommendations");
                udtJobs.ReferenceNo = dbRdr.ToString("reference_no");
                udtJobs.FormType = dbRdr.ToInt32("form_type");
                udtJobs.GeneralLocation = dbRdr.ToString("general_location");
                udtJobs.Groups = dbRdr.ToString("groups_ac");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildJobOverview ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtJobs;
        }
        public static JobOverviewInfo BuildJobOverviewMy(MySqlDataReader dbRdr)
        {
            JobOverviewInfo udtJobs = new JobOverviewInfo();
            try
            {
                // set jobs parameters
                udtJobs.JobID = dbRdr.ToInt64("job_id");
                udtJobs.JobNumber = dbRdr.ToString("job_number");
                udtJobs.Company = dbRdr.ToString("company");
                udtJobs.AssetCompanyID = dbRdr.ToInt32("company_id");
                udtJobs.AssetCompany = dbRdr.ToString("company_name");
                udtJobs.AssetResellerID = dbRdr.ToInt32("reseller_id");
                udtJobs.AssetReseller = dbRdr.ToString("reseller_name");
                udtJobs.AssetID = dbRdr.ToInt32("asset_id");
                udtJobs.Asset = dbRdr.ToString("asset");
                udtJobs.Timestamp = dbRdr.ToDateTime("timestamp");
                udtJobs.RxTime = dbRdr.ToDateTime("rx_time");
                udtJobs.Amount = dbRdr.ToDouble("amount");
                udtJobs.Destination = dbRdr.ToString("destination");
                udtJobs.Phone = dbRdr.ToString("phone");
                udtJobs.Unit = dbRdr.ToString("unit");
                udtJobs.Remarks = dbRdr.ToString("remarks");
                udtJobs.Receipt = dbRdr.ToString("receipt_number");
                udtJobs.UserID = dbRdr.ToInt32("user_id");
                udtJobs.UserName = dbRdr.ToString("user_name");
                udtJobs.DriverID = dbRdr.ToInt32("driver_id");
                udtJobs.DriverName = dbRdr.ToString("driver_name");
                udtJobs.Technician = dbRdr.ToString("technician");
                udtJobs.Flag = dbRdr.ToInt32("flag");
                udtJobs.FlagValue = dbRdr.ToString("flag_value");
                udtJobs.PIC = dbRdr.ToString("pic");
                udtJobs.Postal = dbRdr.ToString("postal");
                udtJobs.JobAccepted = dbRdr.ToDateTime("job_accepted");
                udtJobs.JobCompleted = dbRdr.ToDateTime("job_completed");
                udtJobs.Site = dbRdr.ToString("site");
                udtJobs.CusEmail = dbRdr.ToString("cus_email");
                udtJobs.ReceivedAmount = dbRdr.ToDouble("received_amount");
                udtJobs.PaymentType = dbRdr.ToInt32("payment_type");
                udtJobs.Recommendations = dbRdr.ToString("recommendations");
                udtJobs.ReferenceNo = dbRdr.ToString("reference_no");
                udtJobs.FormType = dbRdr.ToInt32("form_type");
                udtJobs.Groups = dbRdr.ToString("groups_ac");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildJobOverview ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtJobs;
        }

        public static SearchJob BuildSearchJob(MySqlDataReader dbRdr)
        {
            SearchJob udtJobs = new SearchJob();
            try
            {
                // set jobs parameters
                udtJobs.JobID = dbRdr.ToInt64("job_id");
                udtJobs.JobNumber = dbRdr.ToString("job_number");
                udtJobs.Company = dbRdr.ToString("company");
                udtJobs.AssetCompanyID = dbRdr.ToInt32("company_id");
                udtJobs.AssetCompany = dbRdr.ToString("company_name");
                udtJobs.AssetResellerID = dbRdr.ToInt32("reseller_id");
                udtJobs.AssetReseller = dbRdr.ToString("reseller_name");
                udtJobs.AssetID = dbRdr.ToInt32("asset_id");
                udtJobs.Asset = dbRdr.ToString("asset");
                udtJobs.Timestamp = dbRdr.ToDateTime("timestamp");
                udtJobs.RxTime = dbRdr.ToDateTime("rx_time");
                udtJobs.Amount = dbRdr.ToDouble("amount");
                udtJobs.Destination = dbRdr.ToString("destination");
                udtJobs.Phone = dbRdr.ToString("phone");
                udtJobs.Unit = dbRdr.ToString("unit");
                udtJobs.Remarks = dbRdr.ToString("remarks");
                udtJobs.Receipt = dbRdr.ToString("receipt_number");
                udtJobs.UserID = dbRdr.ToInt32("user_id");
                udtJobs.UserName = dbRdr.ToString("user_name");
                udtJobs.DriverName = dbRdr.ToString("driver_name");
                udtJobs.Flag = dbRdr.ToInt32("flag");
                udtJobs.PIC = dbRdr.ToString("pic");
                udtJobs.Postal = dbRdr.ToInt32("postal");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildSearchJob ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtJobs;
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
                udtEvent.AlertLevel = dbRdr.ToInt32("alert_level_ex");
                //udtEvent.AlertLevel = dbRdr.ToInt32("alert_level");
                udtEvent.Flag = dbRdr.ToInt32("flag");
                udtEvent.Timestamp = dbRdr.ToDateTime("timestamp");
                udtEvent.RxTime = dbRdr.ToDateTime("rx_time");
                udtEvent.AckRoleID = dbRdr.ToInt32("ack_user");
                udtEvent.AckUser = dbRdr.ToString("user_ack");
                udtEvent.AckTime = dbRdr.ToDateTime("ack_time");
                udtEvent.PosID = dbRdr.ToInt64("pos_id");
                udtEvent.Location = dbRdr.ToString("loc");
                udtEvent.CompanyID = dbRdr.ToInt32("company_id");
                udtEvent.ZoneID = dbRdr.ToInt32("zone_id");
                udtEvent.Speed = dbRdr.ToDouble("speed");


            }
            catch (Exception ex)
            {
                // log error
                //Logger.LogEvent(mProjName, "BuildEvent ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtEvent;
        }

        public static MessageInfo BuildMessage(MySqlDataReader dbRdr)
        {
            MessageInfo udtMessage = new MessageInfo();
            try
            {
                // set company parameters
                udtMessage.MessageID = dbRdr.ToInt32("message_id");
                udtMessage.Sender = dbRdr.ToString("sender");
                udtMessage.Recipients = dbRdr.ToString("recipients");
                udtMessage.Message = dbRdr.ToString("message");
                udtMessage.Timestamp = dbRdr.ToDateTime("timestamp");
                udtMessage.RxTime = dbRdr.ToDateTime("rx_time");
                udtMessage.Flag = dbRdr.ToInt32("flag");
                udtMessage.CompanyID = dbRdr.ToInt32("company_id");
                udtMessage.AssetID = dbRdr.ToInt32("asset_id");
                udtMessage.Company = dbRdr.ToString("company_name");
                udtMessage.Asset = dbRdr.ToString("asset_name");
                udtMessage.JobNumber = dbRdr.ToString("job_number");
                udtMessage.Notified = dbRdr.ToInt32("notified");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildMessage ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtMessage;
        }

        public static SearchMessage BuildSearchMessage(MySqlDataReader dbRdr)
        {
            SearchMessage udtMessage = new SearchMessage();
            try
            {
                // set company parameters
                udtMessage.MessageID = dbRdr.ToInt32("message_id");
                udtMessage.Sender = dbRdr.ToString("sender");
                udtMessage.Recipients = dbRdr.ToString("recipients");
                udtMessage.Message = dbRdr.ToString("message");
                udtMessage.Timestamp = dbRdr.ToDateTime("timestamp");
                udtMessage.RxTime = dbRdr.ToDateTime("rx_time");
                udtMessage.Flag = dbRdr.ToInt32("flag");
                udtMessage.CompanyID = dbRdr.ToInt32("company_id");
                udtMessage.AssetID = dbRdr.ToInt32("asset_id");
                udtMessage.Company = dbRdr.ToString("company_name");
                udtMessage.Asset = dbRdr.ToString("asset_name");
                udtMessage.JobNumber = dbRdr.ToString("job_number");
                udtMessage.Notified = dbRdr.ToInt32("notified");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildSearchMessage ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtMessage;
        }

        public static StatusInfo BuildStatus(MySqlDataReader dbRdr)
        {
            StatusInfo udtStatus = new StatusInfo();
            try
            {
                // set status parameters
                udtStatus.StatusID = dbRdr.ToInt32("status_id");
                udtStatus.StatusDesc = dbRdr.ToString("status_desc");
                udtStatus.Flag = dbRdr.ToInt32("flag");
                udtStatus.Type = dbRdr.ToInt32("type");

            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildStatus ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtStatus;
        }

        public static UtilizeReport BuildUtilization(MySqlDataReader dbRdr)
        {
            UtilizeReport udtUtilize = new UtilizeReport();
            try
            {
                // set status parameters
                udtUtilize.UtilID = dbRdr.ToInt64("util_id");
                udtUtilize.AssetID = dbRdr.ToInt32("asset_id");
                udtUtilize.Driver = dbRdr.ToString("driver");
                udtUtilize.Date = dbRdr.ToDateTimeMin("date");
                udtUtilize.StartTime = dbRdr.ToDateTimeMin("start_time");
                udtUtilize.EndTime = dbRdr.ToDateTimeMin("end_time");
                udtUtilize.Stop1 = dbRdr.ToDouble("stop");
                udtUtilize.Stop2 = dbRdr.ToDouble("stop_ex");
                udtUtilize.Idle = dbRdr.ToDouble("idle");
                udtUtilize.Move = dbRdr.ToDouble("move");
                udtUtilize.StopCount = dbRdr.ToInt32("stop_count");
                udtUtilize.Mileage = dbRdr.ToDouble("mileage");
                udtUtilize.LastIgnition = dbRdr.ToDateTime("last_ignition");
                udtUtilize.Location = dbRdr.ToString("location");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildUtilization ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtUtilize;
        }

        public static IdlingInfo BuildIdling(MySqlDataReader dbRdr)
        {
            IdlingInfo udtIdling = new IdlingInfo();
            try
            {
                // set status parameters
                udtIdling.IdleReportID = dbRdr.ToInt64("idlereport_id");
                //udtIdling.Driver = dbRdr.ToString("driver");
                //udtIdling.AssetID = dbRdr.ToInt32("asset_id");
                //udtIdling.IdleStart = dbRdr.ToDateTimeMin("idle_start");
                //udtIdling.IdleEnd = dbRdr.ToDateTimeMin("idle_end");
                //udtIdling.Location = dbRdr.ToString("location");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildIdling ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtIdling;
        }

        /// <summary>
        /// builds plan info from database record
        /// </summary>
        /// <param name="dbRdr"></param>
        /// <returns></returns>
        public static PlanInfo BuildPlan(MySqlDataReader dbRdr)
        {
            PlanInfo udtPlan = new PlanInfo();
            try
            {
                // add trip plan to list
                udtPlan.PlanID = dbRdr.ToInt32("plan_id");
                udtPlan.OriginID = dbRdr.ToInt32("origin_id");
                udtPlan.Origin = dbRdr.ToString("origin");
                udtPlan.DestinationID = dbRdr.ToInt32("destination_id");
                udtPlan.Destination = "";
                udtPlan.Duration = dbRdr.ToDouble("duration");
                udtPlan.Price = dbRdr.ToDouble("price");
                udtPlan.Company = dbRdr.ToString("company");
                udtPlan.Timestamp = dbRdr.ToDateTime("timestamp");
                udtPlan.LastTrip = dbRdr.ToDateTime("last_trip");

                // format duration
                double lSeconds = (udtPlan.Duration - Math.Round(udtPlan.Duration)) * 60;
                TimeSpan tsDiff = new TimeSpan(0, (int)udtPlan.Duration, (int)lSeconds);
                udtPlan.DurationEx = String.Format("{0:00}:{1:00}:{2:00}",
                    tsDiff.Hours, tsDiff.Minutes, tsDiff.Seconds);
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildPlan ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtPlan;
        }

        public static CustomerInfo BuildCustomer(MySqlDataReader dbRdr)
        {
            CustomerInfo udtCus = new CustomerInfo();

            try
            {
                // set company parameters
                udtCus.CustomerID = dbRdr.ToInt32("cus_id");
                udtCus.Name = dbRdr.ToString("cus_name");
                udtCus.Address = dbRdr.ToString("address");
                udtCus.Postal = dbRdr.ToInt32("postal");
                udtCus.Unit = dbRdr.ToString("unit");
                udtCus.Phone = dbRdr.ToString("phone");
                udtCus.CusCompany = dbRdr.ToString("cus_company");
                udtCus.Remarks = dbRdr.ToString("remarks");
                udtCus.Email = dbRdr.ToString("email");
                udtCus.CompanyID = dbRdr.ToInt32("company_id");
                udtCus.ResellerID = dbRdr.ToInt32("reseller_id");

            }
            catch (Exception ex)
            {
                // log error
                //Logger.LogEvent(mProjName, "BuildDriver ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtCus;
        }

        public static MaintenanceInfo BuildMaintenance(MySqlDataReader dbRdr)
        {
            MaintenanceInfo udtJobs = new MaintenanceInfo();
            try
            {
                // set jobs parameters
                udtJobs.MaintenanceID = dbRdr.ToInt64("maintenance_id");
                udtJobs.CompanyID = dbRdr.ToInt32("company_id");
                udtJobs.Company = dbRdr.ToString("company_name");
                udtJobs.Timestamp = dbRdr.ToDateTime("timestamp");
                udtJobs.RxTime = dbRdr.ToDateTime("rx_time");
                udtJobs.Remarks = dbRdr.ToString("remarks");
                udtJobs.UserID = dbRdr.ToInt32("user_id");
                udtJobs.UserName = dbRdr.ToString("user_name");
                udtJobs.Address = dbRdr.ToString("address");
                udtJobs.Postal = dbRdr.ToString("postal");
                udtJobs.Unit = dbRdr.ToString("unit");
                udtJobs.CusCompany = dbRdr.ToString("cus_company");
                udtJobs.PIC = dbRdr.ToString("pic");
                udtJobs.Phone = dbRdr.ToString("phone");
                udtJobs.Email = dbRdr.ToString("email");
                udtJobs.Site = dbRdr.ToString("site");
                udtJobs.ContractStart = dbRdr.ToDateTime("contract_start");
                udtJobs.ContractEnd = dbRdr.ToDateTime("contract_end");
                udtJobs.MaintenanceInterval = dbRdr.ToString("maintenance_interval");
                udtJobs.NotificationInterval = dbRdr.ToString("notification_interval");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "DataMgr BuildMaintenance ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtJobs;
        }
        public static MaintenanceJobInfo BuildMaintenanceJob(MySqlDataReader dbRdr)
        {
            MaintenanceJobInfo udtJobs = new MaintenanceJobInfo();
            try
            {
                // set jobs parameters
                udtJobs.MaintenanceJobID = dbRdr.ToInt64("maintenancejob_id");
                udtJobs.MaintenanceID = dbRdr.ToInt64("maintenance_id");
                udtJobs.AlertDate = dbRdr.ToDateTime("alert_date");
                udtJobs.Timestamp = dbRdr.ToDateTime("timestamp");
                udtJobs.RxTime = dbRdr.ToDateTime("rx_time");
                udtJobs.Flag = dbRdr.ToInt32("flag");
                udtJobs.FlagValue = dbRdr.ToString("flag_value");
                udtJobs.JobCancelled = dbRdr.ToDateTime("job_cancelled");
                udtJobs.CancelRemarks = dbRdr.ToString("cancel_remarks");
                udtJobs.isSent = dbRdr.ToInt32("isSent");
                udtJobs.ReferenceNo = dbRdr.ToString("reference_no");
                udtJobs.CusCompany = dbRdr.ToString("cus_company");
                udtJobs.Address = dbRdr.ToString("address");
                udtJobs.Postal = dbRdr.ToString("postal");
                udtJobs.PIC = dbRdr.ToString("pic");
                udtJobs.DriverID = dbRdr.ToInt32("driver_id");
                udtJobs.DriverName = dbRdr.ToString("driver_name");
                udtJobs.Technician = dbRdr.ToString("technician");
                udtJobs.AssetID = dbRdr.ToInt32("asset_id");
                udtJobs.Asset = dbRdr.ToString("asset_name");
                udtJobs.AssetCompanyID = dbRdr.ToInt32("company_id");
                udtJobs.Site = dbRdr.ToString("site");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "DataMgr BuildMaintenanceJob ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtJobs;
        }
        public static MaintenanceCalJobInfo BuildMaintenanceJobCal(MySqlDataReader dbRdr)
        {
            MaintenanceCalJobInfo udtJobs = new MaintenanceCalJobInfo();
            try
            {
                // set jobs parameters
                udtJobs.MaintenanceJobID = dbRdr.ToInt64("maintenancejob_id");
                udtJobs.Timestamp = dbRdr.ToDateTime("timestamp");
                udtJobs.RxTime = dbRdr.ToDateTime("rx_time");
                udtJobs.Flag = dbRdr.ToInt32("flag");
                udtJobs.FlagValue = dbRdr.ToString("flag_value");
                udtJobs.CusCompany = dbRdr.ToString("cus_company");
                udtJobs.Address = dbRdr.ToString("address");
                udtJobs.Unit = dbRdr.ToString("unit");
                udtJobs.Postal = dbRdr.ToString("postal");
                udtJobs.DriverID = dbRdr.ToInt32("driver_id");
                udtJobs.DriverName = dbRdr.ToString("driver_name");
                udtJobs.Technician = dbRdr.ToString("technician");
                udtJobs.AssetCompanyID = dbRdr.ToInt32("company_id");
                udtJobs.Site = dbRdr.ToString("site");
                udtJobs.Remarks = dbRdr.ToString("remarks");
                udtJobs.GeneralLocation = dbRdr.ToString("general_location");
                udtJobs.Groups = dbRdr.ToString("groups_ac");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "DataMgr BuildMaintenanceJob ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtJobs;
        }
        public static MaintenanceCalJobInfo BuildMaintenanceJobCalMy(MySqlDataReader dbRdr)
        {
            MaintenanceCalJobInfo udtJobs = new MaintenanceCalJobInfo();
            try
            {
                // set jobs parameters
                udtJobs.MaintenanceJobID = dbRdr.ToInt64("maintenancejob_id");
                udtJobs.Timestamp = dbRdr.ToDateTime("timestamp");
                udtJobs.RxTime = dbRdr.ToDateTime("rx_time");
                udtJobs.Flag = dbRdr.ToInt32("flag");
                udtJobs.FlagValue = dbRdr.ToString("flag_value");
                udtJobs.CusCompany = dbRdr.ToString("cus_company");
                udtJobs.Address = dbRdr.ToString("address");
                udtJobs.Unit = dbRdr.ToString("unit");
                udtJobs.Postal = dbRdr.ToString("postal");
                udtJobs.DriverID = dbRdr.ToInt32("driver_id");
                udtJobs.DriverName = dbRdr.ToString("driver_name");
                udtJobs.Technician = dbRdr.ToString("technician");
                udtJobs.AssetCompanyID = dbRdr.ToInt32("company_id");
                udtJobs.Site = dbRdr.ToString("site");
                udtJobs.Remarks = dbRdr.ToString("remarks");
                udtJobs.Groups = dbRdr.ToString("groups_ac");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "DataMgr BuildMaintenanceJob ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtJobs;
        }
        public static MaintenanceJobApp BuildMaintenanceJobApp(MySqlDataReader dbRdr)
        {
            MaintenanceJobApp udtJobs = new MaintenanceJobApp();
            try
            {
                // set jobs parameters
                udtJobs.MaintenanceJobID = dbRdr.ToInt64("maintenancejob_id");
                udtJobs.MaintenanceID = dbRdr.ToInt64("maintenance_id");
                udtJobs.AlertDate = dbRdr.ToDateTime("alert_date");
                udtJobs.Timestamp = dbRdr.ToDateTime("timestamp");
                udtJobs.RxTime = dbRdr.ToDateTime("rx_time");
                udtJobs.Flag = dbRdr.ToInt32("flag");
                udtJobs.FlagValue = dbRdr.ToString("flag_value");
                udtJobs.JobCancelled = dbRdr.ToDateTime("job_cancelled");
                udtJobs.CancelRemarks = dbRdr.ToString("cancel_remarks");
                udtJobs.isSent = dbRdr.ToInt32("isSent");
                udtJobs.ReferenceNo = dbRdr.ToString("reference_no");
                udtJobs.CusCompany = dbRdr.ToString("cus_company");
                udtJobs.Address = dbRdr.ToString("address");
                udtJobs.Unit = dbRdr.ToString("unit");
                udtJobs.Postal = dbRdr.ToString("postal");
                udtJobs.PIC = dbRdr.ToString("pic");
                udtJobs.Phone = dbRdr.ToString("phone");
                udtJobs.Email = dbRdr.ToString("email");
                udtJobs.DriverID = dbRdr.ToInt32("driver_id");
                udtJobs.DriverName = dbRdr.ToString("driver_name");
                udtJobs.Technician = dbRdr.ToString("technician");
                udtJobs.AssetID = dbRdr.ToInt32("asset_id");
                udtJobs.Asset = dbRdr.ToString("asset_name");
                udtJobs.AssetCompanyID = dbRdr.ToInt32("company_id");
                udtJobs.Site = dbRdr.ToString("site");
                udtJobs.Remarks = dbRdr.ToString("remarks");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "DataMgr BuildMaintenanceJob ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtJobs;
        }

        public static LocationInfo BuildLocation(MySqlDataReader dbRdr)
        {
            LocationInfo udtLocation = new LocationInfo();
            try
            {

                udtLocation.Location = dbRdr.ToString("loc");

            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildLocation ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtLocation;
        }

    }
}