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
using FMSWebApi.Properties;

namespace FMSWebApi.Repository
{
    public class SearchDriverRepository : ISearchDriverRepository
    {
        //private string mConnStr = "server=localhost;uid=root;pwd=$B$Transit888;database=adas;charset=utf8;max pool size=500;default command timeout=999;";
        private string mConnStr = "server=localhost;uid=root;pwd=$B$Transit888;database=adas;charset=utf8;max pool size=500;default command timeout=99999;";
        private string mProjName = "SBS";
        public IEnumerable<SearchDriver> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<SearchDriver> arrDrivers = new List<SearchDriver>();


            return arrDrivers.ToArray();
        }

        public IEnumerable<SearchDriver> GetByCompany(SearchDriver param)
        {

            List<SearchDriver> arrDrivers = new List<SearchDriver>();
            SearchDriver currDriver = new SearchDriver();
            object objTemp = new object();


            string query = "SELECT * FROM view_drivers WHERE driver_name = @Name";


            //Logger.LogEvent("GetQuery Driver Repository: " + query, System.Diagnostics.EventLogEntryType.Information);//TESTING

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
                                    currDriver = DataMgrTools.BuildSearchDriver(reader);
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

        public SearchDriver GetByName(string driverName)
        {
            SearchDriver currDriver = new SearchDriver();

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
                            currDriver = DataMgrTools.BuildSearchDriver(reader);
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

        public SearchDriver Get(int id)
        {
            SearchDriver currDriver = new SearchDriver();
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
                            currDriver = DataMgrTools.BuildSearchDriver(reader);
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

        public SearchDriver Add(SearchDriver currDriver)
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
                                ", rfid_id, rfid, company_id, bloodtype, last_tap, remarks, created_date, modified_date, created_by, modified_by, created_byName, modified_byName) " +
                                "VALUES (@Name, @Email, @Address, @Phone, @DateOfBirth, @RelativePhone, @RelativeName, @RFIDID, @RFID, @CompanyID, @BloodType, @LastTap, @Remarks"
                                + ", @CreatedDate, @ModifiedDate, @CreatedBy, @ModifiedBy, @CreatedByName, @ModifiedByName)";
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

        public bool Update(SearchDriver currDriver)
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
                                            ", created_date = @CreatedDate, modified_date = @ModifiedDate, created_by = @CreatedBy, modified_by = @ModifiedBy, created_byName = @CreatedByName, modified_byName = @ModifiedByName WHERE driver_id = @DriverID";
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
                    string strUri = String.Format("{0}/images/{1}", "http://localhost/trackdemowebapi", strTemp);

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
        
    }
}