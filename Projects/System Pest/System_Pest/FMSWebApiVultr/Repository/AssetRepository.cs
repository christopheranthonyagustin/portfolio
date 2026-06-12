using MySqlConnector;
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
        private string mConnStr = "server=127.0.0.1;uid=root;pwd=@c3c0M;database=sp;charset=utf8;max pool size=500;SSL Mode=None;";

        public IEnumerable<AssetInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<AssetInfo> arrAssets = new List<AssetInfo>();

            try
            {
                conn.ConnectionString = mConnStr;
                conn.Open();

                cmd.CommandText = "SELECT * FROM view_assets";
                cmd.Connection = conn;
                cmd.CommandType = CommandType.Text;
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

                                // check fix
                                if ((arrAssets[i].LastFixID == arrAssets[i].LastPosID) && (arrAssets[i].LastPos != null))
                                {
                                    // check gps status
                                    switch (arrAssets[i].LastPos.FixID)
                                    {
                                        case -1: arrAssets[i].Gps = 1; break;
                                        case 1:
                                        case 2: arrAssets[i].Gps = 0; break;
                                    }
                                }

                                // check last position
                                if (arrAssets[i].LastPos != null)
                                {
                                    // check if last position is no fix
                                    if (currPos.FixID == 0)
                                    {
                                        // check last gps fix
                                        switch (arrAssets[i].LastPos.FixID)
                                        {
                                            case 1: arrAssets[i].LastPos.FixID = 3; break;
                                            case 2: arrAssets[i].LastPos.FixID = 4; break;
                                        }

                                        // check last gps fix
                                        switch (arrAssets[i].LastPos.FixID)
                                        {
                                            case 3:
                                            case 4: arrAssets[i].LastPos.Fix = "Last Known GPS"; break;
                                        }
                                    }
                                }

                                // check report interval
                                double lLimit = 60;
                                if (lLimit > 0)
                                {
                                    // check gprs status
                                    if (tsDiff.TotalSeconds < lLimit * 2)
                                        arrAssets[i].Gprs = (int)Enums.StatusColorInt.GREEN;
                                    else if (tsDiff.TotalSeconds < lLimit * 3)
                                        arrAssets[i].Gprs = (int)Enums.StatusColorInt.AMBER;

                                    // check gps status
                                    if (tsDiff.TotalSeconds < lLimit * 2)
                                        arrAssets[i].Gps = (int)Enums.GPSStatusColorInt.GREEN;
                                    else if (tsDiff.TotalSeconds < lLimit * 3)
                                        arrAssets[i].Gps = (int)Enums.GPSStatusColorInt.RED;

                                     // check ignition
                                    if (tsDiff.TotalSeconds < lLimit * 2)
                                        arrAssets[i].Ignition = (int)Enums.IgnitionStatusColorInt.GREEN;
                                    else if (tsDiff.TotalSeconds < lLimit * 3)
                                        arrAssets[i].Ignition = (int)Enums.IgnitionStatusColorInt.RED;

                                    // check gps status
                                    if (DateTime.Now.ToUniversalTime() > currPos.Timestamp && arrAssets[i].Ignition != 1)
                                    {
                                        // get engine status
                                        switch (arrAssets[i].LastPos.Engine)
                                        {
                                            case "STOP": arrAssets[i].Engine = "STOP";
                                                break;
                                            case "IDLE": arrAssets[i].Engine = "STOP";
                                                break;
                                            case "MOVE": arrAssets[i].Engine = "STOP";
                                                break;
                                        }
                                    }
                                    else
                                    {
                                        switch (arrAssets[i].LastPos.Engine)
                                        {
                                            case "STOP": arrAssets[i].Engine = "STOP";
                                                break;
                                            case "IDLE": arrAssets[i].Engine = "IDLE";
                                                break;
                                            case "MOVE": arrAssets[i].Engine = "MOVE";
                                                break;
                                        }
                                    }
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

            //Get Jobs
            try
            {
                conn.Open();
                for (int i = 0; i < arrAssets.Count; i++)
                {
                    string strSql = string.Format("SELECT * FROM view_jobs where asset_id = {0} order by job_id desc LIMIT 1", arrAssets[i].AssetID);

                    cmd.CommandText = strSql;
                    cmd.Connection = conn;
                    cmd.CommandType = CommandType.Text;
                    using (MySqlDataReader reader = cmd.ExecuteReader())
                    {
                        JobInfo currJob = new JobInfo();
                        if ((reader != null) && (reader.HasRows))
                        {
                            while (reader.Read())
                            {
                                currJob = DataMgrTools.BuildJob(reader);
                                arrAssets[i].Jobs = currJob;
                            }
                        }
                        else
                        {
                            arrAssets[i].Jobs = currJob;

                        }

                    }
                }
                conn.Close();
            }
            catch (Exception ex)
            {
                Logger.LogEvent("GetAll-view_jobs: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }

            if(conn != null)
                conn.Close();

            return arrAssets.ToArray();
        }

        public IEnumerable<AssetInfo> ClearAssets()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<AssetInfo> arrAssets = new List<AssetInfo>();

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
                    Logger.LogEvent(ex.Message + "-GetAssetID", System.Diagnostics.EventLogEntryType.Error);
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
                        cmd.Parameters.AddWithValue("@Tag", tagName);
                        //cmd.Prepare();
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

                    if (param.CompanyID == 1) query += " and company_id IN (1,3)";
                       else query += " and company_id = @CompanyID";

                    if (!string.IsNullOrEmpty(param.Assets)) query += " and asset_id = (SELECT asset_id FROM view_assets WHERE name = @AssetName)";
                    if ((objTemp != null) && (objTemp.ToString() != ""))
                        query += String.Format(" AND asset_id IN ({0})", objTemp);
                        query += " order by name asc";

                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();                      
                        cmd.Parameters.AddWithValue("@ResellerID", param.ResellerID);
                        
                        if (param.CompanyID > 0) cmd.Parameters.AddWithValue("@CompanyID", param.CompanyID);

                        if (!string.IsNullOrEmpty(param.Assets)) cmd.Parameters.AddWithValue("@AssetName", param.Assets);

                        cmd.Prepare();

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
                    Logger.LogEvent("GetAll-view_assets by CompanyID: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                    if (conn != null)
                        conn.Close(); 
                }



                try
                {
                  PosInfo currPos = new PosInfo();
                  for (int i = 0; i < arrAssets.Count; i++)
                    {
                    query = string.Format("SELECT * FROM view_positions where pos_id = {0}", arrAssets[i].LastPosID);

                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        MySqlDataReader reader = cmd.ExecuteReader();
                        if ((reader != null) && (reader.HasRows))
                        {
                            while (reader.Read())
                            {
                                currPos = DataMgrTools.BuildPosition(reader);
                                arrAssets[i].LastGps = currPos;
                                arrAssets[i].LastPos = currPos;
                                TimeSpan tsDiff = DateTime.Now.ToUniversalTime() - currPos.Timestamp;

                                // check fix
                                //if ((arrAssets[i].LastFixID == arrAssets[i].LastPosID) && (arrAssets[i].LastPos != null))
                                //{
                                //    // check gps status
                                //    switch (arrAssets[i].LastPos.FixID)
                                //    {
                                //        case -1: arrAssets[i].Gps = 1; break;
                                //        case 1:
                                //        case 2: arrAssets[i].Gps = 0; break;
                                //    }
                                //}

                                // check last position
                                if (arrAssets[i].LastPos != null)
                                {
                                    // check if last position is no fix
                                    if (currPos.FixID == 0)
                                    {
                                        // check last gps fix
                                        switch (arrAssets[i].LastPos.FixID)
                                        {
                                            case 1: arrAssets[i].LastPos.FixID = 3; break;
                                            case 2: arrAssets[i].LastPos.FixID = 4; break;
                                        }

                                        // check last gps fix
                                        switch (arrAssets[i].LastPos.FixID)
                                        {
                                            case 3:
                                            case 4: arrAssets[i].LastPos.Fix = "Last Known GPS"; break;
                                        }
                                    }
                                }

                                // check report interval
                                double lLimit = 60;
                                if (lLimit > 0)
                                {
                                    // check gprs status
                                    if (tsDiff.TotalSeconds < lLimit * 2)
                                        arrAssets[i].Gprs = (int)Enums.StatusColorInt.GREEN;
                                    else if (tsDiff.TotalSeconds < lLimit * 3)
                                        arrAssets[i].Gprs = (int)Enums.StatusColorInt.AMBER;

                                    // check gps status
                                    if (tsDiff.TotalSeconds < lLimit * 2)
                                        arrAssets[i].Gps = (int)Enums.GPSStatusColorInt.GREEN;
                                    else if (tsDiff.TotalSeconds < lLimit * 3)
                                        arrAssets[i].Gps = (int)Enums.GPSStatusColorInt.RED;

                                    // check ignition
                                    if (tsDiff.TotalSeconds < lLimit * 2)
                                        arrAssets[i].Ignition = (int)Enums.IgnitionStatusColorInt.GREEN;
                                    else if (tsDiff.TotalSeconds < lLimit * 3)
                                        arrAssets[i].Ignition = (int)Enums.IgnitionStatusColorInt.RED;

                                    // check gps status
                                    if (DateTime.Now.ToUniversalTime() > currPos.Timestamp && arrAssets[i].Ignition != 1)
                                    {
                                        // get engine status
                                        switch (arrAssets[i].LastPos.Engine)
                                        {
                                            case "STOP": arrAssets[i].Engine = "STOP";
                                                break;
                                            case "IDLE": arrAssets[i].Engine = "STOP";
                                                break;
                                            case "MOVE": arrAssets[i].Engine = "STOP";
                                                break;
                                        }
                                    }
                                    else
                                    {
                                        arrAssets[i].Engine = arrAssets[i].LastPos.Engine;
                                    }
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

                    if (DateTime.Now.ToUniversalTime() > currPos.Timestamp && arrAssets[i].Ignition != 1 && currPos.FixID == 2)
                    {
                        query = "UPDATE positions SET speed = @Speed, ignition = @Ignition, engine = @Engine, fix = @FixID WHERE pos_id = @LastPosID";
                        try
                        {
                            using (MySqlCommand cmd = new MySqlCommand(query, conn))
                            {
                                conn.Open();
                                cmd.Connection = conn;
                                cmd.CommandText = query;                           
                                cmd.Parameters.AddWithValue("@Speed", 0);
                                cmd.Parameters.AddWithValue("@Ignition", 0);
                                cmd.Parameters.AddWithValue("@Engine", 0);
                                cmd.Parameters.AddWithValue("@FixID", 4);
                                cmd.Parameters.AddWithValue("@LastPosID", arrAssets[i].LastPosID);
                                //cmd.Prepare();
                                cmd.ExecuteNonQuery();
                                conn.Close();
                            }
                        }
                        catch (Exception ex)
                        {
                            Logger.LogEvent("Update Last Positions: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                        }
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

                try
                {

                    for (int i = 0; i < arrAssets.Count; i++)
                    {
                        //query = string.Format("SELECT * FROM view_jobs where asset_id = {0} order by job_id desc LIMIT 1", arrAssets[i].AssetID);
                        query = string.Format("SELECT * FROM view_jobs where driver_id = {0} and company_id = {1} and flag NOT IN (0, 7, 8) and timestamp >= CURDATE() AND timestamp < CURDATE() + INTERVAL 1 DAY order by timestamp asc LIMIT 1", arrAssets[i].DriverID, arrAssets[i].CompanyID);

                        using (MySqlCommand cmd = new MySqlCommand(query, conn))
                        {
                            conn.Open();
                            MySqlDataReader reader = cmd.ExecuteReader();
                            JobInfo currJob = new JobInfo();
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currJob = DataMgrTools.BuildJob(reader);
                                    arrAssets[i].Jobs = currJob;                              
                                }
                            }
                            else
                            {
                                arrAssets[i].Jobs = currJob;
                            }
                            conn.Close();
                        }
                    }

                }
                catch (Exception ex)
                {
                    Logger.LogEvent("GetAssetEx-view_jobs: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                }



                if (conn != null)
                    conn.Close();            
            
            }
        
            //return arrAssets;
            return arrAssets.ToArray();
           
         }

        public IEnumerable<AssetInfo> GetByDriver(AssetInfo param)
        {

            List<AssetInfo> arrAssets = new List<AssetInfo>();
            AssetInfo currAsset = new AssetInfo();
            object objTemp = new object();

            string query = "SELECT * FROM view_assets WHERE driver_name = @DriverName";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();                
                        cmd.Parameters.AddWithValue("@DriverName", param.DriverName);
                        //cmd.Prepare();
                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currAsset = DataMgrTools.BuildAsset(reader);
                                    arrAssets.Add(currAsset);
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(GetByDriver)", System.Diagnostics.EventLogEntryType.Error);

                }


            }

            return arrAssets;
        }

        public IEnumerable<AssetInfo> GetByAssetID(AssetInfo param)
        {

            List<AssetInfo> arrAssets = new List<AssetInfo>();
            AssetInfo currAsset = new AssetInfo();
            object objTemp = new object();

            string query = "SELECT * FROM view_assets WHERE asset_id = @AssetID";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();                    
                        cmd.Parameters.AddWithValue("@AssetID", param.AssetID);
                        //cmd.Prepare();
                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currAsset = DataMgrTools.BuildAsset(reader);
                                    arrAssets.Add(currAsset);
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(GetByAssetID)", System.Diagnostics.EventLogEntryType.Error);

                }


            }

            return arrAssets;
        }

        public IEnumerable<AssetInfo> GetByAsset(AssetInfo param)
        {

            List<AssetInfo> arrAssets = new List<AssetInfo>();
            AssetInfo currAsset = new AssetInfo();
            object objTemp = new object();

            string query = "SELECT * FROM view_assets WHERE name = @Name";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();                        
                        cmd.Parameters.AddWithValue("@Name", param.Name);
                        //cmd.Prepare();
                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currAsset = DataMgrTools.BuildAsset(reader);
                                    arrAssets.Add(currAsset);
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(GetByAsset)", System.Diagnostics.EventLogEntryType.Error);

                }


            }

            return arrAssets;
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

                        int tagId = 0;
                        //get tag id
                        if (currAsset.Tag == "0")
                        {
                            tagId = 0;
                        }
                        else
                        {
                            tagId = RepoHelpers.GetTagId(currAsset.Tag);
                        }

                        if (tagId < 0)
                        {
                            currAsset.ErrorMessage = Consts.ERR_ASSET_DEVICEINUSE;
                            return currAsset;
                        }

                        //get company id
                        //int coyId = RepoHelpers.GetCompanyID(currAsset.Company);
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
                        cmd.Parameters.AddWithValue("@AssetRemarks", "0");
                        //cmd.Prepare();
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
        public AssetInfo GetAssetByTag(AssetInfo item)
        {
            AssetInfo currAsset = new AssetInfo();
            DriverInfo currDriver = new DriverInfo();
            DriverRepository driverRepo = new DriverRepository();

            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {

                    #region GET THE LINKED ASSET
                    try
                    {
                        currAsset = GetByTagName(item.Tag);
                        if (item == null) currAsset.Name = "Asset Not Found";
                        //Logger.LogEvent("Check Asset:" + currAsset.Name, System.Diagnostics.EventLogEntryType.Error);

                    }
                    catch (Exception ex)
                    {
                        Logger.LogEvent("GET THE LINKED ASSET: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                    }
                    #endregion

                    //get company id
                    int companyID = currAsset.CompanyID;
                    if (item.CompanyID == 0)
                    {
                        if (companyID == 0) companyID = 1;
                        else companyID = currAsset.CompanyID;
                    }
                    else
                    {
                        companyID = item.CompanyID;
                    }


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
                            }
                        }



                        cmd.CommandText = "UPDATE assets SET name = @Name, category_id = @CategoryID, tag_id = @TagID, company_id = @CompanyID, " +
                            "phone = @Phone, email = @Email, home = @Home, restricted = @AlertZones, curfew_start = @CurfewStart, curfew_end = @CurfewEnd, " +
                            "idle_limit = @IdleLimit, speed_limit = @SpeedLimit, mileage = @Mileage, mileage_dist = @MileageDist, " +
                            "mileage_date = @MileageDate, driver_id = @DriverID, notifications = @Notifications, " +
                            "install_date = @InstallDate, asset_remarks = @AssetRemarks " +
                                "WHERE asset_id = @AssetID";
                        
                        cmd.Parameters.AddWithValue("@Name", currAsset.Name);
                        cmd.Parameters.AddWithValue("@CategoryID", catId);
                        cmd.Parameters.AddWithValue("@TagID", tagId);
                        cmd.Parameters.AddWithValue("@CompanyID", companyID);
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
                        cmd.Parameters.AddWithValue("@DriverID", item.DriverID);
                        cmd.Parameters.AddWithValue("@Notifications", "");
                        cmd.Parameters.AddWithValue("@InstallDate", DateTime.UtcNow);
                        cmd.Parameters.AddWithValue("@AssetRemarks", "1");
                        cmd.Parameters.AddWithValue("@AssetID", currAsset.AssetID);
                        //cmd.Prepare();
                        cmd.ExecuteNonQuery();
                        //Logger.LogEvent("Update Driver Success", System.Diagnostics.EventLogEntryType.Error);

                        conn.Close();
                    }

                    #region UPDATE DRIVER JOBS
                    try
                    {
                        using (MySqlCommand cmd = new MySqlCommand())
                        {
                            conn.Open();
                            cmd.Connection = conn;
                            cmd.CommandText = "UPDATE jobs SET asset_id = @AssetID WHERE timestamp between @StartTS and @EndTS and driver_id = @DriverID";                     
                            cmd.Parameters.AddWithValue("@StartTS", DateTime.Today);
                            cmd.Parameters.AddWithValue("@EndTS", DateTime.Today.AddDays(1));
                            cmd.Parameters.AddWithValue("@DriverID", item.DriverID);
                            cmd.Parameters.AddWithValue("@AssetID", currAsset.AssetID);
                            //cmd.Prepare();
                            cmd.ExecuteNonQuery();
                            conn.Close();
                        }
                    }
                    catch (Exception ex)
                    {
                        Logger.LogEvent("UPDATE THE LINKED DRIVER & JOBS: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                    }
                    #endregion

                    #region UPDATE DRIVER COMPANY
                    try
                    {
                        using (MySqlCommand cmd = new MySqlCommand())
                        {
                            conn.Open();
                            cmd.Connection = conn;
                            cmd.CommandText = "UPDATE drivers SET company_id = @CompanyID WHERE driver_id = @DriverID";                           
                            cmd.Parameters.AddWithValue("@DriverID", item.DriverID);
                            cmd.Parameters.AddWithValue("@CompanyID", companyID);
                            //cmd.Prepare();
                            cmd.ExecuteNonQuery();
                            conn.Close();
                        }
                    }
                    catch (Exception ex)
                    {
                        Logger.LogEvent("UPDATE DRIVER COMPANY ID: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                    }
                    #endregion 

                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-GetAssetByTag", System.Diagnostics.EventLogEntryType.Error);
            }

            return item;
        }
        public object GetAssetByTagEx(object item)
        {
            AssetInfo newInfo = item as AssetInfo;
            try
            {
                using (MySqlConnection conn = new MySqlConnection(Settings.Default.DB))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "SELECT * FROM view_assets WHERE tag = @Tag";                 
                        cmd.Parameters.AddWithValue("@Tag", newInfo.Tag);
                        //cmd.Prepare();
                        MySqlDataReader reader = cmd.ExecuteReader();

                        if ((reader != null) && (reader.HasRows))
                        {
                            while (reader.Read())
                            {
                                newInfo = DataMgrTools.BuildAsset(reader);
                            }
                        }
                        else
                        {
                            newInfo.ErrorMessage = Consts.ERR_ASSETERROR;
                        }

                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent("GetAssetByTagEx: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }

            return newInfo;
        }
        public AssetInfo LogoutAssetByTag(AssetInfo item)
        {
            AssetInfo currAsset = new AssetInfo();
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {

                    #region GET THE LINKED ASSET
                    try
                    {
                        currAsset = GetByTagName(item.Tag);
                        if (item == null) currAsset.Name = "Asset Not Found";
                        //Logger.LogEvent("Check Asset:" + currAsset.Name, System.Diagnostics.EventLogEntryType.Error);

                    }
                    catch (Exception ex)
                    {
                        Logger.LogEvent("GET THE LINKED ASSET: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                    }
                    #endregion


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
                            }
                        }


                        cmd.CommandText = "UPDATE assets SET name = @Name, category_id = @CategoryID, tag_id = @TagID, company_id = @CompanyID, " +
                            "phone = @Phone, email = @Email, home = @Home, restricted = @AlertZones, curfew_start = @CurfewStart, curfew_end = @CurfewEnd, " +
                            "idle_limit = @IdleLimit, speed_limit = @SpeedLimit, mileage = @Mileage, mileage_dist = @MileageDist, " +
                            "mileage_date = @MileageDate, driver_id = @DriverID, notifications = @Notifications, " +
                            "install_date = @InstallDate, asset_remarks = @AssetRemarks " +
                                "WHERE asset_id = @AssetID";
                        
                        cmd.Parameters.AddWithValue("@Name", currAsset.Name);
                        cmd.Parameters.AddWithValue("@CategoryID", catId);
                        cmd.Parameters.AddWithValue("@TagID", tagId);
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
                        //cmd.Parameters.AddWithValue("@DriverID", item.DriverID);
                        cmd.Parameters.AddWithValue("@DriverID", 0);
                        cmd.Parameters.AddWithValue("@Notifications", "");
                        cmd.Parameters.AddWithValue("@InstallDate", DateTime.UtcNow);
                        cmd.Parameters.AddWithValue("@AssetRemarks", "0");
                        cmd.Parameters.AddWithValue("@AssetID", currAsset.AssetID);
                        //cmd.Prepare();
                        cmd.ExecuteNonQuery();
                        //Logger.LogEvent("Update Driver Success", System.Diagnostics.EventLogEntryType.Error);
                        conn.Close();


                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-LogoutAssetByTag", System.Diagnostics.EventLogEntryType.Error);
            }

            return item;
        }
        public AssetInfo BreakAssetByTag(AssetInfo item)
        {
            AssetInfo currAsset = new AssetInfo();
            EventInfo currEvent = new EventInfo();
            EventRepository eventRepo = new EventRepository();
            int tagId;
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {

                    #region GET THE LINKED ASSET
                    try
                    {
                        currAsset = GetByTagName(item.Tag);
                        if (item == null) currAsset.Name = "Asset Not Found";
                        //Logger.LogEvent("Check Asset:" + currAsset.Name, System.Diagnostics.EventLogEntryType.Error);

                    }
                    catch (Exception ex)
                    {
                        Logger.LogEvent("GET THE LINKED ASSET: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                    }
                    #endregion


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
                            }
                        }

                        //get tag id
                        tagId = currAsset.TagID;
                        if (tagId <= 0)
                        {
                            tagId = RepoHelpers.GetTagId(currAsset.Tag);
                            if (tagId <= 0)
                            {
                                currAsset.ErrorMessage = Consts.ERR_ASSET_DEVICEINUSE;
                            }
                        }


                        cmd.CommandText = "UPDATE assets SET name = @Name, category_id = @CategoryID, tag_id = @TagID, company_id = @CompanyID, " +
                            "phone = @Phone, email = @Email, home = @Home, restricted = @AlertZones, curfew_start = @CurfewStart, curfew_end = @CurfewEnd, " +
                            "idle_limit = @IdleLimit, speed_limit = @SpeedLimit, mileage = @Mileage, mileage_dist = @MileageDist, " +
                            "mileage_date = @MileageDate, driver_id = @DriverID, notifications = @Notifications, " +
                            "install_date = @InstallDate, asset_remarks = @AssetRemarks " +
                                "WHERE asset_id = @AssetID";
                        
                        cmd.Parameters.AddWithValue("@Name", currAsset.Name);
                        cmd.Parameters.AddWithValue("@CategoryID", catId);
                        cmd.Parameters.AddWithValue("@TagID", tagId);
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
                        cmd.Parameters.AddWithValue("@DriverID", item.DriverID);
                        cmd.Parameters.AddWithValue("@Notifications", "");
                        cmd.Parameters.AddWithValue("@InstallDate", DateTime.UtcNow);
                        cmd.Parameters.AddWithValue("@AssetRemarks", item.Flag);
                        cmd.Parameters.AddWithValue("@AssetID", currAsset.AssetID);
                        //cmd.Prepare();
                        cmd.ExecuteNonQuery();
                        //Logger.LogEvent("Update Driver Success", System.Diagnostics.EventLogEntryType.Error);
                        conn.Close();
                    }


                    currAsset.Remarks = String.Format("{0}", "Driver Break " + "(Driver: " + item.DriverName + ")");
                    //Logger.LogEvent("Check Remarks - " + currAsset.Remarks, System.Diagnostics.EventLogEntryType.Error);

                        long eventReportID = 0;
                        string query = string.Format("SELECT event_id FROM view_events WHERE asset_id = @AssetID and timestamp like @Timestamp LIMIT 1");
                        //Logger.LogEvent("Get query: " + query, System.Diagnostics.EventLogEntryType.Warning);

                        //change date time string format
                        //11/5/2016 4:47:37 AM
                        string strStart = (item.Timestamp != DateTime.MinValue ? String.Format("{0:yyyy-MM-dd HH:mm:ss}" + ".000000", item.Timestamp) : "NULL");
                        //Logger.LogEvent(strStart, System.Diagnostics.EventLogEntryType.Warning);
                        try
                        {
                            using (MySqlCommand cmd = new MySqlCommand())
                            {
                                conn.Open();
                                cmd.Connection = conn;
                                cmd.CommandText = query;
                                
                                cmd.Parameters.AddWithValue("@AssetID", currAsset.AssetID);
                                //Logger.LogEvent("Get AssetID: " + currAsset.AssetID, System.Diagnostics.EventLogEntryType.Warning);
                                cmd.Parameters.AddWithValue("@Timestamp", strStart);
                                //Logger.LogEvent("Get Timestamp: " + item.Timestamp, System.Diagnostics.EventLogEntryType.Warning);
                                //cmd.Prepare();
                                MySqlDataReader reader = cmd.ExecuteReader();

                                while (reader.Read())
                                {
                                    currEvent = DataMgrTools.BuildEvent(reader);
                                }

                                eventReportID = currEvent.EventID;
                               // Logger.LogEvent("Get eventReportID: " + eventReportID, System.Diagnostics.EventLogEntryType.Warning);
                              
                                conn.Close();
                            }
                        }
                        catch (Exception ex)
                        {
                            Logger.LogEvent(ex.Message + " check if record is already existing", System.Diagnostics.EventLogEntryType.Error);
                        }
                    
                        if (item.Flag  == "2")
                        {
                            // Save Driver Break Events
                            try
                            {
                                using (MySqlCommand cmd = new MySqlCommand())
                                {
                                    conn.Open();
                                    cmd.Connection = conn;
                                    cmd.CommandText = "INSERT INTO events (`asset_id`, `tag_id`, `timestamp`, `rx_time`, `status_id`, " +
                                               "`remarks`, `alert_level`, `alert_level_ex`, `flag`, `ack_user`, `ack_time`, `pos_id`, `company_id`) " +
                                               "VALUES (@AssetID, @TagID, @Timestamp, @RxTime, @StatusID, @Remarks, " +
                                               "@AlertLevel, @AlertLevelEx, @Flag, @AckUserID, UTC_DATE(), @PosID, @CompanyID)";
                                    
                                    cmd.Parameters.AddWithValue("@AssetID", currAsset.AssetID);
                                    cmd.Parameters.AddWithValue("@TagID", tagId);
                                    cmd.Parameters.AddWithValue("@Timestamp", item.Timestamp);
                                    cmd.Parameters.AddWithValue("@RxTime", item.Timestamp);
                                    cmd.Parameters.AddWithValue("@StatusID", 20);
                                    cmd.Parameters.AddWithValue("@Remarks", currAsset.Remarks);
                                    cmd.Parameters.AddWithValue("@AlertLevel", 0);
                                    cmd.Parameters.AddWithValue("@AlertLevelEx", 0);
                                    cmd.Parameters.AddWithValue("@Flag", 1);
                                    cmd.Parameters.AddWithValue("@AckUserID", 3);
                                    cmd.Parameters.AddWithValue("@AckTime", DateTime.UtcNow);
                                    cmd.Parameters.AddWithValue("@PosID", currAsset.PosID);
                                    cmd.Parameters.AddWithValue("@CompanyID", currAsset.CompanyID);
                                    //cmd.Prepare();
                                    cmd.ExecuteNonQuery();
                                    conn.Close();
                                }
                            }
                            catch (Exception ex)
                            {
                                Logger.LogEvent("Add Driver Break Events - " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                            }
                        }
                        else if (item.Flag == "1")
                        {
                            // Update Driver Break Events
                            try
                            {
                                using (MySqlCommand cmd = new MySqlCommand())
                                {
                                    conn.Open();
                                    cmd.Connection = conn;
                                    cmd.CommandText = "UPDATE events SET asset_id = @AssetID, rx_time = @RxTime, status_id = @StatusID, " +
                                               "remarks = @Remarks, alert_level = @AlertLevel, alert_level_ex = @AlertLevelEx, flag = @Flag, ack_user = @AckUserID, pos_id = @PosID, company_id = @CompanyID WHERE event_id = @EventID";
                                    
                                    cmd.Parameters.AddWithValue("@AssetID", currAsset.AssetID);
                                    cmd.Parameters.AddWithValue("@RxTime", item.RxTime);
                                    cmd.Parameters.AddWithValue("@StatusID", 20);
                                    cmd.Parameters.AddWithValue("@Remarks", currAsset.Remarks);
                                    cmd.Parameters.AddWithValue("@AlertLevel", 0);
                                    cmd.Parameters.AddWithValue("@AlertLevelEx", 0);
                                    cmd.Parameters.AddWithValue("@Flag", 1);
                                    cmd.Parameters.AddWithValue("@AckUserID", 3);
                                    cmd.Parameters.AddWithValue("@AckTime", DateTime.UtcNow);
                                    cmd.Parameters.AddWithValue("@PosID", currAsset.PosID);
                                    cmd.Parameters.AddWithValue("@CompanyID", currAsset.CompanyID);
                                    cmd.Parameters.AddWithValue("@EventID", eventReportID);
                                    //cmd.Prepare();
                                    //Logger.LogEvent("Check Event ID - " + eventReportID, System.Diagnostics.EventLogEntryType.Warning);
                                    cmd.ExecuteNonQuery();
                                    //Logger.LogEvent("Update Driver Break Event Success", System.Diagnostics.EventLogEntryType.Error);
                                    conn.Close();
                                }
                            }
                            catch (Exception ex)
                            {
                                Logger.LogEvent("Update Driver Break Events - " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                            }
                        }
                                 
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-BreakAssetByTag", System.Diagnostics.EventLogEntryType.Error);
            }

            return item;
        }
        public AssetInfo OnboardOffload(AssetInfo item)
        {
            AssetInfo currAsset = new AssetInfo();
            EventInfo currEvent = new EventInfo();
            EventRepository eventRepo = new EventRepository();
            int tagId;
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {

                    #region GET THE LINKED ASSET
                    try
                    {
                        currAsset = GetByTagName(item.Tag);
                        if (item == null) currAsset.Name = "Asset Not Found";
                    }
                    catch (Exception ex)
                    {
                        Logger.LogEvent("GET THE LINKED ASSET: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                    }
                    #endregion

                    //get tag id
                    tagId = currAsset.TagID;
                    if (tagId <= 0)
                    {
                        tagId = RepoHelpers.GetTagId(currAsset.Tag);
                        if (tagId <= 0)
                        {
                            currAsset.ErrorMessage = Consts.ERR_ASSET_DEVICEINUSE;
                        }
                    }

                    currAsset.Remarks = String.Format("{0}", "Onboard & Offload " + "(Driver: " + item.DriverName + ")");
                    //Logger.LogEvent("Check Remarks - " + currAsset.Remarks, System.Diagnostics.EventLogEntryType.Error);

                    long eventReportID = 0;
                    string query = string.Format("SELECT event_id FROM view_events WHERE asset_id = @AssetID and timestamp like @Timestamp LIMIT 1");
                    //Logger.LogEvent("Get query: " + query, System.Diagnostics.EventLogEntryType.Warning);

                    //change date time string format
                    //11/5/2016 4:47:37 AM
                    string strStart = (item.Timestamp != DateTime.MinValue ? String.Format("{0:yyyy-MM-dd HH:mm:ss}" + ".000000", item.Timestamp) : "NULL");
                    //Logger.LogEvent(strStart, System.Diagnostics.EventLogEntryType.Warning);
                    try
                    {
                        using (MySqlCommand cmd = new MySqlCommand())
                        {
                            conn.Open();
                            cmd.Connection = conn;
                            cmd.CommandText = query;                   
                            cmd.Parameters.AddWithValue("@AssetID", currAsset.AssetID);
                            cmd.Parameters.AddWithValue("@Timestamp", strStart);
                            //cmd.Prepare();
                            MySqlDataReader reader = cmd.ExecuteReader();

                            while (reader.Read())
                            {
                                currEvent = DataMgrTools.BuildEvent(reader);
                            }

                            eventReportID = currEvent.EventID;
                            // Logger.LogEvent("Get eventReportID: " + eventReportID, System.Diagnostics.EventLogEntryType.Warning);

                            conn.Close();
                        }
                    }
                    catch (Exception ex)
                    {
                        Logger.LogEvent(ex.Message + " check if record is already existing", System.Diagnostics.EventLogEntryType.Error);
                    }

                    if (eventReportID == 0)
                    {
                        // Save Onboard/Offload Events
                        try
                        {
                            using (MySqlCommand cmd = new MySqlCommand())
                            {
                                conn.Open();
                                cmd.Connection = conn;
                                cmd.CommandText = "INSERT INTO events (`asset_id`, `tag_id`, `timestamp`, `rx_time`, `status_id`, " +
                                           "`remarks`, `alert_level`, `alert_level_ex`, `flag`, `ack_user`, `ack_time`, `pos_id`, `company_id`) " +
                                           "VALUES (@AssetID, @TagID, @Timestamp, @RxTime, @StatusID, @Remarks, " +
                                           "@AlertLevel, @AlertLevelEx, @Flag, @AckUserID, UTC_DATE(), @PosID, @CompanyID)";
                                
                                cmd.Parameters.AddWithValue("@AssetID", currAsset.AssetID);
                                cmd.Parameters.AddWithValue("@TagID", tagId);
                                cmd.Parameters.AddWithValue("@Timestamp", item.Timestamp);
                                cmd.Parameters.AddWithValue("@RxTime", item.Timestamp);
                                cmd.Parameters.AddWithValue("@StatusID", 21);
                                cmd.Parameters.AddWithValue("@Remarks", currAsset.Remarks);
                                cmd.Parameters.AddWithValue("@AlertLevel", 0);
                                cmd.Parameters.AddWithValue("@AlertLevelEx", 0);
                                cmd.Parameters.AddWithValue("@Flag", 1);
                                cmd.Parameters.AddWithValue("@AckUserID", 3);
                                cmd.Parameters.AddWithValue("@AckTime", DateTime.UtcNow);
                                cmd.Parameters.AddWithValue("@PosID", currAsset.PosID);
                                cmd.Parameters.AddWithValue("@CompanyID", currAsset.CompanyID);
                                //cmd.Prepare();
                                cmd.ExecuteNonQuery();
                                conn.Close();
                            }
                        }
                        catch (Exception ex)
                        {
                            Logger.LogEvent("Add Onboard/Offload Events - " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                        }
                    }
                    else
                    {
                        // Update Onboard/Offload Events
                        try
                        {
                            using (MySqlCommand cmd = new MySqlCommand())
                            {
                                conn.Open();
                                cmd.Connection = conn;
                                cmd.CommandText = "UPDATE events SET asset_id = @AssetID, rx_time = @RxTime, status_id = @StatusID, " +
                                           "remarks = @Remarks, alert_level = @AlertLevel, alert_level_ex = @AlertLevelEx, flag = @Flag, ack_user = @AckUserID, pos_id = @PosID, company_id = @CompanyID WHERE event_id = @EventID";
                                

                                cmd.Parameters.AddWithValue("@AssetID", currAsset.AssetID);
                                cmd.Parameters.AddWithValue("@RxTime", item.RxTime);
                                cmd.Parameters.AddWithValue("@StatusID", 21);
                                cmd.Parameters.AddWithValue("@Remarks", currAsset.Remarks);
                                cmd.Parameters.AddWithValue("@AlertLevel", 0);
                                cmd.Parameters.AddWithValue("@AlertLevelEx", 0);
                                cmd.Parameters.AddWithValue("@Flag", 1);
                                cmd.Parameters.AddWithValue("@AckUserID", 3);
                                cmd.Parameters.AddWithValue("@AckTime", DateTime.UtcNow);
                                cmd.Parameters.AddWithValue("@PosID", currAsset.PosID);
                                cmd.Parameters.AddWithValue("@CompanyID", currAsset.CompanyID);
                                cmd.Parameters.AddWithValue("@EventID", eventReportID);
                                //Logger.LogEvent("Check Event ID - " + eventReportID, System.Diagnostics.EventLogEntryType.Warning);
                                //cmd.Prepare();
                                cmd.ExecuteNonQuery();
                                //Logger.LogEvent("Update Driver Break Event Success", System.Diagnostics.EventLogEntryType.Error);
                                conn.Close();
                            }
                        }
                        catch (Exception ex)
                        {
                            Logger.LogEvent("Update Onboard/Offload Events - " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                        }
                    }

                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-OnboardOffload", System.Diagnostics.EventLogEntryType.Error);
            }

            return item;
        }
        public OnboardOffloadInfo OnboardOffloadEx(OnboardOffloadInfo item)
        {
            AssetInfo currAsset = new AssetInfo();
            EventInfo currEvent = new EventInfo();
            EventRepository eventRepo = new EventRepository();
            int tagId;
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {

                    #region GET THE LINKED ASSET
                    try
                    {
                        currAsset = GetByTagName(item.Tag);
                        if (item == null) currAsset.Name = "Asset Not Found";
                    }
                    catch (Exception ex)
                    {
                        Logger.LogEvent("GET THE LINKED ASSET: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                    }
                    #endregion

                    //get tag id
                    tagId = currAsset.TagID;
                    if (tagId <= 0)
                    {
                        tagId = RepoHelpers.GetTagId(currAsset.Tag);
                        if (tagId <= 0)
                        {
                            currAsset.ErrorMessage = Consts.ERR_ASSET_DEVICEINUSE;
                        }
                    }

                    currAsset.Remarks = String.Format("{0}", "Onboard & Offload " + "(Job Number: " + item.JobNumber + "\r\n" + "Driver: " + item.DriverName + "\r\n" + "Patient: " + item.Patient + "\r\n" + "From: " + item.Origin + "\r\n" + "To: " + item.Destination + ")");

                    long eventReportID = 0;
                    string query = string.Format("SELECT event_id FROM view_events WHERE asset_id = @AssetID and timestamp like @Timestamp LIMIT 1");

                    //change date time string format
                    //11/5/2016 4:47:37 AM
                    string strStart = (item.Timestamp != DateTime.MinValue ? String.Format("{0:yyyy-MM-dd HH:mm:ss}" + ".000000", item.Timestamp) : "NULL");

                    try
                    {
                        using (MySqlCommand cmd = new MySqlCommand())
                        {
                            conn.Open();
                            cmd.Connection = conn;
                            cmd.CommandText = query;
                            
                            cmd.Parameters.AddWithValue("@AssetID", currAsset.AssetID);
                            cmd.Parameters.AddWithValue("@Timestamp", strStart);
                            //cmd.Prepare();
                            MySqlDataReader reader = cmd.ExecuteReader();

                            while (reader.Read())
                            {
                                currEvent = DataMgrTools.BuildEvent(reader);
                            }

                            eventReportID = currEvent.EventID;
                            // Logger.LogEvent("Get eventReportID: " + eventReportID, System.Diagnostics.EventLogEntryType.Warning);

                            conn.Close();
                        }
                    }
                    catch (Exception ex)
                    {
                        Logger.LogEvent(ex.Message + " check if record is already existing", System.Diagnostics.EventLogEntryType.Error);
                    }

                    if (eventReportID == 0)
                    {
                        // Save Onboard/Offload Events
                        try
                        {
                            using (MySqlCommand cmd = new MySqlCommand())
                            {
                                conn.Open();
                                cmd.Connection = conn;
                                cmd.CommandText = "INSERT INTO events (`asset_id`, `tag_id`, `timestamp`, `rx_time`, `status_id`, " +
                                           "`remarks`, `alert_level`, `alert_level_ex`, `flag`, `ack_user`, `ack_time`, `pos_id`, `company_id`) " +
                                           "VALUES (@AssetID, @TagID, @Timestamp, @RxTime, @StatusID, @Remarks, " +
                                           "@AlertLevel, @AlertLevelEx, @Flag, @AckUserID, UTC_DATE(), @PosID, @CompanyID)";
                                

                                cmd.Parameters.AddWithValue("@AssetID", currAsset.AssetID);
                                cmd.Parameters.AddWithValue("@TagID", tagId);
                                cmd.Parameters.AddWithValue("@Timestamp", item.Timestamp);
                                cmd.Parameters.AddWithValue("@RxTime", item.Timestamp);
                                cmd.Parameters.AddWithValue("@StatusID", 21);
                                cmd.Parameters.AddWithValue("@Remarks", currAsset.Remarks);
                                cmd.Parameters.AddWithValue("@AlertLevel", 0);
                                cmd.Parameters.AddWithValue("@AlertLevelEx", 0);
                                cmd.Parameters.AddWithValue("@Flag", 1);
                                cmd.Parameters.AddWithValue("@AckUserID", 3);
                                cmd.Parameters.AddWithValue("@AckTime", DateTime.UtcNow);
                                cmd.Parameters.AddWithValue("@PosID", currAsset.PosID);
                                cmd.Parameters.AddWithValue("@CompanyID", currAsset.CompanyID);
                                //cmd.Prepare();
                                cmd.ExecuteNonQuery();
                                conn.Close();
                            }
                        }
                        catch (Exception ex)
                        {
                            Logger.LogEvent("Add Onboard/Offload Events - " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                        }
                    }
                    else
                    {
                        // Update Onboard/Offload Events
                        try
                        {
                            using (MySqlCommand cmd = new MySqlCommand())
                            {
                                conn.Open();
                                cmd.Connection = conn;
                                cmd.CommandText = "UPDATE events SET asset_id = @AssetID, rx_time = @RxTime, status_id = @StatusID, " +
                                           "remarks = @Remarks, alert_level = @AlertLevel, alert_level_ex = @AlertLevelEx, flag = @Flag, ack_user = @AckUserID, pos_id = @PosID, company_id = @CompanyID WHERE event_id = @EventID";
                                

                                cmd.Parameters.AddWithValue("@AssetID", currAsset.AssetID);
                                cmd.Parameters.AddWithValue("@RxTime", item.RxTime);
                                cmd.Parameters.AddWithValue("@StatusID", 21);
                                cmd.Parameters.AddWithValue("@Remarks", currAsset.Remarks);
                                cmd.Parameters.AddWithValue("@AlertLevel", 0);
                                cmd.Parameters.AddWithValue("@AlertLevelEx", 0);
                                cmd.Parameters.AddWithValue("@Flag", 1);
                                cmd.Parameters.AddWithValue("@AckUserID", 3);
                                cmd.Parameters.AddWithValue("@AckTime", DateTime.UtcNow);
                                cmd.Parameters.AddWithValue("@PosID", currAsset.PosID);
                                cmd.Parameters.AddWithValue("@CompanyID", currAsset.CompanyID);
                                cmd.Parameters.AddWithValue("@EventID", eventReportID);
                                //cmd.Prepare();
                                cmd.ExecuteNonQuery();
                                conn.Close();
                            }
                        }
                        catch (Exception ex)
                        {
                            Logger.LogEvent("Update Onboard/Offload Events - " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                        }
                    }

                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-OnboardOffload", System.Diagnostics.EventLogEntryType.Error);
            }

            return item;
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
                            //Logger.LogEvent("Check tagId: " + tagId, System.Diagnostics.EventLogEntryType.Error);
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
                        //    coyId = RepoHelpers.GetCompanyID(currAsset.Company);
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
                        
                        cmd.Parameters.AddWithValue("@Name", currAsset.Name);
                        cmd.Parameters.AddWithValue("@CategoryID", catId);
                        cmd.Parameters.AddWithValue("@TagID", tagId);
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
                        //cmd.Prepare();

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

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                // update asset's settings
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {

                        try
                        {
                            //Logger.LogEvent("Enter Delete AssetInfo", System.Diagnostics.EventLogEntryType.Warning);
                            conn.Open();
                            cmd.Connection = conn;
                            cmd.CommandText = string.Format("DELETE FROM assetinfo WHERE postype_id = @PosTypeID AND " +
                                                             "asset_id = @AssetId");
                            
                            cmd.Parameters.AddWithValue("@AssetID", iAssetID);
                            cmd.Parameters.AddWithValue("@PosTypeID", (int)posTypeID);
                            //cmd.Prepare();
                            cmd.ExecuteNonQuery();
                            conn.Close();
                        }
                        catch (Exception ex)
                        {
                            Logger.LogEvent("Delete AssetInfo Exception: ", ex.Message, System.Diagnostics.EventLogEntryType.Error);
                        }
                    }

                    using (MySqlCommand cmd = new MySqlCommand())
                    {

                        try
                        {
                            conn.Open();
                            cmd.Connection = conn;
                            cmd.CommandText = string.Format("INSERT INTO assetinfo (asset_id, postype_id, pos_id, timestamp, notified) VALUES (@AssetID, @PosTypeID, @PosID, @Timestamp, @Notified)");
                            
                            cmd.Parameters.AddWithValue("@AssetID", iAssetID);
                            cmd.Parameters.AddWithValue("@PosTypeID", (int)posTypeID);
                            cmd.Parameters.AddWithValue("@PosID", iPosID);
                            cmd.Parameters.AddWithValue("@Timestamp", dtTimestamp);
                            cmd.Parameters.AddWithValue("@Notified", 0);
                            //cmd.Prepare();
                            cmd.ExecuteNonQuery();
                            conn.Close();
                        }
                        catch (Exception ex)
                        {
                            Logger.LogEvent("Save AssetInfo Exception: ", ex.Message, System.Diagnostics.EventLogEntryType.Error);
                        }
                    }
                }

                catch (Exception ex)
                {
                    Logger.LogEvent("Save AssetInfo Exception: ", ex.Message, System.Diagnostics.EventLogEntryType.Error);
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
                    string strUri = String.Format("{0}/images/{1}", ConfigurationManager.AppSettings["ServerPath"], strTemp);

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

     