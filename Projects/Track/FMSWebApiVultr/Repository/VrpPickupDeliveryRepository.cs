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
    public class VrpPickupDeliveryRepository : IVrpPickupDeliveryRepository
    {
        private string mConnStr = Settings.Default.DB;
        private string mProjName = "FMS-Singapore";
        public IEnumerable<VrpPickupDeliveryInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<VrpPickupDeliveryInfo> arrVrpPickupDelivery = new List<VrpPickupDeliveryInfo>();

            if (conn != null)
                conn.Close();

            return arrVrpPickupDelivery.ToArray();
        }
        public IEnumerable<VrpPickupDeliveryInfo> GetByRouteNo(VrpPickupDeliveryInfo param)
        {

            List<VrpPickupDeliveryInfo> arrVrpPickupDelivery = new List<VrpPickupDeliveryInfo>();
            VrpPickupDeliveryInfo currVrpPickupDelivery = new VrpPickupDeliveryInfo();
            object objTemp = new object();
            
            string query = "SELECT * FROM view_vrp_pickup_delivery WHERE (time_window_start between @StartTS and @EndTS)";

            if (param.DriverID > 0) query += " and driver_id = @DriverID";
            if (param.CompanyID > 0) query += " and company_id = @CompanyID";

            //if (!string.IsNullOrEmpty(param.OrderType)) query += " and order_type = @OrderType";
            if (param.OrderType.Equals("Pickup") || param.OrderType.Equals("Delivery")) query += " and order_type = @OrderType";

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
                        cmd.Parameters.AddWithValue("@DriverID", param.DriverID);
                        cmd.Parameters.AddWithValue("@CompanyID", param.CompanyID);
                        if (param.OrderType.Equals("Pickup") || param.OrderType.Equals("Delivery")) cmd.Parameters.AddWithValue("@OrderType", param.OrderType);
                        cmd.Parameters.AddWithValue("@RouteNo", param.RouteNo);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currVrpPickupDelivery = DataMgrTools.BuildVrpPickupDelivery(reader);
                                    string strFill = "";
                                    try
                                    {
                                        if (param.OrderType.Equals("Pending"))
                                        {
                                            currVrpPickupDelivery.OrderForm = "";
                                            currVrpPickupDelivery.DriverSign = "";
                                            currVrpPickupDelivery.RecipientSign = "";
                                            currVrpPickupDelivery.OrderFormFill = "None";
                                            currVrpPickupDelivery.DriverSignFill = "None";
                                            currVrpPickupDelivery.RecipientSignFill = "None";
                                        }
                                        if (param.OrderType.Equals("Pickup"))
                                        {
                                            if (currVrpPickupDelivery.PickupID > 0)
                                            {

                                                currVrpPickupDelivery.OrderForm = HelperFunctions.GetImage(String.Format("pickup_order_forms/{0}", currVrpPickupDelivery.PickupID), ref strFill);
                                                currVrpPickupDelivery.DriverSign = HelperFunctions.GetImage(String.Format("pickup_order_driver_signs/{0}", currVrpPickupDelivery.PickupID), ref strFill);
                                                currVrpPickupDelivery.RecipientSign = HelperFunctions.GetImage(String.Format("pickup_order_recipient_signs/{0}", currVrpPickupDelivery.PickupID), ref strFill);
                                                Logger.LogEvent(string.Format("GetImages Platform: {0} PickupID: {1} strFill: {2}", param.Platform, currVrpPickupDelivery.PickupID, strFill), System.Diagnostics.EventLogEntryType.Information);
                                                currVrpPickupDelivery.OrderFormFill = strFill;
                                                currVrpPickupDelivery.DriverSignFill = strFill;
                                                currVrpPickupDelivery.RecipientSignFill = strFill;
                                            }
                                        }
                                        else if (param.OrderType.Equals("Delivery"))
                                        {
                                            if (currVrpPickupDelivery.DeliveryID > 0)
                                            {
                                                currVrpPickupDelivery.OrderForm = HelperFunctions.GetImage(String.Format("delivery_order_forms/{0}", currVrpPickupDelivery.DeliveryID), ref strFill);
                                                currVrpPickupDelivery.DriverSign = HelperFunctions.GetImage(String.Format("delivery_order_driver_signs/{0}", currVrpPickupDelivery.DeliveryID), ref strFill);
                                                currVrpPickupDelivery.RecipientSign = HelperFunctions.GetImage(String.Format("delivery_order_recipient_signs/{0}", currVrpPickupDelivery.DeliveryID), ref strFill);
                                                Logger.LogEvent(string.Format("GetImages Platform: {0} DeliveryID: {1} strFill: {2}", param.Platform, currVrpPickupDelivery.DeliveryID, strFill), System.Diagnostics.EventLogEntryType.Information);
                                                currVrpPickupDelivery.OrderFormFill = strFill;
                                                currVrpPickupDelivery.DriverSignFill = strFill;
                                                currVrpPickupDelivery.RecipientSignFill = strFill;
                                            }

                                        }
                                    }
                                    catch (Exception ex)
                                    {
                                        Logger.LogEvent(string.Format("(GetByRouteNo-GetImages) - Error: {0} Platform: {1} PickupID: {2} DeliveryID: {3} strFill: {4}", ex.StackTrace, param.Platform, currVrpPickupDelivery.PickupID, currVrpPickupDelivery.DeliveryID, strFill), System.Diagnostics.EventLogEntryType.Error);
                                    }


                                    arrVrpPickupDelivery.Add(currVrpPickupDelivery);
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {                   
                    Logger.LogEvent(string.Format("VrpPickupDeliveryRepository(GetByRouteNo): {0}", ex.Message), System.Diagnostics.EventLogEntryType.Error);
                }


            }

            return arrVrpPickupDelivery;
        }
        public IEnumerable<VrpPickupDeliveryInfo> GetOrders(VrpPickupDeliveryInfo param)
        {

            List<VrpPickupDeliveryInfo> arrVrpPickupDelivery = new List<VrpPickupDeliveryInfo>();
            VrpPickupDeliveryInfo currVrpPickupDelivery = new VrpPickupDeliveryInfo();
            object objTemp = new object();

            string query = "SELECT * FROM view_vrp_pickup_delivery WHERE flag IN (0,1,4)";

            if (!string.IsNullOrEmpty(param.OrderType)) query += " and order_type = @OrderType";
            if (!string.IsNullOrEmpty(param.RouteNo)) query += " and route_no = @RouteNo";
            if (param.CompanyID > 0) query += " and company_id = @CompanyID";

            query += " and DATE(time_window_start) = CURDATE()";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        
                        cmd.Parameters.AddWithValue("@OrderType", param.OrderType);
                        cmd.Parameters.AddWithValue("@RouteNo", param.RouteNo);
                        cmd.Parameters.AddWithValue("@CompanyID", param.CompanyID);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currVrpPickupDelivery = DataMgrTools.BuildVrpPickupDelivery(reader);
                                    arrVrpPickupDelivery.Add(currVrpPickupDelivery);
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-VrpPickupDeliveryRepository(GetOrders)", System.Diagnostics.EventLogEntryType.Error);

                }


            }

            return arrVrpPickupDelivery;
        }
        public bool UpdatePickupDelivery(VrpPickupInfo currVrpPickup)
        {
            bool retValPickup = false;
            bool retValPickupItem = false;
            SubInventoryHistoryRepository repoSubInventory = new SubInventoryHistoryRepository();
            SubInventoryHistoryInfo currSubInventory = new SubInventoryHistoryInfo();
            VrpRouteRepository repoVrpRoue = new VrpRouteRepository();
            VrpRouteInfo currVrpRoute = new VrpRouteInfo();
            VrpRouteInfo _currVrpRoute = new VrpRouteInfo();
            List<VrpRouteInfo> arrVrpRoute = new List<VrpRouteInfo>();
            List<VrpDeliveryInfo> arrVrpDelivery = new List<VrpDeliveryInfo>();
            VrpDeliveryInfo currVrpDelivery = new VrpDeliveryInfo();
            DateTime d = DateTime.Now;
            string query = "";
            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {

                try
                {
                    //Pickup
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "UPDATE vrp_pickup SET flag = @Flag, driver_remarks = @DriverRemarks WHERE pickup_id = @PickupID";
                        
                        cmd.Parameters.AddWithValue("@Flag", currVrpPickup.Flag);
                        cmd.Parameters.AddWithValue("@DriverRemarks", currVrpPickup.DriverRemarks);
                        cmd.Parameters.AddWithValue("@PickupID", currVrpPickup.PickupID);

                        if (cmd.ExecuteNonQuery() == 1)
                            retValPickup = true;
                        else
                            retValPickup = false;

                        conn.Close();
                    }

                    //Delivery
                    query = "SELECT * FROM view_vrp_delivery WHERE FIND_IN_SET(@PickupID, pickup_id) > 0";

                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = query;
                        
                        cmd.Parameters.AddWithValue("@PickupID", currVrpPickup.PickupID);
                    
                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currVrpDelivery = DataMgrTools.BuildVrpDelivery(reader);
                                    arrVrpDelivery.Add(currVrpDelivery);
                                }
                            }
                        }

                        conn.Close();
                    }

                    if (arrVrpDelivery.Count > 0)
                    {
                        for (int i = 0; i < arrVrpDelivery.Count; i++)
                        {
                            using (MySqlCommand cmd = new MySqlCommand())
                            {
                                conn.Open();
                                cmd.Connection = conn;
                                cmd.CommandText = "UPDATE vrp_delivery SET flag = @Flag, driver_remarks = @DriverRemarks WHERE delivery_id = @DeliveryID";
                                
                                cmd.Parameters.AddWithValue("@Flag", currVrpPickup.Flag);
                                cmd.Parameters.AddWithValue("@DriverRemarks", currVrpPickup.DriverRemarks);
                                cmd.Parameters.AddWithValue("@DeliveryID", arrVrpDelivery[i].DeliveryID);
                                cmd.ExecuteNonQuery();
                                conn.Close();
                            }
                        }
                    }

                    //Routes
                    query = "SELECT * FROM view_vrp_route_info WHERE FIND_IN_SET(@PickupID, pickup_from_ids) > 0";

                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = query;
                        
                        cmd.Parameters.AddWithValue("@PickupID", currVrpPickup.PickupID);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    _currVrpRoute = DataMgrTools.BuildVrpRoute(reader);
                                    arrVrpRoute.Add(_currVrpRoute);
                                }
                            }
                        }

                        conn.Close();
                    }

                    if (arrVrpRoute.Count > 0)
                    {
                        for (int i = 0; i < arrVrpRoute.Count; i++)
                        {
                            using (MySqlCommand cmd = new MySqlCommand())
                            {
                                conn.Open();
                                cmd.Connection = conn;
                                cmd.CommandText = "UPDATE vrp_routes SET flag = @Flag WHERE vrp_routes_id = @VrpRouteID";
                                
                                cmd.Parameters.AddWithValue("@Flag", currVrpPickup.Flag);
                                cmd.Parameters.AddWithValue("@VrpRouteID", arrVrpRoute[i].VrpRouteID);
                                cmd.ExecuteNonQuery();
                                conn.Close();
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-UpdatePickupDelivery(VrpPickupDeliveryRepository)", System.Diagnostics.EventLogEntryType.Error);
                }

                try
                {
                    //Routes
                    if (retValPickup == true && currVrpPickup.VrpRouteID > 0)
                    {
                        currVrpRoute.VrpRouteID = currVrpPickup.VrpRouteID;
                        currVrpRoute.Flag = currVrpPickup.Flag;
                        repoVrpRoue.CancelByRouteID(currVrpRoute);
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-CancelByRouteID(VrpPickupDeliveryRepository)", System.Diagnostics.EventLogEntryType.Error);
                }

                if (retValPickup == true)
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "UPDATE vrp_pickup_item SET flag = @Flag WHERE pickup_id = @PickupID";
                        
                        cmd.Parameters.AddWithValue("@Flag", currVrpPickup.Flag);
                        cmd.Parameters.AddWithValue("@PickupID", currVrpPickup.PickupID);
                        if (cmd.ExecuteNonQuery() > 0)
                            retValPickupItem = true;
                        else
                            retValPickupItem = false;
                        conn.Close();
                    }

                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "UPDATE vrp_delivery_item SET flag = @Flag WHERE pickup_id = @PickupID";
                        
                        cmd.Parameters.AddWithValue("@Flag", currVrpPickup.Flag);
                        cmd.Parameters.AddWithValue("@PickupID", currVrpPickup.PickupID);
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }
                
                if (retValPickupItem == true)
                {
                    currSubInventory.Timestamp = new DateTime(d.Year, d.Month, d.Day, 0, 0, 0);
                    currSubInventory.RxTime = new DateTime(d.Year, d.Month, d.Day, 23, 59, 59);
                    currSubInventory.CompanyID = currVrpPickup.CompanyID;
                    currSubInventory.StockType = currVrpPickup.Flag;
                    currSubInventory.ItemCategory = 2;
                    currSubInventory.DriverID = currVrpPickup.DriverID;
                    currSubInventory.PickupID = currVrpPickup.PickupID;
                    currSubInventory.isIncomplete = currVrpPickup.isIncomplete;
                    repoSubInventory.UpdateAll(currSubInventory);
                }

                //Logger.LogEvent(string.Format("VrpRouteID: {0} retValPickup: {1}", currVrpPickup.VrpRouteID, retValPickup, currSubInventory.Timestamp, currSubInventory.RxTime), System.Diagnostics.EventLogEntryType.Warning);


            }


            return retValPickup;
        }

    }
}