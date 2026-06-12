using FMSWebApi.Models;
using FMSWebApi.Properties;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace FMSWebApi.Repository
{
    public class DeviceRepository : IDeviceRepository
    {
        //private string mConnStr = "server=127.0.0.1;uid=root;pwd=12345;database=test;";
        private string mConnStr = Settings.Default.DB;
        private string mProjName = "FMS-Singapore";
        public IEnumerable<DeviceInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<DeviceInfo> arrDevice = new List<DeviceInfo>();

            try
            {
                   conn.ConnectionString = mConnStr;
                   conn.Open();

                   cmd.CommandText = "view_tags";
                   cmd.Connection = conn;
                   cmd.CommandType = CommandType.TableDirect;
                   using (MySqlDataReader reader = cmd.ExecuteReader())
                   {
                    //Console.WriteLine(String.Format("Total Data: {0}", dbRdr.FieldCount));

                    if ((reader != null) && (reader.HasRows))
                    {
                        while (reader.Read())
                        {
                            DeviceInfo currDevice = DataMgrTools.BuildDevice(reader);
                            arrDevice.Add(currDevice);
					    }
                    }
                }
                    conn.Close();
            }
            catch (MySqlException ex)
            {
                Logger.LogEvent(ex.Message  + "-GetAll(DeviceRepository)", System.Diagnostics.EventLogEntryType.Error);
            }


            if (conn != null)
                conn.Close();

            return arrDevice.ToArray();
        }

        public IEnumerable<DeviceInfo> GetAllDevice()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<DeviceInfo> arrDevices = new List<DeviceInfo>();

            return arrDevices.ToArray();
        }
        public IEnumerable<DeviceInfo> GetByCompany(DeviceInfo param)
        {

            List<DeviceInfo> arrDevices = new List<DeviceInfo>();
            DeviceInfo currDevice = new DeviceInfo();
            object objTemp = new object();

            //string query = "";

            string query = "SELECT * FROM view_tags WHERE reseller_id = @ResellerID";

            if (param.CompanyID > 0) query += " and company_id = @CompanyID";


            //Logger.LogEvent("GetQuery: " + query, System.Diagnostics.EventLogEntryType.Information);//TESTING

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        
                        cmd.Parameters.AddWithValue("@CompanyID", param.CompanyID);
                        cmd.Parameters.AddWithValue("@ResellerID", param.ResellerID);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currDevice = DataMgrTools.BuildDevice(reader);
                                    arrDevices.Add(currDevice);
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get Devices(ByCompany)", System.Diagnostics.EventLogEntryType.Error);

                }


            }

            return arrDevices;
        }

        public DeviceInfo Get(int id)
        {
            DeviceInfo currDevice = new DeviceInfo();
            string query = string.Format("SELECT * FROM view_tags WHERE tag_id = {0}", id);

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
                            currDevice = DataMgrTools.BuildDevice(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
					  Logger.LogEvent(ex.Message + "-Get(DeviceRepository)", System.Diagnostics.EventLogEntryType.Error);
                }
            }
            return currDevice;
        }

        public DeviceInfo GetByName(string tagName)
        {
            DeviceInfo currDevice = new DeviceInfo();
            string query = string.Format("SELECT * FROM tags WHERE name = @Tag");

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
                        MySqlDataReader reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            currDevice = DataMgrTools.BuildDevice(reader);
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
            return currDevice;
        }

        public DeviceInfo Add(DeviceInfo currDevice)
        {
            try
            {
               
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;

                        cmd.CommandText = "INSERT INTO tags (name, imei, phone, `interval`, port, APN, install_date, modified_timestamp, remarks, isSentOut) " +
                            "VALUES (@Name, @IMEI, @Phone, @Interval, @Port, @APN, @InstallDate, @ModifiedTimestamp, @Remarks, @IsSentOut)";

                        
                        cmd.Parameters.AddWithValue("@Name", currDevice.Name);
                        cmd.Parameters.AddWithValue("@IMEI", currDevice.Imei);
                        cmd.Parameters.AddWithValue("@Phone", currDevice.Phone);
                        cmd.Parameters.AddWithValue("@Interval", currDevice.Interval);
                        cmd.Parameters.AddWithValue("@Port", currDevice.Port);
                        cmd.Parameters.AddWithValue("@APN", currDevice.APN);
                        cmd.Parameters.AddWithValue("@InstallDate", currDevice.InstallDate);
                        cmd.Parameters.AddWithValue("@ModifiedTimestamp", currDevice.ModifiedTimestamp);
                        cmd.Parameters.AddWithValue("@Remarks", currDevice.Remarks);
                        cmd.Parameters.AddWithValue("@isSentOut", currDevice.isSentOut);
                        cmd.ExecuteNonQuery();
                        long id = cmd.LastInsertedId;
                        currDevice.DeviceID = id;
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(DeviceRepository)", System.Diagnostics.EventLogEntryType.Error);

            }

            return currDevice;
        }

        public bool Remove(int id)
        {
            bool retVal = false;
            string query = string.Format("DELETE FROM tags WHERE tag_id = {0}", id);
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
                        conn.Close();
                    }
                  }
               }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Remove(DeviceRepository)", System.Diagnostics.EventLogEntryType.Error);
                
            }

            return retVal;
        }

        public bool Update(DeviceInfo currDevice)
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

                            Logger.LogEvent("Entered Update Repository: " + currDevice.Name, System.Diagnostics.EventLogEntryType.Information);//testing

                            cmd.CommandText = "UPDATE tags SET `name` = @Name, `imei` = @IMEI, `phone` = @Phone, `interval` = @Interval, `port` = @Port, `APN` = @APN, `install_date` = @InstallDate, `modified_timestamp` = @ModifiedTimestamp, " +
                                                "`remarks` = @Remarks, `isSentOut` = @isSentOut WHERE `tag_id` = @DeviceID";

                            
                            cmd.Parameters.AddWithValue("@Name", currDevice.Name);
                            cmd.Parameters.AddWithValue("@IMEI", currDevice.Imei);
                            cmd.Parameters.AddWithValue("@Phone", currDevice.Phone);
                            cmd.Parameters.AddWithValue("@Interval", currDevice.Interval);
                            cmd.Parameters.AddWithValue("@Port", currDevice.Port);
                            cmd.Parameters.AddWithValue("@APN", currDevice.APN);
                            cmd.Parameters.AddWithValue("@InstallDate", currDevice.InstallDate);
                            cmd.Parameters.AddWithValue("@ModifiedTimestamp", DateTime.UtcNow);
                            cmd.Parameters.AddWithValue("@Remarks", currDevice.Remarks);
                            cmd.Parameters.AddWithValue("@isSentOut", currDevice.isSentOut);
                            cmd.Parameters.AddWithValue("@DeviceID", currDevice.DeviceID);

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
                Logger.LogEvent(ex.Message + "-Update(DeviceRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }

        public bool UpdateTag(DeviceInfo currDevice)
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
                        cmd.CommandText = "UPDATE tags SET `name` = @Name, `imei` = @IMEI, `modified_timestamp` = @ModifiedTimestamp WHERE `tag_id` = @DeviceID";

                        
                        cmd.Parameters.AddWithValue("@Name", currDevice.Name);
                        cmd.Parameters.AddWithValue("@IMEI", currDevice.Imei);
                        cmd.Parameters.AddWithValue("@ModifiedTimestamp", DateTime.UtcNow);
                        cmd.Parameters.AddWithValue("@DeviceID", currDevice.DeviceID);

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
                Logger.LogEvent(ex.Message + "-UpdateTag(DeviceRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }

        public IEnumerable<DeviceInfo> GetByDevice(DeviceInfo param)
        {

            List<DeviceInfo> arrDevices = new List<DeviceInfo>();
            DeviceInfo currDevice = new DeviceInfo();
            object objTemp = new object();

            string query = "SELECT * FROM view_tags WHERE name = @Name";
            if (param.CompanyID > 0) query += " AND company_id = @CompanyID";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        
                        cmd.Parameters.AddWithValue("@Name", param.Name);
                        cmd.Parameters.AddWithValue("@CompanyID", param.CompanyID);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currDevice = DataMgrTools.BuildDevice(reader);
                                    arrDevices.Add(currDevice);
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(GetByDevice)", System.Diagnostics.EventLogEntryType.Error);

                }


            }

            return arrDevices;
        }
    }
}