using FMSWebApi.Models;
using FMSWebApi.Properties;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http.Headers;
using System.Net.Http;
using System.Security.Cryptography;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Script.Serialization;
using Newtonsoft.Json;
using Renci.SshNet.Messages.Authentication;
using Google.Protobuf.WellKnownTypes;
using Renci.SshNet.Security;
using System.Collections;
using System.Diagnostics;
using System.Text.RegularExpressions;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Web.Hosting;

namespace FMSWebApi.Repository
{
    public class BigSellerOrderRepository : IBigSellerOrderRepository
    {
        private string mConnStr = Settings.Default.DB;
        private string mProjName = "FMS-Singapore";
        public IEnumerable<BigSellerOrderInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<BigSellerOrderInfo> arrStockMovement = new List<BigSellerOrderInfo>();

            if (conn != null)
                conn.Close();

            return arrStockMovement.ToArray();
        }
        public IEnumerable<BigSellerOrderInfo> GetByUploadNo(BigSellerOrderInfo param)
        {

            List<BigSellerOrderInfo> arrOrder = new List<BigSellerOrderInfo>();
            BigSellerOrderInfo currOrder = new BigSellerOrderInfo();
            object objTemp = new object();

            string query = "SELECT * FROM bigseller_order WHERE company_id = @CompanyID";
            if (!string.IsNullOrEmpty(param.UploadNo)) query += " and upload_no = @UploadNo";
            if (param.OrderTime != DateTime.MinValue && param.OrderShippedTime != DateTime.MinValue) query += " and order_time between @OrderTime and @OrderShippedTime";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        
                        cmd.Parameters.AddWithValue("@OrderTime", param.OrderTime);
                        cmd.Parameters.AddWithValue("@OrderShippedTime", param.OrderShippedTime);
                        cmd.Parameters.AddWithValue("@CompanyID", param.CompanyID);
                        cmd.Parameters.AddWithValue("@UploadNo", param.UploadNo);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currOrder = DataMgrTools.BuildBigSellerOrder(reader);
                                    arrOrder.Add(currOrder);
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

            //Logger.LogEvent(string.Format("Count Orders: {0}", arrOrder.Count()), System.Diagnostics.EventLogEntryType.Warning);
            return arrOrder.ToArray();
        }
        public IEnumerable<BigSellerOrderInfo> GetOrders(BigSellerOrderInfo param)
        {

            List<BigSellerOrderInfo> arrOrder = new List<BigSellerOrderInfo>();
            BigSellerOrderInfo currOrder = new BigSellerOrderInfo();
            object objTemp = new object();

            string query = "SELECT * FROM bigseller_order WHERE company_id = @CompanyID";
            if (!string.IsNullOrEmpty(param.UploadNo)) query += " and upload_no = @UploadNo";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        cmd.Parameters.AddWithValue("@CompanyID", param.CompanyID);
                        cmd.Parameters.AddWithValue("@UploadNo", param.UploadNo);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currOrder = DataMgrTools.BuildBigSellerOrder(reader);
                                    arrOrder.Add(currOrder);
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

            //Logger.LogEvent(string.Format("Count Orders: {0}", arrOrder.Count()), System.Diagnostics.EventLogEntryType.Warning);
            return arrOrder;
        }
        public BigSellerOrderInfo Get(int id)
        {
            BigSellerOrderInfo currOrder = new BigSellerOrderInfo();
            string query = string.Format("SELECT * FROM bigseller_order WHERE order_id = {0}", id);
            
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
                            currOrder = DataMgrTools.BuildBigSellerOrder(reader);
                        }
                        
                    }
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Get(BigSellerOrderRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return currOrder;
        }
        public BigSellerOrderInfo Add(BigSellerOrderInfo currOrder)
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
                        cmd.CommandText = "INSERT INTO bigseller_order (upload_no, order_no, package_no, main_package_no, invoice_no, marketplace, store_nickname, storename_marketplace, seller_name, order_status, order_type, marketplace_status, order_time, order_paid_time, expire_time, order_shipped_time, " +
                                                                       "packed_time, printed_time, cancel_time, buyer_message, username, receiver_name, phone_number, delivery_address, town, district, city, " +
                                                                       "province, country, post_code, product_name, sku, variation_name, image_link, price, quantity, product_subtotal, " +
                                                                       "merchant_sku, title, commodity_cost, reference_price, buyer_design_logistics, shipping_option, cargo_carry_method, tracking_number, package_weight, payment_method, " +
                                                                       "order_total, voucher, store_voucher, management_fee, transaction_fee, currency, shipping_fee, seller_discount, marketplace_discount, seller_shipping_discount, " +
                                                                       "marketplace_shipping_discount, seller_note, note_for_cs, note_for_pick, order_mark, shipping_warehouse, shelf, stock_out, stock_in, shipping_fee_paid_by_seller, company_id) " +
                                                              "VALUES (@UploadNo, @OrderNo, @PackageNo, @MainPackageNo, @InvoiceNo, @Marketplace, @BigSellerStoreNickname, @StorenameMarketplace, @SellerName, @OrderStatus, @OrderType, @MarketplaceStatus, @OrderTime, @OrderPaidTime, @ExpireTime, @OrderShippedTime, " +
                                                                       "@PackedTime, @PrintedTime, @CancelTime, @BuyerMessage, @UserName, @ReceiverName, @PhoneNumber, @DeliveryAddress, @Town, @District, @City, " +
                                                                       "@Province, @Country, @PostCode, @ProductName, @SKU, @VariationName, @ImageLink, @Price, @Quantity, @ProductSubtotal, " +
                                                                       "@MerchantSKU, @Title, @CommodityCost, @ReferencePrice, @BuyerDesignLogistics, @ShippingOption, @CargoCarryMethod, @TrackingNumber, @PackageWeight, @PaymentMethod, " +
                                                                       "@OrderTotal, @Voucher, @StoreVoucher, @ManagementFee, @TransactionFee, @Currency, @ShippingFee, @SellerDiscount, @MarketplaceDiscount, @SellerShippingDiscount, " +
                                                                       "@MarketplaceShippingDiscount, @SellerNote, @NoteForCS, @NoteForPick, @OrderMark, @ShippingWarehouse, @Shelf, @StockOut, @StockIn, @ShippingFeePaidBySeller, @CompanyID)";
                        
                        cmd.Parameters.AddWithValue("@UploadNo", currOrder.UploadNo);
                        cmd.Parameters.AddWithValue("@OrderNo", currOrder.OrderNo);
                        cmd.Parameters.AddWithValue("@PackageNo", currOrder.PackageNo);
                        cmd.Parameters.AddWithValue("@MainPackageNo", currOrder.MainPackageNo);
                        cmd.Parameters.AddWithValue("@InvoiceNo", currOrder.InvoiceNo);
                        cmd.Parameters.AddWithValue("@Marketplace", currOrder.Marketplace);
                        cmd.Parameters.AddWithValue("@BigSellerStoreNickname", currOrder.BigSellerStoreNickname);
                        cmd.Parameters.AddWithValue("@StorenameMarketplace", currOrder.StorenameMarketplace);
                        cmd.Parameters.AddWithValue("@SellerName", currOrder.SellerName);
                        cmd.Parameters.AddWithValue("@OrderStatus", currOrder.OrderStatus);
                        cmd.Parameters.AddWithValue("@OrderType", currOrder.OrderType);
                        cmd.Parameters.AddWithValue("@MarketplaceStatus", currOrder.MarketplaceStatus);
                        cmd.Parameters.AddWithValue("@OrderTime", currOrder.OrderTime);
                        cmd.Parameters.AddWithValue("@OrderPaidTime", currOrder.OrderPaidTime);
                        cmd.Parameters.AddWithValue("@ExpireTime", currOrder.ExpireTime);
                        cmd.Parameters.AddWithValue("@OrderShippedTime", currOrder.OrderShippedTime);
                        cmd.Parameters.AddWithValue("@PackedTime", currOrder.PackedTime);
                        cmd.Parameters.AddWithValue("@PrintedTime", currOrder.PrintedTime);
                        cmd.Parameters.AddWithValue("@CancelTime", currOrder.CancelTime);
                        cmd.Parameters.AddWithValue("@BuyerMessage", currOrder.BuyerMessage);
                        cmd.Parameters.AddWithValue("@UserName", currOrder.UserName);
                        cmd.Parameters.AddWithValue("@ReceiverName", currOrder.ReceiverName);
                        cmd.Parameters.AddWithValue("@PhoneNumber", currOrder.PhoneNumber);
                        cmd.Parameters.AddWithValue("@DeliveryAddress", currOrder.DeliveryAddress);
                        cmd.Parameters.AddWithValue("@Town", currOrder.Town);
                        cmd.Parameters.AddWithValue("@District", currOrder.District);
                        cmd.Parameters.AddWithValue("@City", currOrder.City);
                        cmd.Parameters.AddWithValue("@Province", currOrder.Province);
                        cmd.Parameters.AddWithValue("@Country", currOrder.Country);
                        cmd.Parameters.AddWithValue("@PostCode", currOrder.PostCode);
                        cmd.Parameters.AddWithValue("@ProductName", currOrder.ProductName);
                        cmd.Parameters.AddWithValue("@SKU", currOrder.SKU);
                        cmd.Parameters.AddWithValue("@VariationName", currOrder.VariationName);
                        cmd.Parameters.AddWithValue("@ImageLink", currOrder.ImageLink);
                        cmd.Parameters.AddWithValue("@Price", currOrder.Price);
                        cmd.Parameters.AddWithValue("@Quantity", currOrder.Quantity);
                        cmd.Parameters.AddWithValue("@ProductSubtotal", currOrder.ProductSubtotal);
                        cmd.Parameters.AddWithValue("@MerchantSKU", currOrder.MerchantSKU);
                        cmd.Parameters.AddWithValue("@Title", currOrder.Title);
                        cmd.Parameters.AddWithValue("@CommodityCost", currOrder.CommodityCost);
                        cmd.Parameters.AddWithValue("@ReferencePrice", currOrder.ReferencePrice);
                        cmd.Parameters.AddWithValue("@BuyerDesignLogistics", currOrder.BuyerDesignLogistics);
                        cmd.Parameters.AddWithValue("@ShippingOption", currOrder.ShippingOption);
                        cmd.Parameters.AddWithValue("@CargoCarryMethod", currOrder.CargoCarryMethod);
                        cmd.Parameters.AddWithValue("@TrackingNumber", currOrder.TrackingNumber);
                        cmd.Parameters.AddWithValue("@PackageWeight", currOrder.PackageWeight);
                        cmd.Parameters.AddWithValue("@PaymentMethod", currOrder.PaymentMethod);
                        cmd.Parameters.AddWithValue("@OrderTotal", currOrder.OrderTotal);
                        cmd.Parameters.AddWithValue("@Voucher", currOrder.Voucher);
                        cmd.Parameters.AddWithValue("@StoreVoucher", currOrder.StoreVoucher);
                        cmd.Parameters.AddWithValue("@ManagementFee", currOrder.ManagementFee);
                        cmd.Parameters.AddWithValue("@TransactionFee", currOrder.TransactionFee);
                        cmd.Parameters.AddWithValue("@Currency", currOrder.Currency);
                        cmd.Parameters.AddWithValue("@ShippingFee", currOrder.ShippingFee);
                        cmd.Parameters.AddWithValue("@SellerDiscount", currOrder.SellerDiscount);
                        cmd.Parameters.AddWithValue("@MarketplaceDiscount", currOrder.MarketplaceDiscount);
                        cmd.Parameters.AddWithValue("@SellerShippingDiscount", currOrder.SellerShippingDiscount);
                        cmd.Parameters.AddWithValue("@MarketplaceShippingDiscount", currOrder.MarketplaceShippingDiscount);
                        cmd.Parameters.AddWithValue("@SellerNote", currOrder.SellerNote);
                        cmd.Parameters.AddWithValue("@NoteForCS", currOrder.NoteForCS);
                        cmd.Parameters.AddWithValue("@NoteForPick", currOrder.NoteForPick);
                        cmd.Parameters.AddWithValue("@OrderMark", currOrder.OrderMark);
                        cmd.Parameters.AddWithValue("@ShippingWarehouse", currOrder.ShippingWarehouse);
                        cmd.Parameters.AddWithValue("@Shelf", currOrder.Shelf);
                        cmd.Parameters.AddWithValue("@StockOut", currOrder.StockOut);
                        cmd.Parameters.AddWithValue("@StockIn", currOrder.StockIn);
                        cmd.Parameters.AddWithValue("@ShippingFeePaidBySeller", currOrder.ShippingFeePaidBySeller);
                        cmd.Parameters.AddWithValue("@CompanyID", currOrder.CompanyID);
                        cmd.ExecuteNonQuery();

                        long id = cmd.LastInsertedId;
                        currOrder.OrderID = id;

                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(StockMovementRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return currOrder;
        }
        public async Task<BigSellerOrderInfo> AddImportAsync(BigSellerOrderInfo currOrder)
        {

            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO bigseller_order (upload_no, order_no, package_no, main_package_no, invoice_no, marketplace, store_nickname, storename_marketplace, seller_name, order_status, order_type, marketplace_status, order_time, order_paid_time, expire_time, order_shipped_time, " +
                                                                       "packed_time, printed_time, cancel_time, buyer_message, username, receiver_name, phone_number, delivery_address, town, district, city, " +
                                                                       "province, country, post_code, product_name, sku, variation_name, image_link, price, quantity, product_subtotal, " +
                                                                       "merchant_sku, title, commodity_cost, reference_price, buyer_design_logistics, shipping_option, cargo_carry_method, tracking_number, package_weight, payment_method, " +
                                                                       "order_total, voucher, store_voucher, management_fee, transaction_fee, currency, shipping_fee, seller_discount, marketplace_discount, seller_shipping_discount, " +
                                                                       "marketplace_shipping_discount, seller_note, note_for_cs, note_for_pick, order_mark, shipping_warehouse, shelf, stock_out, stock_in, shipping_fee_paid_by_seller, company_id) " +
                                                              "VALUES (@UploadNo, @OrderNo, @PackageNo, @MainPackageNo, @InvoiceNo, @Marketplace, @BigSellerStoreNickname, @StorenameMarketplace, @SellerName, @OrderStatus, @OrderType, @MarketplaceStatus, @OrderTime, @OrderPaidTime, @ExpireTime, @OrderShippedTime, " +
                                                                       "@PackedTime, @PrintedTime, @CancelTime, @BuyerMessage, @UserName, @ReceiverName, @PhoneNumber, @DeliveryAddress, @Town, @District, @City, " +
                                                                       "@Province, @Country, @PostCode, @ProductName, @SKU, @VariationName, @ImageLink, @Price, @Quantity, @ProductSubtotal, " +
                                                                       "@MerchantSKU, @Title, @CommodityCost, @ReferencePrice, @BuyerDesignLogistics, @ShippingOption, @CargoCarryMethod, @TrackingNumber, @PackageWeight, @PaymentMethod, " +
                                                                       "@OrderTotal, @Voucher, @StoreVoucher, @ManagementFee, @TransactionFee, @Currency, @ShippingFee, @SellerDiscount, @MarketplaceDiscount, @SellerShippingDiscount, " +
                                                                       "@MarketplaceShippingDiscount, @SellerNote, @NoteForCS, @NoteForPick, @OrderMark, @ShippingWarehouse, @Shelf, @StockOut, @StockIn, @ShippingFeePaidBySeller, @CompanyID)";
                        
                        cmd.Parameters.AddWithValue("@UploadNo", currOrder.UploadNo);
                        cmd.Parameters.AddWithValue("@OrderNo", currOrder.OrderNo);
                        cmd.Parameters.AddWithValue("@PackageNo", currOrder.PackageNo);
                        cmd.Parameters.AddWithValue("@MainPackageNo", currOrder.MainPackageNo);
                        cmd.Parameters.AddWithValue("@InvoiceNo", currOrder.InvoiceNo);
                        cmd.Parameters.AddWithValue("@Marketplace", currOrder.Marketplace);
                        cmd.Parameters.AddWithValue("@BigSellerStoreNickname", currOrder.BigSellerStoreNickname);
                        cmd.Parameters.AddWithValue("@StorenameMarketplace", currOrder.StorenameMarketplace);
                        cmd.Parameters.AddWithValue("@SellerName", currOrder.SellerName);
                        cmd.Parameters.AddWithValue("@OrderStatus", currOrder.OrderStatus);
                        cmd.Parameters.AddWithValue("@OrderType", currOrder.OrderType);
                        cmd.Parameters.AddWithValue("@MarketplaceStatus", currOrder.MarketplaceStatus);
                        cmd.Parameters.AddWithValue("@OrderTime", currOrder.OrderTime);
                        cmd.Parameters.AddWithValue("@OrderPaidTime", currOrder.OrderPaidTime);
                        cmd.Parameters.AddWithValue("@ExpireTime", currOrder.ExpireTime);
                        cmd.Parameters.AddWithValue("@OrderShippedTime", currOrder.OrderShippedTime);
                        cmd.Parameters.AddWithValue("@PackedTime", currOrder.PackedTime);
                        cmd.Parameters.AddWithValue("@PrintedTime", currOrder.PrintedTime);
                        cmd.Parameters.AddWithValue("@CancelTime", currOrder.CancelTime);
                        cmd.Parameters.AddWithValue("@BuyerMessage", currOrder.BuyerMessage);
                        cmd.Parameters.AddWithValue("@UserName", currOrder.UserName);
                        cmd.Parameters.AddWithValue("@ReceiverName", currOrder.ReceiverName);
                        cmd.Parameters.AddWithValue("@PhoneNumber", currOrder.PhoneNumber);
                        cmd.Parameters.AddWithValue("@DeliveryAddress", currOrder.DeliveryAddress);
                        cmd.Parameters.AddWithValue("@Town", currOrder.Town);
                        cmd.Parameters.AddWithValue("@District", currOrder.District);
                        cmd.Parameters.AddWithValue("@City", currOrder.City);
                        cmd.Parameters.AddWithValue("@Province", currOrder.Province);
                        cmd.Parameters.AddWithValue("@Country", currOrder.Country);
                        cmd.Parameters.AddWithValue("@PostCode", currOrder.PostCode);
                        cmd.Parameters.AddWithValue("@ProductName", currOrder.ProductName);
                        cmd.Parameters.AddWithValue("@SKU", currOrder.SKU);
                        cmd.Parameters.AddWithValue("@VariationName", currOrder.VariationName);
                        cmd.Parameters.AddWithValue("@ImageLink", currOrder.ImageLink);
                        cmd.Parameters.AddWithValue("@Price", currOrder.Price);
                        cmd.Parameters.AddWithValue("@Quantity", currOrder.Quantity);
                        cmd.Parameters.AddWithValue("@ProductSubtotal", currOrder.ProductSubtotal);
                        cmd.Parameters.AddWithValue("@MerchantSKU", currOrder.MerchantSKU);
                        cmd.Parameters.AddWithValue("@Title", currOrder.Title);
                        cmd.Parameters.AddWithValue("@CommodityCost", currOrder.CommodityCost);
                        cmd.Parameters.AddWithValue("@ReferencePrice", currOrder.ReferencePrice);
                        cmd.Parameters.AddWithValue("@BuyerDesignLogistics", currOrder.BuyerDesignLogistics);
                        cmd.Parameters.AddWithValue("@ShippingOption", currOrder.ShippingOption);
                        cmd.Parameters.AddWithValue("@CargoCarryMethod", currOrder.CargoCarryMethod);
                        cmd.Parameters.AddWithValue("@TrackingNumber", currOrder.TrackingNumber);
                        cmd.Parameters.AddWithValue("@PackageWeight", currOrder.PackageWeight);
                        cmd.Parameters.AddWithValue("@PaymentMethod", currOrder.PaymentMethod);
                        cmd.Parameters.AddWithValue("@OrderTotal", currOrder.OrderTotal);
                        cmd.Parameters.AddWithValue("@Voucher", currOrder.Voucher);
                        cmd.Parameters.AddWithValue("@StoreVoucher", currOrder.StoreVoucher);
                        cmd.Parameters.AddWithValue("@ManagementFee", currOrder.ManagementFee);
                        cmd.Parameters.AddWithValue("@TransactionFee", currOrder.TransactionFee);
                        cmd.Parameters.AddWithValue("@Currency", currOrder.Currency);
                        cmd.Parameters.AddWithValue("@ShippingFee", currOrder.ShippingFee);
                        cmd.Parameters.AddWithValue("@SellerDiscount", currOrder.SellerDiscount);
                        cmd.Parameters.AddWithValue("@MarketplaceDiscount", currOrder.MarketplaceDiscount);
                        cmd.Parameters.AddWithValue("@SellerShippingDiscount", currOrder.SellerShippingDiscount);
                        cmd.Parameters.AddWithValue("@MarketplaceShippingDiscount", currOrder.MarketplaceShippingDiscount);
                        cmd.Parameters.AddWithValue("@SellerNote", currOrder.SellerNote);
                        cmd.Parameters.AddWithValue("@NoteForCS", currOrder.NoteForCS);
                        cmd.Parameters.AddWithValue("@NoteForPick", currOrder.NoteForPick);
                        cmd.Parameters.AddWithValue("@OrderMark", currOrder.OrderMark);
                        cmd.Parameters.AddWithValue("@ShippingWarehouse", currOrder.ShippingWarehouse);
                        cmd.Parameters.AddWithValue("@Shelf", currOrder.Shelf);
                        cmd.Parameters.AddWithValue("@StockOut", currOrder.StockOut);
                        cmd.Parameters.AddWithValue("@StockIn", currOrder.StockIn);
                        cmd.Parameters.AddWithValue("@ShippingFeePaidBySeller", currOrder.ShippingFeePaidBySeller);
                        cmd.Parameters.AddWithValue("@CompanyID", currOrder.CompanyID);
                        cmd.ExecuteNonQuery();

                        long id = cmd.LastInsertedId;
                        currOrder.OrderID = id;
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(ImportBigSellerOrderRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return await Task.FromResult(currOrder);
        }
        public async Task<BigSellerOrderInfo> SaveGI(BigSellerOrderInfo currOrder)
        {
            var orderData = new object();
            List<BigSellerOrderInfo> arrOrder = new List<BigSellerOrderInfo>();
            arrOrder = (List<BigSellerOrderInfo>)GetOrders(currOrder);
            
            if (arrOrder.Count > 0)
            {
                //Logger.LogEvent(string.Format("Save GI: {0}", arrOrder.Count()), System.Diagnostics.EventLogEntryType.Warning);

                for (int i = 0; i < arrOrder.Count; i++)
                {
                    try
                    {
                        //Logger.LogEvent(string.Format("Order No: {0}", arrOrder[i].OrderNo), System.Diagnostics.EventLogEntryType.Warning);
                        orderData = await ParseData(arrOrder[i]);
                    }
                    catch (Exception ex)
                    {
                        //Logger.LogEvent(ex.Message + "-SaveGIRunAsync", System.Diagnostics.EventLogEntryType.Error);
                        continue;
                    }

                    try
                    {
                        Logger.LogEvent("ParseData: " + JsonConvert.SerializeObject(orderData, Formatting.Indented), System.Diagnostics.EventLogEntryType.Information);
                        using (var client = new HttpClient())
                        {
                            client.BaseAddress = new Uri(Settings.Default.BaseAddess);
                            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", currOrder.Token);
                            client.DefaultRequestHeaders.Add("Accept", "*/*");

                            var Parameters = new List<KeyValuePair<string, string>>
                        {
                            new KeyValuePair<string, string>("Order", JsonConvert.SerializeObject(orderData)),
                        };

                            var Request = new HttpRequestMessage(HttpMethod.Post, "api/GoodsIssue/")
                            {
                                Content = new FormUrlEncodedContent(Parameters)
                            };

                            var Result = await client.SendAsync(Request).Result.Content.ReadAsStringAsync();
                            Logger.LogEvent("SaveGI result: " + Result, System.Diagnostics.EventLogEntryType.Information);
                            //var Rts = await RTS(arrOrder[i], currOrder.Token);

                        }
                    }
                    catch (HttpRequestException ex)
                    {
                        Logger.LogEvent("Httpclient ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                        continue;
                    }

                    try
                    {
                        var Shipped = await _Shipped(arrOrder[i], currOrder.Token);
                    }
                    catch (Exception ex)
                    {
                        Logger.LogEvent(ex.Message + "-UpdateToShip", System.Diagnostics.EventLogEntryType.Error);
                        continue;
                    }
                }
            }

            return await Task.FromResult(currOrder);
        }
        public async Task<BigSellerOrderInfo> _Shipped(BigSellerOrderInfo currOrder, string token)
        {
            var orderData = new object();
            orderData = Ship(currOrder, "Ship");

            try
            {
                //Logger.LogEvent("Ship: " + JsonConvert.SerializeObject(orderData, Formatting.Indented), System.Diagnostics.EventLogEntryType.Information);
                using (var client = new HttpClient())
                {
                    client.BaseAddress = new Uri(Settings.Default.BaseAddess);
                    client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
                    client.DefaultRequestHeaders.Add("Accept", "*/*");

                    var Parameters = new List<KeyValuePair<string, string>>
                    {
                        new KeyValuePair<string, string>("Order", JsonConvert.SerializeObject(orderData)),
                    };

                    var Request = new HttpRequestMessage(HttpMethod.Post, "api/GoodsIssue/")
                    {
                        Content = new FormUrlEncodedContent(Parameters)
                    };

                    var Result = await client.SendAsync(Request).Result.Content.ReadAsStringAsync();

                }
            }
            catch (HttpRequestException ex)
            {
                Logger.LogEvent("Httpclient ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }

            return await Task.FromResult(currOrder);
        }
        private async Task<Order> ParseData(BigSellerOrderInfo currOrder)
        {
            StockMovementRepository smRepo = new StockMovementRepository();
            StockMovementInfo currSM = new StockMovementInfo();
            Order _currOrder = new Order();
            OrderLines _currOrderLines = new OrderLines();
            List<OrderLines> arrOrderLines = new List<OrderLines>();
            string order_type = "";
            string brand_code = "";

            _currOrder.IncomingCode = "New";
            _currOrder.AccountCode = "TEST-ACECOM";
            _currOrder.SalesOrderDate = currOrder.OrderTime;
            _currOrder.OrderType = "B2C";
            _currOrder.OrderPriority = "";
            _currOrder.ExpectedDate = currOrder.ExpireTime;
            _currOrder.PurchaseOrderNo = "";
            _currOrder.SiteCode = "01-UBI";
            _currOrder.OrderBy = currOrder.UserName;
            _currOrder.ShipToCode = "";
            _currOrder.ShipToName = currOrder.ReceiverName;
            _currOrder.ShipToAddress1 = currOrder.DeliveryAddress;
            _currOrder.ShipToAddress2 = "";
            _currOrder.ShipToAddress3 = "";
            _currOrder.ShipToAddress4 = "";
            _currOrder.ShipToCountryCode = "SG";
            _currOrder.ShipToPostalCode = currOrder.PostCode;
            _currOrder.ShipToContactPerson = currOrder.PhoneNumber;
            _currOrder.RouteCode = currOrder.UploadNo;
            _currOrder.SoldToCode = currOrder.UserName;
            _currOrder.SoldToName = currOrder.ReceiverName;
            _currOrder.SoldToAddress = currOrder.DeliveryAddress;
            _currOrder.SoldToCountryCode = "SG";
            _currOrder.SoldToPostalCode = currOrder.PostCode;
            _currOrder.Remarks1 = "";
            _currOrder.Remarks2 = "";
            _currOrder.OnlinePlatform = currOrder.Marketplace;
            _currOrder.StoreName = currOrder.StorenameMarketplace;
            _currOrder.TransporterCode = "";
            _currOrder.DeliveryTrackingId = currOrder.TrackingNumber;
            _currOrder.SalesOrderNo = string.Format("{0}-{1}", currOrder.OrderNo, currOrder.OrderID);

            // get brand code
            switch (currOrder.StorenameMarketplace)
            {
                case "L'OCCITANE":
                    brand_code = "LOC-";
                    break;
                case "L’Occitane Official Store":
                    brand_code = "LOC-";
                    break;
                default:
                    brand_code = "";
                    break;
            }

            //Check Single/Bundle
            currSM = smRepo.GetByUploadNo(currOrder.UploadNo, currOrder.OrderNo, currOrder.MerchantSKU);

            if (string.IsNullOrEmpty(Regex.Replace(currSM.CombinationSKU, @"\s+", "")))
            {
                order_type = "single";
            }
            else
            {
                order_type = "bundle";
            }


            if (order_type == "single")
            {
                _currOrderLines.OrderLineNo = 0;
                _currOrderLines.OrderQuantity = currOrder.Quantity;
                _currOrderLines.BundleSKUCode = currSM.CombinationSKU;
                _currOrderLines.OrderItemType = order_type;
                _currOrderLines.SKUCode = brand_code + currSM.MerchantSKU;
                _currOrderLines.UOM = "PCE";
                _currOrderLines.OrderLineRemarks1 = "";
                _currOrderLines.OrderLineRemarks2 = "";
                 arrOrderLines.Add(_currOrderLines);
            }
            else
            {
                //Get Multiple Orderlines           
                arrOrderLines = await GetOrderlines(currOrder.UploadNo, currOrder.OrderNo, currSM.CombinationSKU, currOrder.StorenameMarketplace, order_type, currOrder.Quantity);               
            }


            _currOrder.OrderLines = arrOrderLines;

            return await Task.FromResult(_currOrder);
        }
        public async Task<List<OrderLines>> GetOrderlines(string upload_no, string order_no, string combination_sku, string store, string order_type, int quantity)
        {
            StockMovementInfo currStockMovement = new StockMovementInfo();          
            List<OrderLines> arrOrderLines = new List<OrderLines>();
            string query = "SELECT * FROM view_stock_movement WHERE upload_no = @UploadNo_ and order_no = @OrderNo_ and combination_sku = @CombinationSKU";
            string brand_code = "";


            // get brand code
            switch (store)
            {
                case "L'OCCITANE":
                    brand_code = "LOC-";
                    break;
                case "L’Occitane Official Store":
                    brand_code = "LOC-";
                    break;
                default:
                    brand_code = "";
                    break;
            }

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();

                        cmd.Parameters.AddWithValue("@UploadNo_", upload_no);
                        cmd.Parameters.AddWithValue("@OrderNo_", order_no);
                        cmd.Parameters.AddWithValue("@CombinationSKU", combination_sku);
                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                int rowCount = 0;
                                while (reader.Read())
                                {
                                    currStockMovement = DataMgrTools.BuildStockMovement(reader);
                                    OrderLines _currOrderLines = new OrderLines();
                                    _currOrderLines.OrderLineNo = rowCount;                                   
                                    _currOrderLines.OrderQuantity = quantity;
                                    _currOrderLines.BundleSKUCode = currStockMovement.CombinationSKU;
                                    _currOrderLines.OrderItemType = order_type;
                                    _currOrderLines.SKUCode = brand_code + currStockMovement.MerchantSKU;
                                    _currOrderLines.UOM = "PCE";
                                    _currOrderLines.OrderLineRemarks1 = "";
                                    _currOrderLines.OrderLineRemarks2 = "";
                                    rowCount++;

                                    //Logger.LogEvent(string.Format("Get(GetOrderlines) OrderNo: {0} Order MerchantSKU: {1}", order_no, brand_code + currStockMovement.MerchantSKU), System.Diagnostics.EventLogEntryType.Warning);
                                    arrOrderLines.Add(_currOrderLines);

                                    
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-GetOrderlines", System.Diagnostics.EventLogEntryType.Error);
                }
            }


            //return arrOrderLines;
            return await Task.FromResult(arrOrderLines);
        }
        public IEnumerable<BigSellerOrderInfo> CheckGroup(string upload_no, string order_no, string tracking_number)
        {
            List<BigSellerOrderInfo> arrOrder = new List<BigSellerOrderInfo>();
            BigSellerOrderInfo currOrder = new BigSellerOrderInfo();

            string query = "SELECT * FROM bigseller_order WHERE upload_no = @UploadNo and order_no = @OrderNo and tracking_number = @TrackingNumber";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {               
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();

                        cmd.Parameters.AddWithValue("@UploadNo", upload_no);
                        cmd.Parameters.AddWithValue("@OrderNo", order_no);
                        cmd.Parameters.AddWithValue("@TrackingNumber", tracking_number);
                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currOrder = DataMgrTools.BuildBigSellerOrder(reader);
                                    arrOrder.Add(currOrder);
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-CheckGroup", System.Diagnostics.EventLogEntryType.Error);
                }
            }
            return arrOrder;
        }
        private static Ship Ship(BigSellerOrderInfo currOrder, string status)
        {

            Ship _currOrder = new Ship();
            StockMovementRepository smRepo = new StockMovementRepository();
            StockMovementInfo currSM = new StockMovementInfo();
            //Get Stock Movement
            currSM = smRepo.GetByUploadNo(currOrder.UploadNo, currOrder.OrderNo, currOrder.MerchantSKU);
            string order_no = ""; //custom order no.

            if (string.IsNullOrEmpty(Regex.Replace(currSM.CombinationSKU, @"\s+", "")))
            {
                order_no = string.Format("{0}-{1}", currOrder.OrderNo, currOrder.OrderID);
            }
            else
            {
                order_no = string.Format("{0}-{1}", currOrder.OrderNo, currOrder.OrderID);
            }

            _currOrder.SalesOrderNo = order_no;

            try
            {
                _currOrder.IncomingCode = status;
                _currOrder.AccountCode = "TEST-ACECOM";
                _currOrder.SalesOrderNo = order_no;
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Ship", System.Diagnostics.EventLogEntryType.Error);
            }

            return _currOrder;
        }
        public bool Remove(int id)
        {
            bool retVal = false;
            string query = string.Format("DELETE FROM bigseller_order WHERE order_id = {0}", id);
            
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
                Logger.LogEvent(ex.Message + "-Remove(BigSellerOrderRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return retVal;
        }
        public bool Update(BigSellerOrderInfo currOrder)
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
                        cmd.CommandText = "UPDATE bigseller_order SET upload_no = @UploadNo, merchant_sku = @MerchantSKU, title = @Title, store_nickname = @StoreNickname, store_name = @StoreName, warehouse = @Warehouse, shelf_name = @ShelfName, timestamp = @Timestamp, rx_time = @RxTime, " +
                                                                                                                      "original = @Original, movement = @Movement, latest = @Latest, type = @Type, combination_sku = @CombinationSKU, movement_no = @MovementNo, transfer_no = @TransfersNo, purchase_no = @PurchaseNo, package_no = @PackageNo, original_cost = @OriginalCost, stockout_price = @StockOutPrice, stockin_price = @StockInPrice, new_cost = @NewCost, " +
                                                                                                                      "stockout_no = @StockOutNo, stockin_no = @StockInNo, order_no = @OrderNo, account = @Account, note = @Note, company_id = @CompanyID " +
                                                                                                                      "WHERE stock_movement_id = @StockMovementID";
                        
                        cmd.Parameters.AddWithValue("@UploadNo", currOrder.UploadNo);
                        cmd.Parameters.AddWithValue("@OrderNo", currOrder.OrderNo);
                        cmd.Parameters.AddWithValue("@PackageNo", currOrder.PackageNo);
                        cmd.Parameters.AddWithValue("@MainPackageNo", currOrder.MainPackageNo);
                        cmd.Parameters.AddWithValue("@InvoiceNo", currOrder.InvoiceNo);
                        cmd.Parameters.AddWithValue("@Marketplace", currOrder.Marketplace);
                        cmd.Parameters.AddWithValue("@BigSellerStoreNickname", currOrder.BigSellerStoreNickname);
                        cmd.Parameters.AddWithValue("@StorenameMarketplace", currOrder.StorenameMarketplace);
                        cmd.Parameters.AddWithValue("@SellerName", currOrder.SellerName);
                        cmd.Parameters.AddWithValue("@OrderStatus", currOrder.OrderStatus);
                        cmd.Parameters.AddWithValue("@OrderType", currOrder.OrderType);
                        cmd.Parameters.AddWithValue("@MarketplaceStatus", currOrder.MarketplaceStatus);
                        cmd.Parameters.AddWithValue("@OrderTime", currOrder.OrderTime);
                        cmd.Parameters.AddWithValue("@OrderPaidTime", currOrder.OrderPaidTime);
                        cmd.Parameters.AddWithValue("@ExpireTime", currOrder.ExpireTime);
                        cmd.Parameters.AddWithValue("@OrderShippedTime", currOrder.OrderShippedTime);
                        cmd.Parameters.AddWithValue("@PackedTime", currOrder.PackedTime);
                        cmd.Parameters.AddWithValue("@PrintedTime", currOrder.PrintedTime);
                        cmd.Parameters.AddWithValue("@CancelTime", currOrder.CancelTime);
                        cmd.Parameters.AddWithValue("@BuyerMessage", currOrder.BuyerMessage);
                        cmd.Parameters.AddWithValue("@UserName", currOrder.UserName);
                        cmd.Parameters.AddWithValue("@ReceiverName", currOrder.ReceiverName);
                        cmd.Parameters.AddWithValue("@PhoneNumber", currOrder.PhoneNumber);
                        cmd.Parameters.AddWithValue("@DeliveryAddress", currOrder.DeliveryAddress);
                        cmd.Parameters.AddWithValue("@Town", currOrder.Town);
                        cmd.Parameters.AddWithValue("@District", currOrder.District);
                        cmd.Parameters.AddWithValue("@City", currOrder.City);
                        cmd.Parameters.AddWithValue("@Province", currOrder.Province);
                        cmd.Parameters.AddWithValue("@Country", currOrder.Country);
                        cmd.Parameters.AddWithValue("@PostCode", currOrder.PostCode);
                        cmd.Parameters.AddWithValue("@ProductName", currOrder.ProductName);
                        cmd.Parameters.AddWithValue("@SKU", currOrder.SKU);
                        cmd.Parameters.AddWithValue("@VariationName", currOrder.VariationName);
                        cmd.Parameters.AddWithValue("@ImageLink", currOrder.ImageLink);
                        cmd.Parameters.AddWithValue("@Price", currOrder.Price);
                        cmd.Parameters.AddWithValue("@Quantity", currOrder.Quantity);
                        cmd.Parameters.AddWithValue("@ProductSubtotal", currOrder.ProductSubtotal);
                        cmd.Parameters.AddWithValue("@MerchantSKU", currOrder.MerchantSKU);
                        cmd.Parameters.AddWithValue("@Title", currOrder.Title);
                        cmd.Parameters.AddWithValue("@CommodityCost", currOrder.CommodityCost);
                        cmd.Parameters.AddWithValue("@ReferencePrice", currOrder.ReferencePrice);
                        cmd.Parameters.AddWithValue("@BuyerDesignLogistics", currOrder.BuyerDesignLogistics);
                        cmd.Parameters.AddWithValue("@ShippingOption", currOrder.ShippingOption);
                        cmd.Parameters.AddWithValue("@CargoCarryMethod", currOrder.CargoCarryMethod);
                        cmd.Parameters.AddWithValue("@TrackingNumber", currOrder.TrackingNumber);
                        cmd.Parameters.AddWithValue("@PackageWeight", currOrder.PackageWeight);
                        cmd.Parameters.AddWithValue("@PaymentMethod", currOrder.PaymentMethod);
                        cmd.Parameters.AddWithValue("@OrderTotal", currOrder.OrderTotal);
                        cmd.Parameters.AddWithValue("@Voucher", currOrder.Voucher);
                        cmd.Parameters.AddWithValue("@StoreVoucher", currOrder.StoreVoucher);
                        cmd.Parameters.AddWithValue("@ManagementFee", currOrder.ManagementFee);
                        cmd.Parameters.AddWithValue("@TransactionFee", currOrder.TransactionFee);
                        cmd.Parameters.AddWithValue("@Currency", currOrder.Currency);
                        cmd.Parameters.AddWithValue("@ShippingFee", currOrder.ShippingFee);
                        cmd.Parameters.AddWithValue("@SellerDiscount", currOrder.SellerDiscount);
                        cmd.Parameters.AddWithValue("@MarketplaceDiscount", currOrder.MarketplaceDiscount);
                        cmd.Parameters.AddWithValue("@SellerShippingDiscount", currOrder.SellerShippingDiscount);
                        cmd.Parameters.AddWithValue("@MarketplaceShippingDiscount", currOrder.MarketplaceShippingDiscount);
                        cmd.Parameters.AddWithValue("@SellerNote", currOrder.SellerNote);
                        cmd.Parameters.AddWithValue("@NoteForCS", currOrder.NoteForCS);
                        cmd.Parameters.AddWithValue("@NoteForPick", currOrder.NoteForPick);
                        cmd.Parameters.AddWithValue("@OrderMark", currOrder.OrderMark);
                        cmd.Parameters.AddWithValue("@ShippingWarehouse", currOrder.ShippingWarehouse);
                        cmd.Parameters.AddWithValue("@Shelf", currOrder.Shelf);
                        cmd.Parameters.AddWithValue("@StockOut", currOrder.StockOut);
                        cmd.Parameters.AddWithValue("@StockIn", currOrder.StockIn);
                        cmd.Parameters.AddWithValue("@ShippingFeePaidBySeller", currOrder.ShippingFeePaidBySeller);
                        cmd.Parameters.AddWithValue("@CompanyID", currOrder.CompanyID);
                        cmd.Parameters.AddWithValue("@OrderID", currOrder.OrderID);

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
                Logger.LogEvent(ex.Message + "-Update(BigSellerOrderRepository)", System.Diagnostics.EventLogEntryType.Error);
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
                Logger.LogEvent(ex.Message + "-(Get Image)", System.Diagnostics.EventLogEntryType.Error);
            }

            // image file not found
            strFill = "None";
            return strName;
        }
    }
}