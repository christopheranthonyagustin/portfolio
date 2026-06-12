using FMSWebApi.Models;
using FMSWebApi.Properties;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace FMSWebApi.Repository
{
    public class RouteRepository : IRouteRepository
    {
        private string mConnStr = Settings.Default.DB;
        private string mProjName = "FMS-Singapore";
        public IEnumerable<RouteInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<RouteInfo> arrRoutes = new List<RouteInfo>();

            if (conn != null)
                conn.Close();

            return arrRoutes.ToArray();
        }
        public IEnumerable<RouteInfo> GetByCompany(RouteInfo param)
        {
            List<RouteInfo> arrRoutes = new List<RouteInfo>();
            RouteInfo currRoute = new RouteInfo();

            string query = "SELECT * FROM view_routes WHERE company_id = @CompanyID";

            if (param.StartDate != DateTime.MinValue && param.EndDate != DateTime.MinValue) query += " and start_date between @StartTS and @EndTS";
            if (param.DriverID > 0) query += " and driver_id = @DriverID";
            if (param.Flag > 0) query += " and flag = @Flag";
                
            query += " order by start_date desc";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@CompanyID", param.CompanyID);
                        cmd.Parameters.AddWithValue("@DriverID", param.DriverID);
                        cmd.Parameters.AddWithValue("@Flag", param.Flag);
                        if (param.StartDate != DateTime.MinValue && param.EndDate != DateTime.MinValue) cmd.Parameters.AddWithValue("@StartTS", param.StartDate.AddHours(-8));
                        if (param.StartDate != DateTime.MinValue && param.EndDate != DateTime.MinValue) cmd.Parameters.AddWithValue("@EndTS", param.EndDate.AddHours(-8));

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currRoute = DataMgrTools.BuildRoute(reader);
                                    currRoute.Locations = GetLocations(currRoute.RouteID);
                                    arrRoutes.Add(currRoute);
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-GetRoutes(ByCompany)", System.Diagnostics.EventLogEntryType.Error);

                }
            }

            return arrRoutes;
        }
        public RouteInfo Get(int routeID)
        {
            RouteInfo currRoute = new RouteInfo();

            string query = string.Format("SELECT * FROM view_routes WHERE route_id = {0}", routeID);

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
                            currRoute = DataMgrTools.BuildRoute(reader);
                            currRoute.Locations = GetLocations(currRoute.RouteID);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(RouteRepository)", System.Diagnostics.EventLogEntryType.Error);
                }
            }
            return currRoute;
        }
        public RouteInfo Add(RouteInfo currRoute)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO routes (company_id, route_name, route_number, driver_id, service_duration, start, start_date, end, end_date, total_distance, total_driving_time, total_serving_time, flag) " +
                                                      "VALUES (@CompanyID, @RouteName, @RouteNo, @DriverID, @SvcDuration, @Start, @StartDate, @End, @EndDate, @Distance, @Journey, @SvcTime, @Flag)";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@CompanyID", currRoute.CompanyID);
                        cmd.Parameters.AddWithValue("@RouteName", currRoute.RouteName);
                        cmd.Parameters.AddWithValue("@RouteNo", currRoute.RouteNo);
                        cmd.Parameters.AddWithValue("@DriverID", currRoute.DriverID);
                        cmd.Parameters.AddWithValue("@SvcDuration", currRoute.SvcDuration);
                        cmd.Parameters.AddWithValue("@Start", currRoute.Start);
                        cmd.Parameters.AddWithValue("@StartDate", currRoute.StartDate);
                        cmd.Parameters.AddWithValue("@End", currRoute.End);
                        cmd.Parameters.AddWithValue("@EndDate", currRoute.EndDate);
                        cmd.Parameters.AddWithValue("@Distance", currRoute.Distance);
                        cmd.Parameters.AddWithValue("@Journey", currRoute.Journey);
                        cmd.Parameters.AddWithValue("@SvcTime", currRoute.SvcTime);
                        cmd.Parameters.AddWithValue("@Flag", currRoute.Flag);
                        cmd.ExecuteNonQuery();

                        long id = cmd.LastInsertedId;
                        currRoute.RouteID = id;

                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(RouteRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return currRoute;
        }
        public bool Remove(int routeID)
        {
            bool retVal = false;
            string query = "";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    query = string.Format("DELETE FROM routes WHERE route_id = {0}", routeID);

                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        if (cmd.ExecuteNonQuery() == 1)
                            retVal = true;
                        else if (cmd.ExecuteNonQuery() == 2)
                            retVal = true;
                        else
                            retVal = false;
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Remove(RouteRepository)", System.Diagnostics.EventLogEntryType.Error);
                }

                try
                {
                    query = string.Format("DELETE FROM locations WHERE route_id = {0}", routeID);

                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        if (cmd.ExecuteNonQuery() == 1)
                            retVal = true;
                        else if (cmd.ExecuteNonQuery() == 2)
                            retVal = true;
                        else
                            retVal = false;
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Remove Locations(RouteRepository)", System.Diagnostics.EventLogEntryType.Error);
                }
            }

            return retVal;
        }
        public bool Update(RouteInfo currRoute)
        {
            bool retVal = false;
            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "UPDATE routes SET company_id = @CompanyID, route_name = @RouteName, route_number = @RouteNo, driver_id = @DriverID, service_duration = @SvcDuration, start = @Start, start_date = @StartDate, end = @End, end_date = @EndDate, total_distance = @Distance, total_driving_time = @Journey, total_serving_time = @SvcTime, flag = @Flag" +
                                                " WHERE route_id = @RouteID";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@CompanyID", currRoute.CompanyID);
                        cmd.Parameters.AddWithValue("@RouteName", currRoute.RouteName);
                        cmd.Parameters.AddWithValue("@RouteNo", currRoute.RouteNo);
                        cmd.Parameters.AddWithValue("@DriverID", currRoute.DriverID);
                        cmd.Parameters.AddWithValue("@SvcDuration", currRoute.SvcDuration);
                        cmd.Parameters.AddWithValue("@Start", currRoute.Start);
                        cmd.Parameters.AddWithValue("@StartDate", currRoute.StartDate);
                        cmd.Parameters.AddWithValue("@End", currRoute.End);
                        cmd.Parameters.AddWithValue("@EndDate", currRoute.EndDate);
                        cmd.Parameters.AddWithValue("@Distance", currRoute.Distance);
                        cmd.Parameters.AddWithValue("@Journey", currRoute.Journey);
                        cmd.Parameters.AddWithValue("@SvcTime", currRoute.SvcTime);
                        cmd.Parameters.AddWithValue("@Flag", currRoute.Flag);
                        cmd.Parameters.AddWithValue("@RouteID", currRoute.RouteID);

                        if (cmd.ExecuteNonQuery() == 1)
                            retVal = true;
                        else
                            retVal = false;
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Update(RouteRepository)", System.Diagnostics.EventLogEntryType.Error);
                }
            }

            return retVal;
        }

        private List<RouteLocationInfo> GetLocations(long routeID)
        {
            List<RouteLocationInfo> arrLocations = new List<RouteLocationInfo>();
            RouteLocationInfo currLocation = new RouteLocationInfo();
            string query = string.Format("SELECT * FROM view_locations where route_id = {0} order by et_arrival asc", routeID);

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
                            currLocation = DataMgrTools.BuildRouteLocation(reader);
                            arrLocations.Add(currLocation);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(mProjName, "GetLocation - Route: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                }
            }

            return arrLocations;
        }
    }
}