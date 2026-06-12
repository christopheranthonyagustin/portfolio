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
    public class SearchDeviceRepository : ISearchDeviceRepository
    {
        private string mConnStr = Settings.Default.DB;
        private string mProjName = "SBS";
        public IEnumerable<SearchDevice> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<SearchDevice> arrDevice = new List<SearchDevice>();


            return arrDevice.ToArray();
        }
        public IEnumerable<SearchDevice> GetByCompany(SearchDevice param)
        {

            List<SearchDevice> arrDevices = new List<SearchDevice>();
            SearchDevice currDevice = new SearchDevice();
            object objTemp = new object();

            //string query = "";

            string query = "SELECT * FROM view_tags WHERE name = @Name";


            //Logger.LogEvent("GetQuery: " + query, System.Diagnostics.EventLogEntryType.Information);//TESTING

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
                                    currDevice = DataMgrTools.BuildSearchDevice(reader);
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

        public SearchDevice Get(int id)
        {
            SearchDevice currDevice = new SearchDevice();
            string query = string.Format("SELECT * FROM tags WHERE tag_id = {0}", id);

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
                            currDevice = DataMgrTools.BuildSearchDevice(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
					  Logger.LogEvent(ex.Message + "-Get(DeviceRepository)", System.Diagnostics.EventLogEntryType.Error);
                    conn.Close();
                }
            }
            return currDevice;
        }

        public SearchDevice GetByName(string tagName)
        {
            SearchDevice currDevice = new SearchDevice();
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
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@Tag", tagName);
                        MySqlDataReader reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            currDevice = DataMgrTools.BuildSearchDevice(reader);
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

        public SearchDevice Add(SearchDevice currDevice)
        {
            try
            {
               
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                   
                        cmd.CommandText = "INSERT INTO tags (name, imei, phone, `interval`, port, APN, install_date, modified_timestamp, remarks, isSentOut, tag_typeid) " +
                            "VALUES (@Name, @IMEI, @Phone, @Interval, @Port, @APN, @InstallDate, @ModifiedTimestamp, @Remarks, @IsSentOut, @DeviceTypeID)";

                        cmd.Prepare();
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
                        cmd.Parameters.AddWithValue("@DeviceTypeID", currDevice.DeviceTypeID);
                        cmd.ExecuteNonQuery();
                        Logger.LogEvent("Device Saved: " + currDevice.Name, System.Diagnostics.EventLogEntryType.Information);//testing
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

        public bool Update(SearchDevice currDevice)
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
                                                "`remarks` = @Remarks, `isSentOut` = @isSentOut, `tag_typeid` = @DeviceTypeID WHERE `tag_id` = @DeviceID";

                            cmd.Prepare();
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
                            cmd.Parameters.AddWithValue("@DeviceTypeID", currDevice.DeviceTypeID);
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
    }
}