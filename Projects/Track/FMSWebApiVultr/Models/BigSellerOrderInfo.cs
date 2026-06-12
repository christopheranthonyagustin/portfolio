using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    /// <summary>
    /// zone info
    /// </summary>
    public class BigSellerOrderInfo
    {
        public long OrderID { get; set; }
        public string UploadNo { get; set; }
        public string OrderNo { get; set; }
        public string PackageNo { get; set; }
        public string MainPackageNo { get; set; }
        public string InvoiceNo { get; set; }
        public string Marketplace { get; set; }
        public string BigSellerStoreNickname { get; set; }
        public string StorenameMarketplace { get; set; }
        public string SellerName { get; set; }
        public string OrderStatus { get; set; }

        public string OrderType { get; set; }
        public string MarketplaceStatus { get; set; }
        public DateTime OrderTime { get; set; }
        public DateTime OrderPaidTime { get; set; }
        public DateTime ExpireTime { get; set; }
        public DateTime OrderShippedTime { get; set; }
        public DateTime PackedTime { get; set; }
        public DateTime PrintedTime { get; set; }
        public DateTime CancelTime { get; set; }
        public string BuyerMessage { get; set; }
        public string UserName  { get; set; }
        public string ReceiverName { get; set; }
        public string PhoneNumber { get; set; }
        public string DeliveryAddress { get; set; }
        public string Town { get; set; }
        public int District { get; set; }
        public string City { get; set; }
        public string Province { get; set; }
        public string Country { get; set; }
        public int PostCode { get; set; }
        public string ProductName { get; set; }
        public string SKU { get; set; }
        public string VariationName { get; set; }
        public string ImageLink { get; set; }
        public double Price { get; set; }
        public int Quantity { get; set; }
        public double ProductSubtotal { get; set; }
        public string MerchantSKU { get; set; }
        public string Title { get; set; }
        public double CommodityCost { get; set; }
        public double ReferencePrice { get; set; }
        public string BuyerDesignLogistics { get; set; }
        public string ShippingOption { get; set; }
        public string CargoCarryMethod { get; set; }
        public string TrackingNumber { get; set; }
        public double PackageWeight { get; set; }
        public string PaymentMethod { get; set; }
        public double OrderTotal { get; set; }
        public double Voucher { get; set; }
        public double StoreVoucher { get; set; }
        public double ManagementFee { get; set; }
        public double TransactionFee { get; set; }
        public string Currency { get; set; }
        public double ShippingFee { get; set; }
        public double SellerDiscount { get; set; }
        public double MarketplaceDiscount { get; set; }
        public double SellerShippingDiscount { get; set; }
        public double MarketplaceShippingDiscount { get; set; }
        public string SellerNote { get; set; }
        public string NoteForCS { get; set; }
        public string NoteForPick { get; set; }
        public string OrderMark { get; set; }
        public string ShippingWarehouse { get; set; }
        public string Shelf { get; set; }
        public string StockOut { get; set; }
        public string StockIn { get; set; }
        public string ShippingFeePaidBySeller { get; set; }
        public int CompanyID { get; set; }
        public string Token { get; set; }
        public string ErrorMessage { get; set; }
    }
}