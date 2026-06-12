using FMSWebApi.Models;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using FMSWebApi.Properties;

namespace FMSWebApi.Repository
{
    public class DriverScheduleRepository : IDriverScheduleRepository
    {
        private string mConnStr = Settings.Default.DB;
        private string mProjName = "FMS-Singapore";
        public IEnumerable<DriverScheduleInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<DriverScheduleInfo> arrDriverSchedule = new List<DriverScheduleInfo>();



            return arrDriverSchedule.ToArray();
        }

        public IEnumerable<DriverScheduleInfo> GetByDriver(DriverScheduleInfo param)
        {

            List<DriverScheduleInfo> arrDriverSchedule = new List<DriverScheduleInfo>();
            DriverScheduleInfo currDriverSchedule = new DriverScheduleInfo();
            object objTemp = new object();


            string query = "SELECT * FROM view_driver_schedule WHERE driver_id = @DriverID";

            if (param.DayID > 0) query += " and day_id = @DayID";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        
                        cmd.Parameters.AddWithValue("@DriverID", param.DriverID);
                        cmd.Parameters.AddWithValue("@DayID", param.DayID);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currDriverSchedule = DataMgrTools.BuildDriverSchedule(reader);
                                    arrDriverSchedule.Add(currDriverSchedule);
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(GetByDriverID[DriverScheduleRepository])", System.Diagnostics.EventLogEntryType.Error);

                }


            }

            return arrDriverSchedule;
        }

        public DriverScheduleInfo Get(int dsID)
        {
            DriverScheduleInfo currDriverSchedule = new DriverScheduleInfo();
            string query = string.Format("SELECT * FROM view_driver_schedule WHERE schedule_id = {0}", dsID);

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
                            currDriverSchedule = DataMgrTools.BuildDriverSchedule(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(DriverScheduleRepository)", System.Diagnostics.EventLogEntryType.Error);
                }
            }
            return currDriverSchedule;
        }

        public DriverScheduleInfo Add(DriverScheduleInfo currDriverSchedule)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO driver_schedule (driver_id, time_window_start, time_window_end, breaktime_start, breaktime_end, day_id) " +
                                                               "VALUES (@DriverID, @TimeStart, @TimeEnd, @BreaktimeStart, @BreaktimeEnd, @DayID)";
                        
                        cmd.Parameters.AddWithValue("@DriverID", currDriverSchedule.DriverID);
                        cmd.Parameters.AddWithValue("@TimeStart", currDriverSchedule.TimeStart);
                        cmd.Parameters.AddWithValue("@TimeEnd", currDriverSchedule.TimeEnd);
                        cmd.Parameters.AddWithValue("@BreaktimeStart", currDriverSchedule.BreaktimeStart);
                        cmd.Parameters.AddWithValue("@BreaktimeEnd", currDriverSchedule.BreaktimeEnd);
                        cmd.Parameters.AddWithValue("@DayID", currDriverSchedule.DayID);
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(DriverScheduleRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return currDriverSchedule;
        }

        public bool Remove(int dsID)
        {
            bool retVal = false;
            string query = string.Format("DELETE FROM driver_schedule WHERE schedule_id = {0}", dsID);

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
                    Logger.LogEvent(ex.Message + "-Delete(DriverScheduleRepository)", System.Diagnostics.EventLogEntryType.Error);
                }
            }

            return retVal;
        }

        public bool Update(DriverScheduleInfo currDriverSchedule)
        {
            bool retVal = false;
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "UPDATE driver_schedule SET driver_id = @DriverID, time_window_start = @TimeStart, time_window_end = @TimeEnd, breaktime_start = @BreaktimeStart, breaktime_end = @BreaktimeEnd, day_id = @DayID " +
                                                             "WHERE schedule_id = @ScheduleID";
                        
                        cmd.Parameters.AddWithValue("@DriverID", currDriverSchedule.DriverID);
                        cmd.Parameters.AddWithValue("@TimeStart", currDriverSchedule.TimeStart);
                        cmd.Parameters.AddWithValue("@TimeEnd", currDriverSchedule.TimeEnd);
                        cmd.Parameters.AddWithValue("@BreaktimeStart", currDriverSchedule.BreaktimeStart);
                        cmd.Parameters.AddWithValue("@BreaktimeEnd", currDriverSchedule.BreaktimeEnd);
                        cmd.Parameters.AddWithValue("@DayID", currDriverSchedule.DayID);
                        cmd.Parameters.AddWithValue("@ScheduleID", currDriverSchedule.ScheduleID);

                        if (cmd.ExecuteNonQuery() == 1)
                            retVal = true;
                        else
                            retVal = false;
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Update(DriverScheduleRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }
    }
}