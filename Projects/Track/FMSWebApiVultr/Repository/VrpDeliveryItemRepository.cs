using FMSWebApi.Models;
using FMSWebApi.Properties;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace FMSWebApi.Repository
{
    public class VrpDeliveryItemRepository : IVrpDeliveryItemRepository
    {
        private string mConnStr = Settings.Default.DB;
        private string mProjName = "FMS-Singapore";
        public IEnumerable<VrpDeliveryItemInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<VrpDeliveryItemInfo> arrVrpDelivery = new List<VrpDeliveryItemInfo>();

            if (conn != null)
                conn.Close();

            return arrVrpDelivery.ToArray();
        }
        public IEnumerable<VrpDeliveryItemInfo> GetByID(VrpDeliveryItemInfo param)
        {

            List<VrpDeliveryItemInfo> arrVrpDelivery = new List<VrpDeliveryItemInfo>();
            VrpDeliveryItemInfo currVrpDelivery = new VrpDeliveryItemInfo();
            MainInventoryHistoryInfo currVrpMainInventory = new MainInventoryHistoryInfo();
            MainInventoryItemInfo currMainInventory = new MainInventoryItemInfo();
            SubInventoryHistoryInfo currVrpSubInventory = new SubInventoryHistoryInfo();
            SubInventoryItemInfo currSubInventory = new SubInventoryItemInfo();

            VrpPickupItemRepository repoPickupItem = new VrpPickupItemRepository();
            VrpPickupItemInfo currVrpPickup = new VrpPickupItemInfo();

            object objTemp = new object();
            
            string query = "SELECT * FROM vrp_delivery_item WHERE delivery_id = @DeliveryID";


            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        
                        cmd.Parameters.AddWithValue("@DeliveryID", param.DeliveryID);


                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currVrpDelivery = DataMgrTools.BuildVrpDeliveryItem(reader);

                                   
                                    if (currVrpDelivery.MainInventoryItemID > 0)
                                    {
                                        currVrpMainInventory = GetMainHistory(currVrpDelivery);
                                        currMainInventory = GetMainItemHistory(currVrpDelivery);
 
                                        currVrpDelivery.StockType = currVrpMainInventory.StockType;
                                        currVrpDelivery.PreviousQuantity = currMainInventory.Quantity;
                                    }
                                    else if (currVrpDelivery.SubInventoryItemID > 0)
                                    {


                                        currVrpPickup.PickupID = currVrpDelivery.PickupID;
                                        currVrpPickup.SubInventoryItemID = currVrpDelivery.SubInventoryItemID;
                                        currVrpPickup.ReferenceNo = currVrpDelivery.ReferenceNo;
                                        currVrpPickup = repoPickupItem.GetSubItem(currVrpPickup);

                                        currVrpSubInventory = GetSubHistory(currVrpDelivery);
                                        currSubInventory = GetSubItemHistory(currVrpDelivery);


                                        currVrpDelivery.StockType = currVrpSubInventory.StockType;
                                        currVrpDelivery.PreviousQuantity = currSubInventory.Quantity;
                                        currVrpDelivery.PickupFlag = currVrpPickup.Flag;
                                    }

                                    arrVrpDelivery.Add(currVrpDelivery);

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

            return arrVrpDelivery;
        }

        public MainInventoryHistoryInfo GetMainHistory(VrpDeliveryItemInfo currVrpDelivery)
        {
            MainInventoryHistoryInfo currVrpMainInventory = new MainInventoryHistoryInfo();

            string query = "SELECT * FROM view_main_inventory_history WHERE delivery_id = @DeliveryID and main_inventory_item_id = @MainInventoryItemID order by timestamp asc";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    if (currVrpDelivery.MainInventoryItemID > 0)
                    {


                        using (MySqlCommand cmd = new MySqlCommand(query, conn))
                        {
                            conn.Open();
                            
                            cmd.Parameters.AddWithValue("@DeliveryID", currVrpDelivery.DeliveryID);
                            cmd.Parameters.AddWithValue("@MainInventoryItemID", currVrpDelivery.MainInventoryItemID);

                            using (MySqlDataReader reader = cmd.ExecuteReader())
                            {
                                if ((reader != null) && (reader.HasRows))
                                {
                                    while (reader.Read())
                                    {
                                        currVrpMainInventory = DataMgrTools.BuildInventoryHistory(reader);
                                    }
                                }
                            }

                            conn.Close();
                        }

                    }

                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get Main(Stock Type)", System.Diagnostics.EventLogEntryType.Error);

                }

            }

            return currVrpMainInventory;

        }
        public MainInventoryItemInfo GetMainItemHistory(VrpDeliveryItemInfo currVrpDelivery)
        {
            MainInventoryItemInfo currMainInventory = new MainInventoryItemInfo();

            string query = "SELECT * FROM main_inventory_item WHERE main_inventory_item_id = @MainInventoryItemID";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        
                        cmd.Parameters.AddWithValue("@MainInventoryItemID", currVrpDelivery.MainInventoryItemID);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currMainInventory = DataMgrTools.BuildMainInventoryItem(reader);
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get Main(Previous Quantity)", System.Diagnostics.EventLogEntryType.Error);

                }

            }

            return currMainInventory;

        }
        public SubInventoryHistoryInfo GetSubHistory(VrpDeliveryItemInfo currVrpDelivery)
        {
            SubInventoryHistoryInfo currVrpSubInventory = new SubInventoryHistoryInfo();

            string query = "SELECT * FROM view_sub_inventory_history WHERE delivery_id = @DeliveryID and sub_inventory_item_id = @SubInventoryItemID order by timestamp asc";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    if (currVrpDelivery.SubInventoryItemID > 0)
                    {


                        using (MySqlCommand cmd = new MySqlCommand(query, conn))
                        {
                            conn.Open();
                            
                            cmd.Parameters.AddWithValue("@DeliveryID", currVrpDelivery.DeliveryID);
                            cmd.Parameters.AddWithValue("@SubInventoryItemID", currVrpDelivery.SubInventoryItemID);

                            using (MySqlDataReader reader = cmd.ExecuteReader())
                            {
                                if ((reader != null) && (reader.HasRows))
                                {
                                    while (reader.Read())
                                    {
                                        currVrpSubInventory = DataMgrTools.BuildSubInventoryHistory(reader);
                                    }
                                }
                            }

                            conn.Close();
                        }

                    }

                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get Sub(Stock Type and Previous Quantity)", System.Diagnostics.EventLogEntryType.Error);

                }

            }

            return currVrpSubInventory;

        }
        public SubInventoryItemInfo GetSubItemHistory(VrpDeliveryItemInfo currVrpDelivery)
        {
            SubInventoryItemInfo currSubInventory = new SubInventoryItemInfo();

            string query = "SELECT * FROM sub_inventory_item WHERE sub_inventory_item_id = @SubInventoryItemID";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        
                        cmd.Parameters.AddWithValue("@SubInventoryItemID", currVrpDelivery.SubInventoryItemID);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currSubInventory = DataMgrTools.BuildSubInventoryItem(reader);
                                }
                            }
                        }

                        conn.Close();
                    }

                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get Sub(Previous Quantity)", System.Diagnostics.EventLogEntryType.Error);

                }

            }

            return currSubInventory;

        }
        public VrpDeliveryItemInfo Get(int id)
        {
            VrpDeliveryItemInfo currVrpDelivery = new VrpDeliveryItemInfo();
            string query = string.Format("SELECT * FROM vrp_delivery_item WHERE delivery_item_id = {0}", id);
            
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
                            currVrpDelivery = DataMgrTools.BuildVrpDeliveryItem(reader);
                        }
                        
                    }
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Get(VrpDeliveryItemRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return currVrpDelivery;
        }
        public VrpDeliveryItemInfo Add(VrpDeliveryItemInfo currVrpDelivery)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO vrp_delivery_item (delivery_id, route_no, timestamp, rx_time, " +
                                                          "reference_no, item_name, description, price, weight, " +
                                                          "width, height, length, volume, quantity, remarks, feature_id, item_no, main_inventory_item_id, sub_inventory_item_id, flag, pickup_id) " +
                                                            "VALUES (@DeliveryID, @RouteNo, @Timestamp, @RxTime, " +
                                                          "@ReferenceNo, @ItemName, @Description, @Price, @Weight, " +
                                                          "@Width, @Height, @Length, @Volume, @Quantity, @Remarks, @FeatureID, @ItemNo, @MainInventoryItemID, @SubInventoryItemID, @Flag, @PickupID)";
                        
                        cmd.Parameters.AddWithValue("@DeliveryID", currVrpDelivery.DeliveryID);
                        cmd.Parameters.AddWithValue("@RouteNo", currVrpDelivery.RouteNo);
                        cmd.Parameters.AddWithValue("@Timestamp", currVrpDelivery.Timestamp);
                        cmd.Parameters.AddWithValue("@RxTime", currVrpDelivery.RxTime);
                        cmd.Parameters.AddWithValue("@ReferenceNo", currVrpDelivery.ReferenceNo);
                        cmd.Parameters.AddWithValue("@ItemName", currVrpDelivery.ItemName);
                        cmd.Parameters.AddWithValue("@Description", currVrpDelivery.Description);
                        cmd.Parameters.AddWithValue("@Price", currVrpDelivery.Price);
                        cmd.Parameters.AddWithValue("@Weight", currVrpDelivery.Weight);
                        cmd.Parameters.AddWithValue("@Width", currVrpDelivery.Width);
                        cmd.Parameters.AddWithValue("@Height", currVrpDelivery.Height);
                        cmd.Parameters.AddWithValue("@Length", currVrpDelivery.Length);
                        cmd.Parameters.AddWithValue("@Volume", currVrpDelivery.Volume);
                        cmd.Parameters.AddWithValue("@Quantity", currVrpDelivery.Quantity);
                        cmd.Parameters.AddWithValue("@Remarks", currVrpDelivery.Remarks);
                        cmd.Parameters.AddWithValue("@FeatureID", currVrpDelivery.FeatureID);
                        cmd.Parameters.AddWithValue("@ItemNo", currVrpDelivery.ItemNo);
                        cmd.Parameters.AddWithValue("@MainInventoryItemID", currVrpDelivery.MainInventoryItemID);
                        cmd.Parameters.AddWithValue("@SubInventoryItemID", currVrpDelivery.SubInventoryItemID);
                        cmd.Parameters.AddWithValue("@Flag", currVrpDelivery.Flag);
                        cmd.Parameters.AddWithValue("@PickupID", currVrpDelivery.PickupID);

                        cmd.ExecuteNonQuery();
                        long id = cmd.LastInsertedId;
                        currVrpDelivery.DeliveryItemID = id;

                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(VrpDeliveryItemRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return currVrpDelivery;
        }

        public Task<VrpDeliveryItemInfo> AddImportAsync(VrpDeliveryItemInfo currVrpDelivery)
        {
            try
            {

                MainInventoryItemInfo currMainCusItem = new MainInventoryItemInfo();
                SubInventoryItemInfo currCusItem = new SubInventoryItemInfo();
                VrpPickupInfo currPickupItem = new VrpPickupInfo();

                AssetFeatureInfo currFeature = new AssetFeatureInfo();

                //get feature id
                string featureId = RepoHelpers.GetFeatureId(currVrpDelivery.Features);
                currVrpDelivery.FeatureID = featureId;

                if (currVrpDelivery.Category.Equals("HQ"))
                {
                    //get hq item id
                    try
                    {
                        MainInventoryItemRepository mainItemRepo = new MainInventoryItemRepository();
                        currMainCusItem = mainItemRepo.GetByReferenceNo(currVrpDelivery.ReferenceNo, currVrpDelivery.CompanyID);
                        currVrpDelivery.PreviousQuantity = currMainCusItem.Quantity;
                        currVrpDelivery.Price = currMainCusItem.Price;
                        currVrpDelivery.MainInventoryItemID = currMainCusItem.MainInventoryItemID;
                        currCusItem.SubInventoryItemID = 0;
                    }
                    catch (Exception ex)
                    {
                        Logger.LogEvent(ex.Message + "-GetMainItemId", System.Diagnostics.EventLogEntryType.Error);
                    }
                }
                else
                {

                    //get customer item id
                    try
                    {
                        SubInventoryItemRepository cusItemRepo = new SubInventoryItemRepository();
                        currCusItem = cusItemRepo.GetByReferenceNo(currVrpDelivery.ReferenceNo, currVrpDelivery.CompanyID);
                        currVrpDelivery.PreviousQuantity = currCusItem.Quantity;
                        currVrpDelivery.Price = currCusItem.Price;
                        currVrpDelivery.SubInventoryItemID = currCusItem.SubInventoryItemID;
                        currMainCusItem.MainInventoryItemID = 0;
                    }
                    catch (Exception ex)
                    {
                        Logger.LogEvent(ex.Message + "-GetCusItemId", System.Diagnostics.EventLogEntryType.Error);
                    }

                    if (!currVrpDelivery.Category.Equals("Customer"))
                    {
                        //get pickup id
                        try
                        {
                            VrpPickupRepository cusPickupItemRepo = new VrpPickupRepository();
                            currPickupItem = cusPickupItemRepo.GetByOrderNo(currVrpDelivery.RouteNo, currVrpDelivery.Category);
                            currVrpDelivery.PickupID = currPickupItem.PickupID;
                        }
                        catch (Exception ex)
                        {
                            Logger.LogEvent(ex.Message + "-GetPickupId", System.Diagnostics.EventLogEntryType.Error);
                        }
                    }

                }


                
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;

                        cmd.CommandText = "INSERT INTO vrp_delivery_item (delivery_id, route_no, timestamp, rx_time, " +
                                                              "reference_no, item_name, description, price, weight, " +
                                                              "width, height, length, volume, quantity, remarks, feature_id, item_no, main_inventory_item_id, sub_inventory_item_id, flag, pickup_id) " +
                                                                "VALUES (@DeliveryID, @RouteNo, @Timestamp, @RxTime, " +
                                                              "@ReferenceNo, @ItemName, @Description, @Price, @Weight, " +
                                                              "@Width, @Height, @Length, @Volume, @Quantity, @Remarks, @FeatureID, @ItemNo, @MainInventoryItemID, @SubInventoryItemID, @Flag, @PickupID)";

                        
                        cmd.Parameters.AddWithValue("@DeliveryID", currVrpDelivery.DeliveryID);
                        cmd.Parameters.AddWithValue("@RouteNo", currVrpDelivery.RouteNo);
                        cmd.Parameters.AddWithValue("@Timestamp", currVrpDelivery.Timestamp);
                        cmd.Parameters.AddWithValue("@RxTime", currVrpDelivery.RxTime);
                        cmd.Parameters.AddWithValue("@ReferenceNo", currVrpDelivery.ReferenceNo);
                        cmd.Parameters.AddWithValue("@ItemName", currVrpDelivery.ItemName);
                        cmd.Parameters.AddWithValue("@Description", currVrpDelivery.Description);
                        cmd.Parameters.AddWithValue("@Price", currVrpDelivery.Price);
                        cmd.Parameters.AddWithValue("@Weight", currVrpDelivery.Weight);
                        cmd.Parameters.AddWithValue("@Width", currVrpDelivery.Width);
                        cmd.Parameters.AddWithValue("@Height", currVrpDelivery.Height);
                        cmd.Parameters.AddWithValue("@Length", currVrpDelivery.Length);
                        cmd.Parameters.AddWithValue("@Volume", currVrpDelivery.Volume);
                        cmd.Parameters.AddWithValue("@Quantity", currVrpDelivery.Quantity);
                        cmd.Parameters.AddWithValue("@Remarks", currVrpDelivery.Remarks);
                        cmd.Parameters.AddWithValue("@FeatureID", currVrpDelivery.FeatureID);
                        cmd.Parameters.AddWithValue("@ItemNo", currVrpDelivery.ItemNo);
                        cmd.Parameters.AddWithValue("@MainInventoryItemID", currVrpDelivery.MainInventoryItemID);
                        cmd.Parameters.AddWithValue("@SubInventoryItemID", currVrpDelivery.SubInventoryItemID);
                        cmd.Parameters.AddWithValue("@Flag", currVrpDelivery.Flag);
                        cmd.Parameters.AddWithValue("@PickupID", currVrpDelivery.PickupID);

                        cmd.ExecuteNonQuery();
                        long id = cmd.LastInsertedId;
                        currVrpDelivery.DeliveryItemID = id;

                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(VrpDeliveryItemRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            //return currVrpPickup;
            return Task<VrpDeliveryItemInfo>.Factory.StartNew(() =>
            {
                return currVrpDelivery;
            });
        }

        public bool Remove(int id)
        {
            bool retVal = false;
            string query = string.Format("DELETE FROM vrp_delivery_item WHERE delivery_item_id = {0}", id);
            
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
                Logger.LogEvent(ex.Message + "-Remove(VrpDeliveryItemRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return retVal;
        }

        public bool Update(VrpDeliveryItemInfo currVrpDelivery)
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
                        cmd.CommandText = "UPDATE vrp_delivery_item SET delivery_id = @DeliveryID, route_no = @RouteNo, timestamp = @Timestamp, rx_time = @RxTime, " +
                                                                "reference_no = @ReferenceNo, item_name = @ItemName, description = @Description, price = @Price, weight = @Weight, " +
                                                                "width = @Width, height = @Height, length = @Length, volume = @Volume, quantity = @Quantity, remarks = @Remarks, feature_id = @FeatureID, item_no = @ItemNo, main_inventory_item_id = @MainInventoryItemID, sub_inventory_item_id = @SubInventoryItemID, flag = @Flag, pickup_id = @PickupID " +
                                                                "WHERE delivery_item_id = @DeliveryItemID";
                        
                        cmd.Parameters.AddWithValue("@DeliveryID", currVrpDelivery.DeliveryID);
                        cmd.Parameters.AddWithValue("@RouteNo", currVrpDelivery.RouteNo);
                        cmd.Parameters.AddWithValue("@Timestamp", currVrpDelivery.Timestamp);
                        cmd.Parameters.AddWithValue("@RxTime", currVrpDelivery.RxTime);
                        cmd.Parameters.AddWithValue("@ReferenceNo", currVrpDelivery.ReferenceNo);
                        cmd.Parameters.AddWithValue("@ItemName", currVrpDelivery.ItemName);
                        cmd.Parameters.AddWithValue("@Description", currVrpDelivery.Description);
                        cmd.Parameters.AddWithValue("@Price", currVrpDelivery.Price);
                        cmd.Parameters.AddWithValue("@Weight", currVrpDelivery.Weight);
                        cmd.Parameters.AddWithValue("@Width", currVrpDelivery.Width);
                        cmd.Parameters.AddWithValue("@Height", currVrpDelivery.Height);
                        cmd.Parameters.AddWithValue("@Length", currVrpDelivery.Length);
                        cmd.Parameters.AddWithValue("@Volume", currVrpDelivery.Volume);
                        cmd.Parameters.AddWithValue("@Quantity", currVrpDelivery.Quantity);
                        cmd.Parameters.AddWithValue("@Remarks", currVrpDelivery.Remarks);
                        cmd.Parameters.AddWithValue("@FeatureID", currVrpDelivery.FeatureID);
                        cmd.Parameters.AddWithValue("@ItemNo", currVrpDelivery.ItemNo);
                        cmd.Parameters.AddWithValue("@MainInventoryItemID", currVrpDelivery.MainInventoryItemID);
                        cmd.Parameters.AddWithValue("@SubInventoryItemID", currVrpDelivery.SubInventoryItemID);
                        cmd.Parameters.AddWithValue("@Flag", currVrpDelivery.Flag);
                        cmd.Parameters.AddWithValue("@PickupID", currVrpDelivery.PickupID);
                        cmd.Parameters.AddWithValue("@DeliveryItemID", currVrpDelivery.DeliveryItemID);  

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
                Logger.LogEvent(ex.Message + "-Update(VrpDeliveryItemRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }

        public bool RemoveDeliveryItem(VrpDeliveryItemInfo currVrpDelivery)
        {
            bool retVal = false;

            string query = string.Format("DELETE FROM vrp_delivery_item WHERE route_no = @RouteNo");

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
                Logger.LogEvent(ex.Message + "-Remove Delivery(VrpDeliveryItemRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }
    }
}