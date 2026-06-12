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
    public class VrpPickupRepository : IVrpPickupRepository
    {
        private string mConnStr = Settings.Default.DB;
        private string mProjName = "FMS-Singapore";
        public IEnumerable<VrpPickupInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<VrpPickupInfo> arrVrpPickup = new List<VrpPickupInfo>();

            if (conn != null)
                conn.Close();

            return arrVrpPickup.ToArray();
        }
        public IEnumerable<VrpPickupInfo> GetByRouteNo(VrpPickupInfo param)
        {

            List<VrpPickupInfo> arrVrpPickup = new List<VrpPickupInfo>();
            VrpPickupInfo currVrpPickup = new VrpPickupInfo();
            object objTemp = new object();

            string query = "SELECT * FROM view_vrp_pickup WHERE route_no = @RouteNo";
            if (!string.IsNullOrEmpty(param.OrderNo)) query += " and order_no = @OrderNo";


            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        
                        cmd.Parameters.AddWithValue("@RouteNo", param.RouteNo);
                        cmd.Parameters.AddWithValue("@OrderNo", param.OrderNo);


                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currVrpPickup = DataMgrTools.BuildVrpPickup(reader);
                                    arrVrpPickup.Add(currVrpPickup);
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

            return arrVrpPickup;
        }

        public VrpPickupInfo GetByOrderNo(string route_no, string reference_no)
        {

            List<VrpPickupInfo> arrVrpPickup = new List<VrpPickupInfo>();
            VrpPickupInfo currVrpPickup = new VrpPickupInfo();
            object objTemp = new object();

            string query = "SELECT * FROM view_vrp_pickup WHERE route_no = @RouteNo";
            if (!string.IsNullOrEmpty(reference_no)) query += " and order_no = @OrderNo";


            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        
                        cmd.Parameters.AddWithValue("@RouteNo", route_no);
                        cmd.Parameters.AddWithValue("@OrderNo", reference_no);


                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currVrpPickup = DataMgrTools.BuildVrpPickup(reader);
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

            return currVrpPickup;
        }


        public VrpPickupInfo Get(int id)
        {
            VrpPickupInfo currVrpPickup = new VrpPickupInfo();
            string query = string.Format("SELECT * FROM view_vrp_pickup WHERE pickup_id = {0}", id);
            
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
                            currVrpPickup = DataMgrTools.BuildVrpPickup(reader);
                            string strFill = "";
                            currVrpPickup.OrderForm = HelperFunctions.GetImage(String.Format("pickup_order_forms/{0}", currVrpPickup.PickupID), ref strFill);
                            currVrpPickup.DriverSign = HelperFunctions.GetImage(String.Format("pickup_order_driver_signs/{0}", currVrpPickup.PickupID), ref strFill);
                            currVrpPickup.RecipientSign = HelperFunctions.GetImage(String.Format("pickup_order_recipient_signs/{0}", currVrpPickup.PickupID), ref strFill);
                            currVrpPickup.OrderFormFill = strFill;
                            currVrpPickup.DriverSignFill = strFill;
                            currVrpPickup.RecipientSignFill = strFill;
                        }
                        
                    }
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Get(VrpPickupRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return currVrpPickup;
        }
        public VrpPickupInfo GetByOrder(string route_no, string order_no)
        {
            VrpPickupInfo currVrpPickup = new VrpPickupInfo();
            string query = string.Format("SELECT * FROM view_vrp_pickup WHERE route_no = @RouteNo and order_no = @OrderNo");

            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        
                        cmd.Parameters.AddWithValue("@RouteNo", route_no);
                        cmd.Parameters.AddWithValue("@OrderNo", order_no);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currVrpPickup = DataMgrTools.BuildVrpPickup(reader);
                                }
                            }
                        }

                        conn.Close();
                    }
                
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-GetByOrder", System.Diagnostics.EventLogEntryType.Error);
            }

            return currVrpPickup;
        }

        public VrpPickupInfo AddImport(VrpPickupInfo currVrpPickup)
        {
            try
            {
                SettingsRepository settingRepo = new SettingsRepository();
                LocationIQForwardGeoCodeResponse fwGeocode = new LocationIQForwardGeoCodeResponse();
                LocationIQGeoCodeResponse revGeocode = new LocationIQGeoCodeResponse();

                string postal = currVrpPickup.Postal.Trim();
                double _lat = 0;
                double _long = 0;
                string block = "";
                string road = "";
                string building = "";
                string address = "";
             

                fwGeocode = settingRepo.GetOneMapForward(postal);

                _lat = fwGeocode.lat;
                _long = fwGeocode.lon;

                block = fwGeocode.BLK_NO;
                road = fwGeocode.ROAD_NAME;
                building = fwGeocode.BUILDING;

                address = string.Format("{0} {1}", block, road);

                if (string.IsNullOrEmpty(address)) address = currVrpPickup.Address;


                //get driver id
                long driverId = RepoHelpers.GetDriverId(currVrpPickup.Driver, currVrpPickup.CompanyID);
                if (driverId == 0)
                {
                    driverId = currVrpPickup.DriverID;
                }
                else if (driverId < 0)
                {
                    currVrpPickup.ErrorMessage = Consts.ERR_DRIVERERROR;
                    return currVrpPickup;
                }

                //get customer id
                long customerId = RepoHelpers.GetCustomerId(currVrpPickup.Customer, currVrpPickup.CompanyID);
                if (customerId == 0)
                {
                    customerId = currVrpPickup.CustomerID;
                }
                else if (customerId < 0)
                {
                    currVrpPickup.ErrorMessage = Consts.ERR_CUSTOMERERROR;
                    return currVrpPickup;
                }

                //get accessories id
                string accessoriesId = RepoHelpers.GetAccessoriesId(currVrpPickup.Accessories, currVrpPickup.CompanyID);

                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO vrp_pickup (route_no, priority_id, driver_id, timestamp, rx_time, customer_id, order_no, " +
                                                          "waiting_duration, service_duration, load_duration, time_window_start, time_window_end, remarks, " +
                                                          "name, latitude, longitude, address, unit, building, postal_code, phone, mobile, email, amount, accessories, isAssign, flag) " +
                                                            "VALUES (@RouteNo, @PriorityID, @DriverID, @Timestamp, @RxTime, @CustomerID, @OrderNo, " +
                                                          "@WaitingDuration, @ServiceDuration, @LoadDuration, @TimeWindowStart, @TimeWindowEnd, @Remarks, " +
                                                          "@Name, @Lat, @Long, @Address, @Unit, @Building, @Postal, @Phone, @Mobile, @Email, @Amount, @Accessories, @isAssign, @Flag)";
                        
                        cmd.Parameters.AddWithValue("@RouteNo", currVrpPickup.RouteNo);
                        cmd.Parameters.AddWithValue("@PriorityID", currVrpPickup.PriorityID);
                        cmd.Parameters.AddWithValue("@DriverID", driverId);
                        cmd.Parameters.AddWithValue("@Timestamp", currVrpPickup.Timestamp);
                        cmd.Parameters.AddWithValue("@RxTime", currVrpPickup.RxTime);
                        cmd.Parameters.AddWithValue("@CustomerID", customerId);
                        cmd.Parameters.AddWithValue("@OrderNo", currVrpPickup.OrderNo);
                        cmd.Parameters.AddWithValue("@WaitingDuration", currVrpPickup.WaitingDuration);
                        cmd.Parameters.AddWithValue("@ServiceDuration", currVrpPickup.ServiceDuration);
                        cmd.Parameters.AddWithValue("@LoadDuration", currVrpPickup.LoadDuration);
                        cmd.Parameters.AddWithValue("@TimeWindowStart", currVrpPickup.TimeWindowStart);
                        cmd.Parameters.AddWithValue("@TimeWindowEnd", currVrpPickup.TimeWindowEnd);
                        cmd.Parameters.AddWithValue("@Remarks", currVrpPickup.Remarks);
                        cmd.Parameters.AddWithValue("@Name", currVrpPickup.Name);
                        cmd.Parameters.AddWithValue("@Lat", _lat);
                        cmd.Parameters.AddWithValue("@Long", _long);
                        cmd.Parameters.AddWithValue("@Address", address.Trim());
                        cmd.Parameters.AddWithValue("@Unit", currVrpPickup.Unit);
                        cmd.Parameters.AddWithValue("@Building", building);
                        cmd.Parameters.AddWithValue("@Postal", currVrpPickup.Postal);
                        cmd.Parameters.AddWithValue("@Phone", currVrpPickup.Phone);
                        cmd.Parameters.AddWithValue("@Mobile", currVrpPickup.Mobile);
                        cmd.Parameters.AddWithValue("@Email", currVrpPickup.Email);
                        cmd.Parameters.AddWithValue("@Amount", currVrpPickup.Amount);
                        cmd.Parameters.AddWithValue("@Accessories", accessoriesId);
                        cmd.Parameters.AddWithValue("@isAssign", currVrpPickup.isAssign);
                        cmd.Parameters.AddWithValue("@Flag", currVrpPickup.Flag);
                        cmd.ExecuteNonQuery();
                        long id = cmd.LastInsertedId;
                        currVrpPickup.PickupID = id;

                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(VrpPickupRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return currVrpPickup;
        }

        public VrpPickupInfo Add(VrpPickupInfo currVrpPickup)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO vrp_pickup (route_no, priority_id, driver_id, timestamp, rx_time, customer_id, order_no, " +
                                                          "waiting_duration, service_duration, load_duration, time_window_start, time_window_end, remarks, " +
                                                          "name, latitude, longitude, address, unit, building, postal_code, phone, mobile, email, amount, accessories, isAssign, flag) " +
                                                            "VALUES (@RouteNo, @PriorityID, @DriverID, @Timestamp, @RxTime, @CustomerID, @OrderNo, " +
                                                          "@WaitingDuration, @ServiceDuration, @LoadDuration, @TimeWindowStart, @TimeWindowEnd, @Remarks, " +
                                                          "@Name, @Lat, @Long, @Address, @Unit, @Building, @Postal, @Phone, @Mobile, @Email, @Amount, @Accessories, @isAssign, @Flag)";
                        
                        cmd.Parameters.AddWithValue("@RouteNo", currVrpPickup.RouteNo);
                        cmd.Parameters.AddWithValue("@PriorityID", currVrpPickup.PriorityID);
                        cmd.Parameters.AddWithValue("@DriverID", currVrpPickup.DriverID);
                        cmd.Parameters.AddWithValue("@Timestamp", currVrpPickup.Timestamp);
                        cmd.Parameters.AddWithValue("@RxTime", currVrpPickup.RxTime);
                        cmd.Parameters.AddWithValue("@CustomerID", currVrpPickup.CustomerID);
                        cmd.Parameters.AddWithValue("@OrderNo", currVrpPickup.OrderNo);
                        cmd.Parameters.AddWithValue("@WaitingDuration", currVrpPickup.WaitingDuration);
                        cmd.Parameters.AddWithValue("@ServiceDuration", currVrpPickup.ServiceDuration);
                        cmd.Parameters.AddWithValue("@LoadDuration", currVrpPickup.LoadDuration);
                        cmd.Parameters.AddWithValue("@TimeWindowStart", currVrpPickup.TimeWindowStart);
                        cmd.Parameters.AddWithValue("@TimeWindowEnd", currVrpPickup.TimeWindowEnd);
                        cmd.Parameters.AddWithValue("@Remarks", currVrpPickup.Remarks);
                        cmd.Parameters.AddWithValue("@Name", currVrpPickup.Name);
                        cmd.Parameters.AddWithValue("@Lat", currVrpPickup.Lat);
                        cmd.Parameters.AddWithValue("@Long", currVrpPickup.Long);
                        cmd.Parameters.AddWithValue("@Address", currVrpPickup.Address);
                        cmd.Parameters.AddWithValue("@Unit", currVrpPickup.Unit);
                        cmd.Parameters.AddWithValue("@Building", currVrpPickup.Building);
                        cmd.Parameters.AddWithValue("@Postal", currVrpPickup.Postal);
                        cmd.Parameters.AddWithValue("@Phone", currVrpPickup.Phone);
                        cmd.Parameters.AddWithValue("@Mobile", currVrpPickup.Mobile);
                        cmd.Parameters.AddWithValue("@Email", currVrpPickup.Email);
                        cmd.Parameters.AddWithValue("@Amount", currVrpPickup.Amount);
                        cmd.Parameters.AddWithValue("@Accessories", currVrpPickup.Accessories);
                        cmd.Parameters.AddWithValue("@isAssign", currVrpPickup.isAssign);
                        cmd.Parameters.AddWithValue("@Flag", currVrpPickup.Flag);
                        cmd.ExecuteNonQuery();
                        long id = cmd.LastInsertedId;
                        currVrpPickup.PickupID = id;

                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(VrpPickupRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return currVrpPickup;
        }

        public bool Remove(int id)
        {
            bool retVal = false;
            string query = string.Format("DELETE FROM vrp_pickup WHERE pickup_id = {0}", id);
            
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

        public bool Update(VrpPickupInfo currVrpPickup)
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
                        cmd.CommandText = "UPDATE vrp_pickup SET route_no = @RouteNo, priority_id = @PriorityID, driver_id = @DriverID, timestamp = @Timestamp, rx_time = @RxTime, customer_id = @CustomerID, order_no = @OrderNo, " +
                                                                "waiting_duration = @WaitingDuration, service_duration = @ServiceDuration, load_duration = @LoadDuration, time_window_start = @TimeWindowStart, time_window_end = @TimeWindowEnd, remarks = @Remarks, " +
                                                                "name = @Name, latitude = @Lat, longitude = @Long, address = @Address, unit = @Unit, building = @Building, postal_code = @Postal, phone = @Phone, mobile = @Mobile, email = @Email, amount = @Amount, accessories = @Accessories, isAssign = @isAssign, flag = @Flag, driver_remarks = @DriverRemarks " +
                                                                "WHERE pickup_id = @PickupID";
                        
                        cmd.Parameters.AddWithValue("@RouteNo", currVrpPickup.RouteNo);
                        cmd.Parameters.AddWithValue("@PriorityID", currVrpPickup.PriorityID);
                        cmd.Parameters.AddWithValue("@DriverID", currVrpPickup.DriverID);
                        cmd.Parameters.AddWithValue("@Timestamp", currVrpPickup.Timestamp);
                        cmd.Parameters.AddWithValue("@RxTime", currVrpPickup.RxTime);
                        cmd.Parameters.AddWithValue("@CustomerID", currVrpPickup.CustomerID);
                        cmd.Parameters.AddWithValue("@OrderNo", currVrpPickup.OrderNo);
                        cmd.Parameters.AddWithValue("@WaitingDuration", currVrpPickup.WaitingDuration);
                        cmd.Parameters.AddWithValue("@ServiceDuration", currVrpPickup.ServiceDuration);
                        cmd.Parameters.AddWithValue("@LoadDuration", currVrpPickup.LoadDuration);
                        cmd.Parameters.AddWithValue("@TimeWindowStart", currVrpPickup.TimeWindowStart);
                        cmd.Parameters.AddWithValue("@TimeWindowEnd", currVrpPickup.TimeWindowEnd);
                        cmd.Parameters.AddWithValue("@Remarks", currVrpPickup.Remarks);
                        cmd.Parameters.AddWithValue("@Name", currVrpPickup.Name);
                        cmd.Parameters.AddWithValue("@Lat", currVrpPickup.Lat);
                        cmd.Parameters.AddWithValue("@Long", currVrpPickup.Long);
                        cmd.Parameters.AddWithValue("@Address", currVrpPickup.Address);
                        cmd.Parameters.AddWithValue("@Unit", currVrpPickup.Unit);
                        cmd.Parameters.AddWithValue("@Building", currVrpPickup.Building);
                        cmd.Parameters.AddWithValue("@Postal", currVrpPickup.Postal);
                        cmd.Parameters.AddWithValue("@Phone", currVrpPickup.Phone);
                        cmd.Parameters.AddWithValue("@Mobile", currVrpPickup.Mobile);
                        cmd.Parameters.AddWithValue("@Email", currVrpPickup.Email);
                        cmd.Parameters.AddWithValue("@Amount", currVrpPickup.Amount);
                        cmd.Parameters.AddWithValue("@Accessories", currVrpPickup.Accessories);
                        cmd.Parameters.AddWithValue("@isAssign", currVrpPickup.isAssign);
                        cmd.Parameters.AddWithValue("@Flag", currVrpPickup.Flag);
                        cmd.Parameters.AddWithValue("@DriverRemarks", currVrpPickup.DriverRemarks);
                        cmd.Parameters.AddWithValue("@PickupID", currVrpPickup.PickupID);  

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
                Logger.LogEvent(ex.Message + "-Update(VrpPickupRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }
        public bool UpdatePickupDriver(VrpPickupInfo currVrpPickup)
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
                        cmd.CommandText = "UPDATE vrp_pickup SET driver_id = @DriverID WHERE route_no = @RouteNo";
                        
                        cmd.Parameters.AddWithValue("@DriverID", currVrpPickup.DriverID);
                        cmd.Parameters.AddWithValue("@RouteNo", currVrpPickup.RouteNo);

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
                Logger.LogEvent(ex.Message + "-UpdatePickupDriver(VrpPickupRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }

        public bool RemovePickup(VrpPickupInfo currVrpPickup)
        {
            bool retVal = false;

            string query = string.Format("DELETE FROM vrp_pickup WHERE route_no = @RouteNo");

            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        
                        cmd.Parameters.AddWithValue("@RouteNo", currVrpPickup.RouteNo);
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