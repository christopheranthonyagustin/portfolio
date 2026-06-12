using FMSWebApi.Models;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace FMSWebApi.Repository
{
    public class PestTreatmentRepository : IPestTreatmentRepository
    {
        //private string mConnStr = "server=127.0.0.1;uid=root;pwd=12345;database=test;";
        private string mConnStr = "server=localhost;uid=root;pwd=@c3c0M;database=sp;max pool size=500;";
        private string mProjName = "SP";
        public IEnumerable<PestTreatmentInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<PestTreatmentInfo> arrPests = new List<PestTreatmentInfo>();

            try
            {
                conn.ConnectionString = mConnStr;
                conn.Open();

                cmd.CommandText = "pests_treatment";
                cmd.Connection = conn;
                cmd.CommandType = CommandType.TableDirect;
                MySqlDataReader reader = cmd.ExecuteReader();

                //Console.WriteLine(String.Format("Total Data: {0}", dbRdr.FieldCount));

                if ((reader != null) && (reader.HasRows))
                {
                    while (reader.Read())
                    {
                        PestTreatmentInfo currPestTreatment = DataMgrTools.BuildPestTreatment(reader);
                        arrPests.Add(currPestTreatment);
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

        public PestTreatmentInfo Get(int pestID)
        {
            PestTreatmentInfo currPestTreatment = new PestTreatmentInfo();
            string query = string.Format("SELECT * FROM pests_treatment WHERE pest_treatment_id = {0}", pestID);

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
                            currPestTreatment = DataMgrTools.BuildPestTreatment(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(PestTreatmentRepository)", System.Diagnostics.EventLogEntryType.Error);
                    conn.Close();
                }
            }
            return currPestTreatment;
        }

        public PestTreatmentInfo Add(PestTreatmentInfo currPestTreatment)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO pests_treatment (job_id, pest_desc, treatment_desc, item_no) " +
                                                               "VALUES (@JobID, @PestDesc, @TreatmentDesc, @ItemNo)";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@JobID", currPestTreatment.JobID);
                        cmd.Parameters.AddWithValue("@PestDesc", currPestTreatment.PestDesc);
                        cmd.Parameters.AddWithValue("@TreatmentDesc", currPestTreatment.TreatmentDesc);
                        cmd.Parameters.AddWithValue("@ItemNo", currPestTreatment.ItemNo);
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(PestTreatmentRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return currPestTreatment;
        }

        public bool Remove(int id)
        {
            bool retVal = false;
            string query = string.Format("DELETE FROM pests_treatment WHERE pests_treatment_id = {0}", id);

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
                    Logger.LogEvent(ex.Message + "-Remove(PestTreatmentRepository)", System.Diagnostics.EventLogEntryType.Error);
                }
            }

            return retVal;
        }

        public bool Update(PestTreatmentInfo currPestTreatment)
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
                        cmd.CommandText = "UPDATE pests_treatment SET job_id = @JobID, pest_desc = @PestDesc, treatment_desc = @TreatmentDesc, item_no = @ItemNo" +
                                                " WHERE pest_treatment_id = @PestTreatmentID";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@JobID", currPestTreatment.JobID);
                        cmd.Parameters.AddWithValue("@PestDesc", currPestTreatment.PestDesc);
                        cmd.Parameters.AddWithValue("@TreatmentDesc", currPestTreatment.TreatmentDesc);
                        cmd.Parameters.AddWithValue("@ItemNo", currPestTreatment.ItemNo);
                        cmd.Parameters.AddWithValue("@PestTreatmentID", currPestTreatment.PestTreatmentID);

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
                Logger.LogEvent(ex.Message + "-Update(PestTreatmentRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }

        public PestTreatmentInfo GetByPestTreatment(PestTreatmentInfo param)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "DELETE FROM pests_treatment WHERE job_id = @JobID";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@JobID", param.JobID);
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Remove(PestTreatmentRepository-GetByPestTretment)", System.Diagnostics.EventLogEntryType.Error);
            }

            return param;
        }
    }
}