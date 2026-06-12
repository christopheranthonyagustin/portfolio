using FMSWebApi.Models;
using FMSWebApi.Properties;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Script.Serialization;

namespace FMSWebApi.Repository
{
    public class VrpSettingsRepository : IVrpSettingsRepository
    {
        private string mConnStr = Settings.Default.DB;
        private string mProjName = "FMS-Singapore";
        public IEnumerable<VrpSettingsInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<VrpSettingsInfo> arrVrpSettings = new List<VrpSettingsInfo>();

            if (conn != null)
                conn.Close();

            return arrVrpSettings.ToArray();
        }
        public IEnumerable<VrpSettingsInfo> GetByRouteNo(VrpSettingsInfo param)
        {

            List<VrpSettingsInfo> arrVrpSettings = new List<VrpSettingsInfo>();
            VrpSettingsInfo currVrpSettings = new VrpSettingsInfo();
            object objTemp = new object();

            string query = "SELECT * FROM view_vrp_settings WHERE company_id = @CompanyID";
            if (!string.IsNullOrEmpty(param.RouteNo)) query += " and route_no = @RouteNo";
            if (param.Timestamp != DateTime.MinValue && param.RxTime != DateTime.MinValue) query += " and timestamp between @Timestamp and @RxTime";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        
                        cmd.Parameters.AddWithValue("@Timestamp", param.Timestamp);
                        cmd.Parameters.AddWithValue("@RxTime", param.RxTime);
                        cmd.Parameters.AddWithValue("@CompanyID", param.CompanyID);
                        cmd.Parameters.AddWithValue("@RouteNo", param.RouteNo);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currVrpSettings = DataMgrTools.BuildVrpSettings(reader);
                                    arrVrpSettings.Add(currVrpSettings);
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(GetByRouteNo)", System.Diagnostics.EventLogEntryType.Error);

                }


            }

            return arrVrpSettings;
        }

 
        public VrpSettingsInfo Get(int id)
        {
            VrpSettingsInfo currVrpSettings = new VrpSettingsInfo();
            string query = string.Format("SELECT * FROM view_vrp_settings WHERE vrp_settings_id = {0}", id);
            
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
                            currVrpSettings = DataMgrTools.BuildVrpSettings(reader);
                        }
                        
                    }
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Get(VrpSettingsRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return currVrpSettings;
        }


        public VrpSettingsInfo Add(VrpSettingsInfo currVrpSettings)
        {
            SettingsRepository settingRepo = new SettingsRepository();
            LocationIQForwardGeoCodeResponse fwGeocode = new LocationIQForwardGeoCodeResponse();
            LocationIQGeoCodeResponse revGeocode = new LocationIQGeoCodeResponse();

            try
            {

                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO vrp_settings (route_no, asset_id, driver_id, timestamp, rx_time, start_latitude, start_longitude, start_address, start_unit, start_building, start_postal, " +
                                                                                                                         "end_latitude, end_longitude, end_address, end_unit, end_building, end_postal, weight_capacity, volume_capacity, distance_capacity, load_duration, unload_duration, " +
                                                                                                                         "time_window_start, time_window_end, break_time_start, break_time_end, features, isOvertime, company_id) " +
                                                            "VALUES (@RouteNo, @AssetID, @DriverID, @Timestamp, @RxTime, @StartLatitude, @StartLongitude, @StartAddress, @StartUnit, @StartBuilding, @StartPostal, " +
                                                                                                                        "@EndLatitude, @EndLongitude, @EndAddress, @EndUnit, @EndBuilding, @EndPostal, @WeightCapacity, @VolumeCapacity, @DistanceCapacity, @LoadDuration, @UnLoadDuration, " +
                                                                                                                         "@TimeWindowStart, @TimeWindowEnd, @BreaktimeStart, @BreaktimeEnd, @Features, @isOvertime, @CompanyID)";
                        
                        cmd.Parameters.AddWithValue("@RouteNo", currVrpSettings.RouteNo);
                        cmd.Parameters.AddWithValue("@AssetID", currVrpSettings.AssetID);
                        cmd.Parameters.AddWithValue("@DriverID", currVrpSettings.DriverID);
                        cmd.Parameters.AddWithValue("@Timestamp", currVrpSettings.Timestamp);
                        cmd.Parameters.AddWithValue("@RxTime", currVrpSettings.RxTime);
                        cmd.Parameters.AddWithValue("@StartLatitude", currVrpSettings.StartLatitude);
                        cmd.Parameters.AddWithValue("@StartLongitude", currVrpSettings.StartLongitude);
                        cmd.Parameters.AddWithValue("@StartAddress", currVrpSettings.StartAddress);
                        cmd.Parameters.AddWithValue("@StartUnit", currVrpSettings.StartUnit);
                        cmd.Parameters.AddWithValue("@StartBuilding", currVrpSettings.StartBuilding);
                        cmd.Parameters.AddWithValue("@StartPostal", currVrpSettings.StartPostal);
                        cmd.Parameters.AddWithValue("@EndLatitude", currVrpSettings.EndLatitude);
                        cmd.Parameters.AddWithValue("@EndLongitude", currVrpSettings.EndLongitude);
                        cmd.Parameters.AddWithValue("@EndAddress", currVrpSettings.EndAddress);
                        cmd.Parameters.AddWithValue("@EndUnit", currVrpSettings.EndUnit);
                        cmd.Parameters.AddWithValue("@EndBuilding", currVrpSettings.EndBuilding);
                        cmd.Parameters.AddWithValue("@EndPostal", currVrpSettings.EndPostal);
                        cmd.Parameters.AddWithValue("@WeightCapacity", currVrpSettings.WeightCapacity);
                        cmd.Parameters.AddWithValue("@VolumeCapacity", currVrpSettings.VolumeCapacity);
                        cmd.Parameters.AddWithValue("@DistanceCapacity", currVrpSettings.DistanceCapacity);
                        cmd.Parameters.AddWithValue("@LoadDuration", currVrpSettings.LoadDuration);
                        cmd.Parameters.AddWithValue("@UnLoadDuration", currVrpSettings.UnLoadDuration);
                        cmd.Parameters.AddWithValue("@TimeWindowStart", currVrpSettings.TimeWindowStart);
                        cmd.Parameters.AddWithValue("@TimeWindowEnd", currVrpSettings.TimeWindowEnd);
                        cmd.Parameters.AddWithValue("@BreaktimeStart", currVrpSettings.BreaktimeStart);
                        cmd.Parameters.AddWithValue("@BreaktimeEnd", currVrpSettings.BreaktimeEnd);
                        cmd.Parameters.AddWithValue("@Features", currVrpSettings.Features);
                        cmd.Parameters.AddWithValue("@isOvertime", currVrpSettings.isOvertime);
                        cmd.Parameters.AddWithValue("@CompanyID", currVrpSettings.CompanyID);
                        cmd.ExecuteNonQuery();

                        long id = cmd.LastInsertedId;
                        currVrpSettings.VrpSettingsID = id;

                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(VrpSettingsRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return currVrpSettings;
        }

        public async Task<VrpSettingsInfo> AddImportAsync(VrpSettingsInfo currVrpSettings)
        {
            SettingsRepository settingRepo = new SettingsRepository();
            LocationIQForwardGeoCodeResponse start_fwGeocode = new LocationIQForwardGeoCodeResponse();
            LocationIQForwardGeoCodeResponse end_fwGeocode = new LocationIQForwardGeoCodeResponse();
            LocationIQGeoCodeResponse start_revGeocode = new LocationIQGeoCodeResponse();
            LocationIQGeoCodeResponse end_revGeocode = new LocationIQGeoCodeResponse();
            AssetFeatureInfo currFeature = new AssetFeatureInfo();
            bool isAssetDuplicated = false;

            try
            {
                string start_postal = currVrpSettings.StartPostal;
                double start_lat = 0;
                double start_long = 0;

                string end_postal = currVrpSettings.EndPostal;
                double end_lat = 0;
                double end_long = 0;

                string start_address = "";
                string start_block = "";
                string start_road = "";
                string start_building = "";
                string end_address = "";
                string end_block = "";
                string end_road = "";
                string end_building = "";


                int n;

                if (start_postal.Length == 6 && int.TryParse(start_postal, out n) == true)
                {
                    start_fwGeocode = settingRepo.GetOneMapForward(start_postal);

                    start_lat = start_fwGeocode.lat;
                    start_long = start_fwGeocode.lon;

                    start_block = start_fwGeocode.BLK_NO;
                    start_road = start_fwGeocode.ROAD_NAME;
                    start_building = start_fwGeocode.BUILDING;
                    start_address = string.Format("{0} {1}", start_block, start_road);


                    if (start_lat == 0 && start_long == 0)
                    {
                        start_address = "No Geocoding Result";
                    }
                }
                else
                {
                    start_fwGeocode = settingRepo.GetLocationIQForward(start_address);
                    start_lat = start_fwGeocode.lat;
                    start_long = start_fwGeocode.lon;

                    if (start_lat == 0 && start_lat == 0)
                    {
                        start_address = "No Geocoding Result";
                    }
                }


                if (end_postal.Length == 6 && int.TryParse(end_postal, out n) == true)
                {
                    end_fwGeocode = settingRepo.GetOneMapForward(end_postal);

                    end_lat = end_fwGeocode.lat;
                    end_long = end_fwGeocode.lon;

                    end_block = end_fwGeocode.BLK_NO;
                    end_road = end_fwGeocode.ROAD_NAME;
                    end_building = end_fwGeocode.BUILDING;
                    end_address = string.Format("{0} {1}", end_block, end_road);

                    if (end_lat == 0 && end_long == 0)
                    {
                        end_address = "No Geocoding Result";
                    }
                }
                else
                {
                    end_fwGeocode = settingRepo.GetLocationIQForward(end_address);
                    end_lat = end_fwGeocode.lat;
                    end_long = end_fwGeocode.lon;

                    if (end_lat == 0 && end_lat == 0)
                    {
                        end_address = "No Geocoding Result";
                    }
                }

                //get asset id
                long assetId = RepoHelpers.GetAssetId(currVrpSettings.Asset, currVrpSettings.CompanyID);
                if (assetId == 0)
                {
                    assetId = currVrpSettings.AssetID;
                }
                else if (assetId < 0)
                {
                    currVrpSettings.ErrorMessage = Consts.ERR_ASSETERROR;
                    return currVrpSettings;
                }

                //get driver id
                long driverId = RepoHelpers.GetDriverId(currVrpSettings.Driver, currVrpSettings.CompanyID);
                if (driverId == 0)
                {
                    driverId = currVrpSettings.DriverID;
                }
                else if (driverId < 0)
                {
                    currVrpSettings.ErrorMessage = Consts.ERR_DRIVERERROR;
                    return currVrpSettings;
                }

                //get feature id
                string featureId = RepoHelpers.GetFeatureId(currVrpSettings.Features);


                //Check Duplications
                #region
                try
                {
                    isAssetDuplicated = CheckAsset(currVrpSettings.RouteNo, assetId, currVrpSettings.CompanyID);
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-AddImport(Check existing assets)", System.Diagnostics.EventLogEntryType.Error);
                }
                #endregion

                if (isAssetDuplicated == false)
                {
                    using (MySqlConnection conn = new MySqlConnection(mConnStr))
                    {
                        using (MySqlCommand cmd = new MySqlCommand())
                        {
                            conn.Open();
                            cmd.Connection = conn;
                            cmd.CommandText = "INSERT INTO vrp_settings (route_no, asset_id, driver_id, timestamp, rx_time, start_latitude, start_longitude, start_address, start_unit, start_building, start_postal, " +
                                                                                                 "end_latitude, end_longitude, end_address, end_unit, end_building, end_postal, weight_capacity, volume_capacity, distance_capacity, load_duration, unload_duration, " +
                                                                                                 "time_window_start, time_window_end, break_time_start, break_time_end, features, isOvertime, company_id) " +
                                    "VALUES (@RouteNo, @AssetID, @DriverID, @Timestamp, @RxTime, @StartLatitude, @StartLongitude, @StartAddress, @StartUnit, @StartBuilding, @StartPostal, " +
                                                                                                "@EndLatitude, @EndLongitude, @EndAddress, @EndUnit, @EndBuilding, @EndPostal, @WeightCapacity, @VolumeCapacity, @DistanceCapacity, @LoadDuration, @UnLoadDuration, " +
                                                                                                 "@TimeWindowStart, @TimeWindowEnd, @BreaktimeStart, @BreaktimeEnd, @Features, @isOvertime, @CompanyID)";
                            
                            cmd.Parameters.AddWithValue("@RouteNo", currVrpSettings.RouteNo);
                            cmd.Parameters.AddWithValue("@AssetID", assetId);
                            cmd.Parameters.AddWithValue("@DriverID", driverId);
                            cmd.Parameters.AddWithValue("@Timestamp", currVrpSettings.Timestamp);
                            cmd.Parameters.AddWithValue("@RxTime", currVrpSettings.RxTime);
                            cmd.Parameters.AddWithValue("@StartLatitude", start_lat);
                            cmd.Parameters.AddWithValue("@StartLongitude", start_long);
                            cmd.Parameters.AddWithValue("@StartAddress", start_address);
                            cmd.Parameters.AddWithValue("@StartUnit", currVrpSettings.StartUnit);
                            cmd.Parameters.AddWithValue("@StartBuilding", start_building);
                            cmd.Parameters.AddWithValue("@StartPostal", currVrpSettings.StartPostal);
                            cmd.Parameters.AddWithValue("@EndLatitude", end_lat);
                            cmd.Parameters.AddWithValue("@EndLongitude", end_long);
                            cmd.Parameters.AddWithValue("@EndAddress", end_address);
                            cmd.Parameters.AddWithValue("@EndUnit", currVrpSettings.EndUnit);
                            cmd.Parameters.AddWithValue("@EndBuilding", end_building);
                            cmd.Parameters.AddWithValue("@EndPostal", currVrpSettings.EndPostal);
                            cmd.Parameters.AddWithValue("@WeightCapacity", currVrpSettings.WeightCapacity);
                            cmd.Parameters.AddWithValue("@VolumeCapacity", currVrpSettings.VolumeCapacity);
                            cmd.Parameters.AddWithValue("@DistanceCapacity", currVrpSettings.DistanceCapacity);
                            cmd.Parameters.AddWithValue("@LoadDuration", currVrpSettings.LoadDuration);
                            cmd.Parameters.AddWithValue("@UnLoadDuration", currVrpSettings.UnLoadDuration);
                            cmd.Parameters.AddWithValue("@TimeWindowStart", currVrpSettings.TimeWindowStart);
                            cmd.Parameters.AddWithValue("@TimeWindowEnd", currVrpSettings.TimeWindowEnd);
                            cmd.Parameters.AddWithValue("@BreaktimeStart", currVrpSettings.BreaktimeStart);
                            cmd.Parameters.AddWithValue("@BreaktimeEnd", currVrpSettings.BreaktimeEnd);
                            cmd.Parameters.AddWithValue("@Features", featureId);
                            cmd.Parameters.AddWithValue("@isOvertime", currVrpSettings.isOvertime);
                            cmd.Parameters.AddWithValue("@CompanyID", currVrpSettings.CompanyID);
                            cmd.ExecuteNonQuery();

                            long id = cmd.LastInsertedId;
                            currVrpSettings.VrpSettingsID = id;

                            conn.Close();
                        }

                        string regions = currVrpSettings.Regions;
                        string[] arrRegions = regions.Split(",".ToCharArray());
                        RegionInfo currRegion = new RegionInfo();

                        foreach (string items in arrRegions)
                        {
                            //get region id
                            long regionId = RepoHelpers.GetRegionId(items, currVrpSettings.CompanyID);
                            if (regionId == 0)
                            {
                                regionId = currRegion.RegionID;
                            }
                            else if (driverId < 0)
                            {
                                currVrpSettings.ErrorMessage = Consts.ERR_REGIONERROR;
                                return currVrpSettings;
                            }

                            using (MySqlCommand cmd = new MySqlCommand())
                            {
                                conn.Open();
                                cmd.Connection = conn;
                                cmd.CommandText = "INSERT INTO vrp_settings_area (vrp_settings_id, area_covered_region_id, timestamp, rx_time, company_id) " +
                                                                         "VALUES (@VrpSettingsID, @RegionID, @Timestamp, @RxTime, @CompanyID)";
                                
                                cmd.Parameters.AddWithValue("@VrpSettingsID", currVrpSettings.VrpSettingsID);
                                cmd.Parameters.AddWithValue("@RegionID", regionId);
                                cmd.Parameters.AddWithValue("@Timestamp", currVrpSettings.Timestamp);
                                cmd.Parameters.AddWithValue("@RxTime", currVrpSettings.RxTime);
                                cmd.Parameters.AddWithValue("@CompanyID", currVrpSettings.CompanyID);
                                cmd.ExecuteNonQuery();
                                conn.Close();
                            }

                        }


                    }
                }

    
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(VrpSettingsRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return await Task.FromResult(currVrpSettings);
        }

        public bool Remove(int id)
        {
            bool retVal = false;
            string query = string.Format("DELETE FROM vrp_settings WHERE vrp_settings_id = {0}", id);
            
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
                Logger.LogEvent(ex.Message + "-Remove(VrpSettingsRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return retVal;
        }
        public bool Update(VrpSettingsInfo currVrpSettings)
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
                        cmd.CommandText = "UPDATE vrp_settings SET route_no = @RouteNo, asset_id = @AssetID, driver_id = @DriverID, timestamp = @Timestamp, rx_time = @RxTime, start_latitude = @StartLatitude, start_longitude = @StartLongitude, start_address = @StartAddress, start_unit = @StartUnit, start_building = @StartBuilding, start_postal = @StartPostal, " +
                                                                                                                      "end_latitude = @EndLatitude, end_longitude = @EndLongitude, end_address = @EndAddress, end_unit = @EndUnit, end_building = @EndBuilding, end_postal = @EndPostal, weight_capacity = @WeightCapacity, volume_capacity = @VolumeCapacity, distance_capacity = @DistanceCapacity, load_duration = @LoadDuration, unload_duration = @UnLoadDuration, " +
                                                                                                                      "time_window_start = @TimeWindowStart, time_window_end = @TimeWindowEnd, break_time_start = @BreaktimeStart, break_time_end = @BreaktimeEnd, features = @Features, isOvertime = @isOvertime, company_id = @CompanyID " +
                                                                                                                      "WHERE vrp_settings_id = @VrpSettingsID";
                        
                        cmd.Parameters.AddWithValue("@RouteNo", currVrpSettings.RouteNo); 
                        cmd.Parameters.AddWithValue("@AssetID", currVrpSettings.AssetID);
                        cmd.Parameters.AddWithValue("@DriverID", currVrpSettings.DriverID);
                        cmd.Parameters.AddWithValue("@Timestamp", currVrpSettings.Timestamp);
                        cmd.Parameters.AddWithValue("@RxTime", currVrpSettings.RxTime);
                        cmd.Parameters.AddWithValue("@StartLatitude", currVrpSettings.StartLatitude);
                        cmd.Parameters.AddWithValue("@StartLongitude", currVrpSettings.StartLongitude);
                        cmd.Parameters.AddWithValue("@StartAddress", currVrpSettings.StartAddress);
                        cmd.Parameters.AddWithValue("@StartUnit", currVrpSettings.StartUnit);
                        cmd.Parameters.AddWithValue("@StartBuilding", currVrpSettings.StartBuilding);
                        cmd.Parameters.AddWithValue("@StartPostal", currVrpSettings.StartPostal);
                        cmd.Parameters.AddWithValue("@EndLatitude", currVrpSettings.EndLatitude);
                        cmd.Parameters.AddWithValue("@EndLongitude", currVrpSettings.EndLongitude);
                        cmd.Parameters.AddWithValue("@EndAddress", currVrpSettings.EndAddress);
                        cmd.Parameters.AddWithValue("@EndUnit", currVrpSettings.EndUnit);
                        cmd.Parameters.AddWithValue("@EndBuilding", currVrpSettings.EndBuilding);
                        cmd.Parameters.AddWithValue("@EndPostal", currVrpSettings.EndPostal);
                        cmd.Parameters.AddWithValue("@WeightCapacity", currVrpSettings.WeightCapacity);
                        cmd.Parameters.AddWithValue("@VolumeCapacity", currVrpSettings.VolumeCapacity);
                        cmd.Parameters.AddWithValue("@DistanceCapacity", currVrpSettings.DistanceCapacity);
                        cmd.Parameters.AddWithValue("@LoadDuration", currVrpSettings.LoadDuration);
                        cmd.Parameters.AddWithValue("@UnLoadDuration", currVrpSettings.UnLoadDuration);
                        cmd.Parameters.AddWithValue("@TimeWindowStart", currVrpSettings.TimeWindowStart);
                        cmd.Parameters.AddWithValue("@TimeWindowEnd", currVrpSettings.TimeWindowEnd);
                        cmd.Parameters.AddWithValue("@BreaktimeStart", currVrpSettings.BreaktimeStart);
                        cmd.Parameters.AddWithValue("@BreaktimeEnd", currVrpSettings.BreaktimeEnd);
                        cmd.Parameters.AddWithValue("@Features", currVrpSettings.Features);
                        cmd.Parameters.AddWithValue("@isOvertime", currVrpSettings.isOvertime);
                        cmd.Parameters.AddWithValue("@CompanyID", currVrpSettings.CompanyID);
                        cmd.Parameters.AddWithValue("@VrpSettingsID", currVrpSettings.VrpSettingsID);  

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
                Logger.LogEvent(ex.Message + "-Update(VrpSettingsRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }

        public bool CheckAsset(string route_no, long asset_id, int company_id)
        {
            bool retVal = false;
            string query = string.Format("SELECT * FROM vrp_settings WHERE route_no = @RouteNo and asset_id = @AssetID and company_id = @CompanyID");

            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        
                        cmd.Parameters.AddWithValue("@RouteNo", route_no);
                        cmd.Parameters.AddWithValue("@AssetID", asset_id);
                        cmd.Parameters.AddWithValue("@CompanyID", company_id);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                                retVal = true;
                            else                           
                                retVal = false;
                            
                        }

                        conn.Close();
                    }
            
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-CheckDuplicatedAssets", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }

        public bool CheckDriver(string route_no, long driver_id, int company_id)
        {
            bool retVal = false;
            string query = string.Format("SELECT * FROM vrp_settings WHERE route_no = @RouteNo and driver_id = @DriverID and company_id = @CompanyID");

            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        
                        cmd.Parameters.AddWithValue("@RouteNo", route_no);
                        cmd.Parameters.AddWithValue("@DriverID", driver_id);
                        cmd.Parameters.AddWithValue("@CompanyID", company_id);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                                retVal = true;
                            else
                                retVal = false;

                        }

                        conn.Close();
                    }

                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-CheckDuplicatedAssets", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }

    }
}