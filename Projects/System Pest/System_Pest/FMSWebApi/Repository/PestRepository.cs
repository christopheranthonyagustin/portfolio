using FMSWebApi.Models;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace FMSWebApi.Repository
{
    public class PestRepository : IPestRepository
    {
        //private string mConnStr = "server=127.0.0.1;uid=root;pwd=12345;database=test;";
        private string mConnStr = "server=localhost;uid=root;pwd=@c3c0M;database=sp;max pool size=500;";
        private string mProjName = "SP";
        public IEnumerable<PestInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<PestInfo> arrPests = new List<PestInfo>();

            try
            {
                conn.ConnectionString = mConnStr;
                conn.Open();

                cmd.CommandText = "pests order by pest_desc asc";
                cmd.Connection = conn;
                cmd.CommandType = CommandType.TableDirect;
                MySqlDataReader reader = cmd.ExecuteReader();

                //Console.WriteLine(String.Format("Total Data: {0}", dbRdr.FieldCount));

                if ((reader != null) && (reader.HasRows))
                {
                    while (reader.Read())
                    {
                        PestInfo currPest = DataMgrTools.BuildPest(reader);
                        arrPests.Add(currPest);
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

            return arrPests.ToArray();
        }

        public PestInfo Get(int pestID)
        {
            PestInfo currPest = new PestInfo();
            string query = string.Format("SELECT * FROM pests WHERE pest_id = {0}", pestID);

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
                            currPest = DataMgrTools.BuildPest(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(PestRepository)", System.Diagnostics.EventLogEntryType.Error);
                    conn.Close();
                }
            }
            return currPest;
        }

        public PestInfo GetByName(string pestName)
        {
            PestInfo currPest = new PestInfo();
            string query = string.Format("SELECT * FROM pest WHERE pest_desc = @Pest");

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
                        cmd.Parameters.AddWithValue("@Pest", pestName.Trim());
                        MySqlDataReader reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            currPest = DataMgrTools.BuildPest(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-GetByName(PestRepository)", System.Diagnostics.EventLogEntryType.Error);
                    //conn.Close();
                }
            }
            return currPest;
        }

    }
}