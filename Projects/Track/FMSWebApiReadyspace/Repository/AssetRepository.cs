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

namespace FMSWebApi.Repository
{
    public class AssetRepository : IAssetRepository
    {
        private string mConnStr = "server=localhost;uid=root;pwd=@c3c0M;database=tracksg;charset=utf8;max pool size=500;";

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

                conn.Close();
            }
            catch (MySqlException ex)
            {
                Logger.LogEvent("view_assets: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }

    

            try
            {
                PosInfo currPos = new PosInfo();
                for (int i = 0; i < arrAssets.Count; i++)
                {
                    string strSql = String.Format("SELECT * FROM view_positions where pos_id = {0}", arrAssets[i].LastPosID);
                    conn.Open();
                    cmd.CommandText = strSql;
                    cmd.Connection = conn;
                    cmd.CommandType = CommandType.Text;
                    using (MySqlDataReader reader = cmd.ExecuteReader())
                    {
                        
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
                                double lLimit = 10;
                                if (lLimit > 0)
                                {
                                    // check gprs status
                                    if (tsDiff.TotalMinutes < lLimit * 2)
                                        arrAssets[i].Gprs = (int)Enums.StatusColorInt.GREEN;
                                    else if (tsDiff.TotalMinutes < lLimit * 3)
                                        arrAssets[i].Gprs = (int)Enums.StatusColorInt.AMBER;

                                    // check gps status
                                    if (tsDiff.TotalMinutes < lLimit * 2)
                                        arrAssets[i].Gps = (int)Enums.GPSStatusColorInt.GREEN;
                                    else if (tsDiff.TotalMinutes < lLimit * 3)
                                        arrAssets[i].Gps = (int)Enums.GPSStatusColorInt.RED;

                                     // check ignition
                                    if (tsDiff.TotalMinutes < lLimit * 2)
                                        arrAssets[i].Ignition = (int)Enums.IgnitionStatusColorInt.GREEN;
                                    else if (tsDiff.TotalMinutes < lLimit * 3)
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
										//get speed
                                        if (arrAssets[i].LastPos.Speed != 0)
                                        {
                                            arrAssets[i].Speed = 0;
                                        }
                                    }
                                    else
                                    {
										//get speed
                                        arrAssets[i].Speed = arrAssets[i].LastPos.Speed;
	
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
                    conn.Close();
                }
               
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
                    if (!string.IsNullOrEmpty(param.Assets)) query += " and asset_id = (SELECT asset_id FROM view_assets WHERE name = @AssetName)";

                    if ((objTemp != null) && (objTemp.ToString() != ""))
                        query += String.Format(" AND asset_id IN ({0})", objTemp);

                    query += " and last_pos > 0";

                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@ResellerID", param.ResellerID);

                        if (param.CompanyID > 0) cmd.Parameters.AddWithValue("@CompanyID", param.CompanyID);
                        if (!string.IsNullOrEmpty(param.Assets)) cmd.Parameters.AddWithValue("@AssetName", param.Assets);

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
                }

                PosInfo currPos = new PosInfo();
                for (int i = 0; i < arrAssets.Count; i++)
                {
                    try
                    {
                        query = String.Format("SELECT * FROM view_positions where pos_id = @PosID");

                        using (MySqlCommand cmd = new MySqlCommand(query, conn))
                        {
                            conn.Open();
                            cmd.Prepare();
                            cmd.Parameters.AddWithValue("@PosID", arrAssets[i].LastPosID);
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
                                    double lLimit = 10;
                                    if (lLimit > 0)
                                    {
                                        // check gprs status
                                        if (tsDiff.TotalMinutes < lLimit * 2)
                                            arrAssets[i].Gprs = (int)Enums.StatusColorInt.GREEN;
                                        else if (tsDiff.TotalMinutes < lLimit * 3)
                                            arrAssets[i].Gprs = (int)Enums.StatusColorInt.AMBER;

                                        // check gps status
                                        if (tsDiff.TotalMinutes < lLimit * 2)
                                        {
                                            arrAssets[i].Gps = (int)Enums.GPSStatusColorInt.GREEN;
                                        }
                                        else if (tsDiff.TotalMinutes < lLimit * 3)
                                        {
                                            arrAssets[i].Gps = (int)Enums.GPSStatusColorInt.RED;                
                                        }

                                        // check ignition
                                        if (tsDiff.TotalMinutes < lLimit * 2)
                                            arrAssets[i].Ignition = (int)Enums.IgnitionStatusColorInt.GREEN;
                                        else if (tsDiff.TotalMinutes < lLimit * 3)
                                            arrAssets[i].Ignition = (int)Enums.IgnitionStatusColorInt.RED;


                                        // check gps status
                                        if (DateTime.Now.ToUniversalTime() > currPos.Timestamp && arrAssets[i].Ignition != 1)
                                        {
                                            // get engine status
                                            switch (arrAssets[i].LastPos.Engine)
                                            {
                                                case "STOP":
                                                    arrAssets[i].Engine = "STOP";
                                                    break;
                                                case "IDLE":
                                                    arrAssets[i].Engine = "STOP";
                                                    break;
                                                case "MOVE":
                                                    arrAssets[i].Engine = "STOP";
                                                    break;
                                            }

                                            arrAssets[i].LastPos.Fix = "No Fix";
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
                    }
                    catch (Exception ex)
                    {
                        Logger.LogEvent("GetAssetEx GetAll-view_positions: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                    }

                }


                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        for (int i = 0; i < arrAssets.Count; i++)
                        {
                            query = String.Format("SELECT * FROM view_drivers where driver_id = {0}", arrAssets[i].DriverID);

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
                    Logger.LogEvent("GetAssetEx GetAll-view_driver: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                }        
            
            }
       
            return arrAssets.ToArray();
           
         }

        private bool IsTheSameDay(DateTime date1, DateTime date2)
        {
            return (date1.Day == date2.Day);
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


                        cmd.CommandText = "INSERT INTO assets (name, category_id, tag_id, phone, email, home, restricted, " +
                                                              "curfew_start, curfew_end, status_id, idle_limit, speed_limit, mileage, mileage_dist, mileage_date, " +
                                                              "driver_id, last_event, last_pos, last_fix, last_gps, company_id, notifications, install_date, asset_remarks, " +
                                                              "make_id, model, license_plate, transmission_id, fueltype_id, chassis_no, model_year, immatriculation_date, firstcontract_date, " +
                                                              "catalog_value, residual_value, seat_no, door_no, color, co2, horsepower, horsepower_taxation, power) " + 
                                                      "VALUES (@Name, @CategoryID, @TagID, @Phone, @Email, @Home, @AlertZones, " +
                                                              "@CurfewStart, @CurfewEnd, 0, @IdleLimit, @SpeedLimit, @Mileage, @MileageDist, @MileageDate, " + 
                                                              "@DriverID, 0, 0, 0, 0, @CompanyID, @Notifications, @InstallDate, @AssetRemarks, " +
                                                              "@MakeID, @Model, @LicensePlate, @TransmissionID, @FuelTypeID, @ChassisNo, @ModelYear, @ImmatriculationDate, @FirstContractDate, " +
                                                              "@CatalogValue, @ResidualValue, @SeatNo, @DoorNo, @Color, @CO2, @Horsepower, @HorsepowerTaxation, @Power)";

                        cmd.Prepare();
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
                        cmd.Parameters.AddWithValue("@IdleLimit", currAsset.IdleLimit);
                        cmd.Parameters.AddWithValue("@SpeedLimit",  currAsset.SpeedLimit);
                        cmd.Parameters.AddWithValue("@Mileage", currAsset.Mileage);
                        cmd.Parameters.AddWithValue("@MileageDist", currAsset.MileageDist);
                        //cmd.Parameters.AddWithValue("@MileageDate", currAsset.MileageDate);
                        cmd.Parameters.AddWithValue("@MileageDate", DateTime.UtcNow);
                        cmd.Parameters.AddWithValue("@DriverID", currAsset.DriverID);
                        //cmd.Parameters.AddWithValue("@Notifications", currAsset.Notifications);
                        cmd.Parameters.AddWithValue("@Notifications", "");
                        cmd.Parameters.AddWithValue("@InstallDate", currAsset.InstallDate);
                        cmd.Parameters.AddWithValue("@AssetRemarks", currAsset.Remarks);
                        cmd.Parameters.AddWithValue("@MakeID", currAsset.MakeID);
                        cmd.Parameters.AddWithValue("@Model", currAsset.Model);
                        cmd.Parameters.AddWithValue("@LicensePlate", currAsset.LicensePlate);
                        cmd.Parameters.AddWithValue("@TransmissionID", currAsset.TransmissionID);
                        cmd.Parameters.AddWithValue("@FuelTypeID", currAsset.FuelTypeID);
                        cmd.Parameters.AddWithValue("@ChassisNo", currAsset.ChassisNo);
                        cmd.Parameters.AddWithValue("@ModelYear", currAsset.ModelYear);
                        cmd.Parameters.AddWithValue("@ImmatriculationDate", currAsset.ImmatriculationDate);
                        cmd.Parameters.AddWithValue("@FirstContractDate", currAsset.FirstContractDate);
                        cmd.Parameters.AddWithValue("@CatalogValue", currAsset.CatalogValue);
                        cmd.Parameters.AddWithValue("@ResidualValue", currAsset.ResidualValue);
                        cmd.Parameters.AddWithValue("@SeatNo", currAsset.SeatNo);
                        cmd.Parameters.AddWithValue("@DoorNo", currAsset.DoorNo);
                        cmd.Parameters.AddWithValue("@Color", currAsset.Color);
                        cmd.Parameters.AddWithValue("@CO2", currAsset.CO2);
                        cmd.Parameters.AddWithValue("@Horsepower", currAsset.Horsepower);
                        cmd.Parameters.AddWithValue("@HorsepowerTaxation", currAsset.HorsepowerTaxation);
                        cmd.Parameters.AddWithValue("@Power", currAsset.Power);

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

        public AssetInfo UpdateAsset(AssetInfo currAsset)
        {
            AssetInfo newcurrAsset = new AssetInfo();
            string query = string.Format("SELECT * FROM view_assets WHERE asset_id = {0}", currAsset.AssetID);

            try
            {
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
                                newcurrAsset = DataMgrTools.BuildAsset(reader);
                            }
                            conn.Close();
                        }
                    }
                    catch (Exception ex)
                    {
                        Logger.LogEvent(ex.Message + "-GetAssetID", System.Diagnostics.EventLogEntryType.Error);
                    }

                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;

                        cmd.CommandText = "UPDATE assets SET asset_remarks = @Flag WHERE asset_id = @AssetID";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@Flag", currAsset.Flag);
                        cmd.Parameters.AddWithValue("@AssetID", currAsset.AssetID);

                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-UpdateAsset", System.Diagnostics.EventLogEntryType.Error);
            }

            return newcurrAsset;
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
                                tagId = 0;
                                currAsset.ErrorMessage = Consts.ERR_ASSET_DEVICEINUSE;
                                //return false;
                            }
                        }
                        else
                        {
                            tagId = 0;
                        }

                        cmd.CommandText = "UPDATE assets SET name = @Name, category_id = @CategoryID, tag_id = @TagID, phone = @Phone, email = @Email, home = @Home, restricted = @AlertZones, " +
                                                            "curfew_start = @CurfewStart, curfew_end = @CurfewEnd, idle_limit = @IdleLimit, speed_limit = @SpeedLimit, mileage = @Mileage, mileage_dist = @MileageDist, mileage_date = @MileageDate, " +
                                                            "driver_id = @DriverID, company_id = @CompanyID, notifications = @Notifications, install_date = @InstallDate, asset_remarks = @AssetRemarks, " +
                                                            "make_id = @MakeID, model = @Model, license_plate = @LicensePlate, transmission_id = @TransmissionID, fueltype_id = @FuelTypeID, chassis_no = @ChassisNo, model_year = @ModelYear, immatriculation_date = @ImmatriculationDate, firstcontract_date = @FirstContractDate, " +
                                                            "catalog_value = @CatalogValue, residual_value = @ResidualValue, seat_no = @SeatNo, door_no = @DoorNo, color = @Color, co2 = @CO2, horsepower = @Horsepower, horsepower_taxation = @HorsepowerTaxation, power = @Power " +
                                                            "WHERE asset_id = @AssetID";
                        cmd.Prepare();
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
                        cmd.Parameters.AddWithValue("@IdleLimit", currAsset.IdleLimit);
                        cmd.Parameters.AddWithValue("@SpeedLimit", currAsset.SpeedLimit);
                        cmd.Parameters.AddWithValue("@Mileage", currAsset.Mileage);
                        cmd.Parameters.AddWithValue("@MileageDist", 0);
                        cmd.Parameters.AddWithValue("@MileageDate", DateTime.UtcNow);
                        cmd.Parameters.AddWithValue("@DriverID", currAsset.DriverID);
                        cmd.Parameters.AddWithValue("@Notifications", "");
                        cmd.Parameters.AddWithValue("@InstallDate", currAsset.InstallDate);
                        cmd.Parameters.AddWithValue("@AssetRemarks", currAsset.Remarks);
                        cmd.Parameters.AddWithValue("@MakeID", currAsset.MakeID);
                        cmd.Parameters.AddWithValue("@Model", currAsset.Model);
                        cmd.Parameters.AddWithValue("@LicensePlate", currAsset.LicensePlate);
                        cmd.Parameters.AddWithValue("@TransmissionID", currAsset.TransmissionID);
                        cmd.Parameters.AddWithValue("@FuelTypeID", currAsset.FuelTypeID);
                        cmd.Parameters.AddWithValue("@ChassisNo", currAsset.ChassisNo);
                        cmd.Parameters.AddWithValue("@ModelYear", currAsset.ModelYear);
                        cmd.Parameters.AddWithValue("@ImmatriculationDate", currAsset.ImmatriculationDate);
                        cmd.Parameters.AddWithValue("@FirstContractDate", currAsset.FirstContractDate);
                        cmd.Parameters.AddWithValue("@CatalogValue", currAsset.CatalogValue);
                        cmd.Parameters.AddWithValue("@ResidualValue", currAsset.ResidualValue);
                        cmd.Parameters.AddWithValue("@SeatNo", currAsset.SeatNo);
                        cmd.Parameters.AddWithValue("@DoorNo", currAsset.DoorNo);
                        cmd.Parameters.AddWithValue("@Color", currAsset.Color);
                        cmd.Parameters.AddWithValue("@CO2", currAsset.CO2);
                        cmd.Parameters.AddWithValue("@Horsepower", currAsset.Horsepower);
                        cmd.Parameters.AddWithValue("@HorsepowerTaxation", currAsset.HorsepowerTaxation);
                        cmd.Parameters.AddWithValue("@Power", currAsset.Power);
                        cmd.Parameters.AddWithValue("@AssetID", currAsset.AssetID);

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
                            cmd.Prepare();
                            cmd.Parameters.AddWithValue("@AssetID", iAssetID);
                            cmd.Parameters.AddWithValue("@PosTypeID", (int)posTypeID);
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
                            cmd.Prepare();
                            cmd.Parameters.AddWithValue("@AssetID", iAssetID);
                            cmd.Parameters.AddWithValue("@PosTypeID", (int)posTypeID);
                            cmd.Parameters.AddWithValue("@PosID", iPosID);
                            cmd.Parameters.AddWithValue("@Timestamp", dtTimestamp);
                            cmd.Parameters.AddWithValue("@Notified", 0);
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
                    //string strUri = String.Format("{0}/images/{1}", ConfigurationManager.AppSettings["ServerPath"], strTemp);
                    string strUri = String.Format("{0}/images/{1}", "https://track-asia.com/tracksgwebapi", strTemp);

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

     