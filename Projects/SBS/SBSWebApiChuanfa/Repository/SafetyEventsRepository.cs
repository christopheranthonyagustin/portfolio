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
    public class SafetyEventsRepository : ISafetyEventsRepository
    {
        //private string mConnStr = "server=localhost;uid=root;pwd=$B$Transit888;database=adas;charset=utf8;max pool size=500;default command timeout=999;";
        private string mConnStr = "server=localhost;uid=root;pwd=$B$Transit888;database=adas;charset=utf8;max pool size=500;default command timeout=99999;";
        private string mProjName = "SBS";

        public IEnumerable<SafetyEventsInfo> GetAll()
        {
            List<SafetyEventsInfo> arrSafety = new List<SafetyEventsInfo>();
            string query = "";

            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    try
                    {
                        query = string.Format("SELECT * FROM view_safetyevents");

                        using (MySqlCommand cmd = new MySqlCommand(query, conn))
                        {
                            conn.Open();
                            MySqlDataReader reader = cmd.ExecuteReader();
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    SafetyEventsInfo currSafety = DataMgrTools.BuildSafetyEventsView(reader);
                                    arrSafety.Add(currSafety);
                                }
                            }

                            conn.Close();
                        }
                    }
                    catch (Exception ex)
                    {
                        Logger.LogEvent("Exception Safety Events: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                    }

                    if (conn != null)
                        conn.Close();
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-GetAll(SafetyEventsRepository)", System.Diagnostics.EventLogEntryType.Error);
            }



            return arrSafety.ToArray();
        }

        public IEnumerable<SafetyEventsInfo> GetSafetyEventsInfo([FromUri]SafetyEventsInfo value)
        {   
            List<SafetyEventsInfo> arrSafety = new List<SafetyEventsInfo>();
            string query = "SELECT * FROM view_safetyevents WHERE start_time between @StartTS and @EndTS";
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
                        cmd.Parameters.AddWithValue("@StartTS", value.StartTime);
                        cmd.Parameters.AddWithValue("@EndTS", value.EndTime);
                        if (value.AssetID > 0) cmd.Parameters.AddWithValue("@AssetID", value.AssetID);
                        else if (!string.IsNullOrEmpty(value.Asset)) cmd.Parameters.AddWithValue("@AssetName", value.Asset);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    SafetyEventsInfo currSafety = DataMgrTools.BuildSafetyEventsView(reader);
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

        public SafetyEventsInfo Get(int safetyID)
        {
            SafetyEventsInfo currSafety = new SafetyEventsInfo();
            string query = string.Format("SELECT * FROM view_safetyevents WHERE safetyevents_id = {0}", safetyID);

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
                            currSafety = DataMgrTools.BuildSafetyEventsView(reader);
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