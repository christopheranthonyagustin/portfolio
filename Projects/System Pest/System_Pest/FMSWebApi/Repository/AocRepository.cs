using FMSWebApi.Models;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace FMSWebApi.Repository
{
    public class AocRepository : IAocRepository
    {
        //private string mConnStr = "server=127.0.0.1;uid=root;pwd=12345;database=test;";
        private string mConnStr = "server=localhost;uid=root;pwd=@c3c0M;database=sp;max pool size=500;";
        private string mProjName = "SP";
        public IEnumerable<AocInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<AocInfo> arrAoc = new List<AocInfo>();

            try
            {
                conn.ConnectionString = mConnStr;
                conn.Open();

                cmd.CommandText = "aoc";
                cmd.Connection = conn;
                cmd.CommandType = CommandType.TableDirect;
                MySqlDataReader reader = cmd.ExecuteReader();

                //Console.WriteLine(String.Format("Total Data: {0}", dbRdr.FieldCount));

                if ((reader != null) && (reader.HasRows))
                {
                    while (reader.Read())
                    {
                        AocInfo currAoc = DataMgrTools.BuildAoc(reader);
                        arrAoc.Add(currAoc);
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

            return arrAoc.ToArray();
        }

        public AocInfo Get(int id)
        {
            AocInfo currAoc = new AocInfo();
            string query = string.Format("SELECT * FROM aoc WHERE aoc_id = {0}", id);

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
                            currAoc = DataMgrTools.BuildAoc(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(AOCRepository)", System.Diagnostics.EventLogEntryType.Error);
                    conn.Close();
                }
            }
            return currAoc;
        }

        public AocInfo GetByName(string aoc)
        {
            AocInfo currAoc = new AocInfo();
            string query = string.Format("SELECT * FROM aoc WHERE aoc_desc = @Aoc");

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
                        cmd.Parameters.AddWithValue("@Aoc", aoc.Trim());
                        MySqlDataReader reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            currAoc = DataMgrTools.BuildAoc(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-GetByName(AOCRepository)", System.Diagnostics.EventLogEntryType.Error);
                    //conn.Close();
                }
            }
            return currAoc;
        }

    }
}