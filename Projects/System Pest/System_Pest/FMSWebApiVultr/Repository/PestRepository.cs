using FMSWebApi.Models;
using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Data;

namespace FMSWebApi.Repository
{
    public class PestRepository : IPestRepository
    {
        //private string mConnStr = "server=127.0.0.1;uid=root;pwd=12345;database=test;";
        private string mConnStr = "server=127.0.0.1;uid=root;pwd=@c3c0M;database=sp;max pool size=500;SSL Mode=None;";
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

                cmd.CommandText = "SELECT * FROM pests order by pest_desc asc";
                cmd.Connection = conn;
                cmd.CommandType = CommandType.Text;
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
        public IEnumerable<PestInfo> GetAllEx()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<PestInfo> arrPests = new List<PestInfo>();


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
            string query = string.Format("SELECT * FROM pests WHERE pest_desc = @Pest");

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = query;
                        //cmd.Prepare();
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

        public IEnumerable<PestInfo> GetByPestName(PestInfo param)
        {

            List<PestInfo> arrPests = new List<PestInfo>();
            PestInfo currPest = new PestInfo();
            object objTemp = new object();

            string query = "SELECT * FROM pests WHERE pest_desc = @PestDesc";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        //cmd.Prepare();
                        cmd.Parameters.AddWithValue("@PestDesc", param.PestDesc);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currPest = DataMgrTools.BuildPest(reader);
                                    arrPests.Add(currPest);
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(GetByPestName)", System.Diagnostics.EventLogEntryType.Error);

                }


            }

            return arrPests;
        }

        public PestInfo Add(PestInfo currPest)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO pests (pest_id, pest_desc) " +
                            "VALUES (@PestID, @PestDesc)";
                        //cmd.Prepare();
                        cmd.Parameters.AddWithValue("@PestID", currPest.PestID);
                        cmd.Parameters.AddWithValue("@PestDesc", currPest.PestDesc);
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(PestRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return currPest;
        }

        public bool Remove(int pestID)
        {
            bool retVal = false;
            string query = string.Format("DELETE FROM pests WHERE pest_id = {0}", pestID);

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
                    Logger.LogEvent(ex.Message + "-Remove(PestRepository)", System.Diagnostics.EventLogEntryType.Error);
                }
            }

            return retVal;
        }

        public bool Update(PestInfo currPest)
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
                        cmd.CommandText = "UPDATE pests SET pest_id = @PestID, pest_desc = @PestDesc" +
                                          " WHERE pest_id = @PestID";
                        //cmd.Prepare();
                        cmd.Parameters.AddWithValue("@PestID", currPest.PestID);
                        cmd.Parameters.AddWithValue("@PestDesc", currPest.PestDesc);

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
                Logger.LogEvent(ex.Message + "-Update(PestRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }

    }
}