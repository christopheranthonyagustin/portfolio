using FMSWebApi.Models;
using FMSWebApi.Properties;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Http;

namespace FMSWebApi.Repository
{
    public class StatusRepository : IStatusRepository
    {
        //private string mConnStr = "server=localhost;uid=root;pwd=$B$Transit888;database=adas;charset=utf8;max pool size=500;default command timeout=999;";
        private string mConnStr = "server=localhost;uid=root;pwd=$B$Transit888;database=adas;charset=utf8;max pool size=500;default command timeout=99999;";
        private string mProjName = "SBS";

        public IEnumerable<StatusInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<StatusInfo> arrStatus = new List<StatusInfo>();

            try
            {
                conn.ConnectionString = mConnStr;
                conn.Open();

                cmd.CommandText = "status";
                cmd.Connection = conn;
                cmd.CommandType = CommandType.TableDirect;
                MySqlDataReader reader = cmd.ExecuteReader();

                //Console.WriteLine(String.Format("Total Data: {0}", dbRdr.FieldCount));

                if ((reader != null) && (reader.HasRows))
                {
                    while (reader.Read())
                    {
                        StatusInfo currStatus = DataMgrTools.BuildStatus(reader);
                        arrStatus.Add(currStatus);
                    }
                }
                conn.Close();
            }
            catch (MySqlException ex)
            {
                Logger.LogEvent(ex.Message + "-GetAll(StatusRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            if (conn != null)
                conn.Close();

            return arrStatus.ToArray();
        }

        public StatusInfo Get(int statusID)
        {
            StatusInfo currStatus = new StatusInfo();
            string query = string.Format("SELECT * FROM status WHERE status_id = {0}", statusID);
            
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
                            currStatus = DataMgrTools.BuildStatus(reader);
                        }
                        
                    }
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Get(StatusRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return currStatus;
        }

        public StatusInfo GetByDesc(string statusName)
        {

            StatusInfo currStatus = new StatusInfo();
            string query = string.Format("SELECT * FROM status WHERE status_desc = @StatusDesc");

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
                        cmd.Parameters.AddWithValue("@StatusDesc", statusName);
                        MySqlDataReader reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            currStatus = DataMgrTools.BuildStatus(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-GetByDesc(StatusRepository)", System.Diagnostics.EventLogEntryType.Error);
                    conn.Close();
                }
            }
            return currStatus;
        }

        public StatusInfo Add(StatusInfo currStatus)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO status (status_id, status_desc, flag, type, " +
                        "VALUES (@StatusID, @StatusDesc, @Flag, @Type)";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@StatusID", currStatus.StatusID);
                        cmd.Parameters.AddWithValue("@StatusDesc", currStatus.StatusDesc);
                        cmd.Parameters.AddWithValue("@Flag", currStatus.Flag);
                        cmd.Parameters.AddWithValue("@Type", currStatus.Type);
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(StatusRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return currStatus;
        }

        public bool Remove(int statusID)
        {
            bool retVal = false;
            string query = string.Format("DELETE FROM status WHERE status_id = {0}", statusID);
            
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
                Logger.LogEvent(ex.Message + "-Remove(StatusRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return retVal;
        }

        public bool Update(StatusInfo currStatus)
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
                        cmd.CommandText = "UPDATE status SET status_id = @StatusID, status_desc = @StatusDesc, flag = @Flag,  type = @Type WHERE status_id = @StatusID";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@StatusID", currStatus.StatusID);
                        cmd.Parameters.AddWithValue("@StatusDesc", currStatus.StatusDesc);
                        cmd.Parameters.AddWithValue("@Flag", currStatus.Flag);
                        cmd.Parameters.AddWithValue("@Type", currStatus.Type);

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
                Logger.LogEvent(ex.Message + "-Update(StatusRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }

        
    }
}