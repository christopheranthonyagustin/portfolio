using FMSWebApi.Models;
using FMSWebApi.Properties;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Hosting;

namespace FMSWebApi.Repository
{
    public class RouteSalesOrderRepository : IRouteSalesOrderRepository
    {
        private string mConnStr = Settings.Default.DB;
        private string mProjName = "FMS-Singapore";
        public IEnumerable<RouteSalesOrderInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<RouteSalesOrderInfo> arrLocations = new List<RouteSalesOrderInfo>();

            if (conn != null)
                conn.Close();

            return arrLocations.ToArray();
        }
        public IEnumerable<RouteSalesOrderInfo> GetByID(RouteSalesOrderInfo param)
        {
            List<RouteSalesOrderInfo> arrLocations = new List<RouteSalesOrderInfo>();
            RouteSalesOrderInfo currLocation = new RouteSalesOrderInfo();

            string query = "SELECT * FROM view_route_sales_order WHERE loc_id = @LocationID";


            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        
                        cmd.Parameters.AddWithValue("@LocationID", param.LocationID);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currLocation = DataMgrTools.BuildRouteSalesOrderLocation(reader);
                                    string strFill = "";
                                    currLocation.Forms = GetImage(String.Format("sales_order_forms/{0}", currLocation.SalesOrderID), ref strFill);
                                    currLocation.FormsFill = strFill;
                                    arrLocations.Add(currLocation);
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(GetByID)", System.Diagnostics.EventLogEntryType.Error);

                }
            }

            return arrLocations;
        }
        public RouteSalesOrderInfo Get(int soID)
        {
            RouteSalesOrderInfo currLocation = new RouteSalesOrderInfo();

            string query = string.Format("SELECT * FROM route_sales_order WHERE sales_order_id = {0}", soID);

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
                            currLocation = DataMgrTools.BuildRouteSalesOrderLocation(reader);
                            string strFill = "";
                            currLocation.Forms = GetImage(String.Format("sales_order_forms/{0}", currLocation.SalesOrderID), ref strFill);
                            currLocation.FormsFill = strFill;
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(RouteSalesOrderRepository)", System.Diagnostics.EventLogEntryType.Error);
                }
            }
            return currLocation;
        }
        public RouteSalesOrderInfo Add(RouteSalesOrderInfo currSO)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO route_sales_order (loc_id, order_no, timestamp, rx_time, billing_name, billing_address, billing_phone, billing_mobile, billing_email, " +
                                                                  "shipping_name, shipping_address, shipping_phone, shipping_mobile, shipping_email, remarks, flag) " +
                                                            "VALUES (@LocationID, @OrderNo, @Timestamp, @RxTime, @BillingName, @BillingAddress, @BillingPhone, @BillingMobile, @BillingEmail, " +
                                                                  "@ShippingName, @ShippingAddress, @ShippingPhone, @ShippingMobile, @ShippingEmail, @Remarks, @Flag)";
                        
                        cmd.Parameters.AddWithValue("@LocationID", currSO.LocationID);
                        cmd.Parameters.AddWithValue("@OrderNo", currSO.OrderNo);
                        cmd.Parameters.AddWithValue("@Timestamp", currSO.Timestamp);
                        cmd.Parameters.AddWithValue("@RxTime", currSO.RxTime);
                        cmd.Parameters.AddWithValue("@BillingName", currSO.BillingName);
                        cmd.Parameters.AddWithValue("@BillingAddress", currSO.BillingAddress);
                        cmd.Parameters.AddWithValue("@BillingPhone", currSO.BillingPhone);
                        cmd.Parameters.AddWithValue("@BillingMobile", currSO.BillingMobile);
                        cmd.Parameters.AddWithValue("@BillingEmail", currSO.BillingEmail);
                        cmd.Parameters.AddWithValue("@ShippingName", currSO.ShippingName);
                        cmd.Parameters.AddWithValue("@ShippingAddress", currSO.ShippingAddress);
                        cmd.Parameters.AddWithValue("@ShippingPhone", currSO.ShippingPhone);
                        cmd.Parameters.AddWithValue("@ShippingMobile", currSO.ShippingMobile);
                        cmd.Parameters.AddWithValue("@ShippingEmail", currSO.ShippingEmail);
                        cmd.Parameters.AddWithValue("@Remarks", currSO.Remarks);
                        cmd.Parameters.AddWithValue("@Flag", currSO.Flag);
                        cmd.ExecuteNonQuery();

                        long id = cmd.LastInsertedId;
                        currSO.SalesOrderID = id;

                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(RouteSalesRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return currSO;
        }
        public bool Remove(int locID)
        {
            bool retVal = false;
            string query = string.Format("DELETE FROM route_sales_order WHERE sales_order_id = {0}", locID);

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
                    Logger.LogEvent(ex.Message + "-Remove(RouteSalesOrderRepository)", System.Diagnostics.EventLogEntryType.Error);
                }
            }

            return retVal;
        }
        public bool Update(RouteSalesOrderInfo currSO)
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
                        cmd.CommandText = "UPDATE route_sales_order SET loc_id = @LocationID, order_no = @OrderNo, timestamp = @Timestamp, rx_time = @RxTime, billing_name = @BillingName, billing_address = @BillingAddress, billing_phone = @BillingPhone, billing_mobile = @BillingMobile, billing_email = @BillingEmail, " +
                                                                          "shipping_name = @ShippingName, shipping_address = @ShippingAddress, shipping_phone = @ShippingPhone, shipping_mobile = @ShippingMobile, shipping_email = @ShippingEmail, remarks = @Remarks, flag = @Flag " +
                                          "WHERE sales_order_id = @SalesOrderID";
                        
                        cmd.Parameters.AddWithValue("@LocationID", currSO.LocationID);
                        cmd.Parameters.AddWithValue("@OrderNo", currSO.OrderNo);
                        cmd.Parameters.AddWithValue("@Timestamp", currSO.Timestamp);
                        cmd.Parameters.AddWithValue("@RxTime", currSO.RxTime);
                        cmd.Parameters.AddWithValue("@BillingName", currSO.BillingName);
                        cmd.Parameters.AddWithValue("@BillingAddress", currSO.BillingAddress);
                        cmd.Parameters.AddWithValue("@BillingPhone", currSO.BillingPhone);
                        cmd.Parameters.AddWithValue("@BillingMobile", currSO.BillingMobile);
                        cmd.Parameters.AddWithValue("@BillingEmail", currSO.BillingEmail);
                        cmd.Parameters.AddWithValue("@ShippingName", currSO.ShippingName);
                        cmd.Parameters.AddWithValue("@ShippingAddress", currSO.ShippingAddress);
                        cmd.Parameters.AddWithValue("@ShippingPhone", currSO.ShippingPhone);
                        cmd.Parameters.AddWithValue("@ShippingMobile", currSO.ShippingMobile);
                        cmd.Parameters.AddWithValue("@ShippingEmail", currSO.ShippingEmail);
                        cmd.Parameters.AddWithValue("@Remarks", currSO.Remarks);
                        cmd.Parameters.AddWithValue("@Flag", currSO.Flag);
                        cmd.Parameters.AddWithValue("@SalesOrderID", currSO.SalesOrderID);

                        if (cmd.ExecuteNonQuery() == 1)
                            retVal = true;
                        else
                            retVal = false;
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Update(RouteSalesOrderRepository)", System.Diagnostics.EventLogEntryType.Error);
                }
            }

            return retVal;
        }

        public string GetImage(string strName, ref string strFill)
        {
            try
            {
                // loop through image file types
                List<string> arrTypes = new List<string>() { "jpg", "png", "gif", "bmp", "pdf" };
                foreach (string strType in arrTypes)
                {
                    string strTemp = String.Format("{0}.{1}", strName, strType);
                    string strFile = String.Format("{0}images\\{1}", HostingEnvironment.ApplicationPhysicalPath, strTemp);
                    string strUri = String.Format("{0}/images/{1}", ConfigurationManager.AppSettings["ServerPath"], strTemp);

                    // check file path
                    if (File.Exists(strFile))
                    {
                        // return image path
                        strFill = "Uniform";
                        return String.Format("{0}?dt={1:ddMMMyyHHmmss}", strUri, File.GetLastWriteTimeUtc(strFile));
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent("Get Image: ", ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }

            // image file not found
            strFill = "None";
            return strName;
        }
    }
}