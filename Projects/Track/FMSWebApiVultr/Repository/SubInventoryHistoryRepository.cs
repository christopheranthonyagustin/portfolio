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
    public class SubInventoryHistoryRepository : ISubInventoryHistoryRepository
    {
        private string mConnStr = Settings.Default.DB;
        private string mProjName = "FMS-Singapore";
        public IEnumerable<SubInventoryHistoryInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<SubInventoryHistoryInfo> arrInventory = new List<SubInventoryHistoryInfo>();


            if (conn != null)
                conn.Close();

            return arrInventory.ToArray();
        }

        public IEnumerable<SubInventoryHistoryInfo> ClearHistory()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<SubInventoryHistoryInfo> arrInventory = new List<SubInventoryHistoryInfo>();

            return arrInventory.ToArray();
        }

        public IEnumerable<SubInventoryHistoryInfo> GetByCompany(SubInventoryHistoryInfo param)
        {
            List<SubInventoryHistoryInfo> arrInventory = new List<SubInventoryHistoryInfo>();
            SubInventoryHistoryInfo currInventory = new SubInventoryHistoryInfo();
            object objTemp = new object();

            string query = "SELECT * FROM view_sub_inventory_history WHERE (timestamp between @StartTS and @EndTS)";
            if (param.CompanyID > 0) query += " and company_id = @CompanyID";
            if (!string.IsNullOrEmpty(param.Reference)) query += " and reference = @Reference";
            if (param.StockType > 0) query += " and stock_type = @StockType";
            if (param.Platform > 0) query += " and platform = @Platform";
            if (param.DriverID > 0) query += " and driver_id = @DriverID";

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
                        if (!string.IsNullOrEmpty(param.Reference)) cmd.Parameters.AddWithValue("@Reference", param.Reference);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currInventory = DataMgrTools.BuildSubInventoryHistory(reader);
                                    string strFill = "";
                                    currInventory.Image = GetImage(String.Format("inventoryhistory/sub_signature/{0}", currInventory.SubInventoryHistoryID), ref strFill);
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


        public SubInventoryHistoryInfo Get(int inventoryID)
        {
            SubInventoryHistoryInfo currInventory = new SubInventoryHistoryInfo();
            string query = string.Format("SELECT * FROM view_sub_inventory_history WHERE sub_inventory_history_id = {0}", inventoryID);

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
                            currInventory = DataMgrTools.BuildSubInventoryHistory(reader);
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

        public SubInventoryHistoryInfo Add(SubInventoryHistoryInfo currInventory)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO sub_inventory_history (sub_inventory_item_id, timestamp, rx_time, stock_type, name, reference, " +
                                                                 "previous_quantity, quantity, total_quantity, " + 
                                                                 "pickup_id, delivery_id, company_id, user_id, asset_id, driver_id, platform) " +
                                                         "VALUES (@SubInventoryItemID, @Timestamp, @RxTime, @StockType, @Name, @Reference, " +
                                                                 "@PreviousQuantity, @Quantity, @TotalQuantity, " +
                                                                 "@PickupID, @DeliveryID, @CompanyID, @UserID, @AssetID, @DriverID, @Platform)";
                        
                        cmd.Parameters.AddWithValue("@SubInventoryItemID", currInventory.SubInventoryItemID);
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
                        currInventory.SubInventoryHistoryID = id;

                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(SubInventoryHistoryRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return currInventory;
        }

        public bool Remove(int inventoryID)
        {
            bool retVal = false;
            string query = string.Format("DELETE FROM sub_inventory_history WHERE sub_inventory_history_id = {0}", inventoryID);

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
                Logger.LogEvent(ex.Message + "-Remove(SubInventoryHistoryRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }

        public bool Update(SubInventoryHistoryInfo currInventory)
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
                        cmd.CommandText = "UPDATE sub_inventory_history SET sub_inventory_item_id = @SubInventoryItemID, timestamp = @Timestamp, rx_time = @RxTime, stock_type = @StockType, name = @Name, reference = @Reference, " +
                                                                       "previous_quantity = @PreviousQuantity, quantity = @Quantity, total_quantity = @TotalQuantity, " +
                                                                       "pickup_id = @PickupID, delivery_id = @DeliveryID, company_id = @CompanyID, user_id = @UserID, asset_id = @AssetID, driver_id = @DriverID, platform = @Platform " +
                                                                       "WHERE sub_inventory_history_id = @SubInventoryHistoryID";
                        
                        cmd.Parameters.AddWithValue("@SubInventoryItemID", currInventory.SubInventoryItemID);
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
                        cmd.Parameters.AddWithValue("@SubInventoryHistoryID", currInventory.SubInventoryHistoryID);

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
                Logger.LogEvent(ex.Message + "-Update(SubInventoryHistoryRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }

        public IEnumerable<SubInventoryHistoryInfo> UpdateAll(SubInventoryHistoryInfo param)
        {
            List<SubInventoryHistoryInfo> arrInventory = new List<SubInventoryHistoryInfo>();
            SubInventoryHistoryInfo currInventory = new SubInventoryHistoryInfo();
            SubInventoryItemRepository repoItem = new SubInventoryItemRepository();
            SubInventoryItemInfo currItem = new SubInventoryItemInfo();
            object objTemp = new object();

            string query = "SELECT * FROM view_sub_inventory_history WHERE (timestamp between @StartTS and @EndTS)";
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
                                    currInventory = DataMgrTools.BuildSubInventoryHistory(reader);
                                    currItem = repoItem.Get(currInventory.SubInventoryHistoryID);

                                    currInventory.StockType = param.StockType;


                                    if (param.StockType == 4)
                                    {
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

                                    if (param.StockType == 4 && param.isIncomplete == false)
                                    {
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