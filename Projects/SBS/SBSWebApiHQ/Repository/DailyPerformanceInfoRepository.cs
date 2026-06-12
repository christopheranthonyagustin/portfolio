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
        //private string mConnStr = "server=localhost;uid=root;pwd=$B$Transit888;database=adas;charset=utf8;max pool size=500;default command timeout=999;";
        private string mConnStr = "server=localhost;uid=root;pwd=$B$Transit888;database=adas;charset=utf8;max pool size=500;default command timeout=99999;";
        //private string mConnStr = "server=localhost;uid=root;pwd=@c3c0M;database=trackdemo;Charset=utf8;";
        private string mProjName = "SBS";

        public DailyPerformanceInfo GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
           DailyPerformanceInfo arrBcRanking = new DailyPerformanceInfo();


            return arrBcRanking;
        }

        //public DailyPerformanceInfo Get(int posID)
        //{
        //    DailyPerformanceInfo currDailyPerformance = new DailyPerformanceInfo();
        //    string query = string.Format("SELECT * FROM view_dailyperformance WHERE pos_id = {0}", posID);

        //    using (MySqlConnection conn = new MySqlConnection(mConnStr))
        //    {
        //        try
        //        {
        //            using (MySqlCommand cmd = new MySqlCommand(query, conn))
        //            {
        //                conn.Open();
        //                MySqlDataReader reader = cmd.ExecuteReader();

        //                while (reader.Read())
        //                {
        //                    currDailyPerformance = DataMgrTools.BuildDailyPerformance(reader);
        //                }
        //                conn.Close();
        //            }
        //        }
        //        catch (Exception ex)
        //        {
        //            Logger.LogEvent(mProjName, "Get Daily Performance: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
        //        }
        //    }
        //    return currDailyPerformance;
        //}


        public DailyPerformanceInfo GetDailyPerformance([FromUri]DailyPerformanceInfo value)
        {
            DailyPerformanceInfo dailyPerformance = new DailyPerformanceInfo();
            List<DailyPerformanceInfoQuery1> arrDailyPerformance = new List<DailyPerformanceInfoQuery1>();
            DailyPerformanceInfoQuery1 currDailyPerformance1 = new DailyPerformanceInfoQuery1();
            DailyPerformanceInfoQuery2 currDailyPerformance2 = new DailyPerformanceInfoQuery2();
            DailyPerformanceInfoQuery3 currDailyPerformance3 = new DailyPerformanceInfoQuery3();
            

            string strDate = (value.Timestamp != DateTime.MinValue ? String.Format("{0:yyyy-MM-dd HH:mm:ss}" + ".000000", value.Timestamp) : "NULL");
            string endDate = (value.RxTime != DateTime.MinValue ? String.Format("{0:yyyy-MM-dd HH:mm:ss}" + ".000000", value.RxTime) : "NULL");

            string query1 = "SELECT" + 
                            " date," +
                            " (SUM(FCWCount) / SUM(total_milage))*100 AS FCW," +
                            " (SUM(HWCount) / SUM(total_milage))*100 AS HW," +
                            " (SUM(LDWCount) / SUM(total_milage))*100 AS LDW," +
                            " (SUM(PCWCount) / SUM(total_milage))*100 AS PCW," +
                            " (SUM(TOTAL_LDWCount) / SUM(total_milage))*100 AS TOTAL_LDW," +
                            " (SUM(TOTAL_EVENTSCount) / SUM(total_milage))*100 AS TOTAL_EVENTS" +
                        " FROM(SELECT" + 
                            " date," +
                            " SUM(FCW) AS FCWCount," +
                            " SUM(HW) AS HWCount," +
                            " SUM(LDW) AS LDWCount," +
                            " SUM(PCW) AS PCWCount," +
                            " SUM(FCW) + SUM(HW) + SUM(PCW) AS TOTAL_LDWCount," +
                            " total_milage AS total_milage," +
                            " drv_no," +
                            " SUM(events_count) AS TOTAL_EVENTSCount" +
                        " FROM" +
                            " (SELECT" + 
                                " date," +
                                    " drv_no," +
                                    " event_code," +
                                    " CASE event_code" +
                                        " WHEN 'FCW' THEN events_count" +
                                        " ELSE 0" +
                                    " END AS FCW," +
                                    " CASE event_code" +
                                        " WHEN 'HW' THEN events_count" +
                                        " ELSE 0" +
                                    " END AS HW," +
                                    " CASE event_code" +
                                        " WHEN 'LDW' THEN events_count" +
                                        " ELSE 0" +
                                    " END AS LDW," +
                                    " CASE event_code" +
                                        " WHEN 'PCW' THEN events_count" +
                                        " ELSE 0" +
                                    " END AS PCW," +
                                    " total_milage," +
                                    " events_count" +
                            " FROM" +
                                " (SELECT" +
                                " DATE((bcperf.timestamp + INTERVAL 8 HOUR)) AS Date," +
                                    " bcperf.drv_no," +
			                        " event_value.event_code," +
                                    " COUNT(*) AS events_count," +
			                        " svc_mileage.mileage * drvsched.trip AS total_milage" +
                            " FROM" +
                                " view_dailyperformance  AS bcperf" +
                            " INNER JOIN (SELECT" + 
                                " OP_DATE, DRV_NO, COUNT(*) AS Trip" +
                            " FROM" +
                                " view_driver_sched_archive" +
                            " WHERE" +
                                " OP_DATE BETWEEN '" + strDate + "' AND '" + endDate +
                                "' AND SVC_NO IN (" + value.SvcNo + ")" +
                                " AND depot_id IN (" + value.DepotID + ")" +
                                " AND  drv_no IN (" + value.DrvNo + ")" +
                            " GROUP BY OP_DATE , DRV_NO) AS drvsched ON CAST((bcperf.timestamp + INTERVAL 8 HOUR)AS DATE) = drvsched.OP_DATE" +
                                " AND bcperf.drv_no = drvsched.drv_no" +
	                        " INNER JOIN svc_mileage ON bcperf.svc_no = svc_mileage.svc_no AND svc_mileage.direction_id = 1" +
                            " INNER JOIN event_value ON bcperf.event = event_value.event_id AND event_value.event_id NOT IN (77 , 73, 84, 83, 68)" +
	                        " WHERE" +
                                    " bcperf.timestamp BETWEEN '" + strDate + "' AND '" + endDate +
                                "' AND  bcperf.drv_no IN (" + value.DrvNo + ")" +
                                " AND bcperf.depot_id IN (" + value.DepotID + ")" + 
                            " GROUP BY Date , bcperf.drv_no , bcperf.event) AS swcalc) AS swpivot" +
                        " GROUP BY DATE ,drv_no) AS PW" +
                        " GROUP BY Date";


            Logger.LogEvent("Get Query 1 Daily Performance: " + query1, System.Diagnostics.EventLogEntryType.Warning);

            string query2 = "SELECT" + 
                            " (SUM(FCWCount) / SUM(total_milage))*100 AS FCW," +
                            " (SUM(HWCount) / SUM(total_milage))*100 AS HW," +
                            " (SUM(LDWCount) / SUM(total_milage))*100 AS LDW," +
                            " (SUM(PCWCount) / SUM(total_milage))*100 AS PCW," +
                            " (SUM(TOTAL_LDWCount) / SUM(total_milage))*100 AS TOTAL_LDW," +
                            " (SUM(TOTAL_EVENTSCount) / SUM(total_milage))*100 AS TOTAL_EVENTS" +
                        " FROM(SELECT" + 
                            " date," +
                            " SUM(FCW) AS FCWCount," +
                            " SUM(HW) AS HWCount," +
                            " SUM(LDW) AS LDWCount," +
                            " SUM(PCW) AS PCWCount," +
                            " SUM(FCW) + SUM(HW) + SUM(PCW) AS TOTAL_LDWCount," +
                            " total_milage AS total_milage," +
                            " drv_no," +
                            " SUM(events_count) AS TOTAL_EVENTSCount" +
                        " FROM" +
                            " (SELECT" +
                                " date," +
                                    " drv_no," +
                                    " event_code," +
                                    " CASE event_code" +
                                        " WHEN 'FCW' THEN events_count" +
                                        " ELSE 0" +
                                    " END AS FCW," +
                                    " CASE event_code" +
                                        " WHEN 'HW' THEN events_count" +
                                        " ELSE 0" +
                                    " END AS HW," +
                                    " CASE event_code" +
                                        " WHEN 'LDW' THEN events_count" +
                                        " ELSE 0" +
                                    " END AS LDW," +
                                    " CASE event_code" +
                                        " WHEN 'PCW' THEN events_count" +
                                        " ELSE 0" +
                                    " END AS PCW," +
                                    " total_milage," +
                                    " events_count" +
                            " FROM" +
                                " (SELECT" +
                                " DATE((bcperf.timestamp + INTERVAL 8 HOUR)) AS Date," +
                                    " bcperf.drv_no," +
			                        " event_value.event_code," +
                                    " COUNT(*) AS events_count," +
			                        " svc_mileage.mileage * drvsched.trip AS total_milage" +
                            " FROM" +
                                " view_dailyperformance  AS bcperf" +
                            " INNER JOIN (SELECT" + 
                                " OP_DATE, DRV_NO, COUNT(*) AS Trip" +
                            " FROM" +
                                " view_driver_sched_archive" +
                            " WHERE" +
                                " OP_DATE BETWEEN ('" + endDate + "' - INTERVAL 7 DAY) AND '" + endDate +
                                "' AND SVC_NO IN (" + value.SvcNo + ")" +
                                " AND depot_id IN (" + value.DepotID + ")" +
                                " AND  drv_no IN (" + value.DrvNo + ")" +
                            " GROUP BY OP_DATE , DRV_NO) AS drvsched ON CAST((bcperf.timestamp + INTERVAL 8 HOUR)AS DATE) = drvsched.OP_DATE" +
                                " AND bcperf.drv_no = drvsched.drv_no" +
	                        " INNER JOIN svc_mileage ON bcperf.svc_no = svc_mileage.svc_no AND svc_mileage.direction_id = 1" +
                            " INNER JOIN event_value ON bcperf.event = event_value.event_id AND event_value.event_id NOT IN (77 , 73, 84, 83, 68)" +
	                        " WHERE" +
                                    " bcperf.timestamp BETWEEN ('" + endDate + "' - INTERVAL 7 DAY) AND '" + endDate +
                                "' AND  bcperf.drv_no IN (" + value.DrvNo + ")" +
                                " AND bcperf.depot_id IN (" + value.DepotID + ")" +
                            " GROUP BY Date , bcperf.drv_no , bcperf.event) AS swcalc) AS swpivot" +
                        " GROUP BY DATE ,drv_no) AS PW";

            Logger.LogEvent("Get Query 2 Daily Performance: " + query2, System.Diagnostics.EventLogEntryType.Warning);

            string query3 = "SELECT" +
                " (SUM(FCWCount) / SUM(total_milage))*100 AS FCW," +
                " (SUM(HWCount) / SUM(total_milage))*100 AS HW," +
                " (SUM(LDWCount) / SUM(total_milage))*100 AS LDW," +
                " (SUM(PCWCount) / SUM(total_milage))*100 AS PCW," +
                " (SUM(TOTAL_LDWCount) / SUM(total_milage))*100 AS TOTAL_LDW," +
                " (SUM(TOTAL_EVENTSCount) / SUM(total_milage))*100 AS TOTAL_EVENTS" +
            " FROM(SELECT" +
                " date," +
                " SUM(FCW) AS FCWCount," +
                " SUM(HW) AS HWCount," +
                " SUM(LDW) AS LDWCount," +
                " SUM(PCW) AS PCWCount," +
                " SUM(FCW) + SUM(HW) + SUM(PCW) AS TOTAL_LDWCount," +
                " total_milage AS total_milage," +
                " drv_no," +
                " SUM(events_count) AS TOTAL_EVENTSCount" +
            " FROM" +
                " (SELECT" +
                    " date," +
                        " drv_no," +
                        " event_code," +
                        " CASE event_code" +
                            " WHEN 'FCW' THEN events_count" +
                            " ELSE 0" +
                        " END AS FCW," +
                        " CASE event_code" +
                            " WHEN 'HW' THEN events_count" +
                            " ELSE 0" +
                        " END AS HW," +
                        " CASE event_code" +
                            " WHEN 'LDW' THEN events_count" +
                            " ELSE 0" +
                        " END AS LDW," +
                        " CASE event_code" +
                            " WHEN 'PCW' THEN events_count" +
                            " ELSE 0" +
                        " END AS PCW," +
                        " total_milage," +
                        " events_count" +
                " FROM" +
                    " (SELECT" +
                    " DATE((bcperf.timestamp + INTERVAL 8 HOUR)) AS Date," +
                        " bcperf.drv_no," +
                        " event_value.event_code," +
                        " COUNT(*) AS events_count," +
                        " svc_mileage.mileage * drvsched.trip AS total_milage" +
                " FROM" +
                    " view_dailyperformance  AS bcperf" +
                " INNER JOIN (SELECT" +
                    " OP_DATE, DRV_NO, COUNT(*) AS Trip" +
                " FROM" +
                    " view_driver_sched_archive" +
                " WHERE" +
                    " OP_DATE BETWEEN ('" + endDate + "' - INTERVAL 30 DAY) AND '" + endDate +
                    "' AND SVC_NO IN (" + value.SvcNo + ")" +
                    " AND depot_id IN (" + value.DepotID + ")" +
                    " AND  drv_no IN (" + value.DrvNo + ")" +
                " GROUP BY OP_DATE , DRV_NO) AS drvsched ON CAST((bcperf.timestamp + INTERVAL 8 HOUR)AS DATE) = drvsched.OP_DATE" +
                    " AND bcperf.drv_no = drvsched.drv_no" +
                " INNER JOIN svc_mileage ON bcperf.svc_no = svc_mileage.svc_no AND svc_mileage.direction_id = 1" +
                " INNER JOIN event_value ON bcperf.event = event_value.event_id AND event_value.event_id NOT IN (77 , 73, 84, 83, 68)" +
                " WHERE" +
                        " bcperf.timestamp BETWEEN ('" + endDate + "' - INTERVAL 30 DAY) AND '" + endDate +
                    "' AND  bcperf.drv_no IN (" + value.DrvNo + ")" +
                    " AND bcperf.depot_id IN (" + value.DepotID + ")" +
                " GROUP BY Date , bcperf.drv_no , bcperf.event) AS swcalc) AS swpivot" +
            " GROUP BY DATE ,drv_no) AS PW";

            Logger.LogEvent("Get Query 3 Daily Performance: " + query3, System.Diagnostics.EventLogEntryType.Warning);

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query1, conn))
                    {
                        conn.Open();
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@StartTS", value.Timestamp);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currDailyPerformance1 = DataMgrTools.BuildDailyPerformance1(reader);
                                    currDailyPerformance1.Timestamp = value.Timestamp;
                                    currDailyPerformance1.RxTime = value.RxTime;
                                    currDailyPerformance1.DepotID = value.DepotID;
                                    currDailyPerformance1.DrvNo = value.DrvNo;
                                    currDailyPerformance1.SvcNo = value.SvcNo;
                                    arrDailyPerformance.Add(currDailyPerformance1);
                                }
                            }
                        }
                        conn.Close();
                        dailyPerformance.Query1 = arrDailyPerformance;
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent("Get Daily Performance: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                }

                //currDailyPerformance.Timestamp = value.Timestamp;
                //currDailyPerformance.RxTime = value.RxTime;
                //currDailyPerformance.DepotID = value.DepotID;
                //currDailyPerformance.DrvNo = value.DrvNo;
                //currDailyPerformance.SvcNo = value.SvcNo;
                //arrDailyPerformance.Add(currDailyPerformance);

                //try
                //{
                //    for (int i = 0; i < arrDailyPerformance.Count; i++)
                //    {
                //        using (MySqlCommand cmd = new MySqlCommand(query1, conn))
                //        {
                //            conn.Open();
                //            cmd.Prepare();
                //            cmd.Parameters.AddWithValue("@StartTS", value.Timestamp);

                //            using (MySqlDataReader reader = cmd.ExecuteReader())
                //            {
                //                if ((reader != null) && (reader.HasRows))
                //                {
                //                    while (reader.Read())
                //                    {
                //                        currDailyPerformance1 = DataMgrTools.BuildDailyPerformance1(reader);
                //                        currDailyPerformance1.Timestamp = value.Timestamp;
                //                        currDailyPerformance1.RxTime = value.RxTime;
                //                        currDailyPerformance1.DepotID = value.DepotID;
                //                        currDailyPerformance1.DrvNo = value.DrvNo;
                //                        currDailyPerformance1.SvcNo = value.SvcNo;
                //                        //arrDailyPerformance[i].Query1 = currDailyPerformance1;
                //                        arrDailyPerformance.Add(currDailyPerformance1);
                //                    }
                //                }
                //            }
                //            conn.Close();
                //        }
                //    }
                //}
                //catch (Exception ex)
                //{
                //    Logger.LogEvent("Get Daily Performance Query 1: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                //}

                try
                {
                    for (int i = 0; i < arrDailyPerformance.Count; i++)
                    {
                        using (MySqlCommand cmd = new MySqlCommand(query2, conn))
                        {
                            conn.Open();
                            cmd.Prepare();
                            cmd.Parameters.AddWithValue("@StartTS", value.Timestamp);

                            using (MySqlDataReader reader = cmd.ExecuteReader())
                            {
                                if ((reader != null) && (reader.HasRows))
                                {
                                    while (reader.Read())
                                    {
                                        currDailyPerformance2 = DataMgrTools.BuildDailyPerformance2(reader);
                                        currDailyPerformance2.Timestamp = value.Timestamp;
                                        currDailyPerformance2.RxTime = value.RxTime;
                                        currDailyPerformance2.DepotID = value.DepotID;
                                        currDailyPerformance2.DrvNo = value.DrvNo;
                                        currDailyPerformance2.SvcNo = value.SvcNo;
                                    }
                                }
                            }
                            conn.Close();
                            dailyPerformance.Query2 = currDailyPerformance2;
                        }
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent("Get Daily Performance Query 2: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                }


                try
                {
                    for (int i = 0; i < arrDailyPerformance.Count; i++)
                    {
                        using (MySqlCommand cmd = new MySqlCommand(query3, conn))
                        {
                            conn.Open();
                            cmd.Prepare();
                            cmd.Parameters.AddWithValue("@StartTS", value.Timestamp);

                            using (MySqlDataReader reader = cmd.ExecuteReader())
                            {
                                if ((reader != null) && (reader.HasRows))
                                {
                                    while (reader.Read())
                                    {
                                        currDailyPerformance3 = DataMgrTools.BuildDailyPerformance3(reader);
                                        currDailyPerformance3.Timestamp = value.Timestamp;
                                        currDailyPerformance3.RxTime = value.RxTime;
                                        currDailyPerformance3.DepotID = value.DepotID;
                                        currDailyPerformance3.DrvNo = value.DrvNo;
                                        currDailyPerformance3.SvcNo = value.SvcNo;
                                    }
                                }
                            }
                            conn.Close();
                            dailyPerformance.Query3 = currDailyPerformance3;
                        }
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent("Get Daily Performance Query 3: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                }
            }

            return dailyPerformance;
        }


    }
}