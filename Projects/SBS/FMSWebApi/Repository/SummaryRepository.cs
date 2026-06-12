using MySql.Data.MySqlClient;
using FMSWebApi.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Hosting;
using System.Configuration;
using System.IO;
using System.Web.Http;
using FMSWebApi.Properties;

namespace FMSWebApi.Repository
{
    public class SummaryRepository : ISummaryRepository
    {
        private string mConnStr = Settings.Default.DB;
        private string mProjName = "SBS";

        public IEnumerable<SummaryInfo> GetAll()
        {
            List<SummaryInfo> arrSafety = new List<SummaryInfo>();
            string query = "";

            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    try
                    {
                        query = string.Format("SELECT * FROM view_summary");

                        using (MySqlCommand cmd = new MySqlCommand(query, conn))
                        {
                            conn.Open();
                            MySqlDataReader reader = cmd.ExecuteReader();
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    SummaryInfo currSafety = DataMgrTools.BuildSummaryView(reader);
                                    arrSafety.Add(currSafety);
                                }
                            }

                            conn.Close();
                        }
                    }
                    catch (Exception ex)
                    {
                        Logger.LogEvent("Exception Summary Safety Events: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                    }

                    if (conn != null)
                        conn.Close();
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-GetAll(SummarySafetyEventsRepository)", System.Diagnostics.EventLogEntryType.Error);
            }



            return arrSafety.ToArray();
        }

        public IEnumerable<SummaryInfo> GetSummaryInfo([FromUri]SummaryInfo value)
        {   
            List<SummaryInfo> arrSafety = new List<SummaryInfo>();
            string query = "SELECT * FROM view_summary WHERE MONTH(date) = @MONTH and YEAR(date) = @YEAR";
            if (value.AssetID > 0) query += " and asset_id = @AssetID";
            else if (!string.IsNullOrEmpty(value.Asset)) query += " and asset_id = (SELECT asset_id FROM view_assets WHERE name = @AssetName)";
            query += " ORDER BY start_time ASC";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {

                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@MONTH", value.Month);
                        cmd.Parameters.AddWithValue("@YEAR", value.Year);
                        if (value.AssetID > 0) cmd.Parameters.AddWithValue("@AssetID", value.AssetID);
                        else if (!string.IsNullOrEmpty(value.Asset)) cmd.Parameters.AddWithValue("@AssetName", value.Asset);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    SummaryInfo currSafety = DataMgrTools.BuildSummaryView(reader);
                                    arrSafety.Add(currSafety);
                                }
                            }
                        }

                        conn.Close();
                    }
                }

                catch (Exception ex)
                {
                    Logger.LogEvent(mProjName, "Get Filter SafetyEvents Exception: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);

                }
            }

            return arrSafety.ToArray();
        }

        public SummaryInfo Get(int summaryID)
        {
            SummaryInfo currSafety = new SummaryInfo();
            string query = string.Format("SELECT * FROM view_summary WHERE summary_id = {0}", summaryID);

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
                            currSafety = DataMgrTools.BuildSummaryView(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(mProjName, "Get: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                    conn.Close();
                }
            }
            return currSafety;
        }


    }
}