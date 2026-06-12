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
    public class OverallPerformanceInfoRepository : IOverallPerformanceRepository
    {
        private string mConnStr = Settings.Default.DB;
        private string mProjName = "SBS";

        public IEnumerable<OverallPerformanceInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<OverallPerformanceInfo> arrOverallPerformance = new List<OverallPerformanceInfo>();


            return arrOverallPerformance.ToArray();
        }

        public OverallPerformanceInfo Get(int posID)
        {
            OverallPerformanceInfo currOverallPerformance = new OverallPerformanceInfo();
            string query = string.Format("SELECT * FROM view_overallperformance WHERE pos_id = {0}", posID);

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
                            currOverallPerformance = DataMgrTools.BuildOverallPerformance(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(mProjName, "Get Overall Performance: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                    conn.Close();
                }
            }
            return currOverallPerformance;
        }


        public IEnumerable<OverallPerformanceInfo> GetOverallPerformance([FromUri]OverallPerformanceInfo value)
        {
            List<OverallPerformanceInfo> arrOverallPerformance = new List<OverallPerformanceInfo>();
            OverallPerformanceInfo currOverallPerformance = new OverallPerformanceInfo();
            object objTemp = new object();

            string query = "SELECT drv_no AS DrvNo, SUM(FCW) AS FCW, SUM(HW) AS HW, SUM(LDW) AS LDW, SUM(PCW) AS PCW, SUM(FCW) + SUM(HW) + SUM(PCW) AS TOTAL_LDW, SUM(safety_events) AS TOTAL_EVENTS" +
               " FROM (SELECT date, drv_no, event_code, case event_code when 'FCW' then safety_events else 0 end AS FCW, case event_code when 'HW' then safety_events else 0 end AS HW, case event_code when 'LDW' then safety_events else 0 end AS LDW, case event_code when 'PCW' then safety_events else 0 end AS PCW, safety_events" +
               " FROM (SELECT bcoverall.local_date AS Date, bcoverall.drv_no, event_value.event_code, (count(*) / (svc_mileage.mileage * drvsched.trip)) * 100 AS safety_events FROM view_overallperformance AS bcoverall" +
               " INNER JOIN (SELECT OP_DATE, DRV_NO, count(*) AS Trip FROM view_driver_sched_archive where SVC_NO IN (" + value.SvcNo + ") and OP_DATE between @StartTS and @EndTS and depot_id IN (" + value.DepotID + ") and interchange_id IN (" + value.InterchangeID + ") GROUP BY OP_DATE, DRV_NO) AS drvsched ON bcoverall.local_date = drvsched.OP_DATE and bcoverall.drv_no = drvsched.drv_no" +
               " INNER JOIN svc_mileage ON bcoverall.svc_no = svc_mileage.svc_no" +
               " INNER JOIN event_value ON bcoverall.event = event_value.event_id" +
               " where bcoverall.timestamp between @StartTS and @EndTS and bcoverall.depot_id IN (" + value.DepotID + ") and bcoverall.interchange_id IN (" + value.InterchangeID + ") and bcoverall.drv_no is not null and bcoverall.event not in (77,73,84,83,68) and bcoverall.svc_no IN (" + value.SvcNo + ") and svc_mileage.direction_id = 1" +
               " GROUP BY bcoverall.local_date , bcoverall.drv_no , bcoverall.event" +
               " ) AS swcalc" +
               " ) AS swpivot";
               if (!string.IsNullOrEmpty(value.DrvNo)) query += " WHERE drv_no IN (" + value.DrvNo + ")";
               query += " GROUP BY DrvNo";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@StartTS", value.Timestamp);
                        cmd.Parameters.AddWithValue("@EndTS", value.RxTime);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currOverallPerformance = DataMgrTools.BuildOverallPerformance(reader);
                                    currOverallPerformance.Timestamp = value.Timestamp;
                                    currOverallPerformance.RxTime = value.RxTime;
                                    currOverallPerformance.DepotID = value.DepotID;
                                    currOverallPerformance.InterchangeID = value.InterchangeID;
                                    currOverallPerformance.SvcNo = value.SvcNo;
                                    currOverallPerformance.DrvNo = value.DrvNo;
                                    arrOverallPerformance.Add(currOverallPerformance);
                                }
                            }
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent("Get Overall Performance: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                }
            }

            return arrOverallPerformance.ToArray();
        }


    }
}