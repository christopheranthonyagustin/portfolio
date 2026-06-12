using FMSWebApi.Models;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using FMSWebApi.Properties;

namespace FMSWebApi.Repository
{
    public class DriverStatusRepository : IDriverStatusRepository
    {
        private string mConnStr = Settings.Default.DB;
        private string mProjName = "FMS-Singapore";
        public IEnumerable<DriverStatusInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<DriverStatusInfo> arrDriverStatus = new List<DriverStatusInfo>();

            try
            {
                conn.ConnectionString = mConnStr;
                conn.Open();

                cmd.CommandText = "driver_status order by driver_status_id";
                cmd.Connection = conn;
                cmd.CommandType = CommandType.TableDirect;
                MySqlDataReader reader = cmd.ExecuteReader();

                if ((reader != null) && (reader.HasRows))
                {
                    while (reader.Read())
                    {
                        DriverStatusInfo currDriverStatus = DataMgrTools.BuildDriverStatus(reader);
                        arrDriverStatus.Add(currDriverStatus);
                    }
                }
                conn.Close();
            }
            catch (MySqlException ex)
            {
                Logger.LogEvent(mProjName, ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }

            if (conn != null)
                conn.Close();

            return arrDriverStatus.ToArray();
        }

        public DriverStatusInfo Get(int dsID)
        {
            DriverStatusInfo currDriverStatus = new DriverStatusInfo();
            string query = string.Format("SELECT * FROM driver_status WHERE driver_status_id = {0}", dsID);

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
                            currDriverStatus = DataMgrTools.BuildDriverStatus(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(DriverStatusRepository)", System.Diagnostics.EventLogEntryType.Error);
                }
            }
            return currDriverStatus;
        }

        public DriverStatusInfo GetByName(string desc)
        {
            DriverStatusInfo currDriverStatus = new DriverStatusInfo();
            string query = string.Format("SELECT * FROM driver_status WHERE description = @Desc");

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = query;
                        
                        cmd.Parameters.AddWithValue("@Desc", desc.Trim());
                        MySqlDataReader reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            currDriverStatus = DataMgrTools.BuildDriverStatus(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-GetByName(DriverStatusRepository)", System.Diagnostics.EventLogEntryType.Error);
                }
            }
            return currDriverStatus;
        }

        public DriverStatusInfo Add(DriverStatusInfo currDriverStatus)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO driver_status (driver_status_id, description) " +
                                                          "VALUES (@DriverStatusID, @DriverStatusDesc)";
                        
                        cmd.Parameters.AddWithValue("@DriverStatusID", currDriverStatus.DriverStatusID);
                        cmd.Parameters.AddWithValue("@DriverStatusDesc", currDriverStatus.DriverStatusDesc);
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(DriverStatusRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return currDriverStatus;
        }

        public bool Remove(int dsID)
        {
            bool retVal = false;
            string query = string.Format("DELETE FROM driver_status WHERE driver_status_id = {0}", dsID);

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
                    Logger.LogEvent(ex.Message + "-Delete(DriverStatusRepository)", System.Diagnostics.EventLogEntryType.Error);
                }
            }

            return retVal;
        }

        public bool Update(DriverStatusInfo currDriverStatus)
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
                        cmd.CommandText = "UPDATE driver_status SET description = @DriverStatusDesc " +
                                                             "WHERE driver_status_id = @DriverStatusID";
                        
                        cmd.Parameters.AddWithValue("@DriverStatusID", currDriverStatus.DriverStatusID);
                        cmd.Parameters.AddWithValue("@DriverStatusDesc", currDriverStatus.DriverStatusDesc);

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
                Logger.LogEvent(ex.Message + "-Update(DriverStatusRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }
    }
}