using FMSWebApi.Models;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.IO;
using System.Web.Hosting;
using System.Configuration;
using System.Web.UI.WebControls;
using FMSWebApi.Properties;

namespace FMSWebApi.Repository
{
    public class MainInventoryHistoryRepository : IMainInventoryHistoryRepository
    {
        private string mConnStr = Settings.Default.DB;
        private string mProjName = "FMS-Singapore";
        public IEnumerable<MainInventoryHistoryInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<MainInventoryHistoryInfo> arrInventory = new List<MainInventoryHistoryInfo>();


            if (conn != null)
                conn.Close();

            return arrInventory.ToArray();
        }

        public IEnumerable<MainInventoryHistoryInfo> ClearHistory()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<MainInventoryHistoryInfo> arrInventory = new List<MainInventoryHistoryInfo>();

            return arrInventory.ToArray();
        }

        public IEnumerable<MainInventoryHistoryInfo> GetByCompany(MainInventoryHistoryInfo param)
        {
            List<MainInventoryHistoryInfo> arrInventory = new List<MainInventoryHistoryInfo>();
            MainInventoryHistoryInfo currInventory = new MainInventoryHistoryInfo();
            object objTemp = new object();

            string query = "SELECT * FROM view_main_inventory_history WHERE (timestamp between @StartTS and @EndTS)";
            if (param.CompanyID > 0) query += " and company_id = @CompanyID";
            if (param.StockType > 0) query += " and stock_type = @StockType";
            if (param.Platform > 0) query += " and platform = @Platform";
            if (param.DriverID > 0) query += " and driver_id = @DriverID";
            if (param.ItemCategory > 0) query += " and item_category = @ItemCategory";
            if (!string.IsNullOrEmpty(param.Name)) query += " and name = @Name";
            if (!string.IsNullOrEmpty(param.Reference)) query += " and reference = @Reference";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        
                        cmd.Parameters.AddWithValue("@StartTS", param.Timestamp);
                        cmd.Parameters.AddWithValue("@EndTS", param.RxTime);
                        cmd.Parameters.AddWithValue("@CompanyID", param.CompanyID);
                        cmd.Parameters.AddWithValue("@StockType", param.StockType);
                        cmd.Parameters.AddWithValue("@Platform", param.Platform);
                        cmd.Parameters.AddWithValue("@DriverID", param.DriverID);
                        cmd.Parameters.AddWithValue("@ItemCategory", param.ItemCategory);
                        if (!string.IsNullOrEmpty(param.Name)) cmd.Parameters.AddWithValue("@Name", param.Name);
                        if (!string.IsNullOrEmpty(param.Reference)) cmd.Parameters.AddWithValue("@Reference", param.Reference);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currInventory = DataMgrTools.BuildInventoryHistory(reader);
                                    string strFill = "";
                                    currInventory.Image = GetImage(String.Format("inventoryhistory/main_signature/{0}", currInventory.MainInventoryHistoryID), ref strFill);
                                    currInventory.ImageFill = strFill;
                                    arrInventory.Add(currInventory);
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(ByCompany)", System.Diagnostics.EventLogEntryType.Error);

                }
            }

            return arrInventory;
        }
        public IEnumerable<MainInventoryHistoryInfo> GetByCategory(MainInventoryHistoryInfo param)
        {
            List<MainInventoryHistoryInfo> arrInventory = new List<MainInventoryHistoryInfo>();
            MainInventoryHistoryInfo currInventory = new MainInventoryHistoryInfo();
            object objTemp = new object();

            string query = "SELECT * FROM view_main_inventory_history WHERE (timestamp between @StartTS and @EndTS)";
            if (param.CompanyID > 0) query += " and company_id = @CompanyID";
            if (param.StockType > 0) query += " and stock_type = @StockType";
            if (param.Platform > 0) query += " and platform = @Platform";
            if (param.DriverID > 0) query += " and driver_id = @DriverID";
            if (param.ItemCategory > 0) query += " and item_category = @ItemCategory";
            if (!string.IsNullOrEmpty(param.Reference)) query += " and reference = @Reference";
            query += " group by name";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        
                        cmd.Parameters.AddWithValue("@StartTS", param.Timestamp);
                        cmd.Parameters.AddWithValue("@EndTS", param.RxTime);
                        cmd.Parameters.AddWithValue("@CompanyID", param.CompanyID);
                        cmd.Parameters.AddWithValue("@StockType", param.StockType);
                        cmd.Parameters.AddWithValue("@Platform", param.Platform);
                        cmd.Parameters.AddWithValue("@DriverID", param.DriverID);
                        cmd.Parameters.AddWithValue("@ItemCategory", param.ItemCategory);
                        if (!string.IsNullOrEmpty(param.Reference)) cmd.Parameters.AddWithValue("@Reference", param.Reference);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currInventory = DataMgrTools.BuildInventoryHistory(reader);
                                    string strFill = "";
                                    currInventory.Image = GetImage(String.Format("supervisorsignatures/{0}", currInventory.MainInventoryHistoryID), ref strFill);
                                    currInventory.ImageFill = strFill;
                                    arrInventory.Add(currInventory);
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(ByCompany)", System.Diagnostics.EventLogEntryType.Error);

                }
            }

            return arrInventory;
        }

        public MainInventoryHistoryInfo Get(int inventoryID)
        {
            MainInventoryHistoryInfo currInventory = new MainInventoryHistoryInfo();
            string query = string.Format("SELECT * FROM view_main_inventory_history WHERE main_inventory_history_id = {0}", inventoryID);

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
                            currInventory = DataMgrTools.BuildInventoryHistory(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(mProjName, "Get: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                    conn.Close();
                }
            }
            return currInventory;
        }

        public MainInventoryHistoryInfo Add(MainInventoryHistoryInfo currInventory)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO main_inventory_history (main_inventory_item_id, timestamp, rx_time, stock_type, name, reference, " +
                                                                 "previous_quantity, quantity, total_quantity, " + 
                                                                 "pickup_id, delivery_id, company_id, user_id, asset_id, driver_id, platform) " +
                                                         "VALUES (@MainInventoryItemID, @Timestamp, @RxTime, @StockType, @Name, @Reference, " +
                                                                 "@PreviousQuantity, @Quantity, @TotalQuantity, " +
                                                                 "@PickupID, @DeliveryID, @CompanyID, @UserID, @AssetID, @DriverID, @Platform)";
                        
                        cmd.Parameters.AddWithValue("@MainInventoryItemID", currInventory.MainInventoryItemID);
                        cmd.Parameters.AddWithValue("@Timestamp", currInventory.Timestamp);
                        cmd.Parameters.AddWithValue("@RxTime", currInventory.RxTime);
                        cmd.Parameters.AddWithValue("@StockType", currInventory.StockType);
                        cmd.Parameters.AddWithValue("@Name", currInventory.Name);
                        cmd.Parameters.AddWithValue("@Reference", currInventory.Reference);
                        cmd.Parameters.AddWithValue("@PreviousQuantity", currInventory.PreviousQuantity);
                        cmd.Parameters.AddWithValue("@Quantity", currInventory.Quantity);
                        cmd.Parameters.AddWithValue("@TotalQuantity", currInventory.TotalQuantity);
                        cmd.Parameters.AddWithValue("@PickupID", currInventory.PickupID);
                        cmd.Parameters.AddWithValue("@DeliveryID", currInventory.DeliveryID);
                        cmd.Parameters.AddWithValue("@CompanyID", currInventory.CompanyID);
                        cmd.Parameters.AddWithValue("@UserID", currInventory.UserID);
                        cmd.Parameters.AddWithValue("@AssetID", currInventory.AssetID);
                        cmd.Parameters.AddWithValue("@DriverID", currInventory.DriverID);
                        cmd.Parameters.AddWithValue("@Platform", currInventory.Platform);
                        cmd.ExecuteNonQuery();

                        long id = cmd.LastInsertedId;
                        currInventory.MainInventoryHistoryID = id;

                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(InventoryHistoryRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return currInventory;
        }

        public bool Remove(int inventoryID)
        {
            bool retVal = false;
            string query = string.Format("DELETE FROM main_inventory_history WHERE main_inventory_history_id = {0}", inventoryID);

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
                Logger.LogEvent(ex.Message + "-Remove(InventoryHistoryRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }

        public bool Update(MainInventoryHistoryInfo currInventory)
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
                        cmd.CommandText = "UPDATE main_inventory_history SET main_inventory_item_id = @MainInventoryItemID, timestamp = @Timestamp, rx_time = @RxTime, stock_type = @StockType, name = @Name, reference = @Reference, " +
                                                                       "previous_quantity = @PreviousQuantity, quantity = @Quantity, total_quantity = @TotalQuantity, " +
                                                                       "pickup_id = @PickupID, delivery_id = @DeliveryID, company_id = @CompanyID, user_id = @UserID, asset_id = @AssetID, driver_id = @DriverID, platform = @Platform " +
                                                                       "WHERE main_inventory_history_id = @MainInventoryHistoryID";
                        
                        cmd.Parameters.AddWithValue("@MainInventoryItemID", currInventory.MainInventoryItemID);
                        cmd.Parameters.AddWithValue("@Timestamp", currInventory.Timestamp);
                        cmd.Parameters.AddWithValue("@RxTime", currInventory.RxTime);
                        cmd.Parameters.AddWithValue("@StockType", currInventory.StockType);
                        cmd.Parameters.AddWithValue("@Name", currInventory.Name);
                        cmd.Parameters.AddWithValue("@Reference", currInventory.Reference);
                        cmd.Parameters.AddWithValue("@PreviousQuantity", currInventory.PreviousQuantity);
                        cmd.Parameters.AddWithValue("@Quantity", currInventory.Quantity);
                        cmd.Parameters.AddWithValue("@TotalQuantity", currInventory.TotalQuantity);
                        cmd.Parameters.AddWithValue("@PickupID", currInventory.PickupID);
                        cmd.Parameters.AddWithValue("@DeliveryID", currInventory.DeliveryID);
                        cmd.Parameters.AddWithValue("@CompanyID", currInventory.CompanyID);
                        cmd.Parameters.AddWithValue("@UserID", currInventory.UserID);
                        cmd.Parameters.AddWithValue("@AssetID", currInventory.AssetID);
                        cmd.Parameters.AddWithValue("@DriverID", currInventory.DriverID);
                        cmd.Parameters.AddWithValue("@Platform", currInventory.Platform);
                        cmd.Parameters.AddWithValue("@MainInventoryHistoryID", currInventory.MainInventoryHistoryID);

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
                Logger.LogEvent(ex.Message + "-Update(InventoryHistoryRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }

        public IEnumerable<MainInventoryHistoryInfo> UpdateAll(MainInventoryHistoryInfo param)
        {
            List<MainInventoryHistoryInfo> arrInventory = new List<MainInventoryHistoryInfo>();
            MainInventoryHistoryInfo currInventory = new MainInventoryHistoryInfo();
            MainInventoryItemRepository repoItem = new MainInventoryItemRepository();
            MainInventoryItemInfo currItem = new MainInventoryItemInfo();
            object objTemp = new object();

            string query = "SELECT * FROM view_main_inventory_history WHERE (timestamp between @StartTS and @EndTS)";
            if (param.CompanyID > 0) query += " and company_id = @CompanyID";
            if (param.StockType > 0) query += " and stock_type = @StockType";
            if (param.Platform > 0) query += " and platform = @Platform";
            if (param.DriverID > 0) query += " and driver_id = @DriverID";
            if (param.PickupID > 0) query += " and pickup_id = @PickupID";
            if (param.DeliveryID > 0) query += " and delivery_id = @DeliveryID";
            if (param.ItemCategory > 0) query += " and item_category = @ItemCategory";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        
                        cmd.Parameters.AddWithValue("@StartTS", param.Timestamp);
                        cmd.Parameters.AddWithValue("@EndTS", param.RxTime);
                        cmd.Parameters.AddWithValue("@CompanyID", param.CompanyID);
                        cmd.Parameters.AddWithValue("@StockType", param.StockType);
                        cmd.Parameters.AddWithValue("@Platform", param.Platform);
                        cmd.Parameters.AddWithValue("@DriverID", param.DriverID);
                        cmd.Parameters.AddWithValue("@PickupID", param.PickupID);
                        cmd.Parameters.AddWithValue("@DeliveryID", param.DeliveryID);
                        cmd.Parameters.AddWithValue("@ItemCategory", param.ItemCategory);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currInventory = DataMgrTools.BuildInventoryHistory(reader);
                                    currItem = repoItem.Get(currInventory.MainInventoryItemID);

                                    currInventory.StockType = param.StockType;
                                    if (param.StockType == 4) { 
                                        currInventory.Platform = 2;
                                        currItem.Quantity = currItem.Quantity - param.Quantity;
                                       
                                        repoItem.Update(currItem);
                                    }
                                    else if (param.StockType == 5 && param.ItemCategory == 1)
                                    {
                                        currInventory.Platform = 1;
                                    }
                                    else if (param.StockType == 7 && param.ItemCategory == 2)
                                    {
                                        currInventory.Platform = 1;

                                        currInventory.PreviousQuantity = currItem.Quantity;
                                        currInventory.TotalQuantity = currItem.Quantity + param.Quantity;
                                        currItem.Quantity = currItem.Quantity + param.Quantity;
                                        repoItem.Update(currItem);
                                    }

                                    Update(currInventory);

                                    if (param.StockType == 4) { 
                                        currInventory.StockType = param.StockType + 1;
                                        Add(currInventory);
                                    }
                                    else if (param.StockType == 5 && param.ItemCategory == 1)
                                    {
                                        currInventory.StockType = 7;
                                        currInventory.PreviousQuantity = currItem.Quantity;
                                        currInventory.TotalQuantity = currItem.Quantity + param.Quantity;
                                        currItem.Quantity = currItem.Quantity + param.Quantity;
                                        repoItem.Update(currItem);
                                        Add(currInventory);
                                    }


                         
                                    arrInventory.Add(currInventory);
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(ByCompany)", System.Diagnostics.EventLogEntryType.Error);

                }
            }

            return arrInventory;
        }

        /// <summary>
        /// gets image file
        /// </summary>
        /// <param name="strName"></param>
        /// <param name="strDefault"></param>
        /// <param name="strFill"></param>
        /// <returns></returns>
        public string GetImage(string strName, ref string strFill)
        {
            try
            {
                // loop through image file types
                List<string> arrTypes = new List<string>() { "jpg", "png", "gif", "bmp" };
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