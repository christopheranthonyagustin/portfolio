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
    public class MakeRepository : IMakeRepository
    {
        private string mConnStr = Settings.Default.DB;
        private string mProjName = "FMS-Singapore";
        public IEnumerable<MakeInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<MakeInfo> arrMake = new List<MakeInfo>();

            try
            {
                conn.ConnectionString = mConnStr;
                conn.Open();

                cmd.CommandText = "make order by make asc";
                cmd.Connection = conn;
                cmd.CommandType = CommandType.TableDirect;
                MySqlDataReader reader = cmd.ExecuteReader();

                if ((reader != null) && (reader.HasRows))
                {
                    while (reader.Read())
                    {
                        MakeInfo currMake = DataMgrTools.BuildMake(reader);
                        arrMake.Add(currMake);
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

            return arrMake.ToArray();
        }

        public MakeInfo Get(int makeID)
        {
            MakeInfo currMake = new MakeInfo();
            string query = string.Format("SELECT * FROM make WHERE make_id = {0}", makeID);

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
                            currMake = DataMgrTools.BuildMake(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(MakeRepository)", System.Diagnostics.EventLogEntryType.Error);
                }
            }
            return currMake;
        }

        public MakeInfo Add(MakeInfo currMake)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO make (make_id, make) " +
                                                    "VALUES (@MakeID, @Make)";
                        
                        cmd.Parameters.AddWithValue("@MakeID", currMake.MakeID);
                        cmd.Parameters.AddWithValue("@Make", currMake.Make);
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {

            }

            return currMake;
        }

        public bool Remove(int makeID)
        {
            bool retVal = false;
            string query = string.Format("DELETE FROM make WHERE make_id = {0}", makeID);

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
                    Logger.LogEvent(ex.Message + "-Remove(MakeRepository)", System.Diagnostics.EventLogEntryType.Error);
                }
            }

            return retVal;
        }

        public bool Update(MakeInfo currMake)
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
                        cmd.CommandText = "UPDATE categories SET make = @Make" +
                                                          "WHERE make_id = @MakeID";
                        
                        cmd.Parameters.AddWithValue("@MakeID", currMake.MakeID);
                        cmd.Parameters.AddWithValue("@Make", currMake.Make);

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
                 Logger.LogEvent(ex.Message + "-Update(MakeRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }
    }
}