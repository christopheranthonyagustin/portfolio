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
        
        //private string mConnStr = "server=localhost;uid=root;pwd=$B$Transit888;database=adas;charset=utf8;max pool size=500;default command timeout=999;";
        private string mConnStr = "server=localhost;uid=root;pwd=$B$Transit888;database=adas;charset=utf8;max pool size=500;default command timeout=99999;";
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

            //string query = "SELECT drv_no AS DrvNo, SUM(FCW) AS FCW, SUM(HW) AS HW, SUM(LDW) AS LDW, SUM(PCW) AS PCW, SUM(FCW) + SUM(HW) + SUM(PCW) AS TOTAL_LDW, SUM(safety_events) AS TOTAL_EVENTS" +
            //   " FROM (SELECT date, drv_no, event_code, case event_code when 'FCW' then safety_events else 0 end AS FCW, case event_code when 'HW' then safety_events else 0 end AS HW, case event_code when 'LDW' then safety_events else 0 end AS LDW, case event_code when 'PCW' then safety_events else 0 end AS PCW, safety_events" +
            //   " FROM (SELECT bcoverall.local_date AS Date, bcoverall.drv_no, event_value.event_code, (count(*) / (svc_mileage.mileage * drvsched.trip)) * 100 AS safety_events FROM view_overallperformance AS bcoverall" +
            //   " INNER JOIN (SELECT OP_DATE, DRV_NO, count(*) AS Trip FROM view_driver_sched_archive where SVC_NO IN (" + value.SvcNo + ") and OP_DATE between @StartTS and @EndTS and depot_id IN (" + value.DepotID + ") and interchange_id IN (" + value.InterchangeID + ") GROUP BY OP_DATE, DRV_NO) AS drvsched ON bcoverall.local_date = drvsched.OP_DATE and bcoverall.drv_no = drvsched.drv_no" +
            //   " INNER JOIN svc_mileage ON bcoverall.svc_no = svc_mileage.svc_no" +
            //   " INNER JOIN event_value ON bcoverall.event = event_value.event_id" +
            //   " where bcoverall.timestamp between @StartTS and @EndTS and bcoverall.depot_id IN (" + value.DepotID + ") and bcoverall.interchange_id IN (" + value.InterchangeID + ") and bcoverall.drv_no is not null and bcoverall.event not in (77,73,84,83,68) and bcoverall.svc_no IN (" + value.SvcNo + ") and svc_mileage.direction_id = 1" +
            //   " GROUP BY bcoverall.local_date , bcoverall.drv_no , bcoverall.event" +
            //   " ) AS swcalc" +
            //   " ) AS swpivot";
            //   if (!string.IsNullOrEmpty(value.DrvNo)) query += " WHERE drv_no IN (" + value.DrvNo + ")";
            //   query += " GROUP BY DrvNo";

            //string query = "SELECT drv_no AS DrvNo, SUM(FCW) AS FCW, SUM(HW) AS HW, SUM(LDW) AS LDW, SUM(PCW) AS PCW, SUM(FCW) + SUM(HW) + SUM(PCW) AS TOTAL_LDW, SUM(safety_events) AS TOTAL_EVENTS" +
            //  " FROM (SELECT date, drv_no, event_code, case event_code when 'FCW' then safety_events else 0 end AS FCW, case event_code when 'HW' then safety_events else 0 end AS HW, case event_code when 'LDW' then safety_events else 0 end AS LDW, case event_code when 'PCW' then safety_events else 0 end AS PCW, safety_events" +
            //  " FROM (SELECT bcoverall.local_date AS Date, bcoverall.drv_no, event_value.event_code, (count(*) / (svc_mileage.mileage * drvsched.trip)) * 100 AS safety_events FROM view_overallperformance AS bcoverall" +
            //  " INNER JOIN (SELECT OP_DATE, DRV_NO, count(*) AS Trip FROM view_driver_sched_archive where SVC_NO IN (" + value.SvcNo + ") and OP_DATE between @StartTS and @EndTS and depot_id IN (" + value.DepotID + ") GROUP BY OP_DATE, DRV_NO) AS drvsched ON bcoverall.local_date = drvsched.OP_DATE and bcoverall.drv_no = drvsched.drv_no" +
            //  " INNER JOIN svc_mileage ON bcoverall.svc_no = svc_mileage.svc_no" +
            //  " INNER JOIN event_value ON bcoverall.event = event_value.event_id" +
            //  " where bcoverall.timestamp between @StartTS and @EndTS and bcoverall.depot_id IN (" + value.DepotID + ") and bcoverall.drv_no is not null and bcoverall.event not in (77,73,84,83,68) and bcoverall.svc_no IN (" + value.SvcNo + ") and svc_mileage.direction_id = 1" +
            //  " GROUP BY bcoverall.local_date , bcoverall.drv_no , bcoverall.event" +
            //  " ) AS swcalc" +
            //  " ) AS swpivot";
            //if (!string.IsNullOrEmpty(value.DrvNo)) query += " WHERE drv_no IN (" + value.DrvNo + ")";
            //query += " GROUP BY DrvNo";

           //SELECT 
           //     total_events,
           //     total_mileage,
           //     oa_perf_criteria.param_desc,
           //     event_value.event_code,
           //     (CASE total_mileage
           //         WHEN 0 THEN 0
           //         ELSE (total_events / total_mileage) * 100
           //     END) AS perf_rating
           // FROM
           //     (SELECT 
           //         IFNULL(oa_perf_count.param_id, oa_criteria_events.param_id) AS param_id,
           //             IFNULL(oa_perf_count.event, oa_criteria_events.event_id) AS event_id,
           //             IFNULL(oa_perf_count.total_events, 0) AS total_events,
           //             IFNULL(oa_perf_count.total_mileage, 0) AS total_mileage
           //     FROM
           //         (SELECT 
           //         oa_perf_total_events.param_id,
           //             oa_perf_total_events.event,
           //             oa_perf_total_events.total_events,
           //             oa_perf_total_mileage.total_mileage
           //     FROM
           //         (SELECT 
           //         oa_perf_filter.param_id,
           //             positions.event,
           //             COUNT(*) total_events
           //     FROM
           //         positions
           //     INNER JOIN (SELECT 
           //         oa_perf_drv.param_id,
           //             oa_perf_params.date_from,
           //             oa_perf_params.date_to,
           //             oa_perf_drv.drv_no
           //     FROM
           //         oa_perf_drv
           //     INNER JOIN oa_perf_params ON oa_perf_drv.param_id = oa_perf_params.param_id
           //         AND oa_perf_drv.session_id = oa_perf_params.session_id
           //     WHERE
           //         oa_perf_params.session_id = 19) oa_perf_filter ON oa_perf_filter.drv_no = positions.drv_no
           //         AND CAST((positions.timestamp + INTERVAL 8 HOUR) AS DATE) BETWEEN oa_perf_filter.date_from AND oa_perf_filter.date_to
           //     WHERE
           //         positions.event NOT IN (77 , 73, 84, 83, 68)
           //     GROUP BY oa_perf_filter.param_id , positions.event) oa_perf_total_events
           //     INNER JOIN (SELECT 
           //         oa_perf_mileage.param_id,
           //             SUM(total_mileage) AS total_mileage
           //     FROM
           //         (SELECT 
           //         oa_perf_filter.param_id,
           //             svc_mileage.mileage * COUNT(*) AS total_mileage
           //     FROM
           //         driver_sched_archive
           //     INNER JOIN svc_mileage ON driver_sched_archive.svc_no = svc_mileage.svc_no
           //     INNER JOIN (SELECT 
           //         oa_perf_drv.param_id,
           //             oa_perf_params.date_from,
           //             oa_perf_params.date_to,
           //             oa_perf_drv.drv_no
           //     FROM
           //         oa_perf_drv
           //     INNER JOIN oa_perf_params ON oa_perf_drv.param_id = oa_perf_params.param_id
           //         AND oa_perf_drv.session_id = oa_perf_params.session_id
           //     WHERE
           //         oa_perf_params.session_id = 19) oa_perf_filter ON oa_perf_filter.drv_no = driver_sched_archive.drv_no
           //         AND driver_sched_archive.op_date BETWEEN oa_perf_filter.date_from AND oa_perf_filter.date_to
           //     GROUP BY oa_perf_filter.param_id , driver_sched_archive.op_date , driver_sched_archive.drv_no) oa_perf_mileage
           //     GROUP BY oa_perf_mileage.param_id) oa_perf_total_mileage ON oa_perf_total_events.param_id = oa_perf_total_mileage.param_id) AS oa_perf_count
           //     RIGHT OUTER JOIN (SELECT 
           //         oa_perf_criteria.param_id, event_value.event_id
           //     FROM
           //         oa_perf_criteria, event_value) oa_criteria_events ON oa_perf_count.param_id = oa_criteria_events.param_id
           //         AND oa_perf_count.event = oa_criteria_events.event_id) oa_perf
           //         INNER JOIN
           //     event_value ON oa_perf.event_id = event_value.event_id
           //         INNER JOIN
           //     oa_perf_criteria ON oa_perf.param_id = oa_perf_criteria.param_id

            //string query = "SELECT total_events, total_mileage, oa_perf_criteria.param_desc, event_value.event_code, CASE total_mileage WHEN 0 THEN 0 ELSE (total_events/total_mileage) * 100  END AS perf_rating FROM" +
            //                    " (SELECT ifnull(oa_perf_count.param_id, oa_criteria_events.param_id) AS param_id," + 
            //                        " ifnull(oa_perf_count.event, oa_criteria_events.event_id) as event_id," +
            //                        " ifnull(oa_perf_count.total_events,0) as total_events," +
            //                        " ifnull(oa_perf_count.total_mileage,0) as total_mileage" +
            //                        " FROM" + 
            //                    " (" +
            //                    " SELECT oa_perf_total_events.param_id, oa_perf_total_events.event, oa_perf_total_events.total_events, oa_perf_total_mileage.total_mileage" +
            //                        " FROM" +
            //                            " (" +
            //                            " SELECT oa_perf_filter.param_id, positions.event, COUNT(*) total_events FROM positions" +
            //                                " INNER JOIN" +
            //                                        " (SELECT oa_perf_drv.param_id, oa_perf_params.date_from, oa_perf_params.date_to, oa_perf_drv.drv_no FROM oa_perf_drv" +
            //                                            " INNER JOIN oa_perf_params ON oa_perf_drv.param_id=oa_perf_params.param_id" +
            //                                                " AND oa_perf_drv.session_id=oa_perf_params.session_id" +
            //                                            " WHERE oa_perf_params.session_id=@SessionID" +
            //                                        " ) oa_perf_filter" +
            //                                    " ON oa_perf_filter.drv_no=positions.drv_no" +
            //                                        " AND CAST((positions.timestamp + INTERVAL 8 HOUR)AS DATE) between oa_perf_filter.date_from and oa_perf_filter.date_to" +
            //                                " WHERE positions.event not in (77,73,84,83,68)" +
            //                                " GROUP BY oa_perf_filter.param_id, positions.event" +
            //                            " ) oa_perf_total_events" +
            //                        " INNER JOIN" +
            //                                " (" +
            //                                " SELECT oa_perf_mileage.param_id, SUM(total_mileage) AS total_mileage" + 
            //                                    " FROM" +  
            //                                        " (" +
            //                                        " SELECT oa_perf_filter.param_id, svc_mileage.mileage * COUNT(*) AS total_mileage FROM driver_sched_archive" + 
            //                                            " INNER JOIN svc_mileage ON driver_sched_archive.svc_no = svc_mileage.svc_no" +
            //                                            " INNER JOIN" +
            //                                                    " (SELECT oa_perf_drv.param_id, oa_perf_params.date_from, oa_perf_params.date_to, oa_perf_drv.drv_no FROM oa_perf_drv" +
            //                                                        " INNER JOIN oa_perf_params ON oa_perf_drv.param_id=oa_perf_params.param_id" +
            //                                                            " AND oa_perf_drv.session_id=oa_perf_params.session_id" +
            //                                                        " WHERE oa_perf_params.session_id=@SessionID" +
            //                                                    " ) oa_perf_filter" +
            //                                                " ON oa_perf_filter.drv_no=driver_sched_archive.drv_no" +
            //                                                    " AND driver_sched_archive.op_date between oa_perf_filter.date_from and oa_perf_filter.date_to" +
            //                                            " GROUP BY oa_perf_filter.param_id, driver_sched_archive.op_date, driver_sched_archive.drv_no" +
            //                                        " ) oa_perf_mileage" +
            //                                    " GROUP BY oa_perf_mileage.param_id" +
            //                                " ) oa_perf_total_mileage" +
            //                            " ON oa_perf_total_events.param_id=oa_perf_total_mileage.param_id" +
            //                    " ) AS oa_perf_count" +
            //                        " RIGHT OUTER JOIN" + 
            //                            " (SELECT oa_perf_criteria.param_id, event_value.event_id" +
            //                                " FROM oa_perf_criteria, event_value) oa_criteria_events" +
            //                            " ON oa_perf_count.param_id = oa_criteria_events.param_id" +
            //                                " AND oa_perf_count.event = oa_criteria_events.event_id" +
            //                    " ) oa_perf" +
            //                    " INNER JOIN event_value" +
            //                      " ON oa_perf.event_id=event_value.event_id" +
            //                    " INNER JOIN oa_perf_criteria" +
            //                      " ON oa_perf.param_id=oa_perf_criteria.param_id";


            //string query = "SELECT oa_perf_criteria.param_desc," +
            //                " event_value.event_code," +
            //                    " oa_perf_total_events.total_events," +
            //                    " oa_perf_total_mileage.total_mileage," +
            //                " CASE oa_perf_total_mileage.total_mileage" +
            //                " WHEN 0 THEN 0" +
            //                " ELSE (oa_perf_total_events.total_events / oa_perf_total_mileage.total_mileage) * 100" +
            //            " END AS perf_rating" +
            //            " FROM" +
            //                " (SELECT" + 
            //                " oa_perf_filter.param_id," +
            //                    " positions.event," +
            //                    " COUNT(*) total_events" +
            //            " FROM" +
            //                " positions" +
            //            " INNER JOIN (SELECT" + 
            //                " oa_perf_drv.param_id," +
            //                    " oa_perf_params.date_from," +
            //                    " oa_perf_params.date_to," +
            //                    " oa_perf_drv.drv_no" +
            //            " FROM" +
            //                " oa_perf_drv" +
            //            " INNER JOIN oa_perf_params ON oa_perf_drv.param_id = oa_perf_params.param_id" +
            //                " AND oa_perf_drv.session_id = oa_perf_params.session_id" +
            //            " WHERE" +
            //                " oa_perf_params.session_id = @SessionID) oa_perf_filter ON oa_perf_filter.drv_no = positions.drv_no" +
            //                " AND CAST((positions.timestamp + INTERVAL 8 HOUR) AS DATE) BETWEEN oa_perf_filter.date_from AND oa_perf_filter.date_to" +
            //           " WHERE" +
            //                " positions.event NOT IN (77 , 73, 84, 83, 68)" +
            //            " GROUP BY oa_perf_filter.param_id , positions.event) oa_perf_total_events" +
            //            " STRAIGHT_JOIN (SELECT" + 
            //                " oa_perf_mileage.param_id," +
            //                    " SUM(total_mileage) AS total_mileage" +
            //            " FROM" +
            //                " (SELECT" + 
            //                " oa_perf_filter.param_id," +
            //                    " svc_mileage.mileage * COUNT(*) AS total_mileage" +
            //            " FROM" +
            //                " driver_sched_archive" +
            //            " STRAIGHT_JOIN svc_mileage ON driver_sched_archive.svc_no = svc_mileage.svc_no" +
            //            " STRAIGHT_JOIN (SELECT" + 
            //                " oa_perf_drv.param_id," +
            //                    " oa_perf_params.date_from," +
            //                    " oa_perf_params.date_to," +
            //                    " oa_perf_drv.drv_no" +
            //            " FROM" +
            //                " oa_perf_drv" +
            //            " INNER JOIN oa_perf_params ON oa_perf_drv.param_id = oa_perf_params.param_id" +
            //                " AND oa_perf_drv.session_id = oa_perf_params.session_id" +
            //            " WHERE" +
            //                " oa_perf_params.session_id = @SessionID) oa_perf_filter ON oa_perf_filter.drv_no = driver_sched_archive.drv_no" +
            //                " AND driver_sched_archive.op_date BETWEEN oa_perf_filter.date_from AND oa_perf_filter.date_to" +
            //            " GROUP BY oa_perf_filter.param_id , driver_sched_archive.op_date , driver_sched_archive.drv_no) oa_perf_mileage" +
            //            " GROUP BY oa_perf_mileage.param_id) oa_perf_total_mileage ON oa_perf_total_events.param_id = oa_perf_total_mileage.param_id" +
            //            " INNER JOIN" +
            //            " event_value ON oa_perf_total_events.event = event_value.event_id" +
            //            " INNER JOIN" +
            //            " oa_perf_criteria ON oa_perf_total_events.param_id = oa_perf_criteria.param_id";

            string query = "SELECT oa_perf_criteria.param_desc," +
                            " event_value.event_code," +
                                " oa_perf_total_events.total_events," +
                                " oa_perf_total_mileage.total_mileage," + 
		                    " CASE oa_perf_total_mileage.total_mileage" +
                            " WHEN 0 THEN 0" +
                            " ELSE (oa_perf_total_events.total_events / oa_perf_total_mileage.total_mileage) * 100" +
                        " END AS perf_rating" +
                        " FROM" +
                            " (SELECT" +  
                            " oa_perf_filter.param_id," +
                                " positions.event," +
                                " COUNT(*) total_events" +
                        " FROM" +
                            " positions" +
                        " INNER JOIN (SELECT" +
                            " oa_perf_drv.param_id," +
                                " oa_perf_params.date_from," +
                                " oa_perf_params.date_to," +
                                " oa_perf_drv.drv_no" +
                        " FROM" +
                            " oa_perf_drv" +
                        " INNER JOIN oa_perf_params ON oa_perf_drv.param_id = oa_perf_params.param_id" +
                            " AND oa_perf_drv.session_id = oa_perf_params.session_id" +
                        " WHERE" +
                            " oa_perf_params.session_id = @SessionID) oa_perf_filter ON oa_perf_filter.drv_no = positions.drv_no" +
                            " AND CAST((positions.timestamp + INTERVAL 8 HOUR) AS DATE) BETWEEN oa_perf_filter.date_from AND oa_perf_filter.date_to" +
                       " WHERE" +
                            " positions.event NOT IN (77 , 73, 84, 83, 68)" +
                        " GROUP BY oa_perf_filter.param_id , positions.event) oa_perf_total_events" +
                        " STRAIGHT_JOIN (SELECT" + 
                            " oa_perf_mileage.param_id," +
                                " SUM(newmileage) AS total_mileage" +
                        " FROM" +
                            " (SELECT" + 
                            " oa_perf_drv.param_id," + " driver_sched_archive.SVC_NO," +
                                " svc_mileage.mileage * COUNT(*) AS newmileage" +
                        " FROM" +
                            " oa_perf_drv" +
                        " INNER JOIN oa_perf_params ON oa_perf_drv.param_id = oa_perf_params.param_id" +
                            " AND oa_perf_params.session_id = @SessionID" +
						" INNER JOIN driver_sched_archive on oa_perf_drv.drv_no = driver_sched_archive.DRV_NO" +		
						" INNER JOIN tags on driver_sched_archive.bus_no= tags.name" +
						" INNER JOIN svc_mileage on driver_sched_archive.SVC_NO = svc_mileage.svc_no" +
                        " WHERE" +
							" driver_sched_archive.op_date BETWEEN oa_perf_params.date_from AND oa_perf_params.date_to" +
							" AND driver_sched_archive.DRV_NO = oa_perf_drv.drv_no" +
						" GROUP BY driver_sched_archive.SVC_NO, oa_perf_drv.param_id) oa_perf_mileage" +
						" GROUP BY oa_perf_mileage.param_id) oa_perf_total_mileage ON oa_perf_total_events.param_id = oa_perf_total_mileage.param_id" +
						" INNER JOIN event_value ON oa_perf_total_events.event = event_value.event_id" +
						" INNER JOIN oa_perf_criteria ON oa_perf_total_events.param_id = oa_perf_criteria.param_id;";

            Logger.LogEvent("Get Query Overall Performance: " + query, System.Diagnostics.EventLogEntryType.Warning);

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
                                    currOverallPerformance = DataMgrTools.BuildOverallPerformance(reader);
                                    currOverallPerformance.SessionID = value.SessionID;
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