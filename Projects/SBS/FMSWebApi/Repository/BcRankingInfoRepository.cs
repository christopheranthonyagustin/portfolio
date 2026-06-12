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
    public class BcRankingInfoRepository : IBcRankingRepository
    {
        private string mConnStr = Settings.Default.DB;
        private string mProjName = "SBS";

        public IEnumerable<BcRankingInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<BcRankingInfo> arrBcRanking = new List<BcRankingInfo>();


            return arrBcRanking.ToArray();
        }

        public BcRankingInfo Get(int posID)
        {
            BcRankingInfo currBcRanking = new BcRankingInfo();
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
                            currBcRanking = DataMgrTools.BuildBcRanking(reader);
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
            return currBcRanking;
        }


        public IEnumerable<BcRankingInfo> GetBcRanking([FromUri]BcRankingInfo value)
        {
            List<BcRankingInfo> arrBcRanking = new List<BcRankingInfo>();
            BcRankingInfo currBcRanking = new BcRankingInfo();
            object objTemp = new object();

            string query = "SELECT drv_no AS DrvNo, SUM(FCW) AS FCW, SUM(HW) AS HW, SUM(LDW) AS LDW, SUM(PCW) AS PCW, SUM(FCW) + SUM(HW) + SUM(PCW) AS TOTAL_LDW, SUM(safety_events) AS TOTAL_EVENTS" +
                          " FROM (SELECT date, drv_no, event_code, case event_code when 'FCW' then safety_events else 0 end AS FCW, case event_code when 'HW' then safety_events else 0 end AS HW, case event_code when 'LDW' then safety_events else 0 end AS LDW, case event_code when 'PCW' then safety_events else 0 end AS PCW, safety_events" +
                          " FROM (SELECT bcrank.local_date AS Date, bcrank.drv_no, event_value.event_code, (count(*) / (svc_mileage.mileage * drvsched.trip)) * 100 AS safety_events FROM view_bcranking AS bcrank" +
                          " INNER JOIN (SELECT OP_DATE, DRV_NO, count(*) AS Trip FROM view_driver_sched_archive where SVC_NO IN (" + value.SvcNo + ") and OP_DATE between @StartTS and @EndTS and depot_id IN (" + value.DepotID + ") and interchange_id IN (" + value.InterchangeID + ") GROUP BY OP_DATE, DRV_NO) AS drvsched ON bcrank.local_date = drvsched.OP_DATE and bcrank.drv_no = drvsched.drv_no" +
                          " INNER JOIN svc_mileage ON bcrank.svc_no = svc_mileage.svc_no" +
                          " INNER JOIN event_value ON bcrank.event = event_value.event_id" +
                          " where bcrank.timestamp between @StartTS and @EndTS and bcrank.depot_id IN (" + value.DepotID + ") and bcrank.interchange_id IN (" + value.InterchangeID + ") and bcrank.drv_no is not null and bcrank.event not in (77,73,84,83,68) and bcrank.svc_no IN (" + value.SvcNo + ") and svc_mileage.direction_id = 1" +
                          " GROUP BY bcrank.local_date , bcrank.drv_no , bcrank.event" +
                          " ) AS swcalc" +
                          " ) AS swpivot" +
                          " GROUP BY DrvNo";

            query += " ORDER BY " + value.Criteria + " " + value.Performance;
            if (value.LIMIT > 0) query += " LIMIT @LIMIT";

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
                        if (value.LIMIT > 0) cmd.Parameters.AddWithValue("@LIMIT", value.LIMIT);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currBcRanking = DataMgrTools.BuildBcRanking(reader);
                                    currBcRanking.Timestamp = value.Timestamp;
                                    currBcRanking.RxTime = value.RxTime;
                                    currBcRanking.DepotID = value.DepotID;
                                    currBcRanking.InterchangeID = value.InterchangeID;
                                    currBcRanking.Criteria = value.Criteria;
                                    currBcRanking.Performance = value.Performance;
                                    currBcRanking.LIMIT = value.LIMIT;
                                    currBcRanking.SvcNo = value.SvcNo;
                                    arrBcRanking.Add(currBcRanking);
                                }
                            }
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent("Get BC Ranking: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                }
            }

            return arrBcRanking.ToArray();
        }


    }
}