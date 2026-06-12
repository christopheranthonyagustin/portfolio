using FMSWebApi.Models;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace FMSWebApi.Repository
{
    public class TreatmentRepository : ITreatmentRepository
    {
        //private string mConnStr = "server=127.0.0.1;uid=root;pwd=12345;database=test;";
        private string mConnStr = "server=localhost;uid=root;pwd=@c3c0M;database=sp;max pool size=500;";
        private string mProjName = "SP";
        public IEnumerable<TreatmentInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<TreatmentInfo> arrTreatments = new List<TreatmentInfo>();

            try
            {
                conn.ConnectionString = mConnStr;
                conn.Open();

                cmd.CommandText = "treatments order by treatment_desc asc";
                cmd.Connection = conn;
                cmd.CommandType = CommandType.TableDirect;
                MySqlDataReader reader = cmd.ExecuteReader();

                //Console.WriteLine(String.Format("Total Data: {0}", dbRdr.FieldCount));

                if ((reader != null) && (reader.HasRows))
                {
                    while (reader.Read())
                    {
                        TreatmentInfo currTreatment = DataMgrTools.BuildTreatment(reader);
                        arrTreatments.Add(currTreatment);
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

            return arrTreatments.ToArray();
        }

        public TreatmentInfo Get(int treatmentID)
        {
            TreatmentInfo currTreatment = new TreatmentInfo();
            string query = string.Format("SELECT * FROM treatments WHERE treatment_id = {0}", treatmentID);

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
                            currTreatment = DataMgrTools.BuildTreatment(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(TreatmentRepository)", System.Diagnostics.EventLogEntryType.Error);
                    conn.Close();
                }
            }
            return currTreatment;
        }

        public TreatmentInfo GetByName(string treatment)
        {
            TreatmentInfo currTreatment = new TreatmentInfo();
            string query = string.Format("SELECT * FROM treatments WHERE treatment_desc = @Treatment");

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
                        cmd.Parameters.AddWithValue("@Treatment", treatment.Trim());
                        MySqlDataReader reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            currTreatment = DataMgrTools.BuildTreatment(reader);
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
            return currTreatment;
        }

    }
}