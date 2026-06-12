using FMSWebApi.Models;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using FMSWebApi.Properties;

namespace FMSWebApi.Repository
{
    public class DriverAttendanceRepository : IDriverAttendanceRepository
    {
        private string mConnStr = Settings.Default.DB;
        private string mProjName = "FMS-Singapore";
        public IEnumerable<DriverAttendance> ClearAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<DriverAttendance> arrDriverAttendance = new List<DriverAttendance>();
            return arrDriverAttendance.ToArray();
        }
        public IEnumerable<DriverAttendanceChart> ClearChart()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<DriverAttendanceChart> arrDriverAttendance = new List<DriverAttendanceChart>();

            return arrDriverAttendance.ToArray();
        }
        public IEnumerable<DriverAttendance> GetByDriver(DriverAttendance param)
        {

            List<DriverAttendance> arrDriverAttendance = new List<DriverAttendance>();
            DriverAttendance currDriverAttendance = new DriverAttendance();
            object objTemp = new object();


            string query = "SELECT * FROM view_driver_reports WHERE (scheduled_work_time_start between @ScheduledWorkTimeStart and @ScheduledWorkTimeEnd)";

            if (param.DriverID > 0) query += " and driver_id = @DriverID";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        
                        cmd.Parameters.AddWithValue("@DriverID", param.DriverID);
                        cmd.Parameters.AddWithValue("@ScheduledWorkTimeStart", param.ScheduledWorkTimeStart);
                        cmd.Parameters.AddWithValue("@ScheduledWorkTimeEnd", param.ScheduledWorkTimeEnd);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currDriverAttendance = DataMgrTools.BuildDriverAttendance(reader);
                                    arrDriverAttendance.Add(currDriverAttendance);
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get Driver Attendance(GetByDriver)", System.Diagnostics.EventLogEntryType.Error);

                }


            }

            return arrDriverAttendance;
        }
        public IEnumerable<DriverAttendanceChart> GetByDriverChart(DriverAttendanceChart param)
        {

            List<DriverAttendanceChart> arrDriverAttendance = new List<DriverAttendanceChart>();
            DriverAttendanceChart currDriverAttendance = new DriverAttendanceChart();

            var resultCount = 0;
            object objTemp = new object();

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand("sp_driver_reports", conn))
                    {
                        conn.Open();
                        
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@DriverID", param.DriverID);
                        cmd.Parameters.AddWithValue("@CompanyID", param.CompanyID);
                        cmd.Parameters.AddWithValue("@ScheduledWorkTimeStart", param.ScheduledWorkTimeStart);
                        cmd.Parameters.AddWithValue("@ScheduledWorkTimeEnd", param.ScheduledWorkTimeEnd);

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
                                        currDriverAttendance = DataMgrTools.BuildDriverAttendanceChart(reader);
                                        arrDriverAttendance.Add(currDriverAttendance);
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


            return arrDriverAttendance.ToArray();

        }

    }
}