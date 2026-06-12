using FMSWebApi.Models;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace FMSWebApi.Repository
{
    public class FindingsRepository : IFindingsRepository
    {
        //private string mConnStr = "server=127.0.0.1;uid=root;pwd=12345;database=test;";
        private string mConnStr = "server=localhost;uid=root;pwd=@c3c0M;database=sp;max pool size=500;";
        private string mProjName = "SP";
        public IEnumerable<FindingsInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<FindingsInfo> arrFindings = new List<FindingsInfo>();

            try
            {
                conn.ConnectionString = mConnStr;
                conn.Open();

                cmd.CommandText = "findings";
                cmd.Connection = conn;
                cmd.CommandType = CommandType.TableDirect;
                MySqlDataReader reader = cmd.ExecuteReader();

                //Console.WriteLine(String.Format("Total Data: {0}", dbRdr.FieldCount));

                if ((reader != null) && (reader.HasRows))
                {
                    while (reader.Read())
                    {
                        FindingsInfo currFindings = DataMgrTools.BuildFindings(reader);
                        arrFindings.Add(currFindings);
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

            return arrFindings.ToArray();
        }

        public FindingsInfo Get(int findingsID)
        {
            FindingsInfo currFindings = new FindingsInfo();
            string query = string.Format("SELECT * FROM findings WHERE findings_id = {0}", findingsID);

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
                            currFindings = DataMgrTools.BuildFindings(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(FindingsRepository)", System.Diagnostics.EventLogEntryType.Error);
                    conn.Close();
                }
            }
            return currFindings;
        }

        public FindingsInfo Add(FindingsInfo currFindings)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO findings (job_id, pest_desc, aoc_desc, findings, item_no) " +
                                                        "VALUES (@JobID, @PestDesc, @AocDesc, @Findings, @ItemNo)";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@JobID", currFindings.JobID);
                        cmd.Parameters.AddWithValue("@PestDesc", currFindings.PestDesc);
                        cmd.Parameters.AddWithValue("@AocDesc", currFindings.AocDesc);
                        cmd.Parameters.AddWithValue("@Findings", currFindings.Findings);
                        cmd.Parameters.AddWithValue("@ItemNo", currFindings.ItemNo);
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(FindingsRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return currFindings;
        }

        public bool Remove(int id)
        {
            bool retVal = false;
            string query = string.Format("DELETE FROM findings WHERE findings_id = {0}", id);

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
                    Logger.LogEvent(ex.Message + "-Remove(FindingsRepository)", System.Diagnostics.EventLogEntryType.Error);
                }
            }

            return retVal;
        }

        public bool Update(FindingsInfo currFindings)
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
                        cmd.CommandText = "UPDATE findings SET job_id = @JobID, pest_desc = @PestDesc, aoc_desc = @AocDesc, findings = @Findings,item_no = @ItemNo" +
                                                " WHERE findings_id = @FindingsID";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@JobID", currFindings.JobID);
                        cmd.Parameters.AddWithValue("@PestDesc", currFindings.PestDesc);
                        cmd.Parameters.AddWithValue("@AocDesc", currFindings.AocDesc);
                        cmd.Parameters.AddWithValue("@Findings", currFindings.Findings);
                        cmd.Parameters.AddWithValue("@ItemNo", currFindings.ItemNo);
                        cmd.Parameters.AddWithValue("@FindingsID", currFindings.FindingsID);

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
                Logger.LogEvent(ex.Message + "-Update(FindingsRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }

        public FindingsInfo GetByFindings(FindingsInfo param)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "DELETE FROM findings WHERE job_id = @JobID";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@JobID", param.JobID);
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Remove(FindingsRepository-GetByFindings)", System.Diagnostics.EventLogEntryType.Error);
            }

            return param;
        }
    }
}