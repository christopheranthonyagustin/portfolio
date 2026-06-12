using FMSWebApi.Models;
using FMSWebApi.Properties;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Http;

namespace FMSWebApi.Repository
{
    public class OaPerfParamsInfoRepository : IOaPerfParamsRepository
    {
        //private string mConnStr = "server=localhost;uid=root;pwd=$B$Transit888;database=adas;charset=utf8;max pool size=500;default command timeout=999;";
        private string mConnStr = "server=localhost;uid=root;pwd=$B$Transit888;database=adas;charset=utf8;max pool size=500;default command timeout=99999;";
        private string mProjName = "SBS";

        public IEnumerable<OaPerfParamsInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<OaPerfParamsInfo> arrOverallPerformance = new List<OaPerfParamsInfo>();


            return arrOverallPerformance.ToArray();
        }
        public IEnumerable<OaPerfParamsInfo> GetOverallPerformanceParam([FromUri]OaPerfParamsInfo value)
        {
            List<OaPerfParamsInfo> arrOverallPerformance = new List<OaPerfParamsInfo>();
            OaPerfParamsInfo currOverallPerformance = new OaPerfParamsInfo();
            object objTemp = new object();


            string query = "SELECT * FROM oa_perf_params WHERE session_id = @SessionID order by param_id asc";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@SessionID", value.SessionID);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currOverallPerformance = DataMgrTools.BuildOverallPerformanceParams(reader);
                                    arrOverallPerformance.Add(currOverallPerformance);
                                }
                            }
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent("Get Overall Performance Params: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                }
            }

            return arrOverallPerformance.ToArray();
        }
        public OaPerfParamsInfo Get(int sessionID)
        {
            OaPerfParamsInfo currOverallPerformance = new OaPerfParamsInfo();
            string query = string.Format("SELECT * FROM oa_perf_params WHERE session_id = {0}", sessionID);

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
                            currOverallPerformance = DataMgrTools.BuildOverallPerformanceParams(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(mProjName, "Get Overall Performance Params: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                }
            }
            return currOverallPerformance;
        }
        public OaPerfParamsInfo Add(OaPerfParamsInfo currOaPerfParams)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO oa_perf_params (session_id, param_id, date_from, date_to)" +
                                          " VALUES (@SessionID, @ParamID, @Timestamp, @RxTime)";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@SessionID", currOaPerfParams.SessionID);
                        cmd.Parameters.AddWithValue("@ParamID", currOaPerfParams.ParamID);
                        cmd.Parameters.AddWithValue("@Timestamp", currOaPerfParams.Timestamp);
                        cmd.Parameters.AddWithValue("@RxTime", currOaPerfParams.RxTime);
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(OA Perf Params)", System.Diagnostics.EventLogEntryType.Error);
            }

            return currOaPerfParams;
        }
        public bool Remove(int sessionID)
        {
            bool retVal = false;
            string query = string.Format("DELETE FROM oa_perf_params WHERE session_id = {0}", sessionID);

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
                    Logger.LogEvent(ex.Message + "-Remove OA Perf Params", System.Diagnostics.EventLogEntryType.Error);
                    conn.Close();
                }
            }

            return retVal;
        }
    }
}