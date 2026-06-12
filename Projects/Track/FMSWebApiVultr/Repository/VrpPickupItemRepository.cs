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
    public class VrpPickupItemRepository : IVrpPickupItemRepository
    {
        private string mConnStr = Settings.Default.DB;
        private string mProjName = "FMS-Singapore";
        public IEnumerable<VrpPickupItemInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<VrpPickupItemInfo> arrVrpPickup = new List<VrpPickupItemInfo>();

            if (conn != null)
                conn.Close();

            return arrVrpPickup.ToArray();
        }
        public IEnumerable<VrpPickupItemInfo> GetByID(VrpPickupItemInfo param)
        {

            List<VrpPickupItemInfo> arrVrpPickup = new List<VrpPickupItemInfo>();
            VrpPickupItemInfo currVrpPickup = new VrpPickupItemInfo();
            SubInventoryHistoryInfo currVrpSubInventory = new SubInventoryHistoryInfo();
            SubInventoryItemInfo currSubInventory = new SubInventoryItemInfo();

            object objTemp = new object();

            string query = "SELECT * FROM vrp_pickup_item WHERE pickup_id = @PickupID";


            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        
                        cmd.Parameters.AddWithValue("@PickupID", param.PickupID);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currVrpPickup = DataMgrTools.BuildVrpPickupItem(reader);

                                    if (currVrpPickup.SubInventoryItemID > 0)
                                    {
                                        currVrpSubInventory = GetSubHistory(currVrpPickup);
                                        currSubInventory = GetSubItemHistory(currVrpPickup);

                                        currVrpPickup.StockType = currVrpSubInventory.StockType;
                                        currVrpPickup.PreviousQuantity = currSubInventory.Quantity;
                                    }


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

        public SubInventoryHistoryInfo GetSubHistory(VrpPickupItemInfo currVrpPickup)
        {
            SubInventoryHistoryInfo currVrpSubInventory = new SubInventoryHistoryInfo();

            string query = "SELECT * FROM view_sub_inventory_history WHERE pickup_id = @PickupID and sub_inventory_item_id = @SubInventoryItemID order by timestamp asc";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    if (currVrpPickup.SubInventoryItemID > 0)
                    {


                        using (MySqlCommand cmd = new MySqlCommand(query, conn))
                        {
                            conn.Open();
                            
                            cmd.Parameters.AddWithValue("@PickupID", currVrpPickup.PickupID);
                            cmd.Parameters.AddWithValue("@SubInventoryItemID", currVrpPickup.SubInventoryItemID);

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

        public VrpPickupItemInfo GetSubItem(VrpPickupItemInfo currVrpPickup)
        {
            VrpPickupItemInfo _currVrpPickup = new VrpPickupItemInfo();

            string query = "SELECT * FROM vrp_pickup_item WHERE pickup_id = @PickupID and sub_inventory_item_id = @SubInventoryItemID and reference_no = @ReferenceNo";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        
                        cmd.Parameters.AddWithValue("@PickupID", currVrpPickup.PickupID);
                        cmd.Parameters.AddWithValue("@SubInventoryItemID", currVrpPickup.SubInventoryItemID);
                        cmd.Parameters.AddWithValue("@ReferenceNo", currVrpPickup.ReferenceNo);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    _currVrpPickup = DataMgrTools.BuildVrpPickupItem(reader);
                                }
                            }
                        }

                        conn.Close();
                    }

                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-GetSubItem", System.Diagnostics.EventLogEntryType.Error);

                }

            }

            return _currVrpPickup;

        }

        public SubInventoryItemInfo GetSubItemHistory(VrpPickupItemInfo currVrpPickup)
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
                        
                        cmd.Parameters.AddWithValue("@SubInventoryItemID", currVrpPickup.SubInventoryItemID);

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
        public VrpPickupItemInfo Get(int id)
        {
            VrpPickupItemInfo currVrpPickup = new VrpPickupItemInfo();
            string query = string.Format("SELECT * FROM vrp_pickup_item WHERE pickup_item_id = {0}", id);
            
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
                            currVrpPickup = DataMgrTools.BuildVrpPickupItem(reader);
                        }
                        
                    }
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Get(VrpPickupItemRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return currVrpPickup;
        }

        public async Task<VrpPickupItemInfo> AddImportAsync(VrpPickupItemInfo currVrpPickup)
        {
            try
            {
                SubInventoryItemInfo currCusItem = new SubInventoryItemInfo();
                AssetFeatureInfo currFeature = new AssetFeatureInfo();
                string featureId = "";

                if (!string.IsNullOrEmpty(currVrpPickup.Features))
                {
                    //get feature id
                    Task<string> task = Task.Run(() => GetFeaturesIdRunAsync(currVrpPickup.Features));
                    featureId = await task;
                    currVrpPickup.FeatureID = featureId;
                }
                else
                {
                    featureId = currVrpPickup.FeatureID;
                }

                //Logger.LogEvent(string.Format("Feature ID: {0} Features: {1} featureId: {2}", currVrpPickup.FeatureID, currVrpPickup.Features, featureId), System.Diagnostics.EventLogEntryType.Warning);

                //get item id
                try
                {
                    SubInventoryItemRepository cusItemRepo = new SubInventoryItemRepository();
                    currCusItem = cusItemRepo.GetByReferenceNo(currVrpPickup.ReferenceNo, currVrpPickup.CompanyID);
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-GetCusItemId", System.Diagnostics.EventLogEntryType.Error);
                }

                currVrpPickup.SubInventoryItemID = currCusItem.SubInventoryItemID;
                currVrpPickup.PreviousQuantity = currCusItem.Quantity;
                currVrpPickup.Price = currCusItem.Price;

                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO vrp_pickup_item (pickup_id, route_no, timestamp, rx_time, " +
                                                          "reference_no, item_name, description, price, weight, " +
                                                          "width, height, length, volume, quantity, remarks, feature_id, item_no, sub_inventory_item_id, flag) " +
                                                            "VALUES (@PickupID, @RouteNo, @Timestamp, @RxTime, " +
                                                          "@ReferenceNo, @ItemName, @Description, @Price, @Weight, " +
                                                          "@Width, @Height, @Length, @Volume, @Quantity, @Remarks, @FeatureID, @ItemNo, @SubInventoryItemID, @Flag)";
                        
                        cmd.Parameters.AddWithValue("@PickupID", currVrpPickup.PickupID);
                        cmd.Parameters.AddWithValue("@RouteNo", currVrpPickup.RouteNo);
                        cmd.Parameters.AddWithValue("@Timestamp", currVrpPickup.Timestamp);
                        cmd.Parameters.AddWithValue("@RxTime", currVrpPickup.RxTime);
                        cmd.Parameters.AddWithValue("@ReferenceNo", currVrpPickup.ReferenceNo);
                        cmd.Parameters.AddWithValue("@ItemName", currVrpPickup.ItemName);
                        cmd.Parameters.AddWithValue("@Description", currVrpPickup.Description);
                        cmd.Parameters.AddWithValue("@Price", currVrpPickup.Price);
                        cmd.Parameters.AddWithValue("@Weight", currVrpPickup.Weight);
                        cmd.Parameters.AddWithValue("@Width", currVrpPickup.Width);
                        cmd.Parameters.AddWithValue("@Height", currVrpPickup.Height);
                        cmd.Parameters.AddWithValue("@Length", currVrpPickup.Length);
                        cmd.Parameters.AddWithValue("@Volume", currVrpPickup.Volume);
                        cmd.Parameters.AddWithValue("@Quantity", currVrpPickup.Quantity);
                        cmd.Parameters.AddWithValue("@Remarks", currVrpPickup.Remarks);
                        cmd.Parameters.AddWithValue("@FeatureID", featureId);
                        cmd.Parameters.AddWithValue("@ItemNo", currVrpPickup.ItemNo);
                        cmd.Parameters.AddWithValue("@SubInventoryItemID", currVrpPickup.SubInventoryItemID);
                        cmd.Parameters.AddWithValue("@Flag", currVrpPickup.Flag);

                        cmd.ExecuteNonQuery();
                        long id = cmd.LastInsertedId;
                        currVrpPickup.PickupItemID = id;

                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(VrpPickupItemRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            //return currVrpPickup;
            //return Task<VrpPickupItemInfo>.Factory.StartNew(() =>
            //{
            //    return currVrpPickup;
            //});

            return await Task.FromResult(currVrpPickup);
        }

        public async Task<string> GetFeaturesIdRunAsync(string features)
        {
            string retVal = "";
            AssetFeatureInfo currFeature = new AssetFeatureInfo();
            try
            {
                AssetFeatureRepository assetFeatureRepo = new AssetFeatureRepository();

                string[] arrFeatures = features.Split(",".ToCharArray());

                for (int i = 0; i < arrFeatures.Length; i++)
                {
                    currFeature = await assetFeatureRepo.GetByNameAsync(arrFeatures[i]);
                    if (i == arrFeatures.Length - 1) retVal += string.Format("{0}", currFeature.FeatureID.ToString());
                    else retVal += string.Format("{0}{1}", currFeature.FeatureID.ToString(), ",");
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-GetFeatureId", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
            //return await Task.FromResult(retVal);

        }

        public VrpPickupItemInfo Add(VrpPickupItemInfo currVrpPickup)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO vrp_pickup_item (pickup_id, route_no, timestamp, rx_time, " +
                                                          "reference_no, item_name, description, price, weight, " +
                                                          "width, height, length, volume, quantity, remarks, feature_id, item_no, sub_inventory_item_id, flag) " +
                                                            "VALUES (@PickupID, @RouteNo, @Timestamp, @RxTime, " +
                                                          "@ReferenceNo, @ItemName, @Description, @Price, @Weight, " +
                                                          "@Width, @Height, @Length, @Volume, @Quantity, @Remarks, @FeatureID, @ItemNo, @SubInventoryItemID, @Flag)";
                        
                        cmd.Parameters.AddWithValue("@PickupID", currVrpPickup.PickupID);
                        cmd.Parameters.AddWithValue("@RouteNo", currVrpPickup.RouteNo);
                        cmd.Parameters.AddWithValue("@Timestamp", currVrpPickup.Timestamp);
                        cmd.Parameters.AddWithValue("@RxTime", currVrpPickup.RxTime);
                        cmd.Parameters.AddWithValue("@ReferenceNo", currVrpPickup.ReferenceNo);
                        cmd.Parameters.AddWithValue("@ItemName", currVrpPickup.ItemName);
                        cmd.Parameters.AddWithValue("@Description", currVrpPickup.Description);
                        cmd.Parameters.AddWithValue("@Price", currVrpPickup.Price);
                        cmd.Parameters.AddWithValue("@Weight", currVrpPickup.Weight);
                        cmd.Parameters.AddWithValue("@Width", currVrpPickup.Width);
                        cmd.Parameters.AddWithValue("@Height", currVrpPickup.Height);
                        cmd.Parameters.AddWithValue("@Length", currVrpPickup.Length);
                        cmd.Parameters.AddWithValue("@Volume", currVrpPickup.Volume);
                        cmd.Parameters.AddWithValue("@Quantity", currVrpPickup.Quantity);
                        cmd.Parameters.AddWithValue("@Remarks", currVrpPickup.Remarks);
                        cmd.Parameters.AddWithValue("@FeatureID", currVrpPickup.FeatureID);
                        cmd.Parameters.AddWithValue("@ItemNo", currVrpPickup.ItemNo);
                        cmd.Parameters.AddWithValue("@SubInventoryItemID", currVrpPickup.SubInventoryItemID);
                        cmd.Parameters.AddWithValue("@Flag", currVrpPickup.Flag);

                        cmd.ExecuteNonQuery();
                        long id = cmd.LastInsertedId;
                        currVrpPickup.PickupItemID = id;

                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(VrpPickupItemRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return currVrpPickup;
        }

        public bool Remove(int id)
        {
            bool retVal = false;
            string query = string.Format("DELETE FROM vrp_pickup_item WHERE pickup_item_id = {0}", id);
            
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
                Logger.LogEvent(ex.Message + "-Remove(VrpPickupItemRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return retVal;
        }

        public bool Update(VrpPickupItemInfo currVrpPickup)
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
                        cmd.CommandText = "UPDATE vrp_pickup_item SET pickup_id = @PickupID, route_no = @RouteNo, timestamp = @Timestamp, rx_time = @RxTime, " +
                                                                "reference_no = @ReferenceNo, item_name = @ItemName, description = @Description, price = @Price, weight = @Weight, " +
                                                                "width = @Width, height = @Height, length = @Length, volume = @Volume, quantity = @Quantity, remarks = @Remarks, feature_id = @FeatureID, item_no = @ItemNo, sub_inventory_item_id = @SubInventoryItemID, flag = @Flag " +
                                                                "WHERE pickup_item_id = @PickupItemID";
                        
                        cmd.Parameters.AddWithValue("@PickupID", currVrpPickup.PickupID);
                        cmd.Parameters.AddWithValue("@RouteNo", currVrpPickup.RouteNo);
                        cmd.Parameters.AddWithValue("@Timestamp", currVrpPickup.Timestamp);
                        cmd.Parameters.AddWithValue("@RxTime", currVrpPickup.RxTime);
                        cmd.Parameters.AddWithValue("@ReferenceNo", currVrpPickup.ReferenceNo);
                        cmd.Parameters.AddWithValue("@ItemName", currVrpPickup.ItemName);
                        cmd.Parameters.AddWithValue("@Description", currVrpPickup.Description);
                        cmd.Parameters.AddWithValue("@Price", currVrpPickup.Price);
                        cmd.Parameters.AddWithValue("@Weight", currVrpPickup.Weight);
                        cmd.Parameters.AddWithValue("@Width", currVrpPickup.Width);
                        cmd.Parameters.AddWithValue("@Height", currVrpPickup.Height);
                        cmd.Parameters.AddWithValue("@Length", currVrpPickup.Length);
                        cmd.Parameters.AddWithValue("@Volume", currVrpPickup.Volume);
                        cmd.Parameters.AddWithValue("@Quantity", currVrpPickup.Quantity);
                        cmd.Parameters.AddWithValue("@Remarks", currVrpPickup.Remarks);
                        cmd.Parameters.AddWithValue("@FeatureID", currVrpPickup.FeatureID);
                        cmd.Parameters.AddWithValue("@ItemNo", currVrpPickup.ItemNo);
                        cmd.Parameters.AddWithValue("@SubInventoryItemID", currVrpPickup.SubInventoryItemID);
                        cmd.Parameters.AddWithValue("@Flag", currVrpPickup.Flag);
                        cmd.Parameters.AddWithValue("@PickupItemID", currVrpPickup.PickupItemID);  

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
                Logger.LogEvent(ex.Message + "-Update(VrpPickupItemRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }

        public bool RemovePickupItem(VrpPickupItemInfo currVrpPickup)
        {
            bool retVal = false;

            string query = string.Format("DELETE FROM vrp_pickup_item WHERE route_no = @RouteNo");

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
                Logger.LogEvent(ex.Message + "-Remove Pickup(VrpPickupItemRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }
    }
}