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
        private string mConnStr = Settings.Default.DB;
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

            string query = "SELECT SUM(event = '76') AS LDW, SUM(event = '72') AS HW, SUM(event = '70') AS FCW, SUM(event = '80') AS PCW, SUM(event = '72') + SUM(event = '70') + SUM(event = '80') AS TOTAL_LDW,  SUM(event = '76') + SUM(event = '72') + SUM(event = '70') + SUM(event = '80') AS TOTAL_EVENTS" +
                           " FROM view_bcperformance WHERE timestamp between @StartTS and @EndTS";

            query += " and depot_id IN (" + value.DepotID + ")";
            query += " and interchange_id IN (" + value.InterchangeID + ")";
            if (!string.IsNullOrEmpty(value.DrvNo)) query += " and drv_no IN (" + value.DrvNo + ")";
            query += " and event != 77"; //Maintenance Error
            query += " and event != 73"; //Interval
            query += " and event != 84"; //Tamper Alert
            query += " and event != 83"; //Speed
            query += " and event != 68"; //PDZ

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
                                    currBcPerformance = DataMgrTools.BuildBcPerformance(reader);
                                    currBcPerformance.Timestamp = value.Timestamp;
                                    currBcPerformance.RxTime = value.RxTime;
                                    currBcPerformance.DepotID = value.DepotID;
                                    currBcPerformance.InterchangeID = value.InterchangeID;
                                    currBcPerformance.DrvNo = value.DrvNo;
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