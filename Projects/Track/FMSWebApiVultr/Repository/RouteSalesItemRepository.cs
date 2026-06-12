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
    public class RouteSalesItemRepository : IRouteSalesItemRepository
    {
        private string mConnStr = Settings.Default.DB;
        private string mProjName = "FMS-Singapore";
        public IEnumerable<RouteSalesItemInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<RouteSalesItemInfo> arrLocations = new List<RouteSalesItemInfo>();

            if (conn != null)
                conn.Close();

            return arrLocations.ToArray();
        }
        public IEnumerable<RouteSalesItemInfo> GetByID(RouteSalesItemInfo param)
        {
            List<RouteSalesItemInfo> arrLocations = new List<RouteSalesItemInfo>();
            RouteSalesItemInfo currLocation = new RouteSalesItemInfo();

            string query = "SELECT * FROM route_sales_item WHERE sales_order_id = @SalesOrderID";


            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        
                        cmd.Parameters.AddWithValue("@SalesOrderID", param.SalesOrderID);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currLocation = DataMgrTools.BuildRouteSalesItemLocation(reader);
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
        public RouteSalesItemInfo Get(int soID)
        {
            RouteSalesItemInfo currLocation = new RouteSalesItemInfo();

            string query = string.Format("SELECT * FROM route_sales_item WHERE sales_item_id = {0}", soID);

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
                            currLocation = DataMgrTools.BuildRouteSalesItemLocation(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(RouteSalesItemRepository)", System.Diagnostics.EventLogEntryType.Error);
                }
            }
            return currLocation;
        }
        public RouteSalesItemInfo Add(RouteSalesItemInfo currLocation)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO route_sales_item (sales_order_id, reference_no, item, description, quantity, price, total_price) " +
                                                            "VALUES (@SalesOrderID, @ReferenceNo, @Item, @Description, @Quantity, @Price, @TotalPrice)";
                        
                        cmd.Parameters.AddWithValue("@SalesOrderID", currLocation.SalesOrderID);
                        cmd.Parameters.AddWithValue("@ReferenceNo", currLocation.ReferenceNo);
                        cmd.Parameters.AddWithValue("@Item", currLocation.Item);
                        cmd.Parameters.AddWithValue("@Description", currLocation.Description);
                        cmd.Parameters.AddWithValue("@Quantity", currLocation.Quantity);
                        cmd.Parameters.AddWithValue("@Price", currLocation.Price);
                        cmd.Parameters.AddWithValue("@TotalPrice", currLocation.TotalPrice);
                        cmd.ExecuteNonQuery();

                        long id = cmd.LastInsertedId;
                        currLocation.SalesItemID = id;

                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(RouteSalesItemRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return currLocation;
        }
        public bool Remove(int locID)
        {
            bool retVal = false;
            string query = string.Format("DELETE FROM route_sales_item WHERE sales_item_id = {0}", locID);

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
                    Logger.LogEvent(ex.Message + "-Remove(RouteSalesItemRepository)", System.Diagnostics.EventLogEntryType.Error);
                }
            }

            return retVal;
        }
        public bool Update(RouteSalesItemInfo currLocation)
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
                        cmd.CommandText = "UPDATE route_sales_item SET sales_order_id = @SalesOrderID, reference_no = @ReferenceNo, item = @Item, description = @Description, quantity = @Quantity, price = @Price, total_price = @TotalPrice " +
                                                               "WHERE sales_item_id = @SalesItemID";
                        
                        cmd.Parameters.AddWithValue("@SalesOrderID", currLocation.SalesOrderID);
                        cmd.Parameters.AddWithValue("@ReferenceNo", currLocation.ReferenceNo);
                        cmd.Parameters.AddWithValue("@Item", currLocation.Item);
                        cmd.Parameters.AddWithValue("@Description", currLocation.Description);
                        cmd.Parameters.AddWithValue("@Quantity", currLocation.Quantity);
                        cmd.Parameters.AddWithValue("@Price", currLocation.Price);
                        cmd.Parameters.AddWithValue("@TotalPrice", currLocation.TotalPrice);
                        cmd.Parameters.AddWithValue("@SalesItemID", currLocation.SalesItemID);

                        if (cmd.ExecuteNonQuery() == 1)
                            retVal = true;
                        else
                            retVal = false;
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Update(RouteSalesItemRepository)", System.Diagnostics.EventLogEntryType.Error);
                }
            }

            return retVal;
        }
    }
}