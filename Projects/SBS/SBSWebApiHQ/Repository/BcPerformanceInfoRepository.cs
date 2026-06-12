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
    public class BcPerformanceInfoRepository : IBcPerformanceRepository
    {
        //private string mConnStr = "server=localhost;uid=root;pwd=$B$Transit888;database=adas;charset=utf8;max pool size=500;default command timeout=999;";
        private string mConnStr = "server=localhost;uid=root;pwd=$B$Transit888;database=adas;charset=utf8;max pool size=500;default command timeout=99999;";
        private string mProjName = "SBS";

        public IEnumerable<BcPerformanceInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<BcPerformanceInfo> arrBcPerformance = new List<BcPerformanceInfo>();


            return arrBcPerformance.ToArray();
        }

        public BcPerformanceInfo Get(int posID)
        {
            BcPerformanceInfo currBcPerformance = new BcPerformanceInfo();
            string query = string.Format("SELECT * FROM view_bcranking WHERE pos_id = {0}", posID);

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
                            currBcPerformance = DataMgrTools.BuildBcPerformance(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(mProjName, "Get BC Performance: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                    conn.Close();
                }
            }
            return currBcPerformance;
        }


        public IEnumerable<BcPerformanceInfo> GetBcPerformance([FromUri]BcPerformanceInfo value)
        {
            List<BcPerformanceInfo> arrBcPerformance = new List<BcPerformanceInfo>();
            BcPerformanceInfo currBcPerformance = new BcPerformanceInfo();
            object objTemp = new object();

            //string query = "SELECT SUM(event = '76') AS LDW, SUM(event = '72') AS HW, SUM(event = '70') AS FCW, SUM(event = '80') AS PCW, SUM(event = '72') + SUM(event = '70') + SUM(event = '80') AS TOTAL_LDW,  SUM(event = '76') + SUM(event = '72') + SUM(event = '70') + SUM(event = '80') AS TOTAL_EVENTS" +
            //               " FROM view_bcperformance WHERE timestamp between @StartTS and @EndTS";

            //query += " and depot_id IN (" + value.DepotID + ")";
            ////query += " and interchange_id IN (" + value.InterchangeID + ")";
            ////if (!string.IsNullOrEmpty(value.SvcNo)) query += " and svc_no IN (" + value.SvcNo + ")";
            //if (!string.IsNullOrEmpty(value.DrvNo)) query += " and drv_no IN (" + value.DrvNo + ")";
            //query += " and event != 77"; //Maintenance Error
            //query += " and event != 73"; //Interval
            //query += " and event != 84"; //Tamper Alert
            //query += " and event != 83"; //Speed
            //query += " and event != 68"; //PDZ
            //if (!string.IsNullOrEmpty(value.Criteria)) query += " and event = @Criteria";

            //SELECT
            //    IFNULL(bcperf_range_count.range_id,
            //            perf_range.range_id) AS range_id,
            //    IFNULL(bcperf_range_count.index_value,
            //            perf_range.index_value) AS index_value,
            //    IFNULL(bcperf_range_count.range_count, 0) AS range_count
            //FROM
            //    perf_range
            //        LEFT OUTER JOIN
            //    (SELECT
            //        range_id, index_value, COUNT(*) AS range_count
            //    FROM
            //        (SELECT
            //        bcperf.DrvNo,
            //            bcperf.growth_rate,
            //            perf_range.range_id,
            //            perf_range.index_value
            //    FROM
            //        (SELECT 
            //        p1.DrvNo,
            //            p1.total_events_p1 AS p1,
            //            p2.total_events_p2 AS p2,
            //            ((p2.total_events_p2 - p1.total_events_p1) / p1.total_events_p1) * -100 AS growth_rate
            //    FROM
            //        (SELECT 
            //        drv_no AS DrvNo, SUM(safety_events) AS total_events_p1
            //    FROM
            //        (SELECT 
            //        date, drv_no, safety_events
            //    FROM
            //        (SELECT 
            //        bcrank.local_date AS Date,
            //            bcrank.drv_no,
            //            (COUNT(*) / (svc_mileage.mileage * drvsched.trip)) * 100 AS safety_events
            //    FROM
            //        (SELECT 
            //        `positions`.`timestamp` AS `timestamp`,
            //            CAST((`positions`.`timestamp` + INTERVAL 8 HOUR)
            //                AS DATE) AS `local_date`,
            //            `positions`.`event` AS `event`,
            //            `positions`.`svc_no` AS `svc_no`,
            //            `positions`.`drv_no` AS `drv_no`,
            //            `assets`.`depot_id` AS `depot_id`
            //    FROM
            //        `positions` AS positions
            //    INNER JOIN `assets` ON `positions`.`asset_id` = `assets`.`asset_id`
            //    WHERE
            //        (`positions`.`event` = 70)
            //            AND positions.timestamp BETWEEN '2017-07-11 03:00:00' AND '2017-07-11 04:00:00'
            //            AND positions.drv_no IN (20753)) AS bcrank
            //    INNER JOIN (SELECT 
            //        OP_DATE, DRV_NO, COUNT(*) AS Trip
            //    FROM
            //        view_driver_sched_archive
            //    WHERE
            //        SVC_NO IN (147)
            //            AND OP_DATE BETWEEN '2017-07-10' AND '2017-07-12'
            //    GROUP BY OP_DATE , DRV_NO) AS drvsched ON bcrank.local_date = drvsched.OP_DATE
            //        AND bcrank.drv_no = drvsched.drv_no
            //    INNER JOIN svc_mileage ON bcrank.svc_no = svc_mileage.svc_no
            //    WHERE
            //        svc_mileage.direction_id = 1
            //    GROUP BY bcrank.local_date , bcrank.drv_no) AS swcalc) AS swpivot
            //    GROUP BY DrvNo) p1, (SELECT 
            //        drv_no AS DrvNo, SUM(safety_events) AS total_events_p2
            //    FROM
            //        (SELECT 
            //        date, drv_no, safety_events
            //    FROM
            //        (SELECT 
            //        bcrank.local_date AS Date,
            //            bcrank.drv_no,
            //            (COUNT(*) / (svc_mileage.mileage * drvsched.trip)) * 100 AS safety_events
            //    FROM
            //        (SELECT 
            //        `positions`.`timestamp` AS `timestamp`,
            //            CAST((`positions`.`timestamp` + INTERVAL 8 HOUR)
            //                AS DATE) AS `local_date`,
            //            `positions`.`event` AS `event`,
            //            `positions`.`svc_no` AS `svc_no`,
            //            `positions`.`drv_no` AS `drv_no`,
            //            `assets`.`depot_id` AS `depot_id`
            //    FROM
            //        `positions` AS positions
            //    INNER JOIN `assets` ON `positions`.`asset_id` = `assets`.`asset_id`
            //    WHERE
            //        (`positions`.`event` = 70)
            //            AND positions.timestamp BETWEEN '2017-07-11 04:00:00' AND '2017-07-11 06:00:00'
            //            AND positions.drv_no IN (20753)) AS bcrank
            //    INNER JOIN (SELECT 
            //        OP_DATE, DRV_NO, COUNT(*) AS Trip
            //    FROM
            //        view_driver_sched_archive
            //    WHERE
            //        SVC_NO IN (147)
            //            AND OP_DATE BETWEEN '2017-07-10' AND '2017-07-12'
            //    GROUP BY OP_DATE , DRV_NO) AS drvsched ON bcrank.local_date = drvsched.OP_DATE
            //        AND bcrank.drv_no = drvsched.drv_no
            //    INNER JOIN svc_mileage ON bcrank.svc_no = svc_mileage.svc_no
            //    WHERE
            //        svc_mileage.direction_id = 1
            //    GROUP BY bcrank.local_date , bcrank.drv_no) AS swcalc) AS swpivot
            //    GROUP BY DrvNo) p2) AS bcperf
            //    INNER JOIN perf_range ON bcperf.growth_rate >= perf_range.lower_bound AND bcperf.growth_rate < perf_range.upper_bound) AS bcperf_range
            //    GROUP BY range_id , index_value) AS bcperf_range_count ON perf_range.range_id = bcperf_range_count.range_id

            string query = "SELECT ifnull(bcperf_range_count.range_id, perf_range.range_id) AS range_id, ifnull(bcperf_range_count.index_value, perf_range.index_value) AS index_value, ifnull(bcperf_range_count.range_count, 0) AS range_count" +
                " FROM perf_range" +
                " LEFT OUTER JOIN" +
                " (SELECT range_id, index_value, count(*) AS range_count" +
                " FROM" + 
                " (SELECT bcperf.DrvNo, bcperf.growth_rate, perf_range.range_id, perf_range.index_value" +
                " FROM" +
                " (SELECT p1.DrvNo, p1.total_events_p1 AS p1, p2.total_events_p2 AS p2, ((p2.total_events_p2 - p1.total_events_p1)/p1.total_events_p1) * -100 AS growth_rate" +
                " FROM" +
                " (SELECT drv_no AS DrvNo, SUM(safety_events) AS total_events_p1" + //Selection 1
                    " FROM" + 
                        " (SELECT date, drv_no, safety_events" + 
                            " FROM" + 
                                " (SELECT bcrank.local_date AS Date, bcrank.drv_no, (count(*) / (svc_mileage.mileage * drvsched.trip)) * 100 AS safety_events" + 
                                    " FROM (SELECT" + 
                                            " `positions`.`timestamp` AS `timestamp`," +
                                            " CAST((`positions`.`timestamp` + INTERVAL 8 HOUR)" +
                                            " AS DATE) AS `local_date`," +
                                            " `positions`.`event` AS `event`," +
                                            " `positions`.`svc_no` AS `svc_no`," +
                                            " `positions`.`drv_no` AS `drv_no`" +
                                            //" `assets`.`depot_id` AS `depot_id`" +
                                            " FROM" +
                                                " `positions` AS positions" +
                                                " INNER JOIN `assets` ON `positions`.`asset_id` = `assets`.`asset_id`" +
                                            " WHERE" +
                                                " (`positions`.`event` = @Criteria)" +
                                                //" (`positions`.`event` = @Criteria) and assets.depot_id IN (" + value.DepotID1 + ")" +
                                                " and positions.timestamp between @StartTS1 and @EndTS1" +
                                                " and positions.drv_no IN (" + value.DrvNo1 + ")" + 
                                                //" and positions.svc_no IN (025, 004)" +
                                        " ) AS bcrank" + 
                                    " INNER JOIN" + 
                                        " (SELECT OP_DATE, DRV_NO, count(*) AS Trip" + 
                                            " FROM view_driver_sched_archive" +
                                            " where OP_DATE between @StartOP1 and @EndOP1" + 
                                            //" where SVC_NO IN (025, 004) and OP_DATE between @StartTS1 and @EndTS1 and depot_id IN (" + value.DepotID1 + ")" + 
                                            " GROUP BY OP_DATE, DRV_NO" +
                                        " ) AS drvsched" + 
                                        " ON bcrank.local_date = drvsched.OP_DATE and bcrank.drv_no = drvsched.drv_no" + 
                                    " INNER JOIN svc_mileage ON bcrank.svc_no = svc_mileage.svc_no" +
                                    " WHERE svc_mileage.direction_id = 1" + 
                                    " GROUP BY bcrank.local_date , bcrank.drv_no" + 
                                " ) AS swcalc" + 
                        " ) AS swpivot GROUP BY DrvNo" +
                        " ) p1," +
                " (SELECT drv_no AS DrvNo, SUM(safety_events) AS total_events_p2" + //Selection 2
                    " FROM" + 
                        " (SELECT date, drv_no, safety_events" + 
                            " FROM" + 
                                " (SELECT bcrank.local_date AS Date, bcrank.drv_no, (count(*) / (svc_mileage.mileage * drvsched.trip)) * 100 AS safety_events" + 
                                    " FROM (SELECT" + 
                                            " `positions`.`timestamp` AS `timestamp`," +
                                            " CAST((`positions`.`timestamp` + INTERVAL 8 HOUR)" +
                                                " AS DATE) AS `local_date`," +
                                            " `positions`.`event` AS `event`," +
                                            " `positions`.`svc_no` AS `svc_no`," +
                                            " `positions`.`drv_no` AS `drv_no`" +
                                            //" `assets`.`depot_id` AS `depot_id`" +
                                            " FROM" +
                                                " `positions` AS positions" +
                                                " INNER JOIN `assets` ON `positions`.`asset_id` = `assets`.`asset_id`" +
                                            " WHERE" +
                                                " (`positions`.`event` = @Criteria)" +
                                                //" (`positions`.`event` = @Criteria) and assets.depot_id IN (" + value.DepotID2 + ")" +
                                                " and positions.timestamp between @StartTS2 and @EndTS2" +
                                                " and positions.drv_no IN (" + value.DrvNo2 + ")" + 
                                                //" and positions.svc_no IN (025, 004)" +
                                        " ) AS bcrank" + 
                                    " INNER JOIN" + 
                                        " (SELECT OP_DATE, DRV_NO, count(*) AS Trip" + 
                                            " FROM view_driver_sched_archive" +
                                            //" where SVC_NO IN (025, 004) and OP_DATE between @StartTS2 and @EndTS2 and depot_id IN (" + value.DepotID2 + ")" + 
                                            " where OP_DATE between @StartOP2 and @EndOP2" + 
                                            " GROUP BY OP_DATE, DRV_NO" +
                                        " ) AS drvsched" + 
                                        " ON bcrank.local_date = drvsched.OP_DATE and bcrank.drv_no = drvsched.drv_no" + 
                                    " INNER JOIN svc_mileage ON bcrank.svc_no = svc_mileage.svc_no" +
                                    " WHERE svc_mileage.direction_id = 1" + 
                                    " GROUP BY bcrank.local_date , bcrank.drv_no" + 
                                " ) AS swcalc" + 
                        " ) AS swpivot GROUP BY DrvNo" +       
                        " ) p2 where p1.DrvNo = p2.DrvNo" +
                        " ) AS bcperf" +
                    " INNER JOIN perf_range ON bcperf.growth_rate >= perf_range.lower_bound AND bcperf.growth_rate < perf_range.upper_bound" +
                    " ) AS bcperf_range" +
                    " GROUP BY range_id, index_value" +
                    " ) AS bcperf_range_count" +
                    " ON perf_range.range_id = bcperf_range_count.range_id";

            Logger.LogEvent("Get BC Performance: " + query, System.Diagnostics.EventLogEntryType.Warning);

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@StartTS1", value.Timestamp1.ToString("yyyy-MM-dd HH:mm:ss"));
                        cmd.Parameters.AddWithValue("@StartOP1", value.Timestamp1.ToString("yyyy-MM-dd"));
                        cmd.Parameters.AddWithValue("@EndTS1", value.RxTime1.ToString("yyyy-MM-dd HH:mm:ss"));
                        cmd.Parameters.AddWithValue("@EndOP1", value.RxTime1.ToString("yyyy-MM-dd"));
                        cmd.Parameters.AddWithValue("@StartTS2", value.Timestamp2.ToString("yyyy-MM-dd HH:mm:ss"));
                        cmd.Parameters.AddWithValue("@StartOP2", value.Timestamp2.ToString("yyyy-MM-dd"));
                        cmd.Parameters.AddWithValue("@EndTS2", value.RxTime2.ToString("yyyy-MM-dd HH:mm:ss"));
                        cmd.Parameters.AddWithValue("@EndOP2", value.RxTime2.ToString("yyyy-MM-dd"));
                        cmd.Parameters.AddWithValue("@Criteria", value.Criteria);
                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currBcPerformance = DataMgrTools.BuildBcPerformance(reader);
                                    currBcPerformance.Timestamp1 = value.Timestamp1;
                                    currBcPerformance.RxTime1 = value.RxTime1;
                                    currBcPerformance.Timestamp2 = value.Timestamp2;
                                    currBcPerformance.RxTime2 = value.RxTime2;
                                    //currBcPerformance.DepotID1 = value.DepotID1;
                                    //currBcPerformance.DepotID2 = value.DepotID2;
                                    currBcPerformance.DrvNo1 = value.DrvNo1;
                                    currBcPerformance.DrvNo2 = value.DrvNo2;
                                    currBcPerformance.Criteria = value.Criteria;
                                    arrBcPerformance.Add(currBcPerformance);
                                }
                            }
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent("Get BC Performance: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                }
            }

            return arrBcPerformance.ToArray();
        }


    }
}