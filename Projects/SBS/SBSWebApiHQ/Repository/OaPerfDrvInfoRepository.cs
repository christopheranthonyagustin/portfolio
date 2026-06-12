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
    public class OaPerfDrvInfoRepository : IOaPerfDrvRepository
    {
        //private string mConnStr = "server=localhost;uid=root;pwd=$B$Transit888;database=adas;charset=utf8;max pool size=500;default command timeout=999;";
        private string mConnStr = "server=localhost;uid=root;pwd=$B$Transit888;database=adas;charset=utf8;max pool size=500;default command timeout=99999;";
        private string mProjName = "SBS";

        public IEnumerable<OaPerfDrvInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<OaPerfDrvInfo> arrOverallPerformance = new List<OaPerfDrvInfo>();


            return arrOverallPerformance.ToArray();
        }
        public IEnumerable<OaPerfDrvInfo> GetOverallPerformanceParam([FromUri]OaPerfDrvInfo value)
        {
            List<OaPerfDrvInfo> arrOverallPerformance = new List<OaPerfDrvInfo>();
            OaPerfDrvInfo currOverallPerformance = new OaPerfDrvInfo();
            object objTemp = new object();


            string query = "SELECT * FROM oa_perf_drv WHERE session_id = @SessionID";

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
                                    currOverallPerformance = DataMgrTools.BuildOverallPerformanceDrv(reader);
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
        public OaPerfDrvInfo Get(int sessionID)
        {
            OaPerfDrvInfo currOverallPerformance = new OaPerfDrvInfo();
            string query = string.Format("SELECT * FROM oa_perf_drv WHERE session_id = {0}", sessionID);

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
                            currOverallPerformance = DataMgrTools.BuildOverallPerformanceDrv(reader);
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
        public OaPerfDrvInfo Add(OaPerfDrvInfo currOaPerfDrv)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO oa_perf_drv (session_id, param_id, drv_no)" +
                                          " VALUES (@SessionID, @ParamID, @DrvNo)";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@SessionID", currOaPerfDrv.SessionID);
                        cmd.Parameters.AddWithValue("@ParamID", currOaPerfDrv.ParamID);
                        cmd.Parameters.AddWithValue("@DrvNo", currOaPerfDrv.DrvNo);
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(OA Perf Drv)", System.Diagnostics.EventLogEntryType.Error);
            }

            return currOaPerfDrv;
        }
        public bool Remove(int sessionID)
        {
            bool retVal = false;
            string query = string.Format("DELETE FROM oa_perf_drv WHERE session_id = {0}", sessionID);

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
                    Logger.LogEvent(ex.Message + "-Remove OA Perf Drv", System.Diagnostics.EventLogEntryType.Error);
                    conn.Close();
                }
            }

            return retVal;
        }
    }
}