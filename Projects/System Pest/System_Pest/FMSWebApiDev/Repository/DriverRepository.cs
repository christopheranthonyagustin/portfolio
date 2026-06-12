using FMSWebApi.Models;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.IO;
using System.Web.Hosting;
using System.Configuration;
using System.Web.UI.WebControls;

namespace FMSWebApi.Repository
{
    public class DriverRepository : IDriverRepository
    {
        //private string mConnStr = "server=127.0.0.1;uid=root;pwd=12345;database=test;";
        private string mConnStr = "server=103.237.168.119;uid=root;pwd=@c3c0M;database=trackliteprodev;max pool size=500;";
        private string mProjName = "TRACKLitePro";
        public IEnumerable<DriverInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<DriverInfo> arrDrivers = new List<DriverInfo>();

            try
            {
                conn.ConnectionString = mConnStr;
                conn.Open();

                cmd.CommandText = "view_drivers";
                cmd.Connection = conn;
                cmd.CommandType = CommandType.TableDirect;
                MySqlDataReader reader = cmd.ExecuteReader();

                //Console.WriteLine(String.Format("Total Data: {0}", dbRdr.FieldCount));

                if ((reader != null) && (reader.HasRows))
                {
                    while (reader.Read())
                    {
                        DriverInfo currDriver = DataMgrTools.BuildDriver(reader);

                        string strFill = "";
                        currDriver.Image = GetImage(String.Format("drivers/{0}", currDriver.DriverID), ref strFill);
                        currDriver.ImageFill = strFill;

                        arrDrivers.Add(currDriver);
                    }
                }
                conn.Close();
            }
            catch (MySqlException ex)
            {
                Logger.LogEvent(ex.Message + "-GetAll(DriverRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            if (conn != null)
                conn.Close();

            return arrDrivers.ToArray();
        }
        public IEnumerable<DriverInfo> GetAllDriver()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<DriverInfo> arrDrivers = new List<DriverInfo>();

            return arrDrivers.ToArray();
        }
        public IEnumerable<DriverInfo> GetByDriver(DriverInfo param)
        {

            List<DriverInfo> arrDrivers = new List<DriverInfo>();
            DriverInfo currDriver = new DriverInfo();
            object objTemp = new object();


            string query = "SELECT * FROM view_drivers WHERE driver_name = @Name";


            Logger.LogEvent("GetQuery Driver Repository: " + query, System.Diagnostics.EventLogEntryType.Information);//TESTING

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@Name", param.Name);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currDriver = DataMgrTools.BuildDriver(reader);
                                    arrDrivers.Add(currDriver);
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

            return arrDrivers;
        }
        public IEnumerable<DriverInfo> GetByCompany(DriverInfo param)
        {

            List<DriverInfo> arrDrivers = new List<DriverInfo>();
            DriverInfo currDriver = new DriverInfo();
            object objTemp = new object();

            //string query = "";

            string query = "SELECT * FROM view_drivers WHERE reseller_id = @ResellerID";

            if (param.CompanyID > 0) query += " and company_id = @CompanyID";

            if (param.AssetID > 0) query += " and asset_id = @AssetID";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@ResellerID", param.ResellerID);
                        cmd.Parameters.AddWithValue("@CompanyID", param.CompanyID);
                        cmd.Parameters.AddWithValue("@AssetID", param.AssetID);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currDriver = DataMgrTools.BuildDriver(reader);
                                    string strFill = "";
                                    currDriver.Image = GetImage(String.Format("drivers/{0}", currDriver.DriverID), ref strFill);
                                    currDriver.ImageFill = strFill;
                                    arrDrivers.Add(currDriver);
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(GetByDriverID)", System.Diagnostics.EventLogEntryType.Error);

                }


            }

