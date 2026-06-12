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
    public class ReportRepository : IReportRepository
    {
        //private string mConnStr = "server=localhost;uid=root;pwd=$B$Transit888;database=adas;charset=utf8;max pool size=500;default command timeout=999;";
        private string mConnStr = "server=localhost;uid=root;pwd=$B$Transit888;database=adas;charset=utf8;max pool size=500;default command timeout=99999;";
        private string mProjName = "SBS";
        public IEnumerable<ReportInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<ReportInfo> arrAssets = new List<ReportInfo>();

            try
            {
                conn.ConnectionString = mConnStr;
                conn.Open();

                cmd.CommandText = "reports";
                cmd.Connection = conn;
                cmd.CommandType = CommandType.TableDirect;
                MySqlDataReader reader = cmd.ExecuteReader();

                //Console.WriteLine(String.Format("Total Data: {0}", dbRdr.FieldCount));

                if ((reader != null) && (reader.HasRows))
                {
                    while (reader.Read())
                    {
                        ReportInfo currAsset = DataMgrTools.BuildReport(reader);
                        arrAssets.Add(currAsset);
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

            return arrAssets.ToArray();
        }

        public ReportInfo Get(int reportID)
        {
            ReportInfo currAsset = new ReportInfo();
            string query = string.Format("SELECT * FROM reports WHERE report_id = {0}", reportID);

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
                            currAsset = DataMgrTools.BuildReport(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    conn.Close();
                }
            }
            return currAsset;
        }

        public ReportInfo Add(ReportInfo currReport)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO reports (report_id, name) " +
                            "VALUES (@ReportID, @name)";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@ReportID", currReport.ReportID);
                        cmd.Parameters.AddWithValue("@Name", currReport.Name);
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Get(ReportRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return currReport;
        }

        public bool Remove(int reportID)
        {
            bool retVal = false;
            string query = string.Format("DELETE FROM reports WHERE report_id = {0}", reportID);

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
                    conn.Close();
                }
            }

            return retVal;
        }

        public bool Update(ReportInfo currReport)
        {
            bool retVal = false;
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    try
                    {
                        using (MySqlCommand cmd = new MySqlCommand())
                        {
                            conn.Open();
                            cmd.Connection = conn;
                            cmd.CommandText = "UPDATE reports SET report_id = @ReportID, name = @Name" +
                                                    "WHERE report_id = @ReportID";
                            cmd.Prepare();
                            cmd.Parameters.AddWithValue("@ReportID", currReport.ReportID);
                            cmd.Parameters.AddWithValue("@CategoryDesc", currReport.Name);

                            if (cmd.ExecuteNonQuery() == 1)
                                retVal = true;
                            else
                                retVal = false;
                            conn.Close();
                        }
                    }
                    catch (Exception ex)
                    {
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {

            }

            return retVal;
        }
    }
}