using MySql.Data.MySqlClient;
using FMSWebApi.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Hosting;
using System.Configuration;
using System.IO;
using FMSWebApi.Properties;

namespace FMSWebApi.Repository
{
    public class AssetRepository : IAssetRepository
    {
        private string mConnStr = Settings.Default.DB;

        public IEnumerable<AssetInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<AssetInfo> arrAssets = new List<AssetInfo>();

            try
            {
                conn.ConnectionString = mConnStr;
                conn.Open();

                cmd.CommandText = "view_assets";
                cmd.Connection = conn;
                cmd.CommandType = CommandType.TableDirect;
                using (MySqlDataReader reader = cmd.ExecuteReader())
                {
                    //Console.WriteLine(String.Format("Total Data: {0}", dbRdr.FieldCount));
                    if ((reader != null) && (reader.HasRows))
                    {
                        while (reader.Read())
                        {
                            AssetInfo currAsset = DataMgrTools.BuildAsset(reader);
                            string strFill = "";
                            currAsset.Image = GetImage(String.Format("drivers/{0}", currAsset.DriverID), ref strFill);
                            currAsset.ImageFill = strFill;
                            arrAssets.Add(currAsset);
                        }
                    }
                }
            }
            catch (MySqlException ex)
            {
                Logger.LogEvent("view_assets: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }

            conn.Close();

            try
            {
                conn.Open();
                for (int i = 0; i < arrAssets.Count; i++)
                {

                    // cmd.CommandText = string.Format("SELECT * FROM view_positions where asset_id = {0}", arrAssets[i].AssetID);
                    string strSql = string.Format("SELECT * FROM view_positions where pos_id = {0}", arrAssets[i].LastPosID);

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
                                arrAssets[i].LastGps = currPos;
                                arrAssets[i].LastPos = currPos;
								TimeSpan tsDiff = DateTime.Now.ToUniversalTime() - currPos.Timestamp;
                                // check report interval
                                double lLimit = 10;
                                if (lLimit > 0)
                                {
                                    // check gprs status
                                    if (tsDiff.TotalMinutes < lLimit * 2)
                                        arrAssets[i].Gprs = (int)Enums.StatusColorInt.GREEN;
                                    else if (tsDiff.TotalMinutes < lLimit * 3)
                                        arrAssets[i].Gprs = (int)Enums.StatusColorInt.AMBER;
                                }
                            }
                        }
                        else
                        {
                            arrAssets[i].LastGps = currPos;
                            arrAssets[i].LastPos = currPos;
                        }

                    }
                }
                conn.Close();
            }
            catch(Exception ex)
            {
                Logger.LogEvent("GetAll-view_positions: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }


            try
            {
                conn.Open();
                for (int i = 0; i < arrAssets.Count; i++)
                {
                    string query = string.Format("SELECT * FROM view_drivers where driver_id = {0}", arrAssets[i].DriverID);

                    cmd.CommandText = query;
                    cmd.Connection = conn;
                    cmd.CommandType = CommandType.Text;
                    using (MySqlDataReader reader = cmd.ExecuteReader())
                    {
                        DriverInfo currDriver = new DriverInfo();
                        if ((reader != null) && (reader.HasRows))
                        {
                            while (reader.Read())
                            {
                                currDriver = DataMgrTools.BuildDriver(reader);
                                string strFill = "";
                                currDriver.Image = GetImage(String.Format("drivers/{0}", currDriver.DriverID), ref strFill);
                                currDriver.ImageFill = strFill;
                                arrAssets[i].Driver = currDriver;
                            }
                        }
                        else
                        {
                            arrAssets[i].Driver = currDriver;

                        }

                    }
                }
                conn.Close();               
            }
            catch (Exception ex)
            {
                Logger.LogEvent("GetAll-view_driver: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }

            if(conn != null)
                conn.Close();

            return arrAssets.ToArray();
        }

        public AssetInfo Get(int assetID)
        {
            AssetInfo currAsset = new AssetInfo();
            string query = string.Format("SELECT * FROM view_assets WHERE asset_id = {0}", assetID);

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
                            currAsset = DataMgrTools.BuildAsset(reader);
                        }
                        conn.Close();
                    }
                }
                catch(Exception ex)
                {
                    conn.Close();
                }
            }
            return currAsset;
        }

        public AssetInfo GetByTagName(string tagName)
        {
            //Logger.LogEvent("tagName: " + tagName, System.Diagnostics.EventLogEntryType.Error);//testing
            AssetInfo currAsset = new AssetInfo();
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
                    Logger.LogEvent(ex.Message + "-GetByTagName", System.Diagnostics.EventLogEntryType.Error);
                    conn.Close();
                }
            }
            return currAsset;
        }

        public IEnumerable<AssetInfo> GetAssetsEx(UserInfo param)
        {

            List<AssetInfo> arrAssets = new List<AssetInfo>();

            string query = "";
            object objTemp = new object();

                  
            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {

                try
                {
                    RoleRepository roleRepo = new RoleRepository();

                    if (roleRepo.GetByUserID(param.UserID) > 0)                    
                    {

                        query = String.Format("SELECT assets FROM users WHERE user_id = {0}", param.UserID);
                        
                         using (MySqlCommand cmd = new MySqlCommand(query, conn))
                         {
                             conn.Open(); 

                            // limit assets to user's company only
                             objTemp = cmd.ExecuteScalar();


                             conn.Close();
                           
                         }

                    }

                }
                catch (Exception ex)
                {

                    Logger.LogEvent(ex.Message + "-Get(AssetsEx)", System.Diagnostics.EventLogEntryType.Error);
                }


                try
                {

                    query = string.Format("SELECT * FROM view_assets WHERE reseller_id = {0}", param.ResellerID);

                    if (param.CompanyID > 0) query += " and company_id = @CompanyID";

                    if ((objTemp != null) && (objTemp.ToString() != ""))
                        query += String.Format(" AND asset_id IN ({0})", objTemp);

                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@ResellerID", param.ResellerID);

                        if (param.CompanyID > 0) cmd.Parameters.AddWithValue("@CompanyID", param.CompanyID);

                        MySqlDataReader reader = cmd.ExecuteReader();
                        if ((reader != null) && (reader.HasRows))
                        { 
                            while (reader.Read())
                            {
                                AssetInfo currAsset = DataMgrTools.BuildAsset(reader);
                                string strFill = "";
                                currAsset.Image = GetImage(String.Format("drivers/{0}", currAsset.DriverID), ref strFill);
                                currAsset.ImageFill = strFill;
                                arrAssets.Add(currAsset);
                            }
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent("GetAll-view_assets by companyID: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                    if (conn != null)
                        conn.Close(); 
                }



                try
                {

                  for (int i = 0; i < arrAssets.Count; i++)
                    {
                    query = string.Format("SELECT * FROM view_positions where pos_id = {0}", arrAssets[i].LastPosID);


                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        MySqlDataReader reader = cmd.ExecuteReader();
                        PosInfo currPos = new PosInfo();
                        if ((reader != null) && (reader.HasRows))
                        {
                            while (reader.Read())
                            {
                                currPos = DataMgrTools.BuildPosition(reader);
                                arrAssets[i].LastGps = currPos;
                                arrAssets[i].LastPos = currPos;
                                TimeSpan tsDiff = DateTime.Now.ToUniversalTime() - currPos.Timestamp;
                                // check report interval
                                double lLimit = 10;
                                if (lLimit > 0)
                                {
                                    // check gprs status
                                    if (tsDiff.TotalMinutes < lLimit * 2)
                                        arrAssets[i].Gprs = (int)Enums.StatusColorInt.GREEN;
                                    else if (tsDiff.TotalMinutes < lLimit * 3)
                                        arrAssets[i].Gprs = (int)Enums.StatusColorInt.AMBER;
                                }
                            }
                        }
                        else
                        {
                            arrAssets[i].LastGps = currPos;
                            arrAssets[i].LastPos = currPos;
                        }
                        conn.Close();
                    }
                  }
                  //conn.Close();
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
                        for (int i = 0; i < arrAssets.Count; i++)
                        {
                            query = string.Format("SELECT * FROM view_drivers where driver_id = {0}", arrAssets[i].DriverID);

                            cmd.CommandText = query;
                            cmd.Connection = conn;
                            cmd.CommandType = CommandType.Text;
                            using (MySqlDataReader reader = cmd.ExecuteReader())
                            {
                                DriverInfo currDriver = new DriverInfo();
                                if ((reader != null) && (reader.HasRows))
                                {
                                    while (reader.Read())
                                    {
                                        currDriver = DataMgrTools.BuildDriver(reader);
                                        arrAssets[i].Driver = currDriver;
                                    }
                                }
                                else
                                {
                                    arrAssets[i].Driver = currDriver;

                                }

                            }
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent("GetAll-view_driver: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                }



                if (conn != null)
                    conn.Close();            
            
            }
        
            //return arrAssets;
            return arrAssets.ToArray();
           
         }
        
        public AssetInfo Add(AssetInfo currAsset) 
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;

                        //get category id
                        int catId = RepoHelpers.GetCategoryId(currAsset.Category);
                        if (catId <= 0)
                        {
                            currAsset.ErrorMessage = Consts.ERR_ASSET_CATEGORYERROR;
                            return currAsset;
                        }

                        //get tag id
                        int tagId = RepoHelpers.GetTagId(currAsset.Tag);
                        if (tagId < 0)
                        {
                            currAsset.ErrorMessage = Consts.ERR_ASSET_DEVICEINUSE;
                            return currAsset;
                        }

                        //get company id
                        //int coyId = RepoHelpers.GetCompanyId(currAsset.Company);
                        //if (coyId < 0)
                        //{
                        //    currAsset.ErrorMessage = Consts.ERR_COMPANYERROR;
                        //    return currAsset;
                        //}


                        Logger.LogEvent("Entered Repository: " + currAsset.Name, System.Diagnostics.EventLogEntryType.Information);//testing
                        cmd.CommandText = "INSERT INTO assets (name, category_id, tag_id, phone, email, home, restricted, " +
                               "curfew_start, curfew_end, status_id, idle_limit, speed_limit, mileage, mileage_dist, mileage_date, " +
                               "driver_id, last_event, last_pos, last_fix, last_gps, company_id, notifications, install_date, asset_remarks) VALUES (@Name, @CategoryID, " +
                               "@TagID, @Phone, @Email, @Home, @AlertZones, @CurfewStart, @CurfewEnd, 0, @IdleLimit, @SpeedLimit, @Mileage, " +
                               "@MileageDist, @MileageDate, @DriverID, 0, 0, 0, 0, @CompanyID, @Notifications, @InstallDate, @AssetRemarks)";

                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@Name", currAsset.Name);
                        cmd.Parameters.AddWithValue("@CategoryID", catId);
                        cmd.Parameters.AddWithValue("@TagID", tagId);
                        //cmd.Parameters.AddWithValue("@CompanyID", coyId);
                        cmd.Parameters.AddWithValue("@CompanyID", currAsset.CompanyID);
                        cmd.Parameters.AddWithValue("@Phone", currAsset.Phone);
                        cmd.Parameters.AddWithValue("@Email", currAsset.Email);
                        cmd.Parameters.AddWithValue("@Home", currAsset.Home);
                        cmd.Parameters.AddWithValue("@AlertZones", currAsset.AlertZones);
                        cmd.Parameters.AddWithValue("@CurfewStart", currAsset.CurfewStart);
                        cmd.Parameters.AddWithValue("@CurfewEnd", currAsset.CurfewEnd);
                        //cmd.Parameters.AddWithValue("@IdleLimit", currAsset.IdleLimit);
                        cmd.Parameters.AddWithValue("@IdleLimit", 0);
                        cmd.Parameters.AddWithValue("@SpeedLimit",  currAsset.SpeedLimit);
                        //cmd.Parameters.AddWithValue("@SpeedLimit", 0);
                        cmd.Parameters.AddWithValue("@Mileage", currAsset.Mileage);
                        //cmd.Parameters.AddWithValue("@MileageDist", currAsset.MileageDist);
                        cmd.Parameters.AddWithValue("@MileageDist", 0);
                        //cmd.Parameters.AddWithValue("@MileageDate", currAsset.MileageDate);
                        cmd.Parameters.AddWithValue("@MileageDate", DateTime.UtcNow);
                        cmd.Parameters.AddWithValue("@DriverID", currAsset.DriverID);
                        //cmd.Parameters.AddWithValue("@Notifications", currAsset.Notifications);
                        cmd.Parameters.AddWithValue("@Notifications", "");
                        //cmd.Parameters.AddWithValue("@InstallDate", currAsset.InstallDate);
                        //cmd.Parameters.AddWithValue("@InstallDate", DateTime.UtcNow);
                        cmd.Parameters.AddWithValue("@InstallDate", DateTime.UtcNow);
                        cmd.Parameters.AddWithValue("@AssetRemarks", currAsset.Remarks);

                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }
            }
            catch(Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(AssetInfo)", System.Diagnostics.EventLogEntryType.Error);
            }

            return currAsset;
        }

        public bool Remove(int assetID) 
        {
            bool retVal = false;
            string query = string.Format("DELETE FROM assets WHERE asset_id = {0}", assetID);

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
                    Logger.LogEvent(ex.Message + "-Remove Asset", System.Diagnostics.EventLogEntryType.Error);
                    conn.Close();
                }
            }
            
            return retVal;
        }

        public bool Update(AssetInfo currAsset) 
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

                        //get category id
                        int catId = currAsset.CategoryID;
                        if (catId <= 0)
                        {
                            catId = RepoHelpers.GetCategoryId(currAsset.Category);
                            if (catId <= 0)
                            {
                                currAsset.ErrorMessage = Consts.ERR_ASSET_CATEGORYERROR;
                                return false;
                            }
                        }

                        //get tag id
                        int tagId = currAsset.TagID;
                        if (tagId <= 0)
                        {
                            tagId = RepoHelpers.GetTagId(currAsset.Tag);
                            if (tagId <= 0)
                            {
                                currAsset.ErrorMessage = Consts.ERR_ASSET_DEVICEINUSE;
                                return false;
                            }
                        }

                        //get company id
                        //int coyId = currAsset.CompanyID;
                        //if (coyId <= 0)
                        //{
                        //    coyId = RepoHelpers.GetCompanyId(currAsset.Company);
                        //    if (coyId <= 0)
                        //    {
                        //        currAsset.ErrorMessage = Consts.ERR_COMPANYERROR;
                        //        return false;
                        //    }
                        //}


                        cmd.CommandText = "UPDATE assets SET name = @Name, category_id = @CategoryID, tag_id = @TagID, company_id = @CompanyID, " +
                            "phone = @Phone, email = @Email, home = @Home, restricted = @AlertZones, curfew_start = @CurfewStart, curfew_end = @CurfewEnd, " +
                            "idle_limit = @IdleLimit, speed_limit = @SpeedLimit, mileage = @Mileage, mileage_dist = @MileageDist, " +
                            "mileage_date = @MileageDate, driver_id = @DriverID, notifications = @Notifications, " +
                            "install_date = @InstallDate, asset_remarks = @AssetRemarks " +
                                "WHERE asset_id = @AssetID";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@Name", currAsset.Name);
                        cmd.Parameters.AddWithValue("@CategoryID", catId);
                        cmd.Parameters.AddWithValue("@TagID", tagId);
                        //cmd.Parameters.AddWithValue("@CompanyID", coyId);
                        cmd.Parameters.AddWithValue("@CompanyID", currAsset.CompanyID);
                        cmd.Parameters.AddWithValue("@Phone", currAsset.Phone);
                        cmd.Parameters.AddWithValue("@Email", currAsset.Email);
                        cmd.Parameters.AddWithValue("@Home", currAsset.Home);
                        cmd.Parameters.AddWithValue("@AlertZones", currAsset.AlertZones);
                        cmd.Parameters.AddWithValue("@CurfewStart", currAsset.CurfewStart);
                        cmd.Parameters.AddWithValue("@CurfewEnd", currAsset.CurfewEnd);
                        cmd.Parameters.AddWithValue("@IdleLimit", 0);
                        cmd.Parameters.AddWithValue("@SpeedLimit", currAsset.SpeedLimit);
                        cmd.Parameters.AddWithValue("@Mileage", currAsset.Mileage);
                        cmd.Parameters.AddWithValue("@MileageDist", 0);
                        cmd.Parameters.AddWithValue("@MileageDate", DateTime.UtcNow);
                        cmd.Parameters.AddWithValue("@DriverID", currAsset.DriverID);
                        cmd.Parameters.AddWithValue("@Notifications", "");
                        cmd.Parameters.AddWithValue("@InstallDate", DateTime.UtcNow);
                        cmd.Parameters.AddWithValue("@AssetRemarks", currAsset.Remarks);
                        cmd.Parameters.AddWithValue("@AssetID", currAsset.AssetID);

                        //cmd.CommandText = "UPDATE assets SET name = @Name, category_id = @CategoryID, tag_id = @TagID, company_id = @CompanyID, " +
                        //        "phone = @Phone, email = @Email, home = @Home, restricted = @AlertZones, curfew_start = @CurfewStart, curfew_end = @CurfewEnd " +
                        //        "WHERE asset_id = @AssetID";
                        //cmd.Prepare();
                        //cmd.Parameters.AddWithValue("@Name", currAsset.Name);
                        //cmd.Parameters.AddWithValue("@CategoryID", currAsset.CategoryID);
                        //cmd.Parameters.AddWithValue("@TagID", currAsset.TagID);
                        //cmd.Parameters.AddWithValue("@CompanyID", currAsset.CompanyID);
                        //cmd.Parameters.AddWithValue("@Phone", currAsset.Phone);
                        //cmd.Parameters.AddWithValue("@Email", currAsset.Email);
                        //cmd.Parameters.AddWithValue("@Home", currAsset.Home);
                        //cmd.Parameters.AddWithValue("@AlertZones", currAsset.AlertZones);
                        //cmd.Parameters.AddWithValue("@CurfewStart", currAsset.CurfewStart);
                        //cmd.Parameters.AddWithValue("@CurfewEnd", currAsset.CurfewEnd);
                        //cmd.Parameters.AddWithValue("@IdleLimit", 0);
                        //cmd.Parameters.AddWithValue("@SpeedLimit", 0);
                        //cmd.Parameters.AddWithValue("@Mileage", currAsset.Mileage);
                        //cmd.Parameters.AddWithValue("@MileageDist", 0);
                        //cmd.Parameters.AddWithValue("@MileageDate", DateTime.UtcNow);
                        //cmd.Parameters.AddWithValue("@Driver", currAsset.Driver);
                        //cmd.Parameters.AddWithValue("@Notifications", "");
                        //cmd.Parameters.AddWithValue("@InstallDate", DateTime.UtcNow);
                        //cmd.Parameters.AddWithValue("@AssetRemarks", currAsset.Remarks);
                        //cmd.Parameters.AddWithValue("@AssetID", currAsset.AssetID);
                        
                        if (cmd.ExecuteNonQuery() == 1)
                            retVal = true;
                        else
                            retVal = false;
                        conn.Close();
                    }
                }
            }
            catch(Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Update(AssetRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }


        /// <summary>
        /// updates asset's latest settings
        /// </summary>
        /// <param name="dbMgr"></param>
        /// <param name="posTypeID"></param>
        /// <param name="iValue"></param>
        /// <param name="iAssetID"></param>
        /// <param name="dtTimestamp"></param>
        public void SaveAssetInfo(Enums.PosInfoType posTypeID, long iPosID, int iAssetID, DateTime dtTimestamp)
        {  

            string query = "";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {

                try
                {
                    query = "INSERT INTO assetinfo (`asset_id`, `postype_id`, `pos_id`, `timestamp`, `notified`) VALUES (@AssetID, @PosTypeID, @PosID, @Timestamp, 0)";

                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        Logger.LogEvent("Enter SaveAssetInfo: ", System.Diagnostics.EventLogEntryType.Error);    
                        conn.Open();
                        cmd.Prepare();
                        //query = string.Format("INSERT INTO assetinfo (asset_id, postype_id, pos_id, timestamp, notified) " +
                        //"VALUES (@AssetID, @PosTypeID, @PosID, @Timestamp, 0)", new object[] { iAssetID, (int)posTypeID, iPosID, dtTimestamp });

                        cmd.CommandText = query;
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@AssetID", iAssetID);
                        cmd.Parameters.AddWithValue("@PostTypeID", posTypeID);
                        cmd.Parameters.AddWithValue("@PosID", iPosID);
                        cmd.Parameters.AddWithValue("@Timestamp", dtTimestamp);
                        cmd.Parameters.AddWithValue("@Notified", 0);
                        cmd.ExecuteNonQuery();
                        conn.Close();

                        if ((int)posTypeID == 15)
                            Logger.LogEvent("Save RFID", 0);
                    }            
                }
                catch (Exception ex)
                {
                    Logger.LogEvent("SaveAssetInfo Exception: ", ex.Message, System.Diagnostics.EventLogEntryType.Error);
                }

                try
                {
                    query = string.Format("DELETE FROM assetinfo WHERE postype_id = @PosTypeID AND " +
                                   "asset_id = @AssetId", (int)posTypeID, iAssetID);


                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        cmd.Prepare();
                        cmd.CommandText = query;
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@PosTypeID", posTypeID);
                        cmd.Parameters.AddWithValue("@AssetID", iAssetID);
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }

                }

                catch (Exception ex)
                {
                    Logger.LogEvent("DELETE AssetInfo: ", ex.Message, System.Diagnostics.EventLogEntryType.Error);
                }
            }

       }

        /// <summary>
        /// gets image file
        /// </summary>
        /// <param name="strName"></param>
        /// <param name="strDefault"></param>
        /// <param name="strFill"></param>
        /// <returns></returns>
        public string GetImage(string strName, ref string strFill)
        {
            try
            {
                // loop through image file types
                List<string> arrTypes = new List<string>() { "jpg", "png", "gif", "bmp" };
                foreach (string strType in arrTypes)
                {
                    string strTemp = String.Format("{0}.{1}", strName, strType);
                    string strFile = String.Format("{0}images\\{1}", HostingEnvironment.ApplicationPhysicalPath, strTemp);
                    //string strUri = String.Format("{0}/images/{1}", ConfigurationManager.AppSettings["ServerPath"], strTemp);
                    string strUri = String.Format("{0}/images/{1}", "http://103.237.168.119/trackdemowebapi", strTemp);

                    // check file path
                    if (File.Exists(strFile))
                    {
                        // return image path
                        strFill = "Uniform";
                        return String.Format("{0}?dt={1:ddMMMyyHHmmss}", strUri, File.GetLastWriteTimeUtc(strFile));
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent("Get Image: ", ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }

            // image file not found
            strFill = "None";
            return strName;
        }



    }
}

     