            return arrDrivers;
        }
        public IEnumerable<DriverInfo> GetByCompanyEx(DriverInfo param)
        {

            List<DriverInfo> arrDrivers = new List<DriverInfo>();
            DriverInfo currDriver = new DriverInfo();
            object objTemp = new object();

            //string query = "";

            string query = "SELECT * FROM drivers WHERE company_id = @CompanyID";

            if (param.AssetID > 0) query += " and asset_id = @AssetID";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@CompanyID", param.CompanyID);
                        cmd.Parameters.AddWithValue("@AssetID", param.AssetID);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currDriver = DataMgrTools.BuildDriver(reader);
                                    string strFill = "";
                                    currDriver.Image = GetImage(String.Format("drivers/{0}", currDriver.DriverID), ref strFill);
                                    currDriver.ImageFill = strFill;
                                    arrDrivers.Add(currDriver);
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(GetByDriverID)", System.Diagnostics.EventLogEntryType.Error);

                }


            }

            return arrDrivers;
        }

        public DriverInfo GetByName(string driverName)
        {
            DriverInfo currDriver = new DriverInfo();

            if (string.IsNullOrEmpty(driverName))
            {
                currDriver.ErrorMessage = Consts.ERR_DRIVERERROR;
                return currDriver;
            }

            string query = string.Format("SELECT * FROM view_drivers WHERE driver_name = @Name");

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
                        cmd.Parameters.AddWithValue("@Name", driverName.Trim());
                        MySqlDataReader reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            currDriver = DataMgrTools.BuildDriver(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-GetByName(DriverRepository)", System.Diagnostics.EventLogEntryType.Error);
                    conn.Close();
                }
            }
            return currDriver;
        }

        public DriverInfo Get(int id)
        {
            DriverInfo currDriver = new DriverInfo();
            string query = string.Format("SELECT * FROM drivers WHERE driver_id = {0}", id);
            
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
                            currDriver = DataMgrTools.BuildDriver(reader);
                        }
                        
                    }
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Get(DriverRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return currDriver;
        }

        public DriverInfo Add(DriverInfo currDriver)
        {

            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO drivers (driver_name, email, address, phone, birthdate, relative_phone, relative_name" +
                                ", rfid_id, rfid, company_id, bloodtype, last_tap, remarks, created_date, modified_date, created_by, modified_by, created_byName, modified_byName, password) " +
                                "VALUES (@Name, @Email, @Address, @Phone, @DateOfBirth, @RelativePhone, @RelativeName, @RFIDID, @RFID, @CompanyID, @BloodType, @LastTap, @Remarks"
                                + ", @CreatedDate, @ModifiedDate, @CreatedBy, @ModifiedBy, @CreatedByName, @ModifiedByName, @Password)";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@Name", currDriver.Name);
                        cmd.Parameters.AddWithValue("@Email", currDriver.Email);
                        cmd.Parameters.AddWithValue("@Address", currDriver.Address);
                        cmd.Parameters.AddWithValue("@Phone", currDriver.Phone);
                        cmd.Parameters.AddWithValue("@DateOfBirth", currDriver.DateOfBirth);
                        cmd.Parameters.AddWithValue("@RelativePhone", currDriver.RelativePhone);
                        cmd.Parameters.AddWithValue("@RelativeName", currDriver.RelativeName);
                        cmd.Parameters.AddWithValue("@RFIDID", currDriver.RFIDID);
                        cmd.Parameters.AddWithValue("@RFID", currDriver.RFID);
                        cmd.Parameters.AddWithValue("@CompanyID", currDriver.CompanyID);
                        cmd.Parameters.AddWithValue("@BloodType", currDriver.BloodType);
                        cmd.Parameters.AddWithValue("@LastTap", currDriver.LastTap);
                        cmd.Parameters.AddWithValue("@Remarks", currDriver.Remarks);
                        cmd.Parameters.AddWithValue("@CreatedDate", currDriver.CreatedDate);
                        cmd.Parameters.AddWithValue("@ModifiedDate", currDriver.ModifiedDate);
                        cmd.Parameters.AddWithValue("@CreatedBy", currDriver.CreatedBy);
                        cmd.Parameters.AddWithValue("@ModifiedBy", currDriver.ModifiedBy);
                        cmd.Parameters.AddWithValue("@CreatedByName", currDriver.CreatedByName);
                        cmd.Parameters.AddWithValue("@ModifiedByName", currDriver.ModifiedByName);
                        cmd.Parameters.AddWithValue("@Password", currDriver.Password);
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(DriverRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return currDriver;
        }

        public bool Remove(int driverID)
        {
            bool retVal = false;
            string query = string.Format("DELETE FROM drivers WHERE driver_id = {0}", driverID);
            
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
                Logger.LogEvent(ex.Message + "-Remove(DriverRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            DeleteImage(String.Format("drivers/{0}", driverID));


            return retVal;
        }

        public bool Update(DriverInfo currDriver)
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
                        cmd.CommandText = "UPDATE drivers SET driver_name = @Name, email = @Email, address = @Address, phone = @Phone, birthdate = @DateOfBirth, relative_phone = @RelativePhone, relative_name = @RelativeName, " +
                                            "rfid_id = @RFIDID, rfid = @RFID, company_id = @CompanyID, bloodtype = @BloodType, last_tap = @LastTap, remarks = @Remarks" +
                                            ", created_date = @CreatedDate, modified_date = @ModifiedDate, created_by = @CreatedBy, modified_by = @ModifiedBy, created_byName = @CreatedByName, modified_byName = @ModifiedByName, password = @Password WHERE driver_id = @DriverID";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@Name", currDriver.Name);
                        cmd.Parameters.AddWithValue("@Email", currDriver.Email);
                        cmd.Parameters.AddWithValue("@Address", currDriver.Address);
                        cmd.Parameters.AddWithValue("@Phone", currDriver.Phone);
                        cmd.Parameters.AddWithValue("@DateOfBirth", currDriver.DateOfBirth);
                        cmd.Parameters.AddWithValue("@RelativePhone", currDriver.RelativePhone);
                        cmd.Parameters.AddWithValue("@RelativeName", currDriver.RelativeName);
                        cmd.Parameters.AddWithValue("@RFIDID", currDriver.RFIDID);
                        cmd.Parameters.AddWithValue("@RFID", currDriver.RFID);
                        cmd.Parameters.AddWithValue("@CompanyID", currDriver.CompanyID);
                        cmd.Parameters.AddWithValue("@BloodType", currDriver.BloodType);
                        cmd.Parameters.AddWithValue("@LastTap", currDriver.LastTap);
                        cmd.Parameters.AddWithValue("@Remarks", currDriver.Remarks);
                        cmd.Parameters.AddWithValue("@CreatedDate", currDriver.CreatedDate);
                        cmd.Parameters.AddWithValue("@ModifiedDate", currDriver.ModifiedDate);
                        cmd.Parameters.AddWithValue("@CreatedBy", currDriver.CreatedBy);
                        cmd.Parameters.AddWithValue("@ModifiedBy", currDriver.ModifiedBy);
                        cmd.Parameters.AddWithValue("@CreatedByName", currDriver.CreatedByName);
                        cmd.Parameters.AddWithValue("@ModifiedByName", currDriver.ModifiedByName);
                        cmd.Parameters.AddWithValue("@Password", currDriver.Password);
                        cmd.Parameters.AddWithValue("@DriverID", currDriver.DriverID);
                        
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
                Logger.LogEvent(ex.Message + "-Update(DriverRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
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
                    string strUri = String.Format("{0}/images/{1}", "http://103.237.168.119/trackliteprodevwebapi", strTemp);

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
                Logger.LogEvent(ex.Message + "-(Get Image)", System.Diagnostics.EventLogEntryType.Error);     
            }

            // image file not found
            strFill = "None";
            return strName;
        }

        /// <summary>
        /// deletes image file
        /// </summary>
        /// <param name="strName"></param>
        public void DeleteImage(string strName)
        {
            try
            {
                // loop through image file types
                List<string> arrTypes = new List<string>() { "jpg", "png", "gif", "bmp" };
                foreach (string strType in arrTypes)
                {
                    // check file path
                    string strFile = String.Format("{0}images\\{1}.{2}",
                        HostingEnvironment.ApplicationPhysicalPath, strName, strType);
                    if (File.Exists(strFile))
                    {
                        // return image path
                        File.Delete(strFile);
                        break;
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(ex.Message + "-(Delete Image)", System.Diagnostics.EventLogEntryType.Error);      
            }
        }

        /// <summary>
        /// gets all zones active for the day for asset
        /// </summary>
        /// <returns></returns>
        public List<DriverInfo> GetAssetDrivers(int iAssetID, int iDriverID)
        {
            List<DriverInfo> arrDrivers = new List<DriverInfo>();
            string query = string.Format("SELECT * FROM view_drivers WHERE asset_id = {0}", iDriverID);

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
                            arrDrivers.Add(DataMgrTools.BuildDriver(reader));
                        }
                        conn.Close();
                    }
                }


                catch (Exception ex)
                {
                    // log error
                    Logger.LogEvent(ex.Message + "-Get(AssetDrivers)", System.Diagnostics.EventLogEntryType.Error);
                    conn.Close();
                }
            }

            return arrDrivers;
        }


        /// <summary>
        /// gets assets' last positions
        /// </summary>
        /// <param name="dbMgr"></param>
        /// <param name="iPosID"></param>
        public DriverInfo GetDriver(long iAssetID)
        {
            DriverInfo currDriver = new DriverInfo();
            string query = string.Format("SELECT * FROM view_drivers WHERE asset_id = {0}", iAssetID);

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
                            currDriver = DataMgrTools.BuildDriver(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(mProjName, "Get Driver: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                    conn.Close();
                }
            }
            return currDriver;
        }
        
    }
}