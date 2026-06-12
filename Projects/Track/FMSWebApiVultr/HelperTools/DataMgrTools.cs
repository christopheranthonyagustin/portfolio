using MySql.Data.MySqlClient;
using FMSWebApi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using FMSWebApi.Repository;

namespace FMSWebApi
{
    public class DataMgrTools
    {
        private static string mProjName = "FMS-Singapore";

        /// <summary>
        /// builds asset info from database record
        /// </summary>
        /// <param name="dbRdr"></param>
        /// <returns></returns>
        public static AssetInfo BuildAsset(MySqlDataReader dbRdr)
        {
            AssetInfo udtAsset = new AssetInfo();
            //List<AssetInfo> arrAssets = new List<AssetInfo>();
            AssetRepository assetRepo = new AssetRepository();
            
            try
            {
                // check assigned tag
                string strTag = dbRdr.ToString("tag");
                if (strTag == "") strTag = "--";

                // get curfew times
                DateTime dtStart = dbRdr.ToDateTime("curfew_start");
                DateTime dtEnd = dbRdr.ToDateTime("curfew_end");

                // adjust curfew times
                dtStart = Convert.ToDateTime(String.Format("{0:dd-MMM-yy} {1:HH:mm:ss}", DateTime.Now, dtStart));
                dtEnd = Convert.ToDateTime(String.Format("{0:dd-MMM-yy} {1:HH:mm:ss}", DateTime.Now, dtEnd));
                if (dtStart > dtEnd)
                    dtEnd = dtEnd.AddDays(1.0);

                // set asset parameters
                udtAsset.AssetID = dbRdr.ToInt64("asset_id");
                udtAsset.Name = dbRdr.ToString("name");
                udtAsset.CategoryID = dbRdr.ToInt32("category_id");
                udtAsset.Category = dbRdr.ToString("category_desc");
                udtAsset.Phone = dbRdr.ToString("phone");
                udtAsset.TagPhoneNo = dbRdr.ToString("tagphone");
                udtAsset.Email = dbRdr.ToString("email");
                udtAsset.Home = dbRdr.ToInt32("home");
                udtAsset.AlertZones = dbRdr.ToString("restricted");

                udtAsset.Category = dbRdr.ToString("category_desc");
                udtAsset.TagID = dbRdr.ToInt64("tag_id");
                udtAsset.Tag = strTag;
                udtAsset.IdleLimit = dbRdr.ToDouble("idle_limit");
                udtAsset.SpeedLimit = dbRdr.ToDouble("speed_limit");
                //udtAsset.BaseMileage = dbRdr.ToDouble("base_mileage");
                udtAsset.Mileage = dbRdr.ToDouble("mileage");
                udtAsset.MileageDist = Math.Abs(dbRdr.ToDouble("mileage_dist"));
                udtAsset.MileageDate = dbRdr.ToDateTime("mileage_date");
                udtAsset.CompanyID = dbRdr.ToInt32("company_id");
                udtAsset.Company = dbRdr.ToString("company");
                udtAsset.DriverID = dbRdr.ToInt32("driver_id");
                //udtAsset.Driver = dbRdr.ToString("driver_name");
                //udtAsset.Email = dbRdr.ToString("email");
                //udtAsset.Notifications = dbRdr.ToString("notifications");
                udtAsset.InstallDate = dbRdr.ToDateTime("install_date");

                udtAsset.CurfewStart = dtStart;
                udtAsset.CurfewEnd = dtEnd;
                // udtAsset.Timestamp = dbRdr.ToDateTime("timestamp");
                //udtAsset.Temperature = 0.0;
                //udtAsset.Temperature2 = 0.0;
                //udtAsset.RFID = "";            

                //try
                //{
                //    udtAsset.Temperature = dbRdr.ToDouble("temperature");
                //    udtAsset.Temperature2 = dbRdr.ToDouble("temperature2");
                //    udtAsset.RFID = dbRdr.ToString("rfid");
                //}
                //catch { }



                // initialize asset status
                udtAsset.StatusID = dbRdr.ToInt32("status_id");
                udtAsset.Status = dbRdr.ToString("status_desc");
                udtAsset.StatusEx = dbRdr.ToString("status_ex");
                udtAsset.Remarks = dbRdr.ToString("asset_remarks");
                udtAsset.AlertLevel = 0;
                udtAsset.Ignition = dbRdr.ToInt32("ignition");
                udtAsset.Gps = (int)Enums.GPSStatusColorInt.RED;
                udtAsset.Gprs = (int)Enums.StatusColorInt.RED;
                udtAsset.Engine = "STOP";

                // initialize last event / position
                try
                {
                    udtAsset.LastEventID = dbRdr.ToInt64("last_event");
                    udtAsset.LastEnterID = dbRdr.ToInt64("last_enter");
                    udtAsset.LastExitID = dbRdr.ToInt64("last_exit");
                    udtAsset.LastPosID = dbRdr.ToInt64("last_pos");
                    udtAsset.LastFixID = dbRdr.ToInt64("last_fix");
                    udtAsset.LastGpsID = dbRdr.ToInt64("last_gps");
                    udtAsset.LastIdle = dbRdr.ToDateTime("last_idle");
                    udtAsset.LastMove = dbRdr.ToDateTime("last_move"); //GetAssetInfoTimeStamp(PosInfoType.Move, udtAsset.AssetID);
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(mProjName, "BuildAsset(initialize last event / position) ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                }

                //// initialize activity list
                //udtAsset.Activities = new List<ActivityInfo>();
                //udtAsset.Trips = new List<TripInfo>();
                ////udtAsset.TapInfo = GetZoneTapInfo(udtAsset.Tag);
                //udtAsset.RFID_Status = 0;
                //udtAsset.InstallDate = dbRdr.ToDateTime("install_date");
                //udtAsset.InstallRemarks = dbRdr.ToString("asset_remarks");
                udtAsset.Flag = dbRdr.ToString("asset_remarks");

                //New Update
                try
                {
                    udtAsset.MakeID = dbRdr.ToInt32("make_id");
                    udtAsset.Make = dbRdr.ToString("make");
                    udtAsset.Model = dbRdr.ToString("model");
                    udtAsset.LicensePlate = dbRdr.ToString("license_plate");
                    udtAsset.TransmissionID = dbRdr.ToInt32("transmission_id");
                    udtAsset.Transmission = dbRdr.ToString("transmission");
                    udtAsset.FuelTypeID = dbRdr.ToInt32("fueltype_id");
                    udtAsset.FuelType = dbRdr.ToString("fuel_type");
                    udtAsset.ChassisNo = dbRdr.ToString("chassis_no");
                    udtAsset.ModelYear = dbRdr.ToInt32("model_year");
                    udtAsset.ImmatriculationDate = dbRdr.ToDateTime("immatriculation_date");
                    udtAsset.FirstContractDate = dbRdr.ToDateTime("firstcontract_date");
                    udtAsset.CatalogValue = dbRdr.ToDouble("catalog_value");
                    udtAsset.ResidualValue = dbRdr.ToDouble("residual_value");
                    udtAsset.SeatNo = dbRdr.ToInt32("seat_no");
                    udtAsset.DoorNo = dbRdr.ToInt32("door_no");
                    udtAsset.Color = dbRdr.ToString("color");
                    udtAsset.CO2 = dbRdr.ToDouble("co2");
                    udtAsset.Horsepower = dbRdr.ToInt32("horsepower");
                    udtAsset.HorsepowerTaxation = dbRdr.ToDouble("horsepower_taxation");
                    udtAsset.Power = dbRdr.ToInt32("power");
                    udtAsset.Features = dbRdr.ToString("features");
                    udtAsset.Weight = dbRdr.ToDouble("weight");
                    udtAsset.Width = dbRdr.ToDouble("width");
                    udtAsset.Height = dbRdr.ToDouble("height");
                    udtAsset.Length = dbRdr.ToDouble("length");
                    udtAsset.Volume = dbRdr.ToDouble("volume");
                    udtAsset.Distance = dbRdr.ToDouble("distance");

                    // get asset image
                    //string strFill = "";
                    //udtAsset.Image = assetRepo.GetImage(String.Format("make/{0}", udtAsset.MakeID), ref strFill);
                    //udtAsset.ImageFill = strFill;
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(mProjName, "BuildAsset(initialize new fields) ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                }


            }
            catch (Exception ex)
            {
                //// log error
                Logger.LogEvent(mProjName, "BuildAsset ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);

            }
            return udtAsset;
        }

        /// <summary>
        /// builds zone info from database record
        /// </summary>
        /// <param name="dbRdr"></param>
        /// <returns></returns>
        public static ZoneInfo BuildZone(MySqlDataReader dbRdr)
        {
            ZoneInfo udtZone = new ZoneInfo();
            try
            {
                // set zone parameters
                udtZone.ZoneID = dbRdr.ToInt32("zone_id");
                udtZone.Name = dbRdr.ToString("name");
                udtZone.Type = dbRdr.ToString("type");
                udtZone.TypeID = dbRdr.ToInt32("type_id");
                udtZone.Perimeter = dbRdr.ToString("perimeter");
                udtZone.CellIds = dbRdr.ToString("cell_ids");
                udtZone.Company = dbRdr.ToString("company");
                udtZone.CompanyID = dbRdr.ToInt32("company_id");
                udtZone.ResellerID = dbRdr.ToInt32("reseller_id");
                udtZone.Location = dbRdr.ToString("loc");
                udtZone.Color = dbRdr.ToString("color");

                //[Dan:30Apr14] Include date/time and id created/modified
                try
                {
                    udtZone.CreatedDate = dbRdr.ToDateTime("created_date");
                    udtZone.LastModified = dbRdr.ToDateTime("modified_date");
                    udtZone.Created_UserID = dbRdr.ToInt32("created_by");
                    udtZone.Modified_UserID = dbRdr.ToInt32("modified_by");
                    udtZone.Modified_User = dbRdr.ToString("modified_byName");
                    udtZone.Created_User = dbRdr.ToString("created_byName");

                }
                catch (Exception ex)
                {
                    Logger.LogEvent(mProjName, ex.Message, System.Diagnostics.EventLogEntryType.Error);
                }
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtZone;
        }

        public static CustomerInfo BuildCustomer(MySqlDataReader dbRdr)
        {
            CustomerInfo udtCustomer = new CustomerInfo();
            try
            {
                // set company parameters
                udtCustomer.CustomerID = dbRdr.ToInt32("cus_id");
                udtCustomer.Name = dbRdr.ToString("name");
                udtCustomer.BillingAddress = dbRdr.ToString("billing_address");
                udtCustomer.BillingUnit = dbRdr.ToString("billing_unit");
                udtCustomer.BillingBuilding = dbRdr.ToString("billing_building");
                udtCustomer.BillingPostal = dbRdr.ToString("billing_postal");
                udtCustomer.BillingPhone = dbRdr.ToString("billing_phone");
                udtCustomer.BillingMobile = dbRdr.ToString("billing_mobile");
                udtCustomer.BillingEmail = dbRdr.ToString("billing_email");
                udtCustomer.ShippingAddress = dbRdr.ToString("shipping_address");
                udtCustomer.ShippingUnit = dbRdr.ToString("shipping_unit");
                udtCustomer.ShippingBuilding = dbRdr.ToString("shipping_building");
                udtCustomer.ShippingPostal = dbRdr.ToString("shipping_postal");
                udtCustomer.ShippingPhone = dbRdr.ToString("shipping_phone");
                udtCustomer.ShippingMobile = dbRdr.ToString("shipping_mobile");
                udtCustomer.ShippingEmail = dbRdr.ToString("shipping_email");
                udtCustomer.Website = dbRdr.ToString("website");
                udtCustomer.Category = dbRdr.ToInt32("category");
                udtCustomer.CompanyID = dbRdr.ToInt32("company_id");
            }
            catch (Exception ex)
            {
                Logger.LogEvent(mProjName, "BuildCustomer ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtCustomer;
        }


        /// <summary>
        /// builds company info from database record
        /// </summary>
        /// <param name="dbRdr"></param>
        /// <returns></returns>
        public static CompanyInfo BuildCompany(MySqlDataReader dbRdr)
        {
            CompanyInfo udtCompany = new CompanyInfo();
            try
            {
                // set company parameters
                udtCompany.CompanyID = dbRdr.ToInt32("company_id");
                udtCompany.Name = dbRdr.ToString("name");
                udtCompany.Address = dbRdr.ToString("address");
                udtCompany.Unit = dbRdr.ToString("unit");
                udtCompany.Building = dbRdr.ToString("building");
                udtCompany.Postal = dbRdr.ToString("postal_code");
                udtCompany.Email = dbRdr.ToString("email");
                udtCompany.Phone = dbRdr.ToString("phone");
                udtCompany.Reports = dbRdr.ToString("reports");
                udtCompany.Categories = dbRdr.ToString("categories");
                //udtCompany.Flag = (dbRdr.ToInt32("flag") > 0 ? Enums.Status.Enabled : Enums.Status.Disabled);
                udtCompany.Flag = dbRdr.ToInt32("flag");
                udtCompany.ResellerID = dbRdr.ToInt32("reseller_id");
                udtCompany.Reseller = dbRdr.ToString("reseller");
                udtCompany.UserLimit = dbRdr.ToInt32("user_limit");
                udtCompany.ZoneLimit = dbRdr.ToInt32("zone_limit");
                udtCompany.AssetLimit = dbRdr.ToInt32("asset_limit");
                udtCompany.CreditLimit = dbRdr.ToInt32("credit_limit");
                udtCompany.isSHN = dbRdr.ToInt32("isSHN");
                udtCompany.isDirections = dbRdr.ToInt32("isDirections");
                udtCompany.isTSP = dbRdr.ToInt32("isTSP");
                udtCompany.isVRP = dbRdr.ToInt32("isVRP");
                udtCompany.isLocation = dbRdr.ToInt32("isLocation");
                udtCompany.isTraffic = dbRdr.ToInt32("isTraffic");
                udtCompany.isCarpark = dbRdr.ToInt32("isCarpark");
                udtCompany.isErp = dbRdr.ToInt32("isErp");
                udtCompany.isWeather = dbRdr.ToInt32("isWeather");
                udtCompany.isStreetview = dbRdr.ToInt32("isStreetview");
                udtCompany.isHeatmap = dbRdr.ToInt32("isHeatmap");
                udtCompany.isGPS = dbRdr.ToInt32("isGPS");
                udtCompany.SessionTimeout = dbRdr.ToInt32("session_timeout");
                udtCompany.ReportDuration = dbRdr.ToInt32("report_duration");
                udtCompany.ReportRange = dbRdr.ToInt32("report_range");
                udtCompany.NotificationInterval = dbRdr.ToInt32("notification_interval");
                udtCompany.NotifyCustomer = dbRdr.ToInt32("notify_customer");
                udtCompany.NotifyFinalInvoice = dbRdr.ToInt32("notify_final_invoice");
                udtCompany.OMUsername = dbRdr.ToString("om_username");
                udtCompany.OMPassword = dbRdr.ToString("om_password");
                udtCompany.Token = dbRdr.ToString("token");
                udtCompany.SMTPUsername = dbRdr.ToString("smtp_username");
                udtCompany.SMTPPassword = dbRdr.ToString("smtp_password");
                udtCompany.SMTPPort = dbRdr.ToInt32("smtp_port");
                udtCompany.SMTPHost = dbRdr.ToString("smtp_host");
                udtCompany.isSecured = dbRdr.ToInt32("isSecured");
                udtCompany.SubscriptionID = dbRdr.ToInt32("subscription_id");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildCompany ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtCompany;
        }
        
        /// <summary>
        /// builds company info from database record
        /// </summary>
        /// <param name="dbRdr"></param>
        /// <returns></returns>
        public static ResellerInfo BuildReseller(MySqlDataReader dbRdr)
        {
            ResellerInfo udtReseller = new ResellerInfo();
            try
            {
                // set company parameters
                udtReseller.ResellerID = dbRdr.ToInt32("reseller_id");
                udtReseller.Name = dbRdr.ToString("name");
                udtReseller.Flag = (dbRdr.ToInt32("flag") > 0 ? Enums.Status.Enabled : Enums.Status.Disabled);
                udtReseller.Address = dbRdr.ToString("address");
                udtReseller.Email = dbRdr.ToString("email");
                udtReseller.Phone = dbRdr.ToString("phone");
                                    
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildReseller ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtReseller;
        }

        public static StockMovementInfo BuildStockMovement(MySqlDataReader dbRdr)
        {
            StockMovementInfo udtSM = new StockMovementInfo();
            try
            {
                udtSM.StockMovementID = dbRdr.ToInt64("stock_movement_id");
                udtSM.UploadNo = dbRdr.ToString("upload_no");
                udtSM.MerchantSKU = dbRdr.ToString("merchant_sku");
                udtSM.Title = dbRdr.ToString("title");
                udtSM.StoreNickname = dbRdr.ToString("store_nickname");
                udtSM.StoreName = dbRdr.ToString("store_name");
                udtSM.Warehouse = dbRdr.ToString("warehouse");
                udtSM.ShelfName = dbRdr.ToString("shelf_name");
                udtSM.Timestamp = dbRdr.ToDateTime("timestamp");
                udtSM.RxTime = dbRdr.ToDateTime("rx_time");
                udtSM.Original = dbRdr.ToInt32("original");
                udtSM.Movement = dbRdr.ToInt32("movement");
                udtSM.Latest = dbRdr.ToInt32("latest");
                udtSM.Type = dbRdr.ToString("type");
                udtSM.CombinationSKU = dbRdr.ToString("combination_sku");
                udtSM.MovementNo = dbRdr.ToString("movement_no");
                udtSM.TransfersNo = dbRdr.ToString("transfer_no");
                udtSM.PurchaseNo = dbRdr.ToString("purchase_no");
                udtSM.PackageNo = dbRdr.ToString("package_no");
                udtSM.OriginalCost = dbRdr.ToDouble("original_cost");
                udtSM.StockOutPrice = dbRdr.ToDouble("stockout_price");
                udtSM.StockInPrice = dbRdr.ToDouble("stockin_price");
                udtSM.NewCost = dbRdr.ToDouble("new_cost");
                udtSM.StockOutNo = dbRdr.ToInt32("stockout_no");
                udtSM.StockInNo = dbRdr.ToInt32("stockin_no");
                udtSM.OrderNo = dbRdr.ToString("order_no");
                udtSM.Account = dbRdr.ToString("account");
                udtSM.Note = dbRdr.ToString("note");    
                udtSM.CompanyID = dbRdr.ToInt32("company_id");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildStockMovement ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtSM;
        }
        public static BigSellerOrderInfo BuildBigSellerOrder(MySqlDataReader dbRdr)
        {
            BigSellerOrderInfo udtOrder = new BigSellerOrderInfo();
            try
            {
                udtOrder.OrderID = dbRdr.ToInt64("order_id");
                udtOrder.UploadNo = dbRdr.ToString("upload_no");
                udtOrder.OrderNo = dbRdr.ToString("order_no");
                udtOrder.PackageNo = dbRdr.ToString("package_no");
                udtOrder.MainPackageNo = dbRdr.ToString("main_package_no");
                udtOrder.InvoiceNo = dbRdr.ToString("invoice_no");
                udtOrder.Marketplace = dbRdr.ToString("marketplace");
                udtOrder.BigSellerStoreNickname = dbRdr.ToString("store_nickname");
                udtOrder.StorenameMarketplace = dbRdr.ToString("storename_marketplace");
                udtOrder.SellerName = dbRdr.ToString("seller_name");
                udtOrder.OrderStatus = dbRdr.ToString("order_status");
                udtOrder.OrderType = dbRdr.ToString("order_type");
                udtOrder.MarketplaceStatus = dbRdr.ToString("marketplace_status");
                udtOrder.OrderTime = dbRdr.ToDateTime("order_time");
                udtOrder.OrderPaidTime = dbRdr.ToDateTime("order_paid_time");
                udtOrder.ExpireTime = dbRdr.ToDateTime("expire_time");
                udtOrder.OrderShippedTime = dbRdr.ToDateTime("order_shipped_time");
                //===
                udtOrder.PackedTime = dbRdr.ToDateTime("packed_time");
                udtOrder.PrintedTime = dbRdr.ToDateTime("printed_time");
                udtOrder.CancelTime = dbRdr.ToDateTime("cancel_time");
                udtOrder.BuyerMessage = dbRdr.ToString("buyer_message");
                udtOrder.UserName = dbRdr.ToString("username");
                udtOrder.ReceiverName = dbRdr.ToString("receiver_name");
                udtOrder.PhoneNumber = dbRdr.ToString("phone_number");
                udtOrder.DeliveryAddress = dbRdr.ToString("delivery_address");
                udtOrder.District = dbRdr.ToInt32("district");
                udtOrder.Town = dbRdr.ToString("town");
                udtOrder.City = dbRdr.ToString("city");
                //===
                udtOrder.Province = dbRdr.ToString("province");
                udtOrder.Country = dbRdr.ToString("country");
                udtOrder.PostCode = dbRdr.ToInt32("post_code");
                udtOrder.ProductName = dbRdr.ToString("product_name");
                udtOrder.SKU = dbRdr.ToString("sku");
                udtOrder.VariationName = dbRdr.ToString("variation_name");
                udtOrder.ImageLink = dbRdr.ToString("image_link");
                udtOrder.Price = dbRdr.ToDouble("price");
                udtOrder.Quantity = dbRdr.ToInt32("quantity");
                udtOrder.ProductSubtotal = dbRdr.ToDouble("product_subtotal");
                //===
                udtOrder.MerchantSKU = dbRdr.ToString("merchant_sku");
                udtOrder.Title = dbRdr.ToString("title");
                udtOrder.CommodityCost = dbRdr.ToDouble("commodity_cost");
                udtOrder.ReferencePrice = dbRdr.ToDouble("reference_price");
                udtOrder.BuyerDesignLogistics = dbRdr.ToString("buyer_design_logistics");
                udtOrder.ShippingOption = dbRdr.ToString("shipping_option");
                udtOrder.CargoCarryMethod = dbRdr.ToString("cargo_carry_method");
                udtOrder.TrackingNumber = dbRdr.ToString("tracking_number");
                udtOrder.PackageWeight = dbRdr.ToDouble("package_weight");
                udtOrder.PaymentMethod = dbRdr.ToString("payment_method");
                //===
                udtOrder.OrderTotal = dbRdr.ToDouble("order_total");
                udtOrder.Voucher = dbRdr.ToDouble("voucher");
                udtOrder.StoreVoucher = dbRdr.ToDouble("store_voucher");
                udtOrder.ManagementFee = dbRdr.ToDouble("management_fee");
                udtOrder.TransactionFee = dbRdr.ToDouble("transaction_fee");
                udtOrder.Currency = dbRdr.ToString("currency");
                udtOrder.ShippingFee = dbRdr.ToDouble("shipping_fee");
                udtOrder.SellerDiscount = dbRdr.ToDouble("seller_discount");
                udtOrder.MarketplaceDiscount = dbRdr.ToDouble("marketplace_discount");
                udtOrder.SellerShippingDiscount = dbRdr.ToDouble("seller_shipping_discount");
                //===
                udtOrder.MarketplaceShippingDiscount = dbRdr.ToDouble("marketplace_shipping_discount");
                udtOrder.SellerNote = dbRdr.ToString("seller_note");
                udtOrder.NoteForCS = dbRdr.ToString("note_for_cs");
                udtOrder.NoteForPick = dbRdr.ToString("note_for_pick");
                udtOrder.OrderMark = dbRdr.ToString("order_mark");
                udtOrder.ShippingWarehouse = dbRdr.ToString("shipping_warehouse");
                udtOrder.Shelf = dbRdr.ToString("shelf");
                udtOrder.StockOut = dbRdr.ToString("stock_out");
                udtOrder.StockIn = dbRdr.ToString("stock_in");
                udtOrder.ShippingFeePaidBySeller = dbRdr.ToString("shipping_fee_paid_by_seller");
                udtOrder.CompanyID = dbRdr.ToInt32("company_id");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildBigSellerOrder ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtOrder;
        }
        public static VrpSettingsInfo BuildVrpSettings(MySqlDataReader dbRdr)
        {
            VrpSettingsInfo udtVrp = new VrpSettingsInfo();
            try
            {
                udtVrp.VrpSettingsID = dbRdr.ToInt64("vrp_settings_id");
                udtVrp.RouteNo = dbRdr.ToString("route_no");
                udtVrp.AssetID = dbRdr.ToInt64("asset_id");
                udtVrp.Asset = dbRdr.ToString("asset");
                udtVrp.DriverID = dbRdr.ToInt64("driver_id");
                udtVrp.Driver = dbRdr.ToString("driver");
                udtVrp.Timestamp = dbRdr.ToDateTime("timestamp");
                udtVrp.RxTime = dbRdr.ToDateTime("rx_time");
                udtVrp.StartLatitude = dbRdr.ToDouble("start_latitude");
                udtVrp.StartLongitude = dbRdr.ToDouble("start_longitude");
                udtVrp.StartAddress = dbRdr.ToString("start_address");
                udtVrp.StartUnit = dbRdr.ToString("start_unit");
                udtVrp.StartBuilding = dbRdr.ToString("start_building");
                udtVrp.StartPostal = dbRdr.ToString("start_postal");
                udtVrp.EndLatitude = dbRdr.ToDouble("end_latitude");
                udtVrp.EndLongitude = dbRdr.ToDouble("end_longitude");
                udtVrp.EndAddress = dbRdr.ToString("end_address");
                udtVrp.EndUnit = dbRdr.ToString("end_unit");
                udtVrp.EndBuilding = dbRdr.ToString("end_building");
                udtVrp.EndPostal = dbRdr.ToString("end_postal");
                udtVrp.WeightCapacity = dbRdr.ToDouble("weight_capacity");
                udtVrp.VolumeCapacity = dbRdr.ToDouble("volume_capacity");
                udtVrp.DistanceCapacity = dbRdr.ToDouble("distance_capacity");
                udtVrp.LoadDuration = dbRdr.ToInt32("load_duration");
                udtVrp.UnLoadDuration = dbRdr.ToInt32("unload_duration");
                udtVrp.TimeWindowStart = dbRdr.ToDateTime("time_window_start");
                udtVrp.TimeWindowEnd = dbRdr.ToDateTime("time_window_end");
                udtVrp.BreaktimeStart = dbRdr.ToDateTime("break_time_start");
                udtVrp.BreaktimeEnd = dbRdr.ToDateTime("break_time_end");
                udtVrp.Features = dbRdr.ToString("features");
                udtVrp.isOvertime = dbRdr.ToInt32("isOvertime");
                udtVrp.CompanyID = dbRdr.ToInt32("company_id");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildVrpSettings ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtVrp;
        }

        public static VrpSettingsAreaInfo BuildVrpSettingsArea(MySqlDataReader dbRdr)
        {
            VrpSettingsAreaInfo udtVrp = new VrpSettingsAreaInfo();
            try
            {
                udtVrp.VrpSettingsAreaID = dbRdr.ToInt64("vsa_id");
                udtVrp.VrpSettingsID = dbRdr.ToInt64("vrp_settings_id");
                udtVrp.RegionID = dbRdr.ToInt64("area_covered_region_id");
                udtVrp.Timestamp = dbRdr.ToDateTime("timestamp");
                udtVrp.RxTime = dbRdr.ToDateTime("rx_time");
                udtVrp.CompanyID = dbRdr.ToInt32("company_id");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildVrpSettingsArea ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtVrp;
        }
        public static VrpRouteInfo BuildVrpRoute(MySqlDataReader dbRdr)
        {
            VrpRouteInfo udtVrp = new VrpRouteInfo();
            try
            {
                udtVrp.VrpRouteID = dbRdr.ToInt64("vrp_routes_id");
                udtVrp.RouteNo = dbRdr.ToString("route_no");
                udtVrp.AssetID = dbRdr.ToInt64("asset_id");
                udtVrp.Asset = dbRdr.ToString("name");
                udtVrp.DriverID = dbRdr.ToInt64("driver_id");
                udtVrp.Driver = dbRdr.ToString("driver_name");
                udtVrp.OrderType = dbRdr.ToString("order_type");
                udtVrp.PickupID = dbRdr.ToString("pickup_ids");
                udtVrp.DeliveryID = dbRdr.ToString("delivery_ids");
                udtVrp.PickupFromID = dbRdr.ToString("pickup_from_ids");
                udtVrp.RouteDistance = dbRdr.ToDouble("route_distance");
                udtVrp.RouteTime = dbRdr.ToInt32("route_time");
                udtVrp.ArrivalTime = dbRdr.ToDateTime("arrival_time");
                udtVrp.DepartureTime = dbRdr.ToDateTime("departure_time");
                udtVrp.Sequence = dbRdr.ToInt32("sequence");
                udtVrp.Status = dbRdr.ToString("status");
                udtVrp.Features = dbRdr.ToString("feature_id");
                udtVrp.Accessories = dbRdr.ToString("accessories");
                udtVrp.Flag = dbRdr.ToInt32("flag");
                udtVrp.Timestamp = dbRdr.ToDateTime("timestamp");
                udtVrp.RxTime = dbRdr.ToDateTime("rx_time");
                udtVrp.TotalWeight = dbRdr.ToInt32("total_weight");
                udtVrp.TotalVolume = dbRdr.ToInt32("total_volume");
                udtVrp.ServiceDuration = dbRdr.ToInt32("service_duration");
                udtVrp.LoadDuration = dbRdr.ToInt32("load_duration");
                udtVrp.UnLoadDuration = dbRdr.ToInt32("unload_duration");
                udtVrp.WaitingDuration = dbRdr.ToInt32("waiting_duration");
                udtVrp.PriorityID = dbRdr.ToInt32("priority_id");
                udtVrp.Lat = dbRdr.ToDouble("latitude");
                udtVrp.Long = dbRdr.ToDouble("longitude");
                udtVrp.TimeWindowStart = dbRdr.ToDateTime("time_window_start");
                udtVrp.TimeWindowEnd = dbRdr.ToDateTime("time_window_end");
                udtVrp.Address = dbRdr.ToString("address");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildVrpRoute ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtVrp;
        }
        public static VrpPickupDeliveryInfo BuildVrpPickupDelivery(MySqlDataReader dbRdr)
        {
            VrpPickupDeliveryInfo udtVrp = new VrpPickupDeliveryInfo();
            try
            {
                udtVrp.RouteNo = dbRdr.ToString("route_no");
                udtVrp.CompanyID = dbRdr.ToInt64("company_id");
                udtVrp.PickupDeliveryID = dbRdr.ToInt64("pickup_delivery_id");
                udtVrp.PickupID = dbRdr.ToInt64("pickup_id");
                udtVrp.DeliveryID = dbRdr.ToInt64("delivery_id");
                udtVrp.PickupFromID = dbRdr.ToString("pickup_from_id");
                udtVrp.OrderType = dbRdr.ToString("order_type");
                udtVrp.OrderNo = dbRdr.ToString("order_no");
                udtVrp.PriorityID = dbRdr.ToInt32("priority_id");
                udtVrp.DriverID = dbRdr.ToInt64("driver_id");
                udtVrp.Driver = dbRdr.ToString("driver_name");
                udtVrp.Features = dbRdr.ToString("feature_ids");
                udtVrp.Accessories = dbRdr.ToString("accessories");
                udtVrp.Lat = dbRdr.ToDouble("latitude");
                udtVrp.Long = dbRdr.ToDouble("longitude");
                udtVrp.Address = dbRdr.ToString("address");
                udtVrp.Unit = dbRdr.ToString("unit");
                udtVrp.Postal = dbRdr.ToString("postal_code");
                udtVrp.ServiceDuration = dbRdr.ToInt32("service_duration");
                udtVrp.TotalWeight = dbRdr.ToInt32("total_weight");
                udtVrp.TotalVolume = dbRdr.ToInt32("total_volume");
                udtVrp.LoadDuration = dbRdr.ToInt32("load_duration");
                udtVrp.UnLoadDuration = dbRdr.ToInt32("unload_duration");
                udtVrp.WaitingDuration = dbRdr.ToInt32("waiting_duration");
                udtVrp.TimeWindowStart = dbRdr.ToDateTime("time_window_start");
                udtVrp.TimeWindowEnd = dbRdr.ToDateTime("time_window_end");
                udtVrp.isAssign = dbRdr.ToInt32("isAssign");
                udtVrp.Flag = dbRdr.ToInt32("flag");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildVrpPickupDelivery ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtVrp;
        }
        public static VrpPickupInfo BuildVrpPickup(MySqlDataReader dbRdr)
        {
            VrpPickupInfo udtVrp = new VrpPickupInfo();
            try
            {
                udtVrp.PickupID = dbRdr.ToInt64("pickup_id");
                udtVrp.RouteNo = dbRdr.ToString("route_no");
                udtVrp.PriorityID = dbRdr.ToInt32("priority_id");
                udtVrp.DriverID = dbRdr.ToInt64("driver_id");
                udtVrp.Driver = dbRdr.ToString("driver");
                udtVrp.Timestamp = dbRdr.ToDateTime("timestamp");
                udtVrp.RxTime = dbRdr.ToDateTime("rx_time");
                udtVrp.CustomerID = dbRdr.ToInt64("customer_id");
                udtVrp.Customer = dbRdr.ToString("customer");
                udtVrp.OrderNo = dbRdr.ToString("order_no");
                udtVrp.WaitingDuration = dbRdr.ToInt32("waiting_duration");
                udtVrp.ServiceDuration = dbRdr.ToInt32("service_duration");
                udtVrp.LoadDuration = dbRdr.ToInt32("load_duration");
                udtVrp.TimeWindowStart = dbRdr.ToDateTime("time_window_start");
                udtVrp.TimeWindowEnd = dbRdr.ToDateTime("time_window_end");
                udtVrp.Remarks = dbRdr.ToString("remarks");
                udtVrp.Name = dbRdr.ToString("name");
                udtVrp.Lat = dbRdr.ToDouble("latitude");
                udtVrp.Long = dbRdr.ToDouble("longitude");
                udtVrp.Address = dbRdr.ToString("address");
                udtVrp.Unit = dbRdr.ToString("unit");
                udtVrp.Building = dbRdr.ToString("building");
                udtVrp.Postal = dbRdr.ToString("postal_code");
                udtVrp.Phone = dbRdr.ToString("phone");
                udtVrp.Mobile = dbRdr.ToString("mobile");
                udtVrp.Email = dbRdr.ToString("email");
                udtVrp.Amount = dbRdr.ToDouble("amount");
                udtVrp.Accessories = dbRdr.ToString("accessories");
                udtVrp.isAssign = dbRdr.ToInt32("isAssign");
                udtVrp.Flag = dbRdr.ToInt32("flag");
                udtVrp.DriverRemarks = dbRdr.ToString("driver_remarks");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildVrpPickup ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtVrp;
        }
        public static VrpPickupItemInfo BuildVrpPickupItem(MySqlDataReader dbRdr)
        {
            VrpPickupItemInfo udtVrp = new VrpPickupItemInfo();
            try
            {
                udtVrp.PickupItemID = dbRdr.ToInt64("pickup_item_id");
                udtVrp.PickupID = dbRdr.ToInt64("pickup_id");
                udtVrp.RouteNo = dbRdr.ToString("route_no");
                udtVrp.Timestamp = dbRdr.ToDateTime("timestamp");
                udtVrp.RxTime = dbRdr.ToDateTime("rx_time");
                udtVrp.ReferenceNo = dbRdr.ToString("reference_no");
                udtVrp.ItemName = dbRdr.ToString("item_name");
                udtVrp.Description = dbRdr.ToString("description");
                udtVrp.Price = dbRdr.ToDouble("price");
                udtVrp.Weight = dbRdr.ToDouble("weight");
                udtVrp.Width = dbRdr.ToDouble("width");
                udtVrp.Height = dbRdr.ToDouble("height");
                udtVrp.Length = dbRdr.ToDouble("length");
                udtVrp.Volume = dbRdr.ToDouble("volume");
                udtVrp.Quantity = dbRdr.ToInt32("quantity");
                udtVrp.Remarks = dbRdr.ToString("remarks");
                udtVrp.FeatureID = dbRdr.ToString("feature_id");
                udtVrp.ItemNo = dbRdr.ToInt32("item_no");
                udtVrp.SubInventoryItemID = dbRdr.ToInt64("sub_inventory_item_id");
                udtVrp.Flag = dbRdr.ToInt32("flag");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildVrpPickupItem ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtVrp;
        }
        public static VrpDeliveryInfo BuildVrpDelivery(MySqlDataReader dbRdr)
        {
            VrpDeliveryInfo udtVrp = new VrpDeliveryInfo();
            try
            {
                udtVrp.DeliveryID = dbRdr.ToInt64("delivery_id");
                udtVrp.RouteNo = dbRdr.ToString("route_no");
                udtVrp.PriorityID = dbRdr.ToInt32("priority_id");
                udtVrp.DriverID = dbRdr.ToInt64("driver_id");
                udtVrp.Driver = dbRdr.ToString("driver");
                udtVrp.Timestamp = dbRdr.ToDateTime("timestamp");
                udtVrp.RxTime = dbRdr.ToDateTime("rx_time");
                udtVrp.CustomerID = dbRdr.ToInt64("customer_id");
                udtVrp.Customer = dbRdr.ToString("customer");
                udtVrp.OrderNo = dbRdr.ToString("order_no");
                udtVrp.WaitingDuration = dbRdr.ToInt32("waiting_duration");
                udtVrp.ServiceDuration = dbRdr.ToInt32("service_duration");
                udtVrp.UnLoadDuration = dbRdr.ToInt32("unload_duration");
                udtVrp.TimeWindowStart = dbRdr.ToDateTime("time_window_start");
                udtVrp.TimeWindowEnd = dbRdr.ToDateTime("time_window_end");
                udtVrp.Remarks = dbRdr.ToString("remarks");
                udtVrp.Name = dbRdr.ToString("name");
                udtVrp.Lat = dbRdr.ToDouble("latitude");
                udtVrp.Long = dbRdr.ToDouble("longitude");
                udtVrp.BillingName = dbRdr.ToString("billing_name");
                udtVrp.BillingAddress = dbRdr.ToString("billing_address");
                udtVrp.BillingUnit = dbRdr.ToString("billing_unit");
                udtVrp.BillingBuilding = dbRdr.ToString("billing_building");
                udtVrp.BillingPostal = dbRdr.ToString("billing_postal_code");
                udtVrp.BillingPhone = dbRdr.ToString("billing_phone");
                udtVrp.BillingMobile = dbRdr.ToString("billing_mobile");
                udtVrp.BillingEmail = dbRdr.ToString("billing_email");
                udtVrp.ShippingName = dbRdr.ToString("shipping_name");
                udtVrp.ShippingAddress = dbRdr.ToString("shipping_address");
                udtVrp.ShippingUnit = dbRdr.ToString("shipping_unit");
                udtVrp.ShippingBuilding = dbRdr.ToString("shipping_building");
                udtVrp.ShippingPostal = dbRdr.ToString("shipping_postal_code");
                udtVrp.ShippingPhone = dbRdr.ToString("shipping_phone");
                udtVrp.ShippingMobile = dbRdr.ToString("shipping_mobile");
                udtVrp.ShippingEmail = dbRdr.ToString("shipping_email");
                udtVrp.Amount = dbRdr.ToDouble("amount");
                udtVrp.Accessories = dbRdr.ToString("accessories");
                udtVrp.PickupID = dbRdr.ToString("pickup_id");
                udtVrp.isAssign = dbRdr.ToInt32("isAssign");
                udtVrp.Flag = dbRdr.ToInt32("flag");
                udtVrp.DriverRemarks = dbRdr.ToString("driver_remarks");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildVrpDelivery ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtVrp;
        }
        public static VrpDeliveryItemInfo BuildVrpDeliveryItem(MySqlDataReader dbRdr)
        {
            VrpDeliveryItemInfo udtVrp = new VrpDeliveryItemInfo();
            try
            {
                udtVrp.DeliveryItemID = dbRdr.ToInt64("delivery_item_id");
                udtVrp.DeliveryID = dbRdr.ToInt64("delivery_id");
                udtVrp.RouteNo = dbRdr.ToString("route_no");
                udtVrp.Timestamp = dbRdr.ToDateTime("timestamp");
                udtVrp.RxTime = dbRdr.ToDateTime("rx_time");
                udtVrp.ReferenceNo = dbRdr.ToString("reference_no");
                udtVrp.ItemName = dbRdr.ToString("item_name");
                udtVrp.Description = dbRdr.ToString("description");
                udtVrp.Price = dbRdr.ToDouble("price");
                udtVrp.TotalPrice = dbRdr.ToDouble("price");
                udtVrp.Weight = dbRdr.ToDouble("weight");
                udtVrp.Width = dbRdr.ToDouble("width");
                udtVrp.Height = dbRdr.ToDouble("height");
                udtVrp.Length = dbRdr.ToDouble("length");
                udtVrp.Volume = dbRdr.ToDouble("volume");
                udtVrp.Quantity = dbRdr.ToInt32("quantity");
                udtVrp.Remarks = dbRdr.ToString("remarks");
                udtVrp.FeatureID = dbRdr.ToString("feature_id");
                udtVrp.ItemNo = dbRdr.ToInt32("item_no");
                udtVrp.MainInventoryItemID = dbRdr.ToInt64("main_inventory_item_id");
                udtVrp.SubInventoryItemID = dbRdr.ToInt64("sub_inventory_item_id");
                udtVrp.Flag = dbRdr.ToInt32("flag");
                udtVrp.PickupID = dbRdr.ToInt64("pickup_id");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildVrpDeliveryItem ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtVrp;
        }

        public static SupplierInfo BuildSupplier(MySqlDataReader dbRdr)
        {
            SupplierInfo udtSupplier = new SupplierInfo();
            try
            {
                // set company parameters
                udtSupplier.SupplierID = dbRdr.ToInt64("supplier_id");
                udtSupplier.Name = dbRdr.ToString("name");
                udtSupplier.Address = dbRdr.ToString("address");
                udtSupplier.Email = dbRdr.ToString("email");
                udtSupplier.Phone = dbRdr.ToString("phone");
                udtSupplier.CompanyID = dbRdr.ToInt32("company_id");
                udtSupplier.Company = dbRdr.ToString("company");

            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildSupplier ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtSupplier;
        }
        public static MainInventoryItemInfo BuildMainInventoryItem(MySqlDataReader dbRdr)
        {
            MainInventoryItemInfo udtVrp = new MainInventoryItemInfo();
            try
            {
                udtVrp.MainInventoryItemID = dbRdr.ToInt64("main_inventory_item_id");
                udtVrp.CompanyID = dbRdr.ToInt64("company_id");
                udtVrp.SupplierID = dbRdr.ToInt64("supplier_id");
                udtVrp.BranchID = dbRdr.ToInt64("branch_id");
                udtVrp.Timestamp = dbRdr.ToDateTime("timestamp");
                udtVrp.RxTime = dbRdr.ToDateTime("rx_time");
                udtVrp.ReferenceNo = dbRdr.ToString("reference_no");
                udtVrp.ItemName = dbRdr.ToString("item_name");
                udtVrp.Description = dbRdr.ToString("description");
                udtVrp.Price = dbRdr.ToDouble("price");
                udtVrp.Weight = dbRdr.ToDouble("weight");
                udtVrp.Width = dbRdr.ToDouble("width");
                udtVrp.Height = dbRdr.ToDouble("height");
                udtVrp.Length = dbRdr.ToDouble("length");
                udtVrp.Volume = dbRdr.ToDouble("volume");
                udtVrp.Unit = dbRdr.ToString("unit");
                udtVrp.Quantity = dbRdr.ToInt32("quantity");
                udtVrp.Remarks = dbRdr.ToString("remarks");
                udtVrp.FeatureID = dbRdr.ToString("feature_id");
                udtVrp.ItemCategory = dbRdr.ToInt32("item_category");
                udtVrp.Flag = dbRdr.ToInt32("flag");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "MainInventoryItemInfo ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtVrp;
        }
        public static MainInventoryHistoryInfo BuildInventoryHistory(MySqlDataReader dbRdr)
        {
            MainInventoryHistoryInfo udtInventory = new MainInventoryHistoryInfo();
            try
            {
                // set jobs parameters
                udtInventory.MainInventoryHistoryID = dbRdr.ToInt64("main_inventory_history_id");
                udtInventory.MainInventoryItemID = dbRdr.ToInt64("main_inventory_item_id");
                udtInventory.Timestamp = dbRdr.ToDateTime("timestamp");
                udtInventory.RxTime = dbRdr.ToDateTime("rx_time");
                udtInventory.StockType = dbRdr.ToInt32("stock_type");
                udtInventory.Name = dbRdr.ToString("name");
                udtInventory.Reference = dbRdr.ToString("reference");
                udtInventory.PreviousQuantity = dbRdr.ToInt32("previous_quantity");
                udtInventory.Quantity = dbRdr.ToInt32("quantity");
                udtInventory.TotalQuantity = dbRdr.ToInt32("total_quantity");
                udtInventory.PickupID = dbRdr.ToInt64("pickup_id");
                udtInventory.DeliveryID = dbRdr.ToInt64("delivery_id");
                udtInventory.CompanyID = dbRdr.ToInt32("company_id");
                udtInventory.UserID = dbRdr.ToInt32("user_id");
                udtInventory.UserName = dbRdr.ToString("user_name");
                udtInventory.Platform = dbRdr.ToInt32("platform");
                udtInventory.AssetID = dbRdr.ToInt64("asset_id");
                udtInventory.Asset = dbRdr.ToString("asset");
                udtInventory.DriverID = dbRdr.ToInt64("driver_id");
                udtInventory.DriverName = dbRdr.ToString("driver_name");
                udtInventory.Company = dbRdr.ToString("company");
                udtInventory.ItemCategory = dbRdr.ToInt32("item_category");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildMainInventoryHistory ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtInventory;
        }
        public static MainInventoryBranchInfo BuildInventoryBranch(MySqlDataReader dbRdr)
        {
            MainInventoryBranchInfo udtInventory = new MainInventoryBranchInfo();
            try
            {
                udtInventory.BranchID = dbRdr.ToInt64("main_inventory_branch_id");
                udtInventory.Name = dbRdr.ToString("name");
                udtInventory.Address = dbRdr.ToString("address");
                udtInventory.Email = dbRdr.ToString("email");
                udtInventory.Phone = dbRdr.ToString("phone");
                udtInventory.CompanyID = dbRdr.ToInt32("company_id");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildInventoryBranch ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtInventory;
        }
        public static MainInventoryPurchaseInfo BuildInventoryPurchase(MySqlDataReader dbRdr)
        {
            MainInventoryPurchaseInfo udtInventory = new MainInventoryPurchaseInfo();
            try
            {
                // set jobs parameters
                udtInventory.MainInventoryPurchaseID = dbRdr.ToInt64("main_inventory_purchase_id");
                udtInventory.MainInventoryItemID = dbRdr.ToInt64("main_inventory_item_id");
                udtInventory.SupplierID = dbRdr.ToInt64("supplier_id");
                udtInventory.Timestamp = dbRdr.ToDateTime("timestamp");
                udtInventory.RxTime = dbRdr.ToDateTime("rx_time");
                udtInventory.CompanyID = dbRdr.ToInt32("company_id");
                udtInventory.Quantity = dbRdr.ToInt32("quantity");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildInventoryPurchase ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtInventory;
        }
        public static SubSupplierInfo BuildSubSupplier(MySqlDataReader dbRdr)
        {
            SubSupplierInfo udtSupplier = new SubSupplierInfo();
            try
            {
                // set company parameters
                udtSupplier.SupplierID = dbRdr.ToInt64("supplier_id");
                udtSupplier.Name = dbRdr.ToString("name");
                udtSupplier.Address = dbRdr.ToString("address");
                udtSupplier.Email = dbRdr.ToString("email");
                udtSupplier.Phone = dbRdr.ToString("phone");
                udtSupplier.CompanyID = dbRdr.ToInt32("company_id");
                udtSupplier.Company = dbRdr.ToString("company");

            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildSubSupplier ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtSupplier;
        }
        public static SubInventoryBranchInfo BuildInventorySubBranch(MySqlDataReader dbRdr)
        {
            SubInventoryBranchInfo udtInventory = new SubInventoryBranchInfo();
            try
            {
                udtInventory.BranchID = dbRdr.ToInt64("sub_inventory_branch_id");
                udtInventory.Name = dbRdr.ToString("name");
                udtInventory.Address = dbRdr.ToString("address");
                udtInventory.Email = dbRdr.ToString("email");
                udtInventory.Phone = dbRdr.ToString("phone");
                udtInventory.CompanyID = dbRdr.ToInt32("company_id");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildInventorySubBranch ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtInventory;
        }
        public static SubInventoryPurchaseInfo BuildInventorySubPurchase(MySqlDataReader dbRdr)
        {
            SubInventoryPurchaseInfo udtInventory = new SubInventoryPurchaseInfo();
            try
            {
                // set jobs parameters
                udtInventory.SubInventoryPurchaseID = dbRdr.ToInt64("sub_inventory_purchase_id");
                udtInventory.SubInventoryItemID = dbRdr.ToInt64("sub_inventory_item_id");
                udtInventory.SupplierID = dbRdr.ToInt64("supplier_id");
                udtInventory.Timestamp = dbRdr.ToDateTime("timestamp");
                udtInventory.RxTime = dbRdr.ToDateTime("rx_time");
                udtInventory.CompanyID = dbRdr.ToInt32("company_id");
                udtInventory.Quantity = dbRdr.ToInt32("quantity");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildInventorySubPurchase ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtInventory;
        }
        public static SubInventoryItemInfo BuildSubInventoryItem(MySqlDataReader dbRdr)
        {
            SubInventoryItemInfo udtVrp = new SubInventoryItemInfo();
            try
            {
                udtVrp.SubInventoryItemID = dbRdr.ToInt64("sub_inventory_item_id");
                udtVrp.CompanyID = dbRdr.ToInt64("company_id");
                udtVrp.SupplierID = dbRdr.ToInt64("supplier_id");
                udtVrp.BranchID = dbRdr.ToInt64("branch_id");
                udtVrp.Timestamp = dbRdr.ToDateTime("timestamp");
                udtVrp.RxTime = dbRdr.ToDateTime("rx_time");
                udtVrp.ReferenceNo = dbRdr.ToString("reference_no");
                udtVrp.ItemName = dbRdr.ToString("item_name");
                udtVrp.Description = dbRdr.ToString("description");
                udtVrp.Price = dbRdr.ToDouble("price");
                udtVrp.Weight = dbRdr.ToDouble("weight");
                udtVrp.Width = dbRdr.ToDouble("width");
                udtVrp.Height = dbRdr.ToDouble("height");
                udtVrp.Length = dbRdr.ToDouble("length");
                udtVrp.Volume = dbRdr.ToDouble("volume");
                udtVrp.Unit = dbRdr.ToString("unit");
                udtVrp.Quantity = dbRdr.ToInt32("quantity");
                udtVrp.Remarks = dbRdr.ToString("remarks");
                udtVrp.FeatureID = dbRdr.ToString("feature_id");
                udtVrp.ItemCategory = dbRdr.ToInt32("item_category");
                udtVrp.Flag = dbRdr.ToInt32("flag");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "SubInventoryItemInfo ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtVrp;
        }
        public static SubInventoryHistoryInfo BuildSubInventoryHistory(MySqlDataReader dbRdr)
        {
            SubInventoryHistoryInfo udtInventory = new SubInventoryHistoryInfo();
            try
            {
                // set jobs parameters
                udtInventory.SubInventoryHistoryID = dbRdr.ToInt64("sub_inventory_history_id");
                udtInventory.SubInventoryItemID = dbRdr.ToInt64("sub_inventory_item_id");
                udtInventory.Timestamp = dbRdr.ToDateTime("timestamp");
                udtInventory.RxTime = dbRdr.ToDateTime("rx_time");
                udtInventory.StockType = dbRdr.ToInt32("stock_type");
                udtInventory.Name = dbRdr.ToString("name");
                udtInventory.Reference = dbRdr.ToString("reference");
                udtInventory.PreviousQuantity = dbRdr.ToInt32("previous_quantity");
                udtInventory.Quantity = dbRdr.ToInt32("quantity");
                udtInventory.TotalQuantity = dbRdr.ToInt32("total_quantity");
                udtInventory.PickupID = dbRdr.ToInt64("pickup_id");
                udtInventory.DeliveryID = dbRdr.ToInt64("delivery_id");
                udtInventory.CompanyID = dbRdr.ToInt32("company_id");
                udtInventory.UserID = dbRdr.ToInt32("user_id");
                udtInventory.UserName = dbRdr.ToString("user_name");
                udtInventory.Platform = dbRdr.ToInt32("platform");
                udtInventory.AssetID = dbRdr.ToInt64("asset_id");
                udtInventory.Asset = dbRdr.ToString("asset");
                udtInventory.DriverID = dbRdr.ToInt64("driver_id");
                udtInventory.DriverName = dbRdr.ToString("driver_name");
                udtInventory.Company = dbRdr.ToString("company");
                udtInventory.ItemCategory = dbRdr.ToInt32("item_category");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildSubInventoryHistory ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtInventory;
        }

        public static RegionInfo BuildRegion(MySqlDataReader dbRdr)
        {
            RegionInfo udtRegion = new RegionInfo();
            try
            {
                // set company parameters
                udtRegion.RegionID = dbRdr.ToInt64("acr_id");
                udtRegion.CompanyID = dbRdr.ToInt32("company_id");
                udtRegion.RegionName = dbRdr.ToString("region_name");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildRegion ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtRegion;
        }

        public static DistrictInfo BuildDistrict(MySqlDataReader dbRdr)
        {
            DistrictInfo udtDistrict = new DistrictInfo();
            try
            {
                // set company parameters
                udtDistrict.DistrictID = dbRdr.ToInt64("district_id");
                udtDistrict.CompanyID = dbRdr.ToInt64("company_id");
                udtDistrict.PostalDistrict = dbRdr.ToInt32("postal_district");
                udtDistrict.PostalSector = dbRdr.ToInt32("postal_sector");
                udtDistrict.GeneralLocation = dbRdr.ToString("general_location");
                udtDistrict.RegionID = dbRdr.ToInt32("area_covered_region_id");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildDistrict ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtDistrict;
        }
        public static VrpInitLocationInfo BuildVrpInitLlocation(MySqlDataReader dbRdr)
        {
            VrpInitLocationInfo udtVrp = new VrpInitLocationInfo();
            try
            {
                udtVrp.InitialLocationID = dbRdr.ToInt64("init_locations_id");
                udtVrp.RouteNo = dbRdr.ToString("route_no");
                udtVrp.Lat = dbRdr.ToDouble("latitude");
                udtVrp.Long = dbRdr.ToDouble("longitude");
                udtVrp.Address = dbRdr.ToString("address");
                udtVrp.Demands = dbRdr.ToInt32("demands");
                udtVrp.ServiceDuration = dbRdr.ToInt32("service_duration");
                udtVrp.LoadDuration = dbRdr.ToInt32("load_duration");
                udtVrp.UnloadDuration = dbRdr.ToInt32("unload_duration");
                udtVrp.WaitingDuration = dbRdr.ToInt32("waiting_duration");
                udtVrp.ItemNo = dbRdr.ToInt32("item_no");
                udtVrp.Node = dbRdr.ToInt32("node");
                udtVrp.DeliverToNode = dbRdr.ToInt32("deliver_to_node");
                udtVrp.TimeWindowStart = dbRdr.ToDateTime("time_window_start");
                udtVrp.TimeWindowEnd = dbRdr.ToDateTime("time_window_end");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildVrpInitLlocation ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtVrp;
        }


        /// <summary>
        /// builds driver info from database record
        /// </summary>
        /// <param name="dbRdr"></param>
        /// <returns></returns>
        public static DriverInfo BuildDriver(MySqlDataReader dbRdr)
        {
            DriverInfo udtDriver = new DriverInfo();
            DriverRepository driverRepo = new DriverRepository();
            try
            {
                // set company parameters
                udtDriver.DriverID = dbRdr.ToInt32("driver_id");
                udtDriver.LoginName = dbRdr.ToString("login_name");
                udtDriver.Name = dbRdr.ToString("driver_name");
                udtDriver.AssetID = dbRdr.ToInt64("asset_id");
                udtDriver.Asset = dbRdr.ToString("asset");
                udtDriver.Address = dbRdr.ToString("address");
                udtDriver.Unit = dbRdr.ToString("unit");
                udtDriver.Building = dbRdr.ToString("building");
                udtDriver.Postal = dbRdr.ToString("postal_code");
                udtDriver.Phone = dbRdr.ToString("phone");
                if (dbRdr["birthdate"] != DBNull.Value)
                    udtDriver.DateOfBirth = dbRdr.ToDateTime("birthdate");
                udtDriver.RelativePhone = dbRdr.ToString("relative_phone");
                udtDriver.RelativeName = dbRdr.ToString("relative_name");
                udtDriver.RFIDID = dbRdr.ToInt32("rfid_id");
                udtDriver.RFID = dbRdr.ToString("rfid");
                udtDriver.ResellerID = dbRdr.ToInt32("reseller_id");
                udtDriver.CompanyID = dbRdr.ToInt32("company_id");
                udtDriver.Company = dbRdr.ToString("company");
                udtDriver.BloodType = dbRdr.ToInt32("bloodtype");
                udtDriver.LastTap = dbRdr.ToDateTime("last_tap");
                udtDriver.Remarks = dbRdr.ToString("remarks");
                udtDriver.CreatedDate = dbRdr.ToDateTime("created_date");
                udtDriver.ModifiedDate = dbRdr.ToDateTime("modified_date");
                udtDriver.CreatedBy = dbRdr.ToInt32("created_by");
                udtDriver.ModifiedBy = dbRdr.ToInt32("modified_by");
                udtDriver.CreatedByName = dbRdr.ToString("created_byName");
                udtDriver.ModifiedByName = dbRdr.ToString("modified_byName");
                udtDriver.Email = dbRdr.ToString("email");
                udtDriver.Password = dbRdr.ToString("password");
                udtDriver.Token = dbRdr.ToString("token");
                udtDriver.LoginRetry = (dbRdr.ToInt32("login_retry") > 0 ? "Active" : "Locked");
                udtDriver.LoginCount = dbRdr.ToInt32("login_retry");
                udtDriver.LastLogin = dbRdr.ToDateTime("last_login");
                udtDriver.PasswordExpiration = dbRdr.ToInt32("password_expiration");
                udtDriver.DriverExpiration = dbRdr.ToInt32("driver_expiration");
                udtDriver.DriverStatusID = dbRdr.ToInt32("driver_status_id");
                udtDriver.DriverStatus = dbRdr.ToString("driver_status");
                udtDriver.DepartmentID = dbRdr.ToInt32("department_id");
                udtDriver.isTSP = dbRdr.ToInt32("isTSP");
                udtDriver.isVRP = dbRdr.ToInt32("isVRP");
                udtDriver.isGPS = dbRdr.ToInt32("isGPS");
                udtDriver.SessionTimeout = dbRdr.ToInt32("session_timeout");
                udtDriver.ReportDuration = dbRdr.ToInt32("report_duration");
                udtDriver.ReportRange = dbRdr.ToInt32("report_range");
                udtDriver.NotifyFinalInvoice = dbRdr.ToInt32("notify_final_invoice");
                udtDriver.SMTPUsername = dbRdr.ToString("smtp_username");
                udtDriver.SMTPPassword = dbRdr.ToString("smtp_password");
                udtDriver.SMTPPort = dbRdr.ToInt32("smtp_port");
                udtDriver.SMTPHost = dbRdr.ToString("smtp_host");
                udtDriver.isSecured = dbRdr.ToInt32("isSecured");
                udtDriver.SubscriptionID = dbRdr.ToInt32("subscription_id");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildDriver ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtDriver;
        }

        /// <summary>
        /// builds user info from database record
        /// </summary>
        /// <param name="dbRdr"></param>
        /// <returns></returns>
        /// 
        public static UserInfo BuildUser(MySqlDataReader dbRdr)
        {
            UserInfo udtUser = new UserInfo();

            try
            {
                // set users parameters
                udtUser.UserID = dbRdr.ToInt32("user_id");
                udtUser.Name = dbRdr.ToString("name");
                udtUser.User = dbRdr.ToString("user_name");
                udtUser.Password = dbRdr.ToString("password");
                udtUser.RoleID = dbRdr.ToInt32("role_id");
                udtUser.Phone = dbRdr.ToString("phone");
                udtUser.Email = dbRdr.ToString("email");
                udtUser.CompanyID = dbRdr.ToInt32("company_id");
                udtUser.Assets = dbRdr.ToString("assets");
                udtUser.Notifications = dbRdr.ToString("notifications");
                udtUser.LoginRetry = (dbRdr.ToInt32("login_retry") > 0 ? "Active" : "Locked");
                udtUser.LoginCount = dbRdr.ToInt32("login_retry");
                udtUser.Reports = dbRdr.ToString("reports");
                udtUser.LanguageID = dbRdr.ToInt32("language_id");
                udtUser.ApiKey = dbRdr.ToString("api_key");
                udtUser.ResellerID = dbRdr.ToInt32("reseller_id");
                udtUser.ResellerDesc = dbRdr.ToString("reseller");
                udtUser.RoleDesc = dbRdr.ToString("role_desc");
                udtUser.Company = dbRdr.ToString("company");
                udtUser.CompanyAddress = dbRdr.ToString("company_address");
                udtUser.CompanyUnit = dbRdr.ToString("company_unit");
                udtUser.CompanyBuilding = dbRdr.ToString("company_building");
                udtUser.CompanyPostal = dbRdr.ToString("company_postal");
                udtUser.Language = dbRdr.ToString("language");
                udtUser.Culture = dbRdr.ToString("culture");
                udtUser.CreatedDate = dbRdr.ToDateTime("created_date");
                udtUser.ModifiedDate = dbRdr.ToDateTime("modified_date");
                udtUser.PasswordExpiration = dbRdr.ToInt32("password_expiration");
                udtUser.LastLogin = dbRdr.ToDateTime("last_login");
                udtUser.UserExpiration = dbRdr.ToInt32("user_expiration");
                udtUser.UserLimit = dbRdr.ToInt32("user_limit");
                udtUser.ZoneLimit = dbRdr.ToInt32("zone_limit");
                udtUser.AssetLimit = dbRdr.ToInt32("asset_limit");
                udtUser.CreditLimit = dbRdr.ToInt32("credit_limit");
                udtUser.isSHN = dbRdr.ToInt32("isSHN");
                udtUser.isDirections = dbRdr.ToInt32("isDirections");
                udtUser.isTSP = dbRdr.ToInt32("isTSP");
                udtUser.isVRP = dbRdr.ToInt32("isVRP");
                udtUser.isLocation = dbRdr.ToInt32("isLocation");
                udtUser.isTraffic = dbRdr.ToInt32("isTraffic");
                udtUser.isCarpark = dbRdr.ToInt32("isCarpark");
                udtUser.isErp = dbRdr.ToInt32("isErp");
                udtUser.isWeather = dbRdr.ToInt32("isWeather");
                udtUser.isStreetview = dbRdr.ToInt32("isStreetview");
                udtUser.isHeatmap = dbRdr.ToInt32("isHeatmap");
                udtUser.SubscriptionID = dbRdr.ToInt32("subscription_id");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildUser ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtUser;
        }

        /// <summary>
        /// builds device info from database record
        /// </summary>
        /// <param name="dbRdr"></param>
        /// <returns></returns>
        public static DeviceInfo BuildDevice(MySqlDataReader dbRdr)
        {
            DeviceInfo udtDevice = new DeviceInfo();
            try
            {
                udtDevice.DeviceID = dbRdr.ToInt32("tag_id");
                udtDevice.Name = dbRdr.ToString("name");
                udtDevice.Imei = dbRdr.ToString("imei");
                udtDevice.Phone = dbRdr.ToString("phone");
                udtDevice.Interval = dbRdr.ToInt32("interval");
                udtDevice.Port = dbRdr.ToInt32("port");
                udtDevice.APN = dbRdr.ToString("APN");
                udtDevice.InstallDate = dbRdr.ToDateTime("install_date");
                udtDevice.ModifiedTimestamp = dbRdr.ToDateTime("modified_timestamp");
                udtDevice.Remarks = dbRdr.ToString("remarks");
                udtDevice.isSentOut = dbRdr.ToInt32("isSentOut");
                udtDevice.AssetID = dbRdr.ToInt64("asset_id");
                udtDevice.Asset = dbRdr.ToString("asset");
                udtDevice.CompanyID = dbRdr.ToInt32("company_id");
                udtDevice.Company = dbRdr.ToString("company");
                udtDevice.ResellerID = dbRdr.ToInt32("reseller_id");
                //udtDevice.Reseller = dbRdr.ToString("reseller");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildDevice ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtDevice;
        }

        public static AssetFeatureInfo BuildAssetFeature(MySqlDataReader dbRdr)
        {
            AssetFeatureInfo udtFeature = new AssetFeatureInfo();
            try
            {
                udtFeature.FeatureID = dbRdr.ToInt32("feature_id");
                udtFeature.FeatureDesc = dbRdr.ToString("description");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildAssetFeature ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtFeature;
        }

        public static StockTypeInfo BuildStockType(MySqlDataReader dbRdr)
        {
            StockTypeInfo udtStockType = new StockTypeInfo();
            try
            {
                udtStockType.StockTypeID = dbRdr.ToInt32("stock_type_id");
                udtStockType.Name = dbRdr.ToString("name");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildStockType ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtStockType;
        }



        /// <summary>
        /// builds category info from database record
        /// </summary>
        /// <param name="dbRdr"></param>
        /// <returns></returns>
        public static CategoryInfo BuildCategory(MySqlDataReader dbRdr)
        {
            CategoryInfo udtCategory = new CategoryInfo();
            try
            {
                udtCategory.CategoryID = dbRdr.ToInt32("category_id");
                udtCategory.CategoryDesc = dbRdr.ToString("category_desc");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildCategory ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtCategory;
        }


        public static DriverStatusInfo BuildDriverStatus(MySqlDataReader dbRdr) { 

            DriverStatusInfo udtDriverStatus = new DriverStatusInfo();
            try
            {
                udtDriverStatus.DriverStatusID = dbRdr.ToInt32("driver_status_id");
                udtDriverStatus.DriverStatusDesc = dbRdr.ToString("description");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildDriverStatus ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtDriverStatus;
        }


        public static DriverScheduleInfo BuildDriverSchedule(MySqlDataReader dbRdr)
        {

            DriverScheduleInfo udtDriverSchedule = new DriverScheduleInfo();
            try
            {
                udtDriverSchedule.ScheduleID = dbRdr.ToInt64("schedule_id");
                udtDriverSchedule.DriverID = dbRdr.ToInt64("driver_id");
                udtDriverSchedule.TimeStart = dbRdr.GetTimeSpan("time_window_start");
                udtDriverSchedule.TimeEnd = dbRdr.GetTimeSpan("time_window_end");
                udtDriverSchedule.BreaktimeStart = dbRdr.GetTimeSpan("breaktime_start");
                udtDriverSchedule.BreaktimeEnd = dbRdr.GetTimeSpan("breaktime_end");
                udtDriverSchedule.DayID = dbRdr.ToInt32("day_id");
                udtDriverSchedule.Address = dbRdr.ToString("address");
                udtDriverSchedule.Unit = dbRdr.ToString("unit");
                udtDriverSchedule.Building = dbRdr.ToString("building");
                udtDriverSchedule.Postal = dbRdr.ToString("postal_code");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildDriverSchedule ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtDriverSchedule;
        }
        public static DriverAttendanceChart BuildDriverAttendanceChart(MySqlDataReader dbRdr)
        {

            DriverAttendanceChart udtDriverAttedance = new DriverAttendanceChart();
            try
            {
                udtDriverAttedance.DriverName = dbRdr.ToString("driver_name");
                udtDriverAttedance.WorkTimeStartOnTime = dbRdr.ToInt32("workstart_ontime");
                udtDriverAttedance.WorkTimeStartLate = dbRdr.ToInt32("workstart_late");
                udtDriverAttedance.WorkTimeEndOnTime = dbRdr.ToInt32("workend_ontime");
                udtDriverAttedance.WorkTimeEndEarly = dbRdr.ToInt32("workend_early");
                udtDriverAttedance.IncompleteTime = dbRdr.ToInt32("incomplete_time");
                udtDriverAttedance.TotalWorkDuration = dbRdr.ToInt32("total_work_duration") / 60;
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildDriverAttendance ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtDriverAttedance;
        }
        public static DriverAttendance BuildDriverAttendance(MySqlDataReader dbRdr)
        {

            DriverAttendance udtDriverAttedance = new DriverAttendance();
            try
            {
                udtDriverAttedance.DriverReportID = dbRdr.ToInt64("driver_report_id");
                udtDriverAttedance.DriverID = dbRdr.ToInt64("driver_id");
                udtDriverAttedance.DriverName = dbRdr.ToString("driver_name");
                udtDriverAttedance.ScheduledWorkTimeStart = dbRdr.ToDateTime("scheduled_work_time_start");
                udtDriverAttedance.ActualWorkTimeStart = dbRdr.ToDateTime("actual_work_time_start");
                udtDriverAttedance.LocationWorkTimeStart = dbRdr.ToString("location_work_time_start");
                udtDriverAttedance.StatusWorkTimeStart = dbRdr.ToString("status_work_time_start");
                udtDriverAttedance.ScheduledWorkTimeEnd = dbRdr.ToDateTime("scheduled_work_time_end");
                udtDriverAttedance.ActualWorkTimeEnd = dbRdr.ToDateTime("actual_work_time_end");
                udtDriverAttedance.LocationWorkTimeEnd = dbRdr.ToString("location_work_time_end");
                udtDriverAttedance.StatusWorkTimeEnd = dbRdr.ToString("status_work_time_end");
                udtDriverAttedance.ActualWorkDuration = dbRdr.ToDouble("work_duration");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildDriverAttendance ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtDriverAttedance;
        }
        public static VrpDriverPerformanceChart BuildDriverPerformanceChart(MySqlDataReader dbRdr)
        {

            VrpDriverPerformanceChart udtDriverAttedance = new VrpDriverPerformanceChart();
            try
            {
                udtDriverAttedance.DriverName = dbRdr.ToString("driver_name");
                udtDriverAttedance.DepartureOnTime = dbRdr.ToInt32("departure_ontime");
                udtDriverAttedance.DepartureLate = dbRdr.ToInt32("departure_late");
                udtDriverAttedance.ArrivalOnTime = dbRdr.ToInt32("arrival_ontime");
                udtDriverAttedance.ArrivalLate = dbRdr.ToInt32("arrival_late");
                udtDriverAttedance.IncompleteJob = dbRdr.ToInt32("incomplete_job");
                udtDriverAttedance.TotalJobDuration = dbRdr.ToInt32("total_job_duration") / 60;
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildDriverPerformanceChart ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtDriverAttedance;
        }
        public static VrpDriverPerformance BuildDriverPerformance(MySqlDataReader dbRdr)
        {

            VrpDriverPerformance udtDriverPerformance = new VrpDriverPerformance();
            try
            {
                udtDriverPerformance.VRPRouteReportsID = dbRdr.ToInt64("vrp_route_reports_id");
                udtDriverPerformance.VRPRoutesID = dbRdr.ToInt64("vrp_routes_id");
                udtDriverPerformance.FromVRPRoutesID = dbRdr.ToInt64("from_vrp_routes_id");
                udtDriverPerformance.FromAddress = dbRdr.ToString("from_address");
                udtDriverPerformance.ToAddress = dbRdr.ToString("to_address");
                udtDriverPerformance.DriverID = dbRdr.ToInt64("driver_id");
                udtDriverPerformance.DriverName = dbRdr.ToString("driver_name");
                udtDriverPerformance.EstDepartureTime = dbRdr.ToDateTime("est_departure_time");
                udtDriverPerformance.ActualDepartureTime = dbRdr.ToDateTime("actual_departure_time");
                udtDriverPerformance.StatusDepartureTime = dbRdr.ToString("status_departure_time");
                udtDriverPerformance.EstArrivalTime = dbRdr.ToDateTime("est_arrival_time");
                udtDriverPerformance.ActualArrivalTime = dbRdr.ToDateTime("actual_arrival_time");
                udtDriverPerformance.StatusArrivalTime = dbRdr.ToString("status_arrival_time");
                udtDriverPerformance.TravelDuration = dbRdr.ToDouble("travel_duration");
                udtDriverPerformance.JobStartTime = dbRdr.ToDateTime("job_start_time");
                udtDriverPerformance.JobEndTime = dbRdr.ToDateTime("job_end_time");
                udtDriverPerformance.JobDuration = dbRdr.ToDouble("job_duration");
                udtDriverPerformance.EstJobDuration = dbRdr.ToDouble("est_job_duration");
                udtDriverPerformance.CompanyID = dbRdr.ToInt32("company_id");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildDriverPerformance ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtDriverPerformance;
        }
        public static DepartmentInfo BuildDepartment(MySqlDataReader dbRdr)
        {

            DepartmentInfo udtDepartment = new DepartmentInfo();
            try
            {
                // set users parameters
                udtDepartment.DepartmentID = dbRdr.ToInt32("department_id");
                udtDepartment.DepartmentDesc = dbRdr.ToString("description");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildDepartment ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtDepartment;
        }

        /// <summary>
        /// builds zone type info from database record
        /// </summary>
        /// <param name="dbRdr"></param>
        /// <returns></returns>
        public static ZoneTypeInfo BuildZoneType(MySqlDataReader dbRdr)
        {
            ZoneTypeInfo udtZoneType = new ZoneTypeInfo();
            try
            {

                // set users parameters
                udtZoneType.ZoneTypeID = dbRdr.ToInt32("type_id");
                udtZoneType.Name = dbRdr.ToString("name");
                udtZoneType.Color = dbRdr.ToString("color");


                // get user image
                //string strFill = "";
                //udtUser.Image = GetImage(String.Format("users/{0}", udtUser.UserID), strImage, ref strFill);
                //udtUser.ImageFill = strFill;
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildZoneType ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtZoneType;
        }

        /// <summary>
        /// builds report info from database record
        /// </summary>
        /// <param name="dbRdr"></param>
        /// <returns></returns>
        public static ReportInfo BuildReport(MySqlDataReader dbRdr)
        {
            ReportInfo udtReport = new ReportInfo();
            try
            {

                // set users parameters
                udtReport.ReportID = dbRdr.ToInt32("report_id");
                udtReport.Name = dbRdr.ToString("name");



                // get user image
                //string strFill = "";
                //udtUser.Image = GetImage(String.Format("users/{0}", udtUser.UserID), strImage, ref strFill);
                //udtUser.ImageFill = strFill;
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildReport ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtReport;
        }

        /// <summary>
        /// builds role info from database record
        /// </summary>
        /// <param name="dbRdr"></param>
        /// <returns></returns>
        public static RoleInfo BuildRole(MySqlDataReader dbRdr)
        {
            RoleInfo udtRole = new RoleInfo();
            try
            {

                // set users parameters
                udtRole.RoleID = dbRdr.ToInt32("role_id");
                udtRole.RoleDesc = dbRdr.ToString("role_desc");

                // get user image
                //string strFill = "";
                //udtUser.Image = GetImage(String.Format("users/{0}", udtUser.UserID), strImage, ref strFill);
                //udtUser.ImageFill = strFill;
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildRole ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtRole;
        }

        public static LanguageInfo BuildLanguage(MySqlDataReader dbRdr)
        {
            LanguageInfo udtLanguage = new LanguageInfo();
            try
            {
                // set users parameters
                udtLanguage.LanguageID = dbRdr.ToInt32("language_id");
                udtLanguage.Name = dbRdr.ToString("name");
                udtLanguage.Culture = dbRdr.ToString("culture");

                // get user image
                //string strFill = "";
                //udtUser.Image = GetImage(String.Format("users/{0}", udtUser.UserID), strImage, ref strFill);
                //udtUser.ImageFill = strFill;
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildLanguage ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtLanguage;
        }

        public static PosInfo BuildPosition(MySqlDataReader dbRdr)
        {
            PosInfo newPos = new PosInfo();
            try
            {

                // initialize fix
                int iFix = dbRdr.ToInt32("fix");
                string strFix = iFix.ToString();

                // check fix
                switch (iFix)
                {
                    case -1:
                        {
                            // cell id fix
                            strFix = "Cell ID";
                            if (dbRdr.ToString("remarks") != "")
                            {
                                // format cell id
                                string strCellID = dbRdr.ToString("remarks");
                                if (strCellID.Contains(":")) strCellID = strCellID.Substring(strCellID.IndexOf(":") + 1);
                                strFix += String.Format(" ({0})", strCellID);
                            }
                        }
                        break;
                    case 0: strFix = "No Fix"; break;
                    case 1:
                    case 2: strFix = "GPS Fix"; break;
                    case 3:
                    case 4: strFix = "Last Known GPS"; break;
                }



                // set position parameters
                newPos.PosID = dbRdr.ToInt64("pos_id");
                newPos.RxTime = dbRdr.ToDateTime("rx_time");
                newPos.Timestamp = dbRdr.ToDateTime("timestamp");
                newPos.TagID = dbRdr.ToInt64("tag_id");
                newPos.Tag = dbRdr.ToString("tag");
                newPos.AssetID = dbRdr.ToInt64("asset_id");
                newPos.Asset = dbRdr.ToString("asset");
				newPos.FixID = iFix;
                newPos.Fix = strFix;
                newPos.Satellites = dbRdr.ToInt32("satellites");
                newPos.PosX = dbRdr.ToDouble("pos_x");
                newPos.PosY = dbRdr.ToDouble("pos_y");
                newPos.PosZ = dbRdr.ToDouble("pos_z");
                newPos.Speed = Math.Round(dbRdr.ToDouble("speed"), 1);
                newPos.Course = Math.Round(dbRdr.ToDouble("course"), 1);
                newPos.HDOP = Math.Round(dbRdr.ToDouble("hdop"), 1);
                newPos.Mileage = Math.Round(dbRdr.ToDouble("mileage") / 100, 2);
                newPos.Driver = (dbRdr.ToString("driver") != "" ? dbRdr.ToString("driver") : dbRdr.ToString("driver_default"));
                newPos.CompanyID = dbRdr.ToInt32("company_id");

                // get other position parameters
                newPos.Battery = dbRdr.ToDouble("battery");
                newPos.Fuel = dbRdr.ToDouble("fuel");
                newPos.ZoneID = dbRdr.ToInt32("zone_id");
                newPos.Zone = dbRdr.ToString("zone_name");
                newPos.Location = dbRdr.ToString("loc");
                newPos.Location = newPos.Location;

                //if (((newPos.Location) == "" || (newPos.Location == "Singapore")) && (newPos.FixID > 0))
                //    newPos.Location = "No Address from Google Maps";

                if (((newPos.Location) == "ZERO_RESULTS") && (newPos.FixID > 0))
                    newPos.Location = "No Address from Google Maps";

                if (((newPos.Location) == "" || (newPos.Location == "Singapore")) && (newPos.FixID == 0))
                    newPos.Location = "No GPS Signal Detected";

                // get engine status
                switch (dbRdr.ToInt32("engine"))
                {
                    case 0: newPos.Engine = "STOP";
                        break;
                    case 1: newPos.Engine = "IDLE";
                        break;
                    case 2: newPos.Engine = "MOVE";
                        break;
                }

                //Status:Move; Speed < 6kph
                newPos.Ignition = dbRdr.ToInt32("ignition");
                if (newPos.Ignition == 0)
                {
                    newPos.Speed = 0;
                }
                else
                {
                    if (newPos.Engine == "IDLE" && newPos.Speed > 0)
                        newPos.Speed = 0;
                    if (newPos.Engine == "MOVE" && newPos.Speed < 6)
                    {
                        newPos.Speed = 0;
                        newPos.Engine = "IDLE";
                    }
                }

                //try
                //{
                //    newPos.Temperature = dbRdr.ToDouble("fridge");
                //    newPos.Temperature2 = dbRdr.ToDouble("product");
                //}
                //catch (Exception ex)
                //{
                //    // log error
                //    FMSHelper.LogEvent(mProjName + "-BuildPos", ex.Message, System.Diagnostics.EventLogEntryType.Error);
                //    DatabaseMgr.LogError(ex.Message, "BuildPosition-ReadTemp Error");
                //}

                //if (ConfigurationManager.AppSettings["Instance"] == "BUC")
                //{
                //    //Support for Ultralevel Water Sensor
                //    try
                //    {
                //        newPos.FuelLevel = dbRdr.ToDouble("liquid_level");
                //        newPos.ActualTemp = dbRdr.ToDouble("actual_temp");
                //    }
                //    catch (Exception ex)
                //    {
                //        //log error
                //        DatabaseMgr.LogError(ex.Message, "BuildPosition-ReadFuel Error");
                //    }
                //}
               
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildPosition ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);

            }
            return newPos;
        }

        public static JobInfo BuildJob(MySqlDataReader dbRdr)
        {
            JobInfo udtJobs = new JobInfo();
            try
            {
                // set jobs parameters
                udtJobs.JobID = dbRdr.ToInt64("job_id");
                udtJobs.JobNumber = dbRdr.ToString("job_number");
                udtJobs.CompanyID = dbRdr.ToInt32("company_id");
                udtJobs.Company = dbRdr.ToString("company");
                udtJobs.ResellerID = dbRdr.ToInt32("reseller_id");
                udtJobs.Reseller = dbRdr.ToString("reseller");
                udtJobs.DriverID = dbRdr.ToInt32("driver_id");
                udtJobs.Driver = dbRdr.ToString("driver");
                udtJobs.UserID = dbRdr.ToInt32("user_id");
                udtJobs.User = dbRdr.ToString("user_name");
                udtJobs.Timestamp = dbRdr.ToDateTime("timestamp");
                udtJobs.RxTime = dbRdr.ToDateTime("rx_time");
                udtJobs.Cancelled = dbRdr.ToDateTime("cancelled");
                udtJobs.Flag = dbRdr.ToInt32("flag");
                udtJobs.Remarks = dbRdr.ToString("remarks");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildJob ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtJobs;
        }

        public static EventInfo BuildEvent(MySqlDataReader dbRdr)
        {
            EventInfo udtEvent = new EventInfo();
            try
            {
                // set event parameters
                udtEvent.EventID = dbRdr.ToInt64("event_id");
                udtEvent.TagID = dbRdr.ToInt64("tag_id");
                udtEvent.Tag = dbRdr.ToString("tag");
                udtEvent.AssetID = dbRdr.ToInt64("asset_id");
                udtEvent.Asset = dbRdr.ToString("asset");
                udtEvent.StatusID = dbRdr.ToInt32("status_id");
                udtEvent.Event = dbRdr.ToString("status_desc");
                udtEvent.Remarks = dbRdr.ToString("remarks");
                udtEvent.AlertLevel = dbRdr.ToInt32("alert_level_ex");
                //udtEvent.AlertLevel = dbRdr.ToInt32("alert_level");
                udtEvent.Flag = dbRdr.ToInt32("flag");
                udtEvent.Timestamp = dbRdr.ToDateTime("timestamp");
                udtEvent.RxTime = dbRdr.ToDateTime("rx_time");
                udtEvent.AckRoleID = dbRdr.ToInt32("ack_user");
                udtEvent.AckUser = dbRdr.ToString("user_ack");
                udtEvent.AckTime = dbRdr.ToDateTime("ack_time");
                udtEvent.PosID = dbRdr.ToInt64("pos_id");
                udtEvent.Location = dbRdr.ToString("loc");
                udtEvent.CompanyID = dbRdr.ToInt32("company_id");
                udtEvent.ZoneID = dbRdr.ToInt32("zone_id");
                udtEvent.Speed = dbRdr.ToDouble("speed");


            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildEvent ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtEvent;
        }

        public static MessageInfo BuildMessage(MySqlDataReader dbRdr)
        {
            MessageInfo udtMessage = new MessageInfo();
            try
            {
                // set company parameters
                udtMessage.MessageID = dbRdr.ToInt32("message_id");
                udtMessage.Sender = dbRdr.ToString("sender");
                udtMessage.Recipients = dbRdr.ToString("recipients");
                udtMessage.Message = dbRdr.ToString("message");
                udtMessage.Timestamp = dbRdr.ToDateTime("timestamp");
                udtMessage.RxTime = dbRdr.ToDateTime("rx_time");
                udtMessage.Flag = dbRdr.ToInt32("flag");
                udtMessage.CompanyID = dbRdr.ToInt32("company_id");
                udtMessage.AssetID = dbRdr.ToInt64("asset_id");
                udtMessage.Company = dbRdr.ToString("company_name");
                udtMessage.Asset = dbRdr.ToString("asset_name");


            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildMessage ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtMessage;
        }

        public static StatusInfo BuildStatus(MySqlDataReader dbRdr)
        {
            StatusInfo udtStatus = new StatusInfo();
            try
            {
                // set status parameters
                udtStatus.StatusID = dbRdr.ToInt32("status_id");
                udtStatus.StatusDesc = dbRdr.ToString("status_desc");
                udtStatus.Flag = dbRdr.ToInt32("flag");
                udtStatus.Type = dbRdr.ToInt32("type");

            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildStatus ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtStatus;
        }

        public static UtilizeReport BuildUtilization(MySqlDataReader dbRdr)
        {
            UtilizeReport udtUtilize = new UtilizeReport();
            try
            {
                // set status parameters
                udtUtilize.UtilID = dbRdr.ToInt64("util_id");
                udtUtilize.AssetID = dbRdr.ToInt64("asset_id");
                udtUtilize.Driver = dbRdr.ToString("driver");
                udtUtilize.Date = dbRdr.ToDateTimeMin("date");
                udtUtilize.StartTime = dbRdr.ToDateTimeMin("start_time");
                udtUtilize.EndTime = dbRdr.ToDateTimeMin("end_time");
                udtUtilize.Stop1 = dbRdr.ToDouble("stop");
                udtUtilize.Stop2 = dbRdr.ToDouble("stop_ex");
                udtUtilize.Idle = dbRdr.ToDouble("idle");
                udtUtilize.Move = dbRdr.ToDouble("move");
                udtUtilize.StopCount = dbRdr.ToInt32("stop_count");
                udtUtilize.Mileage = dbRdr.ToDouble("mileage");
                udtUtilize.LastIgnition = dbRdr.ToDateTime("last_ignition");
                udtUtilize.Location = dbRdr.ToString("location");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildUtilization ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtUtilize;
        }

        /// <summary>
        /// builds asset info from database record
        /// </summary>
        /// <param name="dbRdr"></param>
        /// <returns></returns>
        public static UtilizationInfo BuildUtilizationView(MySqlDataReader dbRdr)
        {
            UtilizationInfo udtUtilization = new UtilizationInfo();
            try
            {
                udtUtilization.UtilId = dbRdr.ToInt64("util_id");
                udtUtilization.AssetID = dbRdr.ToInt64("asset_id");
                udtUtilization.Driver = dbRdr.ToString("driver");
                udtUtilization.Date = dbRdr.ToDateTime("date");
                udtUtilization.StartTime = dbRdr.ToDateTime("start_time");
                udtUtilization.EndTime = dbRdr.ToDateTime("end_time");
                udtUtilization.Stop = dbRdr.ToDouble("stop");
                udtUtilization.StopEx = dbRdr.ToDouble("stop_ex");
                udtUtilization.Idle = dbRdr.ToDouble("idle");
                udtUtilization.Move = dbRdr.ToDouble("move");
                udtUtilization.StopCount = dbRdr.ToInt32("stop_count");
                udtUtilization.Mileage = dbRdr.ToDouble("mileage");
                udtUtilization.LastIgnition = dbRdr.ToDateTime("last_ignition");
                udtUtilization.Location = dbRdr.ToString("location");
                udtUtilization.Asset = dbRdr.ToString("asset");
                udtUtilization.CategoryId = dbRdr.ToInt32("category_id");
                udtUtilization.CompanyId = dbRdr.ToInt32("company_id");
                udtUtilization.Tag = dbRdr.ToString("tag");
                udtUtilization.Category = dbRdr.ToString("category");

            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName + "-BuildUtilization", ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtUtilization;
        }

        public static IdlingInfo BuildIdlingView(MySqlDataReader dbRdr)
        {
            IdlingInfo udtIdling = new IdlingInfo();
            try
            {
                // set status parameters
                udtIdling.IdleReportID = dbRdr.ToInt64("idlereport_id");
                udtIdling.Driver = dbRdr.ToString("driver");
                udtIdling.AssetID = dbRdr.ToInt64("asset_id");
                udtIdling.IdleStart = dbRdr.ToDateTimeMin("idle_start");
                udtIdling.IdleEnd = dbRdr.ToDateTimeMin("idle_end");
                udtIdling.Location = dbRdr.ToString("location");
                udtIdling.Asset = dbRdr.ToString("asset");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildIdling ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtIdling;
        }

        public static IdlingInfo BuildIdling(MySqlDataReader dbRdr)
        {
            IdlingInfo udtIdling = new IdlingInfo();
            try
            {
                // set status parameters
                udtIdling.IdleReportID = dbRdr.ToInt64("idlereport_id");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildIdling ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtIdling;
        }

        /// <summary>
        /// builds plan info from database record
        /// </summary>
        /// <param name="dbRdr"></param>
        /// <returns></returns>
        public static PlanInfo BuildPlan(MySqlDataReader dbRdr)
        {
            PlanInfo udtPlan = new PlanInfo();
            try
            {
                // add trip plan to list
                udtPlan.PlanID = dbRdr.ToInt32("plan_id");
                udtPlan.OriginID = dbRdr.ToInt32("origin_id");
                udtPlan.Origin = dbRdr.ToString("origin");
                udtPlan.DestinationID = dbRdr.ToInt32("destination_id");
                udtPlan.Destination = "";
                udtPlan.Duration = dbRdr.ToDouble("duration");
                udtPlan.Price = dbRdr.ToDouble("price");
                udtPlan.Company = dbRdr.ToString("company");
                udtPlan.Timestamp = dbRdr.ToDateTime("timestamp");
                udtPlan.LastTrip = dbRdr.ToDateTime("last_trip");

                // format duration
                double lSeconds = (udtPlan.Duration - Math.Round(udtPlan.Duration)) * 60;
                TimeSpan tsDiff = new TimeSpan(0, (int)udtPlan.Duration, (int)lSeconds);
                udtPlan.DurationEx = String.Format("{0:00}:{1:00}:{2:00}",
                    tsDiff.Hours, tsDiff.Minutes, tsDiff.Seconds);
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildPlan ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtPlan;
        }

        public static LocationInfo BuildLocation(MySqlDataReader dbRdr)
        {
            LocationInfo udtLocation = new LocationInfo();
            try
            {
                udtLocation.Location = dbRdr.ToString("loc");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildLocation ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtLocation;
        }
        public static RouteInfo BuildRoute(MySqlDataReader dbRdr)
        {
            RouteInfo udtRoute = new RouteInfo();
            try
            {
                // set users parameters
                udtRoute.RouteID = dbRdr.ToInt64("route_id");
                udtRoute.RouteName = dbRdr.ToString("route_name");
                udtRoute.RouteNo = dbRdr.ToString("route_number");
                udtRoute.CompanyID = dbRdr.ToInt32("company_id");
                udtRoute.DriverID = dbRdr.ToInt32("driver_id");
                udtRoute.Driver = dbRdr.ToString("driver_name");
                udtRoute.SvcDuration = dbRdr.ToDouble("service_duration");
                udtRoute.Start = dbRdr.ToString("start");
                udtRoute.StartDate = dbRdr.ToDateTime("start_date");
                udtRoute.End = dbRdr.ToString("end");
                udtRoute.EndDate = dbRdr.ToDateTime("end_date");
                udtRoute.Distance = dbRdr.ToDouble("total_distance");
                udtRoute.Journey = dbRdr.ToDouble("total_driving_time");
                udtRoute.SvcTime = dbRdr.ToDouble("total_serving_time");
                udtRoute.Flag = dbRdr.ToInt32("flag");
                udtRoute.Status = dbRdr.ToString("status");
            }
            catch (Exception ex)
            {
                Logger.LogEvent(mProjName, "BuildRoute ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtRoute;
         }

        public static RouteLocationInfo BuildRouteLocation(MySqlDataReader dbRdr)
        {
            RouteLocationInfo udtLocation = new RouteLocationInfo();
            try
            {
                // set users parameters
                udtLocation.LocationID = dbRdr.ToInt64("loc_id");
                udtLocation.Segment = dbRdr.ToString("segment");
                udtLocation.LocationFrom = dbRdr.ToString("location_from");
                udtLocation.LocationTo = dbRdr.ToString("location_to");
                udtLocation.Duration = dbRdr.ToDouble("duration");
                udtLocation.Distance = dbRdr.ToDouble("distance");
                udtLocation.ServiceTime = dbRdr.ToDouble("svc_time");
                udtLocation.ETArrival = dbRdr.ToDateTime("et_arrival");
                udtLocation.ETDeparture = dbRdr.ToDateTime("et_departure");
                udtLocation.DriverID = dbRdr.ToInt32("driver_id");
                udtLocation.Driver = dbRdr.ToString("driver_name");
                udtLocation.Flag = dbRdr.ToInt32("flag");
                udtLocation.Status = dbRdr.ToString("status");
                udtLocation.RouteID = dbRdr.ToInt64("route_id");
                udtLocation.CompanyID = dbRdr.ToInt32("company_id");
                udtLocation.WaypointID = dbRdr.ToInt32("waypoint_id");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildRouteLocation ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtLocation;
        }

        public static RouteSalesOrderInfo BuildRouteSalesOrderLocation(MySqlDataReader dbRdr)
        {
            RouteSalesOrderInfo udtSO = new RouteSalesOrderInfo();
            try
            {
                // set users parameters
                udtSO.SalesOrderID = dbRdr.ToInt64("sales_order_id");
                udtSO.LocationID = dbRdr.ToInt64("loc_id");
                udtSO.Timestamp = dbRdr.ToDateTime("timestamp");
                udtSO.RxTime = dbRdr.ToDateTime("rx_time");
                udtSO.OrderNo = dbRdr.ToString("order_no");
                udtSO.BillingName = dbRdr.ToString("billing_name");
                udtSO.BillingAddress = dbRdr.ToString("billing_address");
                udtSO.BillingPhone = dbRdr.ToString("billing_phone");
                udtSO.BillingMobile = dbRdr.ToString("billing_mobile");
                udtSO.BillingEmail = dbRdr.ToString("billing_email");
                udtSO.ShippingName = dbRdr.ToString("shipping_name");
                udtSO.ShippingAddress = dbRdr.ToString("shipping_address");
                udtSO.ShippingPhone = dbRdr.ToString("shipping_phone");
                udtSO.ShippingMobile = dbRdr.ToString("shipping_mobile");
                udtSO.ShippingEmail = dbRdr.ToString("shipping_email");
                udtSO.Remarks = dbRdr.ToString("remarks");
                udtSO.Flag = dbRdr.ToInt32("flag");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildRouteSalesOrderLocation ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtSO;
        }
        public static RouteSalesItemInfo BuildRouteSalesItemLocation(MySqlDataReader dbRdr)
        {
            RouteSalesItemInfo udtSI = new RouteSalesItemInfo();
            try
            {
                // set users parameters
                udtSI.SalesItemID = dbRdr.ToInt64("sales_item_id");
                udtSI.SalesOrderID = dbRdr.ToInt64("sales_order_id");
                udtSI.ReferenceNo = dbRdr.ToString("reference_no");
                udtSI.Item = dbRdr.ToString("item");
                udtSI.Description = dbRdr.ToString("description");
                udtSI.Quantity = dbRdr.ToDouble("quantity");
                udtSI.Price = dbRdr.ToDouble("price");
                udtSI.TotalPrice = dbRdr.ToDouble("total_price");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildRouteSalesItemLocation ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtSI;
        }

        public static ServicingInfo BuildService(MySqlDataReader dbRdr)
        {
            ServicingInfo udtService = new ServicingInfo();
            try
            {
                // set users parameters
                udtService.ServiceID = dbRdr.ToInt64("service_id");
                udtService.CompanyName = dbRdr.ToString("company");
                udtService.CompanyID = dbRdr.ToInt32("company_id");
                udtService.AssetID = dbRdr.ToInt64("asset_id");
                udtService.Asset = dbRdr.ToString("asset");
                udtService.DriverID = dbRdr.ToInt32("driver_id");
                udtService.Driver = dbRdr.ToString("driver_name");
                udtService.ServiceTypeID = dbRdr.ToInt32("service_type_id");
                udtService.Services = dbRdr.ToString("services");
                udtService.Timestamp = dbRdr.ToDateTime("timestamp");
                udtService.RxTime = dbRdr.ToDateTime("rx_time");
                udtService.Invoice = dbRdr.ToString("invoice");
                udtService.Odometer = dbRdr.ToDouble("odometer");
                udtService.Price = dbRdr.ToDouble("price");
                udtService.Address = dbRdr.ToString("address");
                udtService.Remarks = dbRdr.ToString("remarks");
                udtService.Platform = dbRdr.ToInt32("platform");
                udtService.Flag = dbRdr.ToInt32("flag");
                udtService.Status = dbRdr.ToString("status");
            }
            catch (Exception ex)
            {
                Logger.LogEvent(mProjName, "BuildService ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtService;
        }

        public static MakeInfo BuildMake(MySqlDataReader dbRdr)
        {
            MakeInfo udtMake = new MakeInfo();
            try
            {
                // set users parameters
                udtMake.MakeID = dbRdr.ToInt32("make_id");
                udtMake.Make = dbRdr.ToString("make");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildMake ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtMake;
        }


        public static FlagValueInfo BuildStatusFlagValue(MySqlDataReader dbRdr)
        {
            FlagValueInfo udtFlag = new FlagValueInfo();
            try
            {
                // set users parameters
                udtFlag.FlagID = dbRdr.ToInt32("route_status_id");
                udtFlag.FlagValue = dbRdr.ToString("status");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildStatusFlagValue ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtFlag;
        }

        public static FlagValueInfo BuildStatusFlag(MySqlDataReader dbRdr)
        {
            FlagValueInfo udtFlag = new FlagValueInfo();
            try
            {
                // set users parameters
                udtFlag.FlagID = dbRdr.ToInt32("flag_id");
                udtFlag.FlagValue = dbRdr.ToString("status");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildStatusFlag ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtFlag;
        }

        public static TransmissionInfo BuildTransmission(MySqlDataReader dbRdr)
        {
            TransmissionInfo udtTransmission = new TransmissionInfo();
            try
            {
                udtTransmission.TransmissionID = dbRdr.ToInt32("transmission_id");
                udtTransmission.Name = dbRdr.ToString("name");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildTransmission ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtTransmission;
        }

        public static FuelTypeInfo BuildFuelType(MySqlDataReader dbRdr)
        {
            FuelTypeInfo udtFuelType = new FuelTypeInfo();
            try
            {
                udtFuelType.FuelTypeID = dbRdr.ToInt32("fueltype_id");
                udtFuelType.Name = dbRdr.ToString("name");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildFuelType ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtFuelType;
        }

        public static ServiceTypeInfo BuildServiceType(MySqlDataReader dbRdr)
        {
            ServiceTypeInfo udtServiceType = new ServiceTypeInfo();
            try
            {
                udtServiceType.ServiceTypeID = dbRdr.ToInt32("service_type_id");
                udtServiceType.Name = dbRdr.ToString("name");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildServiceType ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtServiceType;
        }

        public static ContractTypeInfo BuildContractType(MySqlDataReader dbRdr)
        {
            ContractTypeInfo udtServiceType = new ContractTypeInfo();
            try
            {
                udtServiceType.ContractTypeID = dbRdr.ToInt32("contract_type_id");
                udtServiceType.Name = dbRdr.ToString("name");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildContractType ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtServiceType;
        }

        public static NotificationIntervalInfo BuildNotificationInterval(MySqlDataReader dbRdr)
        {
            NotificationIntervalInfo udtNotif = new NotificationIntervalInfo();
            try
            {
                udtNotif.NotifID = dbRdr.ToInt32("notif_id");
                udtNotif.Unit = dbRdr.ToInt32("unit");
                udtNotif.UnitID = dbRdr.ToInt32("unit_id");
                udtNotif.Description = dbRdr.ToString("description");
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(mProjName, "BuildNotificationInterval ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtNotif;
        }

        public static ContractInfo BuildContracts(MySqlDataReader dbRdr)
        {
            ContractInfo udtContract = new ContractInfo();
            try
            {
                // set users parameters
                udtContract.ContractID = dbRdr.ToInt64("contract_id");
                udtContract.CompanyID = dbRdr.ToInt32("company_id");
                udtContract.Timestamp = dbRdr.ToDateTime("timestamp");
                udtContract.RxTime = dbRdr.ToDateTime("rx_time");
                udtContract.UserID = dbRdr.ToInt32("user_id");
                udtContract.AssetID = dbRdr.ToInt64("asset_id");
                udtContract.Asset = dbRdr.ToString("asset_name");
                udtContract.DriverID = dbRdr.ToInt32("driver_id");
                udtContract.DriverName = dbRdr.ToString("driver_name");
                udtContract.Name = dbRdr.ToString("contract_name");
                udtContract.ContractNo = dbRdr.ToString("contract_no");
                udtContract.ContractTypeID = dbRdr.ToInt32("contract_type_id");
                udtContract.ContractType = dbRdr.ToString("contract_type_name");
                udtContract.InvoiceDate = dbRdr.ToDateTime("invoice_date");
                udtContract.ContractStart = dbRdr.ToDateTime("contract_start");
                udtContract.ContractEnd = dbRdr.ToDateTime("contract_end");
                udtContract.ContractInterval = dbRdr.ToString("contract_interval");
                udtContract.NotificationInterval = dbRdr.ToString("notification_interval");
                udtContract.TermsAndConditions = dbRdr.ToString("terms_and_conditions");
                udtContract.OdometerAtCreation = dbRdr.ToDouble("odometer");
                udtContract.ContractPrice = dbRdr.ToDouble("contract_price");
                udtContract.Email = dbRdr.ToString("email");
                udtContract.Phone = dbRdr.ToString("phone");
            }
            catch (Exception ex)
            {
                Logger.LogEvent(mProjName, "BuildContracts ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtContract;
        }

        public static ContractAlertInfo BuildContractAlerts(MySqlDataReader dbRdr)
        {
            ContractAlertInfo udtContract = new ContractAlertInfo();
            try
            {
                // set users parameters
                udtContract.ContractAlertID = dbRdr.ToInt64("contract_alert_id");
                udtContract.ContractID = dbRdr.ToInt64("contract_id");
                udtContract.AlertDate = dbRdr.ToDateTime("alert_date");
                udtContract.Timestamp = dbRdr.ToDateTime("timestamp");
                udtContract.RxTime = dbRdr.ToDateTime("rx_time");
                udtContract.ContractCancelled = dbRdr.ToDateTime("contract_cancelled");
                udtContract.CancelRemarks = dbRdr.ToString("cancel_remarks");
                udtContract.CompanyID = dbRdr.ToInt32("company_id");
                udtContract.isSent = dbRdr.ToInt32("isSent");
                udtContract.Flag = dbRdr.ToInt32("flag");
                udtContract.FlagValue = dbRdr.ToString("status");

            }
            catch (Exception ex)
            {
                Logger.LogEvent(mProjName, "BuildContractAlerts ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return udtContract;
        }

    }
}