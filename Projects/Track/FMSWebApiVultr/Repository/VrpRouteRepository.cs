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
    public class VrpRouteRepository : IVrpRouteRepository
    {
        private string mConnStr = Settings.Default.DB;
        private string mProjName = "FMS-Singapore";
        public IEnumerable<VrpRouteInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<VrpRouteInfo> arrVrpRoute = new List<VrpRouteInfo>();

            if (conn != null)
                conn.Close();

            return arrVrpRoute.ToArray();
        }

        public VrpRouteInfo Get(long id)
        {
            VrpRouteInfo currVrpRoute = new VrpRouteInfo();
            string query = string.Format("SELECT * FROM view_vrp_route_info WHERE vrp_routes_id = {0}", id);

            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        MySqlDataReader reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            currVrpRoute = DataMgrTools.BuildVrpRoute(reader);
                        }

                    }
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Get(VrpRouteRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return currVrpRoute;
        }

        public IEnumerable<VrpRouteInfo> GetByRouteNo(VrpRouteInfo param)
        {

            List<VrpRouteInfo> arrVrpRoute = new List<VrpRouteInfo>();
            VrpRouteInfo currVrpRoute = new VrpRouteInfo();
            object objTemp = new object();

            string query = "SELECT * FROM view_vrp_route_info WHERE (time_window_start between @StartTS and @EndTS)";

            if (param.Flag > 0) query += " and flag = @Flag";
            if (!string.IsNullOrEmpty(param.RouteNo)) query += " and route_no = @RouteNo";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        
                        cmd.Parameters.AddWithValue("@StartTS", param.TimeWindowStart);
                        cmd.Parameters.AddWithValue("@EndTS", param.TimeWindowEnd);
                        cmd.Parameters.AddWithValue("@Flag", param.Flag);
                        cmd.Parameters.AddWithValue("@RouteNo", param.RouteNo);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currVrpRoute = DataMgrTools.BuildVrpRoute(reader);
                                    arrVrpRoute.Add(currVrpRoute);
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-VrpRouteRepository(GetByRouteNo)", System.Diagnostics.EventLogEntryType.Error);

                }


            }

            return arrVrpRoute;
        }

        public bool Update(VrpRouteInfo currVrpRoute)
        {
            bool retVal = false;

            //Logger.LogEvent(string.Format("Update() ArrivalTime {0}: DepartureTime{1}", currVrpRoute.ArrivalTime, currVrpRoute.DepartureTime), System.Diagnostics.EventLogEntryType.Warning);

            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "UPDATE vrp_routes SET route_no = @RouteNo, asset_id = @AssetID, driver_id = @DriverID, " +
                                          "arrival_time = @ArrivalTime, departure_time = @DepartureTime, flag = @Flag " +
                                          "WHERE vrp_routes_id = @VrpRouteID";
                        
                        cmd.Parameters.AddWithValue("@RouteNo", currVrpRoute.RouteNo);
                        cmd.Parameters.AddWithValue("@AssetID", currVrpRoute.AssetID);
                        cmd.Parameters.AddWithValue("@DriverID", currVrpRoute.DriverID);
                        cmd.Parameters.AddWithValue("@ArrivalTime", currVrpRoute.ArrivalTime);
                        cmd.Parameters.AddWithValue("@DepartureTime", currVrpRoute.DepartureTime);
                        cmd.Parameters.AddWithValue("@Flag", currVrpRoute.Flag);
                        cmd.Parameters.AddWithValue("@VrpRouteID", currVrpRoute.VrpRouteID);

                        if (cmd.ExecuteNonQuery() > 0)
                            retVal = true;
                        else
                            retVal = false;

                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Update(VrpRouteRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }
        public bool UpdatePreviousOnwards(VrpRouteInfo currVrpRoute, double arrival_diff, double departure_diff)
        {
            bool retVal = false;
            //Logger.LogEvent(string.Format("UpdatePreviousOnwards() RouteID: {0} Arrival: {1} Departure: {2} ArrivalTime: {3} DepartureTime: {4}", currVrpRoute.VrpRouteID, arrival_diff, departure_diff, currVrpRoute.ArrivalTime, currVrpRoute.DepartureTime), System.Diagnostics.EventLogEntryType.Warning);

            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "UPDATE vrp_routes SET route_no = @RouteNo, asset_id = @AssetID, driver_id = @DriverID, " +
                                          "arrival_time = @ArrivalTime, departure_time = @DepartureTime, flag = @Flag " +
                                          "WHERE vrp_routes_id = @VrpRouteID";
                        
                        cmd.Parameters.AddWithValue("@RouteNo", currVrpRoute.RouteNo);
                        cmd.Parameters.AddWithValue("@AssetID", currVrpRoute.AssetID);
                        cmd.Parameters.AddWithValue("@DriverID", currVrpRoute.DriverID);
                        if (currVrpRoute.Status.Equals("End location"))
                        {
                            cmd.Parameters.AddWithValue("@ArrivalTime", currVrpRoute.ArrivalTime.AddMinutes(arrival_diff));
                            cmd.Parameters.AddWithValue("@DepartureTime", currVrpRoute.DepartureTime);
                        }
                        else
                        {
                            cmd.Parameters.AddWithValue("@ArrivalTime", currVrpRoute.ArrivalTime.AddMinutes(arrival_diff));
                            cmd.Parameters.AddWithValue("@DepartureTime", currVrpRoute.DepartureTime.AddMinutes(departure_diff));
                        }

                        cmd.Parameters.AddWithValue("@Flag", currVrpRoute.Flag);
                        cmd.Parameters.AddWithValue("@VrpRouteID", currVrpRoute.VrpRouteID);

                        if (cmd.ExecuteNonQuery() >= 0)
                            retVal = true;
                        else
                            retVal = false;

                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Update(VrpRouteRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }
        public bool UpdateRoutes(VrpRouteInfo currVrpRoute)
        {
            bool retVal = false;
            VrpRouteInfo currRoute = new VrpRouteInfo();
            List<VrpRouteInfo> arrVrpRouteOnwards = new List<VrpRouteInfo>();

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                using (MySqlCommand cmd = new MySqlCommand())
                {
                    try
                    {
                        Update(currVrpRoute);
                    }
                    catch (Exception ex)
                    {
                        Logger.LogEvent(ex.Message + "-Update(VrpRouteRepository)", System.Diagnostics.EventLogEntryType.Error);
                    }

                    try
                    {
                        string scenario = "";
                        switch (currVrpRoute.Scenario)
                        {
                            case 2:
                                scenario = "SELECT * FROM view_vrp_route_info WHERE route_no = @RouteNo and driver_id = @DriverID and vrp_routes_id < @VrpRouteID";
                                break;
                            case 3:
                                scenario = "SELECT * FROM view_vrp_route_info WHERE route_no = @RouteNo and driver_id = @DriverID and vrp_routes_id > @VrpRouteID";
                                break;
                            case 4:
                                scenario = "SELECT * FROM view_vrp_route_info WHERE route_no = @RouteNo and driver_id = @DriverID and vrp_routes_id != @VrpRouteID";
                                break;
                        }

                        //Logger.LogEvent(string.Format("UpdateRoutes() Scenario: {0}", scenario), System.Diagnostics.EventLogEntryType.Warning);

                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = scenario;
                        
                        cmd.Parameters.AddWithValue("@RouteNo", currVrpRoute.RouteNo);
                        cmd.Parameters.AddWithValue("@DriverID", currVrpRoute.DriverID);
                        cmd.Parameters.AddWithValue("@VrpRouteID", currVrpRoute.VrpRouteID);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currRoute = DataMgrTools.BuildVrpRoute(reader);
                                    arrVrpRouteOnwards.Add(currRoute);
                                }
                            }
                        }

                        conn.Close();
                    }
                    catch (Exception ex)
                    {
                        Logger.LogEvent(ex.Message + "-UpdateOnwards(Get Onwards)", System.Diagnostics.EventLogEntryType.Error);
                    }

                    try
                    {
                        double arrival_diff = (currVrpRoute.ArrivalTime - currVrpRoute.CurrentArrivalTime).TotalMinutes;
                        double departure_diff = (currVrpRoute.DepartureTime - currVrpRoute.CurrentDepartureTime).TotalMinutes;

                        //Logger.LogEvent(string.Format("UpdateRoutes() Arrival: {0} Departure: {1} CurrentArrivalTime: {2} CurrentDepartureTime: {3}", arrival_diff, departure_diff, currVrpRoute.CurrentArrivalTime, currVrpRoute.CurrentDepartureTime), System.Diagnostics.EventLogEntryType.Warning);

                        for (int i = 0; i < arrVrpRouteOnwards.Count; i++)
                        {
                            //arrVrpRouteOnwards[i].CurrentArrivalTime = currVrpRoute.CurrentArrivalTime;
                            //arrVrpRouteOnwards[i].CurrentDepartureTime = currVrpRoute.CurrentDepartureTime;
                            UpdatePreviousOnwards(arrVrpRouteOnwards[i], arrival_diff, departure_diff);
                        }
                    }
                    catch (Exception ex)
                    {
                        Logger.LogEvent("Update VRP Routes Onwards: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                    }
                }
            }

            retVal = true;

            return retVal;
        }


        public bool Cancel(VrpRouteInfo currVrpRoute)
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
                        cmd.CommandText = "UPDATE vrp_routes SET flag = @Flag WHERE route_no = @RouteNo";
                        
                        cmd.Parameters.AddWithValue("@RouteNo", currVrpRoute.RouteNo);
                        cmd.Parameters.AddWithValue("@Flag", currVrpRoute.Flag);

                        if (cmd.ExecuteNonQuery() > 0)
                            retVal = true;
                        else
                            retVal = false;

                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Cancel(VrpRouteRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }
        public bool CancelByRouteID(VrpRouteInfo currVrpRoute)
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
                        cmd.CommandText = "UPDATE vrp_routes SET flag = @Flag WHERE vrp_routes_id = @VrpRouteID";
                        
  
                        cmd.Parameters.AddWithValue("@Flag", currVrpRoute.Flag);
                        cmd.Parameters.AddWithValue("@VrpRouteID", currVrpRoute.VrpRouteID);

                        if (cmd.ExecuteNonQuery() > 0)
                            retVal = true;
                        else
                            retVal = false;

                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-CancelByRouteID(VrpRouteRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }

        public VrpRouteInfo AddOrder(VrpRouteInfo currVrpRoute)
        {
            bool retVal = false;
            string query = "";
            string pickup_ids = "";
            string delivery_ids = "";
            string order_type = "";
            VrpRouteInfo _currVrpRoute = new VrpRouteInfo();

            _currVrpRoute = Get(currVrpRoute.VrpRouteID);

            if (currVrpRoute.OrderType.Equals("Pickup"))
            {
                if (!string.IsNullOrEmpty(_currVrpRoute.DeliveryID)) order_type = "Pickup and Delivery";
                else order_type = "Pickup";

                query = "UPDATE vrp_routes SET pickup_ids = @PickupID, order_type = @OrderType WHERE vrp_routes_id = @VrpRouteID";
                pickup_ids = string.Format("{0},{1}", _currVrpRoute.PickupID, currVrpRoute.PickupID);
                delivery_ids = string.Format("{0}", _currVrpRoute.DeliveryID);
            }
            else if (currVrpRoute.OrderType.Equals("Delivery"))
            {
                if (!string.IsNullOrEmpty(_currVrpRoute.PickupID)) order_type = "Pickup and Delivery";
                else order_type = "Delivery";

                query = "UPDATE vrp_routes SET delivery_ids = @DeliveryID, order_type = @OrderType WHERE vrp_routes_id = @VrpRouteID";
                pickup_ids = string.Format("{0}", _currVrpRoute.PickupID);
                delivery_ids = string.Format("{0},{1}", _currVrpRoute.DeliveryID, currVrpRoute.DeliveryID);
            }


            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = query;
                        
                        cmd.Parameters.AddWithValue("@PickupID", pickup_ids);
                        cmd.Parameters.AddWithValue("@DeliveryID", delivery_ids);
                        cmd.Parameters.AddWithValue("@OrderType", order_type);
                        cmd.Parameters.AddWithValue("@VrpRouteID", currVrpRoute.VrpRouteID);

                        if (cmd.ExecuteNonQuery() > 0)
                            retVal = true;
                        else
                            retVal = false;

                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-AddOrder(VrpRouteRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return _currVrpRoute;
        }

        public VrpRouteInfo DeleteOrder(VrpRouteInfo currVrpRoute)
        {
            bool retVal = false;
            string query = "";
            string pickup_ids = "";
            string delivery_ids = "";
            VrpRouteInfo _currVrpRoute = new VrpRouteInfo();

            _currVrpRoute = Get(currVrpRoute.VrpRouteID);

            if (currVrpRoute.OrderType.Equals("Pickup"))
            {
                query = "UPDATE vrp_routes SET pickup_ids = @PickupID WHERE vrp_routes_id = @VrpRouteID";

                pickup_ids = _currVrpRoute.PickupID;

                List<String> Items = pickup_ids.Split(',').Select(i => i.Trim()).Where(i => i != string.Empty).ToList();
                Items.Remove(currVrpRoute.PickupID); 
                string NewX = String.Join(", ", Items.ToArray());
                pickup_ids = NewX;
                delivery_ids = string.Format("{0}", currVrpRoute.DeliveryID);

            }
            else if (currVrpRoute.OrderType.Equals("Delivery"))
            {
                query = "UPDATE vrp_routes SET delivery_ids = @DeliveryID WHERE vrp_routes_id = @VrpRouteID";
                delivery_ids = _currVrpRoute.DeliveryID;
                List<String> Items = delivery_ids.Split(',').Select(i => i.Trim()).Where(i => i != string.Empty).ToList();
                Items.Remove(currVrpRoute.PickupID);
                string NewX = String.Join(", ", Items.ToArray());
                pickup_ids = string.Format("{0}", currVrpRoute.PickupID);
                delivery_ids = NewX;
            }


            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = query;
                        
                        cmd.Parameters.AddWithValue("@PickupID", pickup_ids);
                        cmd.Parameters.AddWithValue("@DeliveryID", delivery_ids);
                        cmd.Parameters.AddWithValue("@VrpRouteID", currVrpRoute.VrpRouteID);

                        if (cmd.ExecuteNonQuery() > 0)
                            retVal = true;
                        else
                            retVal = false;

                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-AddOrder(VrpRouteRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return _currVrpRoute;
        }

    }
}