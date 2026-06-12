using FMSWebApi.Models;
using FMSWebApi.Properties;
using MySql.Data.MySqlClient;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Web;
using System.Web.Script.Serialization;

namespace FMSWebApi.Repository
{
    public class StockMovementRepository : IStockMovementRepository
    {
        private string mConnStr = Settings.Default.DB;
        private string mProjName = "FMS-Singapore";
        public IEnumerable<StockMovementInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<StockMovementInfo> arrStockMovement = new List<StockMovementInfo>();

            if (conn != null)
                conn.Close();

            return arrStockMovement.ToArray();
        }
        public IEnumerable<StockMovementInfo> GetByRouteNo(StockMovementInfo param)
        {

            List<StockMovementInfo> arrStockMovement = new List<StockMovementInfo>();
            OrderLines _currOrderLines = new OrderLines();
            StockMovementInfo currStockMovement = new StockMovementInfo();
            object objTemp = new object();

            string query = "SELECT * FROM view_stock_movement WHERE company_id = @CompanyID";
            if (!string.IsNullOrEmpty(param.UploadNo)) query += " and upload_no = @UploadNo";
            if (param.Timestamp != DateTime.MinValue && param.RxTime != DateTime.MinValue) query += " and timestamp between @Timestamp and @RxTime";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        
                        cmd.Parameters.AddWithValue("@Timestamp", param.Timestamp);
                        cmd.Parameters.AddWithValue("@RxTime", param.RxTime);
                        cmd.Parameters.AddWithValue("@CompanyID", param.CompanyID);
                        cmd.Parameters.AddWithValue("@UploadNo", param.UploadNo);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currStockMovement = DataMgrTools.BuildStockMovement(reader);
                                    arrStockMovement.Add(currStockMovement);
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(GetByUploadNo)", System.Diagnostics.EventLogEntryType.Error);

                }


            }

            return arrStockMovement;
        }
        public StockMovementInfo GetByUploadNo(string upload_no, string order_no, string sku)
        {
            StockMovementInfo currStockMovement = new StockMovementInfo();

            string query = "SELECT * FROM view_stock_movement WHERE upload_no = @UploadNo and order_no = @OrderNo and merchant_sku = @SKU";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                //single
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        
                        cmd.Parameters.AddWithValue("@UploadNo", upload_no);
                        cmd.Parameters.AddWithValue("@OrderNo", order_no);
                        cmd.Parameters.AddWithValue("@SKU", sku);
                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currStockMovement = DataMgrTools.BuildStockMovement(reader);
                                }
                            }
                            else
                            {
                                //bundle
                                currStockMovement = GetBundle(upload_no, order_no, sku);
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-GetByUploadNo Single", System.Diagnostics.EventLogEntryType.Error);

                }



            }

            return currStockMovement;
        }

        public StockMovementInfo GetBundle(string upload_no, string order_no, string sku)
        {
            StockMovementInfo currStockMovement = new StockMovementInfo();

            string query = "SELECT * FROM view_stock_movement WHERE upload_no = @UploadNo_ and order_no = @OrderNo_ and combination_sku = @SKU_";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                //bundle
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();

                        cmd.Parameters.AddWithValue("@UploadNo_", upload_no);
                        cmd.Parameters.AddWithValue("@OrderNo_", order_no);
                        cmd.Parameters.AddWithValue("@SKU_", sku);
                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currStockMovement = DataMgrTools.BuildStockMovement(reader);
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-GetByUploadNo Bundle", System.Diagnostics.EventLogEntryType.Error);
                }
            }

            return currStockMovement; 
        }
        public StockMovementInfo Get(int id)
        {
            StockMovementInfo currStockMovement = new StockMovementInfo();
            string query = string.Format("SELECT * FROM view_stock_movement WHERE stock_movement_id = {0}", id);
            
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
                            currStockMovement = DataMgrTools.BuildStockMovement(reader);
                        }
                        
                    }
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Get(StockMovementRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return currStockMovement;
        }
        public StockMovementInfo Add(StockMovementInfo currStockMovement)
        {
            SettingsRepository settingRepo = new SettingsRepository();
            LocationIQForwardGeoCodeResponse fwGeocode = new LocationIQForwardGeoCodeResponse();
            LocationIQGeoCodeResponse revGeocode = new LocationIQGeoCodeResponse();

            try
            {

                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO stock_movement (upload_no, merchant_sku, title, store_nickname, store_name, warehouse, shelf_name, timestamp, rx_time, " +
                                                                                                                         "original, movement, latest, type, combination_sku, movement_no, transfer_no, purchase_no, package_no, original_cost, stockout_price, stockin_price, new_cost, " +
                                                                                                                         "stockout_no, stockin_no, order_no, account, note, company_id) " +
                                                              "VALUES (@UploadNo, @MerchantSKU, @Title, @StoreNickname, @StoreName, @Warehouse, @ShelfName, @Timestamp, @RxTime, " +
                                                                                                                        "@Original, @Movement, @Latest, @Type, @CombinationSKU, @MovementNo, @TransfersNo, @PurchaseNo, @PackageNo, @OriginalCost, @StockOutPrice, @StockInPrice, @NewCost, " +
                                                                                                                         "@StockOutNo, @StockInNo, @OrderNo, @Account, @Note, @CompanyID)";
                        
                        cmd.Parameters.AddWithValue("@StockMovementID", currStockMovement.StockMovementID);
                        cmd.Parameters.AddWithValue("@UploadNo", currStockMovement.UploadNo);
                        cmd.Parameters.AddWithValue("@MerchantSKU", currStockMovement.MerchantSKU);
                        cmd.Parameters.AddWithValue("@Title", currStockMovement.Title);
                        cmd.Parameters.AddWithValue("@StoreNickname", currStockMovement.StoreNickname);
                        cmd.Parameters.AddWithValue("@StoreName", currStockMovement.StoreName);
                        cmd.Parameters.AddWithValue("@Warehouse", currStockMovement.Warehouse);
                        cmd.Parameters.AddWithValue("@ShelfName", currStockMovement.ShelfName);
                        cmd.Parameters.AddWithValue("@Timestamp", currStockMovement.Timestamp);
                        cmd.Parameters.AddWithValue("@RxTime", currStockMovement.RxTime);
                        cmd.Parameters.AddWithValue("@Original", currStockMovement.Original);
                        cmd.Parameters.AddWithValue("@Movement", currStockMovement.Movement);
                        cmd.Parameters.AddWithValue("@Latest", currStockMovement.Latest);
                        cmd.Parameters.AddWithValue("@Type", currStockMovement.Type);
                        cmd.Parameters.AddWithValue("@CombinationSKU", currStockMovement.CombinationSKU);
                        cmd.Parameters.AddWithValue("@MovementNo", currStockMovement.MovementNo);
                        cmd.Parameters.AddWithValue("@TransfersNo", currStockMovement.TransfersNo);
                        cmd.Parameters.AddWithValue("@PurchaseNo", currStockMovement.PurchaseNo);
                        cmd.Parameters.AddWithValue("@PackageNo", currStockMovement.PackageNo);
                        cmd.Parameters.AddWithValue("@OriginalCost", currStockMovement.OriginalCost);
                        cmd.Parameters.AddWithValue("@StockOutPrice", currStockMovement.StockOutPrice);
                        cmd.Parameters.AddWithValue("@StockInPrice", currStockMovement.StockInPrice);
                        cmd.Parameters.AddWithValue("@NewCost", currStockMovement.NewCost);
                        cmd.Parameters.AddWithValue("@StockOutNo", currStockMovement.StockOutNo);
                        cmd.Parameters.AddWithValue("@StockInNo", currStockMovement.StockInNo);
                        cmd.Parameters.AddWithValue("@OrderNo", currStockMovement.OrderNo);
                        cmd.Parameters.AddWithValue("@Account", currStockMovement.Account);
                        cmd.Parameters.AddWithValue("@Note", currStockMovement.Note);
                        cmd.Parameters.AddWithValue("@CompanyID", currStockMovement.CompanyID);
                        cmd.ExecuteNonQuery();

                        long id = cmd.LastInsertedId;
                        currStockMovement.StockMovementID = id;

                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(StockMovementRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return currStockMovement;
        }
        public async Task<StockMovementInfo> AddImportAsync(StockMovementInfo currStockMovement)
        {
            
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO stock_movement (upload_no, merchant_sku, title, store_nickname, store_name, warehouse, shelf_name, timestamp, rx_time, " +
                                                                                                                     "original, movement, latest, type, combination_sku, movement_no, transfer_no, purchase_no, package_no, original_cost, stockout_price, stockin_price, new_cost, " +
                                                                                                                     "stockout_no, stockin_no, order_no, account, note, company_id) " +
                                                          "VALUES (@UploadNo, @MerchantSKU, @Title, @StoreNickname, @StoreName, @Warehouse, @ShelfName, @Timestamp, @RxTime, " +
                                                                                                                    "@Original, @Movement, @Latest, @Type, @CombinationSKU, @MovementNo, @TransfersNo, @PurchaseNo, @PackageNo, @OriginalCost, @StockOutPrice, @StockInPrice, @NewCost, " +
                                                                                                                     "@StockOutNo, @StockInNo, @OrderNo, @Account, @Note, @CompanyID)";
                        
                        cmd.Parameters.AddWithValue("@StockMovementID", currStockMovement.StockMovementID);
                        cmd.Parameters.AddWithValue("@UploadNo", currStockMovement.UploadNo);
                        cmd.Parameters.AddWithValue("@MerchantSKU", currStockMovement.MerchantSKU);
                        cmd.Parameters.AddWithValue("@Title", currStockMovement.Title);
                        cmd.Parameters.AddWithValue("@StoreNickname", currStockMovement.StoreNickname);
                        cmd.Parameters.AddWithValue("@StoreName", currStockMovement.StoreName);
                        cmd.Parameters.AddWithValue("@Warehouse", currStockMovement.Warehouse);
                        cmd.Parameters.AddWithValue("@ShelfName", currStockMovement.ShelfName);
                        cmd.Parameters.AddWithValue("@Timestamp", currStockMovement.Timestamp);
                        cmd.Parameters.AddWithValue("@RxTime", currStockMovement.RxTime);
                        cmd.Parameters.AddWithValue("@Original", currStockMovement.Original);
                        cmd.Parameters.AddWithValue("@Movement", currStockMovement.Movement);
                        cmd.Parameters.AddWithValue("@Latest", currStockMovement.Latest);
                        cmd.Parameters.AddWithValue("@Type", currStockMovement.Type);
                        cmd.Parameters.AddWithValue("@CombinationSKU", currStockMovement.CombinationSKU);
                        cmd.Parameters.AddWithValue("@MovementNo", currStockMovement.MovementNo);
                        cmd.Parameters.AddWithValue("@TransfersNo", currStockMovement.TransfersNo);
                        cmd.Parameters.AddWithValue("@PurchaseNo", currStockMovement.PurchaseNo);
                        cmd.Parameters.AddWithValue("@PackageNo", currStockMovement.PackageNo);
                        cmd.Parameters.AddWithValue("@OriginalCost", currStockMovement.OriginalCost);
                        cmd.Parameters.AddWithValue("@StockOutPrice", currStockMovement.StockOutPrice);
                        cmd.Parameters.AddWithValue("@StockInPrice", currStockMovement.StockInPrice);
                        cmd.Parameters.AddWithValue("@NewCost", currStockMovement.NewCost);
                        cmd.Parameters.AddWithValue("@StockOutNo", currStockMovement.StockOutNo);
                        cmd.Parameters.AddWithValue("@StockInNo", currStockMovement.StockInNo);
                        cmd.Parameters.AddWithValue("@OrderNo", currStockMovement.OrderNo);
                        cmd.Parameters.AddWithValue("@Account", currStockMovement.Account);
                        cmd.Parameters.AddWithValue("@Note", currStockMovement.Note);
                        cmd.Parameters.AddWithValue("@CompanyID", currStockMovement.CompanyID);
                        cmd.ExecuteNonQuery();

                        long id = cmd.LastInsertedId;
                        currStockMovement.StockMovementID = id;

                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(ImportStockMovementRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return await Task.FromResult(currStockMovement);
        }
        public bool Remove(int id)
        {
            bool retVal = false;
            string query = string.Format("DELETE FROM stock_movement WHERE stock_movement_id = {0}", id);
            
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
                Logger.LogEvent(ex.Message + "-Remove(StockMovementRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return retVal;
        }
        public bool Update(StockMovementInfo currStockMovement)
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
                        cmd.CommandText = "UPDATE stock_movement SET upload_no = @UploadNo, merchant_sku = @MerchantSKU, title = @Title, store_nickname = @StoreNickname, store_name = @StoreName, warehouse = @Warehouse, shelf_name = @ShelfName, timestamp = @Timestamp, rx_time = @RxTime, " +
                                                                                                                      "original = @Original, movement = @Movement, latest = @Latest, type = @Type, combination_sku = @CombinationSKU, movement_no = @MovementNo, transfer_no = @TransfersNo, purchase_no = @PurchaseNo, package_no = @PackageNo, original_cost = @OriginalCost, stockout_price = @StockOutPrice, stockin_price = @StockInPrice, new_cost = @NewCost, " +
                                                                                                                      "stockout_no = @StockOutNo, stockin_no = @StockInNo, order_no = @OrderNo, account = @Account, note = @Note, company_id = @CompanyID " +
                                                                                                                      "WHERE stock_movement_id = @StockMovementID";
                        
                      
                        cmd.Parameters.AddWithValue("@UploadNo", currStockMovement.UploadNo);
                        cmd.Parameters.AddWithValue("@MerchantSKU", currStockMovement.MerchantSKU);
                        cmd.Parameters.AddWithValue("@Title", currStockMovement.Title);
                        cmd.Parameters.AddWithValue("@StoreNickname", currStockMovement.StoreNickname);
                        cmd.Parameters.AddWithValue("@StoreName", currStockMovement.StoreName);
                        cmd.Parameters.AddWithValue("@Warehouse", currStockMovement.Warehouse);
                        cmd.Parameters.AddWithValue("@ShelfName", currStockMovement.ShelfName);
                        cmd.Parameters.AddWithValue("@Timestamp", currStockMovement.Timestamp);
                        cmd.Parameters.AddWithValue("@RxTime", currStockMovement.RxTime);
                        cmd.Parameters.AddWithValue("@Original", currStockMovement.Original);
                        cmd.Parameters.AddWithValue("@Movement", currStockMovement.Movement);
                        cmd.Parameters.AddWithValue("@Latest", currStockMovement.Latest);
                        cmd.Parameters.AddWithValue("@Type", currStockMovement.Type);
                        cmd.Parameters.AddWithValue("@CombinationSKU", currStockMovement.CombinationSKU);
                        cmd.Parameters.AddWithValue("@MovementNo", currStockMovement.MovementNo);
                        cmd.Parameters.AddWithValue("@TransfersNo", currStockMovement.TransfersNo);
                        cmd.Parameters.AddWithValue("@PurchaseNo", currStockMovement.PurchaseNo);
                        cmd.Parameters.AddWithValue("@PackageNo", currStockMovement.PackageNo);
                        cmd.Parameters.AddWithValue("@OriginalCost", currStockMovement.OriginalCost);
                        cmd.Parameters.AddWithValue("@StockOutPrice", currStockMovement.StockOutPrice);
                        cmd.Parameters.AddWithValue("@StockInPrice", currStockMovement.StockInPrice);
                        cmd.Parameters.AddWithValue("@NewCost", currStockMovement.NewCost);
                        cmd.Parameters.AddWithValue("@StockOutNo", currStockMovement.StockOutNo);
                        cmd.Parameters.AddWithValue("@StockInNo", currStockMovement.StockInNo);
                        cmd.Parameters.AddWithValue("@OrderNo", currStockMovement.OrderNo);
                        cmd.Parameters.AddWithValue("@Account", currStockMovement.Account);
                        cmd.Parameters.AddWithValue("@Note", currStockMovement.Note);
                        cmd.Parameters.AddWithValue("@CompanyID", currStockMovement.CompanyID);
                        cmd.Parameters.AddWithValue("@StockMovementID", currStockMovement.StockMovementID);

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
                Logger.LogEvent(ex.Message + "-Update(StockMovementRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }

    }
}