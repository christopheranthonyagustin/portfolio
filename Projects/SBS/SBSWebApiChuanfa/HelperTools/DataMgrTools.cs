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
        private static string mProjName = "SBS";

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
                //udtAsset.Driver = dbRdr.ToString("driver_name");
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
                udtAsset.Gps = (int)Enums.StatusColorInt.RED;
                udtAsset.Gprs = (int)Enums.StatusColorInt.RED;

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

                //// initialize depot, interchange
                try
                {
                    udtAsset.DepotID = dbRdr.ToInt32("depot_id");
                    udtAsset.InterchangeID = dbRdr.ToInt32("interchange_id");
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(mProjName, "BuildAsset(initialize depot, interchange) ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                }


            }
            catch (Exception ex)
            {
                //// log error
                Logger.LogEvent(mProjName, "BuildAsset ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);

            }
            return udtAsset;
        }
        public static SearchAsset BuildSearchAsset(MySqlDataReader dbRdr)
        {
            SearchAsset udtAsset = new SearchAsset();
            //List<AssetInfo> arrAssets = new List<AssetInfo>();
            SearchAssetRepository assetRepo = new SearchAssetRepository();

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
                //udtAsset.Driver = dbRdr.ToString("driver_name");
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
                udtAsset.Gps = (int)Enums.StatusColorInt.RED;
                udtAsset.Gprs = (int)Enums.StatusColorInt.RED;

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
                //udtAsset.InstallRemarks = dbRdr.ToString("asset_remarks");


            }
            catch (Exception ex)
            {
                //// log error
                Logger.LogEvent(mProjName, "BuildSearchAsset ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);

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
                Logger.LogEvent(mProjName + "-BuildZone", ex.Message, System.Diagnostics.EventLogEntryType.Error);
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
                udtCompany.UserLimit = dbRdr.ToInt32("user_limit");
                udtCompany.ZoneLimit = dbRdr.ToInt32("zone_limit");
                udtCompany.AssetLimit = dbRdr.ToInt32("asset_limit");
                udtCompany.SmsLimit = dbRdr.ToInt32("sms_limit");                                        
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent("BuildCompany: ", ex.Message, System.Diagnostics.EventLogEntryType.Error);
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
                Logger.LogEvent(mProjName + "-BuildReseller", ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtReseller;
        }
        /// <summary>
        /// builds user info from database record
        /// </summary>
        /// <param name="dbRdr"></param>
        /// <returns></returns>
        /// 

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
                Logger.LogEvent(mProjName + "-BuildDriver", ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtDriver;
        }

        public static ScsInfo BuildScs(MySqlDataReader dbRdr)
        {
            ScsInfo udtScs = new ScsInfo();

            try
            {

                udtScs.OP_DATE = dbRdr.ToDateTime("OP_DATE");
                udtScs.BUS_NO = dbRdr.ToString("BUS_NO");
                udtScs.SVC_NO = dbRdr.ToString("SVC_NO");
                udtScs.DRV_NO = dbRdr.ToInt32("DRV_NO");
                udtScs.DUTY_NO = dbRdr.ToString("DUTY_NO");
                udtScs.ACT_DEP_TIME = dbRdr.ToString("ACT_DEP_TIME");
                udtScs.ACT_ARR_TIME = dbRdr.ToString("ACT_ARR_TIME");
                udtScs.RESN_CODE_FOR_DEP = dbRdr.ToString("RESN_CODE_FOR_DEP");
                udtScs.RESN_DESC = dbRdr.ToString("RESN_DESC");
                udtScs.REMARKS_FOR_DEP = dbRdr.ToString("REMARKS_FOR_DEP");
                udtScs.RX_TIME = dbRdr.ToDateTime("RX_TIME");
                udtScs.InterchangeID = dbRdr.ToInt32("interchange_id");
                udtScs.DepotID = dbRdr.ToInt32("depot_id");

            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName + "-BuildScs", ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtScs;
        }
        public static ScsArchiveInfo BuildScsArchive(MySqlDataReader dbRdr)
        {
            ScsArchiveInfo udtScs = new ScsArchiveInfo();

            try
            {
                udtScs.OP_DATE = dbRdr.ToDateTime("OP_DATE");
                udtScs.SVC_NO = dbRdr.ToString("SVC_NO");
                udtScs.DRV_NO = dbRdr.ToInt32("DRV_NO");           
                udtScs.InterchangeID = dbRdr.ToInt32("interchange_id");
                udtScs.DepotID = dbRdr.ToInt32("depot_id");

            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName + "-BuildScs", ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtScs;
        }
        public static SearchDriver BuildSearchDriver(MySqlDataReader dbRdr)
        {
            SearchDriver udtDriver = new SearchDriver();
            SearchDriverRepository driverRepo = new SearchDriverRepository();
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
                Logger.LogEvent(mProjName + "-BuildSearchDriver", ex.Message, System.Diagnostics.EventLogEntryType.Error);
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
                Logger.LogEvent("BuildUser: ", ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtUser;
        }
        public static SearchUser BuildSearchUser(MySqlDataReader dbRdr)
        {
            SearchUser udtUser = new SearchUser();

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
                Logger.LogEvent("BuildSearchUser: ", ex.Message, System.Diagnostics.EventLogEntryType.Error);
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
                udtDevice.DeviceTypeID = dbRdr.ToInt32("tag_typeid");
                udtDevice.DeviceType = dbRdr.ToString("tag_type");
                udtDevice.Name = dbRdr.ToString("name");
                udtDevice.Imei = dbRdr.ToString("imei");
                udtDevice.Phone = dbRdr.ToString("phone");
                udtDevice.Interval = dbRdr.ToInt32("interval");
                udtDevice.Port = dbRdr.ToInt32("port");
                udtDevice.IP = dbRdr.ToString("ip");
                udtDevice.SSID = dbRdr.ToInt32("ssid");
                udtDevice.Username = dbRdr.ToString("username");
                udtDevice.Password = dbRdr.ToString("password");
                udtDevice.SecurityType = dbRdr.ToInt32("security_type");
                udtDevice.Mode = dbRdr.ToInt32("mode");
                udtDevice.IPAddress = dbRdr.ToString("ip_address");
                udtDevice.IPMask = dbRdr.ToString("ip_mask");
                udtDevice.IPGateway = dbRdr.ToString("ip_gateway");
                udtDevice.APN = dbRdr.ToString("APN");
                udtDevice.InstallDate = dbRdr.ToDateTime("install_date");
                udtDevice.ModifiedTimestamp = dbRdr.ToDateTime("modified_timestamp");
                udtDevice.Remarks = dbRdr.ToString("remarks");
                udtDevice.isSentOut = dbRdr.ToInt32("isSentOut");
                udtDevice.AssetID = dbRdr.ToInt32("asset_id");
                udtDevice.Asset = dbRdr.ToString("asset");
                udtDevice.CompanyID = dbRdr.ToInt32("company_id");
                udtDevice.Company = dbRdr.ToString("company");
                udtDevice.ResellerID = dbRdr.ToInt32("reseller_id");
                udtDevice.Reseller = dbRdr.ToString("reseller");

            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent("BuildDevice: ", ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtDevice;
        }
        public static SearchDevice BuildSearchDevice(MySqlDataReader dbRdr)
        {
            SearchDevice udtDevice = new SearchDevice();
            try
            {
                // set users parameters
                udtDevice.DeviceID = dbRdr.ToInt32("tag_id");
                udtDevice.DeviceTypeID = dbRdr.ToInt32("tag_typeid");
                udtDevice.DeviceType = dbRdr.ToString("tag_type");
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
                udtDevice.AssetID = dbRdr.ToInt32("asset_id");
                udtDevice.Asset = dbRdr.ToString("asset");
                udtDevice.CompanyID = dbRdr.ToInt32("company_id");
                udtDevice.Company = dbRdr.ToString("company");
                udtDevice.ResellerID = dbRdr.ToInt32("reseller_id");
                udtDevice.Reseller = dbRdr.ToString("reseller");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent("BuildDevice: ", ex.Message, System.Diagnostics.EventLogEntryType.Error);
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
                Logger.LogEvent(mProjName + "-BuildCategory", ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtCategory;
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
                Logger.LogEvent(mProjName + "-BuildZoneType", ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtZoneType;
        }
        /// <summary>
        /// builds device type info from database record
        /// </summary>
        /// <param name="dbRdr"></param>
        /// <returns></returns>
        public static DeviceTypeInfo BuildDeviceType(MySqlDataReader dbRdr)
        {
            DeviceTypeInfo udtDeviceType = new DeviceTypeInfo();
            try
            {

                // set users parameters
                udtDeviceType.DeviceTypeID = dbRdr.ToInt32("tag_typeid");
                udtDeviceType.Name = dbRdr.ToString("name");
                udtDeviceType.Supplier = dbRdr.ToString("supplier");


                // get user image
                //string strFill = "";
                //udtUser.Image = GetImage(String.Format("users/{0}", udtUser.UserID), strImage, ref strFill);
                //udtUser.ImageFill = strFill;
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtDeviceType;
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
                Logger.LogEvent(mProjName + "-BuildReport", ex.Message, System.Diagnostics.EventLogEntryType.Error);
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
                Logger.LogEvent(mProjName + "-BuildRole", ex.Message, System.Diagnostics.EventLogEntryType.Error);
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
                Logger.LogEvent(mProjName + "-BuildLanguage", ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtLanguage;
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
                newPos.FixID = 0;
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
                newPos.OpDate = dbRdr.ToDateTime("op_date");
                newPos.SvcNo = dbRdr.ToString("svc_no");
                newPos.DrvNo = dbRdr.ToInt32("drv_no");
                newPos.DutyNo = dbRdr.ToString("duty_no");

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

                    // get engine status
                    //switch (dbRdr.ToInt32("engine"))
                    //{
                    //    case 0: newPos.Engine = "STOP";
                    //        break;
                    //    case 1: newPos.Engine = "IDLE";
                    //        break;
                    //    case 2: newPos.Engine = "MOVE";
                    //        break;
                    //}

                    //[Chinky:27Jan2014] Eliminated Status:Move; Speed < 6kph
                    //newPos.Ignition = dbRdr.ToInt32("ignition");
                    //if (newPos.Ignition == 0)
                    //{
                    //    newPos.Speed = 0;
                    //}
                    //else
                    //{
                    //    if (newPos.Engine == "IDLE" && newPos.Speed > 0)
                    //        newPos.Speed = 0;
                    //    if (newPos.Engine == "MOVE" && newPos.Speed < 6)
                    //    {
                    //        newPos.Speed = 0;
                    //        newPos.Engine = "IDLE";
                    //    }
                    //}

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
                    //    //[Chinky:08Sept2014] Support for Ultralevel Water Sensor
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
                    Logger.LogEvent("BuildPos(other position parameters)", ex.Message, System.Diagnostics.EventLogEntryType.Error);
                }
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent("BuildPos", ex.Message, System.Diagnostics.EventLogEntryType.Error);

            }
            return newPos;
        }
        public static TriggerInfo BuildTrigger(MySqlDataReader dbRdr)
        {
            TriggerInfo newPos = new TriggerInfo();
            try
            {
                // set position parameters
                newPos.PosID = dbRdr.ToInt64("pos_id");
                newPos.RxTime = dbRdr.ToDateTime("rx_time");
                newPos.Timestamp = dbRdr.ToDateTime("timestamp");
                newPos.AssetID = dbRdr.ToInt32("asset_id");
                newPos.Asset = dbRdr.ToString("asset");
                newPos.PosX = dbRdr.ToDouble("pos_x");
                newPos.PosY = dbRdr.ToDouble("pos_y");           
                newPos.Speed = Math.Round(dbRdr.ToDouble("speed"), 1);
                newPos.Headway = dbRdr.ToString("headway");
                newPos.Event = dbRdr.ToString("event");
                newPos.EventValue = dbRdr.ToString("event_value");
                newPos.OpDate = dbRdr.ToDateTime("op_date");
                newPos.SvcNo = dbRdr.ToString("svc_no");
                newPos.DrvNo = dbRdr.ToInt32("drv_no");
                newPos.DutyNo = dbRdr.ToString("duty_no");

            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent("BuildTrigger", ex.Message, System.Diagnostics.EventLogEntryType.Error);

            }
            return newPos;
        }
        public static BcRankingInfo BuildBcRanking(MySqlDataReader dbRdr)
        {
            BcRankingInfo BcRanking = new BcRankingInfo();
            try
            {
                BcRanking.DrvNo = dbRdr.ToInt32("DrvNo");
                BcRanking.LDW = dbRdr.ToInt32("LDW");
                BcRanking.HW = dbRdr.ToInt32("HW");
                BcRanking.FCW = dbRdr.ToInt32("FCW");
                BcRanking.PCW = dbRdr.ToInt32("PCW");
                BcRanking.TotalLDW = dbRdr.ToInt32("TOTAL_LDW");
                BcRanking.TotalEvents = dbRdr.ToInt32("TOTAL_EVENTS");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent("BuildBcRanking", ex.Message, System.Diagnostics.EventLogEntryType.Error);

            }
            return BcRanking;
        }
        public static OverallPerformanceInfo BuildOverallPerformance(MySqlDataReader dbRdr)
        {
            OverallPerformanceInfo OverallPerformance = new OverallPerformanceInfo();
            try
            {
                OverallPerformance.ParamDesc = dbRdr.ToString("param_desc");
                OverallPerformance.EventCode = dbRdr.ToString("event_code");
                OverallPerformance.PerfRating = dbRdr.ToDouble("perf_rating");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent("BuildOverallPerformance", ex.Message, System.Diagnostics.EventLogEntryType.Error);

            }
            return OverallPerformance;
        }

        public static OaPerfParamsInfo BuildOverallPerformanceParams(MySqlDataReader dbRdr)
        {
            OaPerfParamsInfo OverallPerformance = new OaPerfParamsInfo();
            try
            {
                OverallPerformance.SessionID = dbRdr.ToInt32("session_id");
                OverallPerformance.ParamID = dbRdr.ToInt32("param_id");
                OverallPerformance.Timestamp = dbRdr.ToDateTime("date_from");
                OverallPerformance.RxTime = dbRdr.ToDateTime("date_to");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent("BuildOverallPerformanceParams", ex.Message, System.Diagnostics.EventLogEntryType.Error);

            }
            return OverallPerformance;
        }
        public static OaPerfDrvInfo BuildOverallPerformanceDrv(MySqlDataReader dbRdr)
        {
            OaPerfDrvInfo OverallPerformance = new OaPerfDrvInfo();
            try
            {
                OverallPerformance.SessionID = dbRdr.ToInt32("session_id");
                OverallPerformance.ParamID = dbRdr.ToInt32("param_id");
                OverallPerformance.DrvNo = dbRdr.ToInt32("drv_no");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent("BuildOverallPerformanceDrv", ex.Message, System.Diagnostics.EventLogEntryType.Error);

            }
            return OverallPerformance;
        }

        public static BcPerformanceInfo BuildBcPerformance(MySqlDataReader dbRdr)
        {
            BcPerformanceInfo BcPerformance = new BcPerformanceInfo();
            try
            {
                BcPerformance.RangeID = dbRdr.ToInt32("range_id");
                BcPerformance.IndexValue = dbRdr.ToString("index_value");
                BcPerformance.RangeCount = dbRdr.ToInt32("range_count");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent("Build BcPerformance", ex.Message, System.Diagnostics.EventLogEntryType.Error);

            }
            return BcPerformance;
        }

        public static DailyPerformanceInfoQuery1 BuildDailyPerformance1(MySqlDataReader dbRdr)
        {
            DailyPerformanceInfoQuery1 DailyPerformance = new DailyPerformanceInfoQuery1();
            try
            {
                DailyPerformance.Date = dbRdr.ToDateTime("date");
                DailyPerformance.LDW = dbRdr.ToDouble("LDW");
                DailyPerformance.HW = dbRdr.ToDouble("HW");
                DailyPerformance.FCW = dbRdr.ToDouble("FCW");
                DailyPerformance.PCW = dbRdr.ToDouble("PCW");
                DailyPerformance.TotalLDW = dbRdr.ToDouble("TOTAL_LDW");
                DailyPerformance.TotalEvents = dbRdr.ToDouble("TOTAL_EVENTS");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent("DailyPerformanceInfo Query 1", ex.Message, System.Diagnostics.EventLogEntryType.Error);

            }
            return DailyPerformance;
        }
        public static DailyPerformanceInfoQuery2 BuildDailyPerformance2(MySqlDataReader dbRdr)
        {
            DailyPerformanceInfoQuery2 DailyPerformance = new DailyPerformanceInfoQuery2();
            try
            {
                DailyPerformance.LDW = dbRdr.ToDouble("LDW");
                DailyPerformance.HW = dbRdr.ToDouble("HW");
                DailyPerformance.FCW = dbRdr.ToDouble("FCW");
                DailyPerformance.PCW = dbRdr.ToDouble("PCW");
                DailyPerformance.TotalLDW = dbRdr.ToDouble("TOTAL_LDW");
                DailyPerformance.TotalEvents = dbRdr.ToDouble("TOTAL_EVENTS");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent("DailyPerformanceInfo Query 2", ex.Message, System.Diagnostics.EventLogEntryType.Error);

            }
            return DailyPerformance;
        }
        public static DailyPerformanceInfoQuery3 BuildDailyPerformance3(MySqlDataReader dbRdr)
        {
            DailyPerformanceInfoQuery3 DailyPerformance = new DailyPerformanceInfoQuery3();
            try
            {
                DailyPerformance.LDW = dbRdr.ToDouble("LDW");
                DailyPerformance.HW = dbRdr.ToDouble("HW");
                DailyPerformance.FCW = dbRdr.ToDouble("FCW");
                DailyPerformance.PCW = dbRdr.ToDouble("PCW");
                DailyPerformance.TotalLDW = dbRdr.ToDouble("TOTAL_LDW");
                DailyPerformance.TotalEvents = dbRdr.ToDouble("TOTAL_EVENTS");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent("DailyPerformanceInfo Query 3", ex.Message, System.Diagnostics.EventLogEntryType.Error);

            }
            return DailyPerformance;
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
                Logger.LogEvent(mProjName + "-BuildEvent", ex.Message, System.Diagnostics.EventLogEntryType.Error);
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


            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName + "-BuildMessage", ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtMessage;
        }

        public static DepotInfo BuildDepot(MySqlDataReader dbRdr)
        {
            DepotInfo udtDepot = new DepotInfo();
            try
            {
                // set status parameters
                udtDepot.DepotID = dbRdr.ToInt32("depot_id");
                udtDepot.Name = dbRdr.ToString("name");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName + "-BuildDepot", ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtDepot;
        }
        public static InterchangeInfo BuildInterchange(MySqlDataReader dbRdr)
        {
            InterchangeInfo udtInterchange = new InterchangeInfo();
            try
            {
                // set status parameters
                udtInterchange.InterchangeID = dbRdr.ToInt32("interchange_id");
                udtInterchange.Name = dbRdr.ToString("name");
                udtInterchange.DepotID = dbRdr.ToInt32("depot_id");
                udtInterchange.Desc = dbRdr.ToString("desc");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName + "-BuildInterchange", ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtInterchange;
        }
        public static SvcInfo BuildSvc(MySqlDataReader dbRdr)
        {
            SvcInfo udtSvc = new SvcInfo();
            try
            {
                // set status parameters
                udtSvc.SvcID = dbRdr.ToInt32("svc_id");
                udtSvc.SvcNo = dbRdr.ToString("svc_no");
                udtSvc.InterchangeID = dbRdr.ToInt32("interchange_id");
                udtSvc.DepotID = dbRdr.ToInt32("depot_id");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName + "-BuildSvc", ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtSvc;
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
                Logger.LogEvent(mProjName + "-BuildStatus", ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtStatus;
        }
        public static SafetyEventsInfo BuildSafetyEventsView(MySqlDataReader dbRdr)
        {
            SafetyEventsInfo udtSafety = new SafetyEventsInfo();
            try
            {
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
                udtSafety.Asset = dbRdr.ToString("asset");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName + "-BuildSafetyEvents", ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtSafety;
        }

        public static SummaryInfo BuildSummaryView(MySqlDataReader dbRdr)
        {
            SummaryInfo udtSummary = new SummaryInfo();
            try
            {
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
                udtSummary.Asset = dbRdr.ToString("asset");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName + "-BuildSummary", ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtSummary;
        }
    }
}