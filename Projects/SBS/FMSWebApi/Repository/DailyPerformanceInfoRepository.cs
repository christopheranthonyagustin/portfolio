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
    public class DailyPerformanceInfoRepository : IDailyPerformanceRepository
    {
        //private string mConnStr = Settings.Default.DB;
        private string mConnStr = "server=66.96.208.81;uid=root;pwd=$B$Transit888;database=adas;charset=utf8;max pool size=500;default command timeout=999;";
        private string mProjName = "SBS";

        public IEnumerable<DailyPerformanceInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<DailyPerformanceInfo> arrBcRanking = new List<DailyPerformanceInfo>();


            return arrBcRanking.ToArray();
        }

        public DailyPerformanceInfo Get(int posID)
        {
            DailyPerformanceInfo currDailyPerformance = new DailyPerformanceInfo();
            string query = string.Format("SELECT * FROM view_dailyperformance WHERE pos_id = {0}", posID);

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
                            currDailyPerformance = DataMgrTools.BuildDailyPerformance(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(mProjName, "Get Daily Performance: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                    conn.Close();
                }
            }
            return currDailyPerformance;
        }


        public IEnumerable<DailyPerformanceInfo> GetDailyPerformance([FromUri]DailyPerformanceInfo value)
        {
            List<DailyPerformanceInfo> arrDailyPerformance = new List<DailyPerformanceInfo>();
            DailyPerformanceInfo currDailyPerformance = new DailyPerformanceInfo();
            object objTemp = new object();


            string query = "SELECT date, SUM(FCW) AS FCW, SUM(HW) AS HW, SUM(LDW) AS LDW, SUM(PCW) AS PCW, SUM(FCW) + SUM(HW) + SUM(PCW) AS TOTAL_LDW, SUM(safety_events) AS TOTAL_EVENTS" +
                           " FROM (SELECT date, drv_no, event_code, case event_code when 'FCW' then safety_events else 0 end AS FCW, case event_code when 'HW' then safety_events else 0 end AS HW, case event_code when 'LDW' then safety_events else 0 end AS LDW, case event_code when 'PCW' then safety_events else 0 end AS PCW, safety_events" +
                           " FROM (SELECT bcperf.local_date AS Date, bcperf.drv_no, event_value.event_code, (count(*) / (svc_mileage.mileage * drvsched.trip)) * 100 AS safety_events FROM view_dailyperformance AS bcperf" +
                           " INNER JOIN (SELECT OP_DATE, DRV_NO, count(*) AS Trip FROM view_driver_sched_archive where SVC_NO IN (" + value.SvcNo + ") and OP_DATE between @StartTS and @EndTS and depot_id IN (" + value.DepotID + ") and interchange_id IN (" + value.InterchangeID + ") GROUP BY OP_DATE, DRV_NO) AS drvsched ON bcperf.local_date = drvsched.OP_DATE and bcperf.drv_no = drvsched.drv_no" +
                           " INNER JOIN svc_mileage ON bcperf.svc_no = svc_mileage.svc_no" + 
                           " INNER JOIN event_value ON bcperf.event = event_value.event_id" +
                           " where bcperf.timestamp between @StartTS and @EndTS and bcperf.depot_id IN (" + value.DepotID + ") and bcperf.interchange_id IN (" + value.InterchangeID + ") and bcperf.drv_no is not null and bcperf.event not in (77,73,84,83,68) and bcperf.svc_no IN (" + value.SvcNo + ") and svc_mileage.direction_id = 1" +
                           " GROUP BY bcperf.local_date , bcperf.drv_no , bcperf.event" +
                           " ) AS swcalc" +
                           " ) AS swpivot" +
                           " WHERE drv_no IN (" + value.DrvNo + ")" +
                           " GROUP BY Date";

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
                                    currDailyPerformance = DataMgrTools.BuildDailyPerformance(reader);
                                    currDailyPerformance.Timestamp = value.Timestamp;
                                    currDailyPerformance.RxTime = value.RxTime;
                                    currDailyPerformance.DepotID = value.DepotID;
                                    currDailyPerformance.InterchangeID = value.InterchangeID;
                                    currDailyPerformance.DrvNo = value.DrvNo;
                                    currDailyPerformance.SvcNo = value.SvcNo;
                                    arrDailyPerformance.Add(currDailyPerformance);
                                }
                            }
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent("Get Daily Performance: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                }
            }

            return arrDailyPerformance.ToArray();
        }


    }
}