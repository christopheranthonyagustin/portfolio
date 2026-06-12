using FMSWebApi.Models;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace FMSWebApi.Repository
{
    public class RouteLocationRepository : IRouteLocationRepository
    {
        private string mConnStr = "server=localhost;uid=root;pwd=@c3c0M;database=tracksg;max pool size=500;";
        private string mProjName = "FMS-Singapore";
        public IEnumerable<RouteLocationInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<RouteLocationInfo> arrLocations = new List<RouteLocationInfo>();

            if (conn != null)
                conn.Close();

            return arrLocations.ToArray();
        }
        public IEnumerable<RouteLocationInfo> GetByDriver(RouteLocationInfo param)
        {
            List<RouteLocationInfo> arrLocations = new List<RouteLocationInfo>();
            RouteLocationInfo currLocation = new RouteLocationInfo();

            string query = "SELECT * FROM view_locations WHERE company_id = @CompanyID";

            if (param.RouteID > 0) query += " and route_id = @RouteID";
            if (param.DriverID > 0) query += " and driver_id = @DriverID";
            if (param.Flag > 0) query += " and flag = @Flag";
            query += " order by et_arrival asc";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@CompanyID", param.CompanyID);
                        cmd.Parameters.AddWithValue("@RouteID", param.RouteID);
                        cmd.Parameters.AddWithValue("@DriverID", param.DriverID);
                        cmd.Parameters.AddWithValue("@Flag", param.Flag);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currLocation = DataMgrTools.BuildRouteLocation(reader);
                                    arrLocations.Add(currLocation);
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(ByDriver)", System.Diagnostics.EventLogEntryType.Error);

                }
            }

            return arrLocations;
        }
        public RouteLocationInfo Get(int locID)
        {
            RouteLocationInfo currLocation = new RouteLocationInfo();

            string query = string.Format("SELECT * FROM view_locations WHERE loc_id = {0}", locID);

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
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(LocationRepository)", System.Diagnostics.EventLogEntryType.Error);
                }
            }
            return currLocation;
        }
        public RouteLocationInfo Add(RouteLocationInfo currLocation)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO locations (segment, location_from, location_to, duration, distance, svc_time, et_arrival, et_departure, driver_id, flag, route_id, company_id, waypoint_id) " +
                                                        "VALUES (@Segment, @LocationFrom, @LocationTo, @Duration, @Distance, @ServiceTime, @ETArrival, @ETDeparture, @DriverID, @Flag, @RouteID, @CompanyID, @WaypointID)";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@Segment", currLocation.Segment);
                        cmd.Parameters.AddWithValue("@LocationFrom", currLocation.LocationFrom);
                        cmd.Parameters.AddWithValue("@LocationTo", currLocation.LocationTo);
                        cmd.Parameters.AddWithValue("@Duration", currLocation.Duration);
                        cmd.Parameters.AddWithValue("@Distance", currLocation.Distance);
                        cmd.Parameters.AddWithValue("@ServiceTime", currLocation.ServiceTime);
                        cmd.Parameters.AddWithValue("@ETArrival", currLocation.ETArrival);
                        cmd.Parameters.AddWithValue("@ETDeparture", currLocation.ETDeparture);
                        cmd.Parameters.AddWithValue("@DriverID", currLocation.DriverID);
                        cmd.Parameters.AddWithValue("@Flag", currLocation.Flag);
                        cmd.Parameters.AddWithValue("@RouteID", currLocation.RouteID);
                        cmd.Parameters.AddWithValue("@CompanyID", currLocation.CompanyID);
                        cmd.Parameters.AddWithValue("@WaypointID", currLocation.WaypointID);
                        cmd.ExecuteNonQuery();

                        long id = cmd.LastInsertedId;
                        currLocation.LocationID = id;

                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(LocationRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return currLocation;
        }
        public bool Remove(int locID)
        {
            bool retVal = false;
            string query = string.Format("DELETE FROM locations WHERE location_id = {0}", locID);

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
                    Logger.LogEvent(ex.Message + "-Remove(LocationRepository)", System.Diagnostics.EventLogEntryType.Error);
                }
            }

            return retVal;
        }
        public bool Update(RouteLocationInfo currLocation)
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
                        cmd.CommandText = "UPDATE locations SET segment = @Segment, location_from = @LocationFrom, location_to = @LocationTo, duration = @Duration, distance = @Distance, " +
                                                               "svc_time = @ServiceTime, et_arrival = @ETArrival, et_departure = @ETDeparture, driver_id = @DriverID, flag = @Flag, route_id = @RouteID, company_id = @CompanyID, waypoint_id = @WaypointID " +
                                                               "WHERE loc_id = @LocationID";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@Segment", currLocation.Segment);
                        cmd.Parameters.AddWithValue("@LocationFrom", currLocation.LocationFrom);
                        cmd.Parameters.AddWithValue("@LocationTo", currLocation.LocationTo);
                        cmd.Parameters.AddWithValue("@Duration", currLocation.Duration);
                        cmd.Parameters.AddWithValue("@Distance", currLocation.Distance);
                        cmd.Parameters.AddWithValue("@ServiceTime", currLocation.ServiceTime);
                        cmd.Parameters.AddWithValue("@ETArrival", currLocation.ETArrival);
                        cmd.Parameters.AddWithValue("@ETDeparture", currLocation.ETDeparture);
                        cmd.Parameters.AddWithValue("@DriverID", currLocation.DriverID);
                        cmd.Parameters.AddWithValue("@Flag", currLocation.Flag);
                        cmd.Parameters.AddWithValue("@RouteID", currLocation.RouteID);
                        cmd.Parameters.AddWithValue("@CompanyID", currLocation.CompanyID);
                        cmd.Parameters.AddWithValue("@WaypointID", currLocation.WaypointID);
                        cmd.Parameters.AddWithValue("@LocationID", currLocation.LocationID);

                        if (cmd.ExecuteNonQuery() == 1)
                            retVal = true;
                        else
                            retVal = false;
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Update(LocationRepository)", System.Diagnostics.EventLogEntryType.Error);
                }
            }

            return retVal;
        }
    }
}