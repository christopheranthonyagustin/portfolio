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
    public class VrpDeliveryRepository : IVrpDeliveryRepository
    {
        private string mConnStr = Settings.Default.DB;
        private string mProjName = "FMS-Singapore";
        public IEnumerable<VrpDeliveryInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<VrpDeliveryInfo> arrVrpDelivery = new List<VrpDeliveryInfo>();

            if (conn != null)
                conn.Close();

            return arrVrpDelivery.ToArray();
        }
        public IEnumerable<VrpDeliveryInfo> GetByRouteNo(VrpDeliveryInfo param)
        {

            List<VrpDeliveryInfo> arrVrpDelivery = new List<VrpDeliveryInfo>();
            VrpDeliveryInfo currVrpDelivery = new VrpDeliveryInfo();
            object objTemp = new object();

            string query = "SELECT * FROM view_vrp_delivery WHERE route_no = @RouteNo";


            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        
                        cmd.Parameters.AddWithValue("@RouteNo", param.RouteNo);


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
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(GetByRouteNo)", System.Diagnostics.EventLogEntryType.Error);

                }


            }

            return arrVrpDelivery;
        }

 
        public VrpDeliveryInfo Get(int id)
        {
            VrpDeliveryInfo currVrpDelivery = new VrpDeliveryInfo();
            string query = string.Format("SELECT * FROM view_vrp_delivery WHERE delivery_id = {0}", id);
            
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
                            currVrpDelivery = DataMgrTools.BuildVrpDelivery(reader);
                            string strFill = "";
                            currVrpDelivery.OrderForm = HelperFunctions.GetImage(String.Format("delivery_order_forms/{0}", currVrpDelivery.DeliveryID), ref strFill);
                            currVrpDelivery.DriverSign = HelperFunctions.GetImage(String.Format("delivery_order_driver_signs/{0}", currVrpDelivery.DeliveryID), ref strFill);
                            currVrpDelivery.RecipientSign = HelperFunctions.GetImage(String.Format("delivery_order_recipient_signs/{0}", currVrpDelivery.DeliveryID), ref strFill);
                            currVrpDelivery.OrderFormFill = strFill;
                            currVrpDelivery.DriverSignFill = strFill;
                            currVrpDelivery.RecipientSignFill = strFill;
                        }
                        
                    }
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Get(VrpPickupRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return currVrpDelivery;
        }


        public VrpDeliveryInfo Add(VrpDeliveryInfo currVrpDelivery)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO vrp_delivery (route_no, priority_id, driver_id, timestamp, rx_time, customer_id, order_no, " +
                                                          "waiting_duration, service_duration, unload_duration, time_window_start, time_window_end, remarks, " +
                                                          "name, latitude, longitude, billing_name, billing_address, billing_unit, billing_building, billing_postal_code, billing_phone, billing_mobile, billing_email, shipping_name, shipping_address, shipping_unit, shipping_building, shipping_postal_code, shipping_phone, shipping_mobile, shipping_email, amount, accessories, isAssign, flag, pickup_id) " +
                                                            "VALUES (@RouteNo, @PriorityID, @DriverID, @Timestamp, @RxTime, @CustomerID, @OrderNo, " +
                                                          "@WaitingDuration, @ServiceDuration, @UnLoadDuration, @TimeWindowStart, @TimeWindowEnd, @Remarks, " +
                                                          "@Name, @Lat, @Long, @BillingName, @BillingAddress, @BillingUnit, @BillingBuilding, @BillingPostal, @BillingPhone, @BillingMobile, @BillingEmail, @ShippingName, @ShippingAddress, @ShippingUnit, @ShippingBuilding, @ShippingPostal, @ShippingPhone, @ShippingMobile, @ShippingEmail, @Amount, @Accessories, @isAssign, @Flag, @PickupID)";
                        
                        cmd.Parameters.AddWithValue("@RouteNo", currVrpDelivery.RouteNo);
                        cmd.Parameters.AddWithValue("@PriorityID", currVrpDelivery.PriorityID);
                        cmd.Parameters.AddWithValue("@DriverID", currVrpDelivery.DriverID);
                        cmd.Parameters.AddWithValue("@Timestamp", currVrpDelivery.Timestamp);
                        cmd.Parameters.AddWithValue("@RxTime", currVrpDelivery.RxTime);
                        cmd.Parameters.AddWithValue("@CustomerID", currVrpDelivery.CustomerID);
                        cmd.Parameters.AddWithValue("@OrderNo", currVrpDelivery.OrderNo);
                        cmd.Parameters.AddWithValue("@WaitingDuration", currVrpDelivery.WaitingDuration);
                        cmd.Parameters.AddWithValue("@ServiceDuration", currVrpDelivery.ServiceDuration);
                        cmd.Parameters.AddWithValue("@UnLoadDuration", currVrpDelivery.UnLoadDuration);
                        cmd.Parameters.AddWithValue("@TimeWindowStart", currVrpDelivery.TimeWindowStart);
                        cmd.Parameters.AddWithValue("@TimeWindowEnd", currVrpDelivery.TimeWindowEnd);
                        cmd.Parameters.AddWithValue("@Remarks", currVrpDelivery.Remarks);
                        cmd.Parameters.AddWithValue("@Name", currVrpDelivery.Name);
                        cmd.Parameters.AddWithValue("@Lat", currVrpDelivery.Lat);
                        cmd.Parameters.AddWithValue("@Long", currVrpDelivery.Long);
                        cmd.Parameters.AddWithValue("@BillingName", currVrpDelivery.BillingName);
                        cmd.Parameters.AddWithValue("@BillingAddress", currVrpDelivery.BillingAddress);
                        cmd.Parameters.AddWithValue("@BillingUnit", currVrpDelivery.BillingUnit);
                        cmd.Parameters.AddWithValue("@BillingBuilding", currVrpDelivery.BillingBuilding);
                        cmd.Parameters.AddWithValue("@BillingPostal", currVrpDelivery.BillingPostal);
                        cmd.Parameters.AddWithValue("@BillingPhone", currVrpDelivery.BillingPhone);
                        cmd.Parameters.AddWithValue("@BillingMobile", currVrpDelivery.BillingMobile);
                        cmd.Parameters.AddWithValue("@BillingEmail", currVrpDelivery.BillingEmail);
                        cmd.Parameters.AddWithValue("@ShippingName", currVrpDelivery.ShippingName);
                        cmd.Parameters.AddWithValue("@ShippingAddress", currVrpDelivery.ShippingAddress);
                        cmd.Parameters.AddWithValue("@ShippingUnit", currVrpDelivery.ShippingUnit);
                        cmd.Parameters.AddWithValue("@ShippingBuilding", currVrpDelivery.ShippingBuilding);
                        cmd.Parameters.AddWithValue("@ShippingPostal", currVrpDelivery.ShippingPostal);
                        cmd.Parameters.AddWithValue("@ShippingPhone", currVrpDelivery.ShippingPhone);
                        cmd.Parameters.AddWithValue("@ShippingMobile", currVrpDelivery.ShippingMobile);
                        cmd.Parameters.AddWithValue("@ShippingEmail", currVrpDelivery.ShippingEmail);
                        cmd.Parameters.AddWithValue("@Amount", currVrpDelivery.Amount);
                        cmd.Parameters.AddWithValue("@Accessories", currVrpDelivery.Accessories);
                        cmd.Parameters.AddWithValue("@isAssign", currVrpDelivery.isAssign);
                        cmd.Parameters.AddWithValue("@Flag", currVrpDelivery.Flag);
                        cmd.Parameters.AddWithValue("@PickupID", currVrpDelivery.PickupID);
                        cmd.ExecuteNonQuery();
                        long id = cmd.LastInsertedId;
                        currVrpDelivery.DeliveryID = id;

                        conn.Close();
                    }
                }         
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(VrpDeliveryRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return currVrpDelivery;
        }

        public VrpDeliveryInfo AddImport(VrpDeliveryInfo currVrpDelivery)
        {
            try
            {
                SettingsRepository settingRepo = new SettingsRepository();
                LocationIQForwardGeoCodeResponse fwGeocode = new LocationIQForwardGeoCodeResponse();
                LocationIQGeoCodeResponse revGeocode = new LocationIQGeoCodeResponse();

                string postal = currVrpDelivery.ShippingPostal.Trim();
                double _lat = 0;
                double _long = 0;
                string block = "";
                string road = "";
                string building = "";
                string address = "";
                int n;

                fwGeocode = settingRepo.GetOneMapForward(postal);

                _lat = fwGeocode.lat;
                _long = fwGeocode.lon;

                block = fwGeocode.BLK_NO;
                road = fwGeocode.ROAD_NAME;
                building = fwGeocode.BUILDING;

                address = string.Format("{0} {1}", block, road);

                if (string.IsNullOrEmpty(address)) address = currVrpDelivery.ShippingAddress;

                //get driver id
                long driverId = RepoHelpers.GetDriverId(currVrpDelivery.Driver, currVrpDelivery.CompanyID);
                if (driverId == 0)
                {
                    driverId = currVrpDelivery.DriverID;
                }
                else if (driverId < 0)
                {
                    currVrpDelivery.ErrorMessage = Consts.ERR_DRIVERERROR;
                    return currVrpDelivery;
                }

                //get customer id
                long customerId = RepoHelpers.GetCustomerId(currVrpDelivery.Customer, currVrpDelivery.CompanyID);
                if (customerId == 0)
                {
                    customerId = currVrpDelivery.CustomerID;
                }
                else if (customerId < 0)
                {
                    currVrpDelivery.ErrorMessage = Consts.ERR_CUSTOMERERROR;
                    return currVrpDelivery;
                }

                //get accessories id
                string accessoriesId = RepoHelpers.GetAccessoriesId(currVrpDelivery.Accessories, currVrpDelivery.CompanyID);

                //get pickup id
                long pickupId = RepoHelpers.GetPickupId(currVrpDelivery.RouteNo, currVrpDelivery.PickupOrderNo);


                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO vrp_delivery (route_no, priority_id, driver_id, timestamp, rx_time, customer_id, order_no, " +
                                                          "waiting_duration, service_duration, unload_duration, time_window_start, time_window_end, remarks, " +
                                                          "name, latitude, longitude, billing_name, billing_address, billing_unit, billing_building, billing_postal_code, billing_phone, billing_mobile, billing_email, shipping_name, shipping_address, shipping_unit, shipping_building, shipping_postal_code, shipping_phone, shipping_mobile, shipping_email, amount, accessories, isAssign, flag, pickup_id) " +
                                                            "VALUES (@RouteNo, @PriorityID, @DriverID, @Timestamp, @RxTime, @CustomerID, @OrderNo, " +
                                                          "@WaitingDuration, @ServiceDuration, @UnLoadDuration, @TimeWindowStart, @TimeWindowEnd, @Remarks, " +
                                                          "@Name, @Lat, @Long, @BillingName, @BillingAddress, @BillingUnit, @BillingBuilding, @BillingPostal, @BillingPhone, @BillingMobile, @BillingEmail, @ShippingName, @ShippingAddress, @ShippingUnit, @ShippingBuilding, @ShippingPostal, @ShippingPhone, @ShippingMobile, @ShippingEmail, @Amount, @Accessories, @isAssign, @Flag, @PickupID)";
                        
                        cmd.Parameters.AddWithValue("@RouteNo", currVrpDelivery.RouteNo);
                        cmd.Parameters.AddWithValue("@PriorityID", currVrpDelivery.PriorityID);
                        cmd.Parameters.AddWithValue("@DriverID", driverId);
                        cmd.Parameters.AddWithValue("@Timestamp", currVrpDelivery.Timestamp);
                        cmd.Parameters.AddWithValue("@RxTime", currVrpDelivery.RxTime);
                        cmd.Parameters.AddWithValue("@CustomerID", customerId);
                        cmd.Parameters.AddWithValue("@OrderNo", currVrpDelivery.OrderNo);
                        cmd.Parameters.AddWithValue("@WaitingDuration", currVrpDelivery.WaitingDuration);
                        cmd.Parameters.AddWithValue("@ServiceDuration", currVrpDelivery.ServiceDuration);
                        cmd.Parameters.AddWithValue("@UnLoadDuration", currVrpDelivery.UnLoadDuration);
                        cmd.Parameters.AddWithValue("@TimeWindowStart", currVrpDelivery.TimeWindowStart);
                        cmd.Parameters.AddWithValue("@TimeWindowEnd", currVrpDelivery.TimeWindowEnd);
                        cmd.Parameters.AddWithValue("@Remarks", currVrpDelivery.Remarks);
                        cmd.Parameters.AddWithValue("@Name", currVrpDelivery.Name);
                        cmd.Parameters.AddWithValue("@Lat", _lat);
                        cmd.Parameters.AddWithValue("@Long", _long);
                        cmd.Parameters.AddWithValue("@BillingName", currVrpDelivery.BillingName);
                        cmd.Parameters.AddWithValue("@BillingAddress", currVrpDelivery.BillingAddress);
                        cmd.Parameters.AddWithValue("@BillingUnit", currVrpDelivery.BillingUnit);
                        cmd.Parameters.AddWithValue("@BillingBuilding", currVrpDelivery.BillingBuilding);
                        cmd.Parameters.AddWithValue("@BillingPostal", currVrpDelivery.BillingPostal);
                        cmd.Parameters.AddWithValue("@BillingPhone", currVrpDelivery.BillingPhone);
                        cmd.Parameters.AddWithValue("@BillingMobile", currVrpDelivery.BillingMobile);
                        cmd.Parameters.AddWithValue("@BillingEmail", currVrpDelivery.BillingEmail);
                        cmd.Parameters.AddWithValue("@ShippingName", currVrpDelivery.ShippingName);
                        cmd.Parameters.AddWithValue("@ShippingAddress", address.Trim());
                        cmd.Parameters.AddWithValue("@ShippingUnit", currVrpDelivery.ShippingUnit);
                        cmd.Parameters.AddWithValue("@ShippingBuilding", building);
                        cmd.Parameters.AddWithValue("@ShippingPostal", currVrpDelivery.ShippingPostal);
                        cmd.Parameters.AddWithValue("@ShippingPhone", currVrpDelivery.ShippingPhone);
                        cmd.Parameters.AddWithValue("@ShippingMobile", currVrpDelivery.ShippingMobile);
                        cmd.Parameters.AddWithValue("@ShippingEmail", currVrpDelivery.ShippingEmail);
                        cmd.Parameters.AddWithValue("@Amount", currVrpDelivery.Amount);
                        cmd.Parameters.AddWithValue("@Accessories", accessoriesId);
                        cmd.Parameters.AddWithValue("@isAssign", currVrpDelivery.isAssign);
                        cmd.Parameters.AddWithValue("@Flag", currVrpDelivery.Flag);
                        cmd.Parameters.AddWithValue("@PickupID", pickupId);
                        cmd.ExecuteNonQuery();
                        long id = cmd.LastInsertedId;
                        currVrpDelivery.DeliveryID = id;

                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(VrpDeliveryRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return currVrpDelivery;
        }

        public bool Remove(int id)
        {
            bool retVal = false;
            string query = string.Format("DELETE FROM vrp_delivery WHERE delivery_id = {0}", id);
            
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        if (cmd.ExecuteNonQuery() == 1)
                            retVal = true;
                        else
                            retVal = false;
                    }
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Remove(VrpPickupRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return retVal;
        }

        public bool Update(VrpDeliveryInfo currVrpDelivery)
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
                        cmd.CommandText = "UPDATE vrp_delivery SET route_no = @RouteNo, priority_id = @PriorityID, driver_id = @DriverID, timestamp = @Timestamp, rx_time = @RxTime, customer_id = @CustomerID, order_no = @OrderNo, " +
                                                                "waiting_duration = @WaitingDuration, service_duration = @ServiceDuration, unload_duration = @UnLoadDuration, time_window_start = @TimeWindowStart, time_window_end = @TimeWindowEnd, remarks = @Remarks, " +
                                                                "name = @Name, latitude = @Lat, longitude = @Long, billing_name = @BillingName, billing_address = @BillingAddress, billing_unit = @BillingUnit, billing_building = @BillingBuilding, billing_postal_code = @BillingPostal, billing_phone = @BillingPhone, billing_mobile = @BillingMobile, billing_email = @BillingEmail, shipping_name = @ShippingName, shipping_address = @ShippingAddress, shipping_unit = @ShippingUnit, shipping_building = @ShippingBuilding, shipping_postal_code = @ShippingPostal, shipping_phone = @ShippingPhone, shipping_mobile = @ShippingMobile, shipping_email = @ShippingEmail, amount = @Amount, accessories = @Accessories, isAssign = @isAssign, flag = @Flag, pickup_id = @PickupID, driver_remarks = @DriverRemarks " +
                                                                "WHERE delivery_id = @DeliveryID";
                        
                        cmd.Parameters.AddWithValue("@RouteNo", currVrpDelivery.RouteNo);
                        cmd.Parameters.AddWithValue("@PriorityID", currVrpDelivery.PriorityID);
                        cmd.Parameters.AddWithValue("@DriverID", currVrpDelivery.DriverID);
                        cmd.Parameters.AddWithValue("@Timestamp", currVrpDelivery.Timestamp);
                        cmd.Parameters.AddWithValue("@RxTime", currVrpDelivery.RxTime);
                        cmd.Parameters.AddWithValue("@CustomerID", currVrpDelivery.CustomerID);
                        cmd.Parameters.AddWithValue("@OrderNo", currVrpDelivery.OrderNo);
                        cmd.Parameters.AddWithValue("@WaitingDuration", currVrpDelivery.WaitingDuration);
                        cmd.Parameters.AddWithValue("@ServiceDuration", currVrpDelivery.ServiceDuration);
                        cmd.Parameters.AddWithValue("@UnLoadDuration", currVrpDelivery.UnLoadDuration);
                        cmd.Parameters.AddWithValue("@TimeWindowStart", currVrpDelivery.TimeWindowStart);
                        cmd.Parameters.AddWithValue("@TimeWindowEnd", currVrpDelivery.TimeWindowEnd);
                        cmd.Parameters.AddWithValue("@Remarks", currVrpDelivery.Remarks);
                        cmd.Parameters.AddWithValue("@Name", currVrpDelivery.Name);
                        cmd.Parameters.AddWithValue("@Lat", currVrpDelivery.Lat);
                        cmd.Parameters.AddWithValue("@Long", currVrpDelivery.Long);
                        cmd.Parameters.AddWithValue("@BillingName", currVrpDelivery.BillingName);
                        cmd.Parameters.AddWithValue("@BillingAddress", currVrpDelivery.BillingAddress);
                        cmd.Parameters.AddWithValue("@BillingUnit", currVrpDelivery.BillingUnit);
                        cmd.Parameters.AddWithValue("@BillingBuilding", currVrpDelivery.BillingBuilding);
                        cmd.Parameters.AddWithValue("@BillingPostal", currVrpDelivery.BillingPostal);
                        cmd.Parameters.AddWithValue("@BillingPhone", currVrpDelivery.BillingPhone);
                        cmd.Parameters.AddWithValue("@BillingMobile", currVrpDelivery.BillingMobile);
                        cmd.Parameters.AddWithValue("@BillingEmail", currVrpDelivery.BillingEmail);
                        cmd.Parameters.AddWithValue("@ShippingName", currVrpDelivery.ShippingName);
                        cmd.Parameters.AddWithValue("@ShippingAddress", currVrpDelivery.ShippingAddress);
                        cmd.Parameters.AddWithValue("@ShippingUnit", currVrpDelivery.ShippingUnit);
                        cmd.Parameters.AddWithValue("@ShippingBuilding", currVrpDelivery.ShippingBuilding);
                        cmd.Parameters.AddWithValue("@ShippingPostal", currVrpDelivery.ShippingPostal);
                        cmd.Parameters.AddWithValue("@ShippingPhone", currVrpDelivery.ShippingPhone);
                        cmd.Parameters.AddWithValue("@ShippingMobile", currVrpDelivery.ShippingMobile);
                        cmd.Parameters.AddWithValue("@ShippingEmail", currVrpDelivery.ShippingEmail);
                        cmd.Parameters.AddWithValue("@Amount", currVrpDelivery.Amount);
                        cmd.Parameters.AddWithValue("@Accessories", currVrpDelivery.Accessories);
                        cmd.Parameters.AddWithValue("@isAssign", currVrpDelivery.isAssign);
                        cmd.Parameters.AddWithValue("@Flag", currVrpDelivery.Flag);
                        cmd.Parameters.AddWithValue("@PickupID", currVrpDelivery.PickupID);
                        cmd.Parameters.AddWithValue("@DriverRemarks", currVrpDelivery.DriverRemarks);
                        cmd.Parameters.AddWithValue("@DeliveryID", currVrpDelivery.DeliveryID);  

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
                Logger.LogEvent(ex.Message + "-Update(VrpDeliveryRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }

        public bool UpdateDeliveryDriver(VrpDeliveryInfo currVrpDelivery)
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
                        cmd.CommandText = "UPDATE vrp_delivery SET driver_id = @DriverID WHERE route_no = @RouteNo";
                        
                        cmd.Parameters.AddWithValue("@DriverID", currVrpDelivery.DriverID);
                        cmd.Parameters.AddWithValue("@RouteNo", currVrpDelivery.RouteNo);

                        if (cmd.ExecuteNonQuery() >= 1)
                            retVal = true;
                        else
                            retVal = false;
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-UpdateDeliveryDriver(VrpDeliveryRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }

        public bool RemovePickup(VrpDeliveryInfo currVrpDelivery)
        {
            bool retVal = false;
            string query = string.Format("DELETE FROM vrp_delivery WHERE route_no = @RouteNo");

            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        
                        cmd.Parameters.AddWithValue("@RouteNo", currVrpDelivery.RouteNo);
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
                Logger.LogEvent(ex.Message + "-Remove Pickup(VrpPickupRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }
    }
}