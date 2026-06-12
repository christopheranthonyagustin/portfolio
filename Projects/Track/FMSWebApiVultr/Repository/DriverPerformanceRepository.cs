using FMSWebApi.Models;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using FMSWebApi.Properties;

namespace FMSWebApi.Repository
{
    public class DriverPerformanceRepository : IDriverPerformanceRepository
    {
        private string mConnStr = Settings.Default.DB;
        private string mProjName = "FMS-Singapore";
        public IEnumerable<VrpDriverPerformance> ClearAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<VrpDriverPerformance> arrDriverPerformance = new List<VrpDriverPerformance>();
            return arrDriverPerformance.ToArray();
        }
        public IEnumerable<VrpDriverPerformanceChart> ClearChart()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<VrpDriverPerformanceChart> arrDriverPerformance = new List<VrpDriverPerformanceChart>();

            return arrDriverPerformance.ToArray();
        }
        public IEnumerable<VrpDriverPerformance> GetByDriver(VrpDriverPerformance param)
        {

            List<VrpDriverPerformance> arrDriverPerformance = new List<VrpDriverPerformance>();
            VrpDriverPerformance currDriverPerformance = new VrpDriverPerformance();
            object objTemp = new object();


            string query = "SELECT * FROM view_vrp_route_reports WHERE (est_departure_time between @EstDepartureTime and @EstArrivalTime)";

            if (param.DriverID > 0) query += " and driver_id = @DriverID";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        
                        cmd.Parameters.AddWithValue("@DriverID", param.DriverID);
                        cmd.Parameters.AddWithValue("@EstDepartureTime", param.EstDepartureTime);
                        cmd.Parameters.AddWithValue("@EstArrivalTime", param.EstArrivalTime);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currDriverPerformance = DataMgrTools.BuildDriverPerformance(reader);
                                    arrDriverPerformance.Add(currDriverPerformance);
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get Driver Performance(GetByDriver)", System.Diagnostics.EventLogEntryType.Error);

                }


            }

            return arrDriverPerformance;
        }
        public IEnumerable<VrpDriverPerformanceChart> GetByDriverChart(VrpDriverPerformanceChart param)
        {

            List<VrpDriverPerformanceChart> arrDriverPerformance = new List<VrpDriverPerformanceChart>();
            VrpDriverPerformanceChart currDriverPerformance = new VrpDriverPerformanceChart();

            var resultCount = 0;
            object objTemp = new object();

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand("sp_vrp_route_reports", conn))
                    {
                        conn.Open();
                        
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@DriverID", param.DriverID);
                        cmd.Parameters.AddWithValue("@CompanyID", param.CompanyID);
                        cmd.Parameters.AddWithValue("@EstDepartureTime", param.EstDepartureTime);
                        cmd.Parameters.AddWithValue("@EstArrivalTime", param.EstArrivalTime);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            do
                            {
                                if (reader.FieldCount > 0)
                                    resultCount++;

                                if ((reader != null) && (reader.HasRows))
                                {
                                    while (reader.Read())
                                    {
                                        int firstIntCol = reader.GetInt32(0);
                                        currDriverPerformance = DataMgrTools.BuildDriverPerformanceChart(reader);
                                        arrDriverPerformance.Add(currDriverPerformance);
                                    }
                                }
                            }
                            while (reader.NextResult());

                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get Driver Attendance Chart(GetByDriver)", System.Diagnostics.EventLogEntryType.Error);
                }


                if (conn != null)
                    conn.Close();

            }


            return arrDriverPerformance.ToArray();

        }

    }
}