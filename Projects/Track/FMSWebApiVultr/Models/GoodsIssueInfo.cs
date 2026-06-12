using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    /// <summary>
    /// zone info
    /// </summary>
    //public class GoodsIssueInfo
    //{
    //    public Order Order { get; set; }
    //}

    public class Order
    {
        public string IncomingCode { get; set; }
        public string AccountCode { get; set; }
        public string SalesOrderNo { get; set; }
        public DateTime SalesOrderDate { get; set; }
        public string OrderType { get; set; }
        public string OrderPriority { get; set; }
        public DateTime ExpectedDate { get; set; }
        public string PurchaseOrderNo { get; set; }
        public string SiteCode { get; set; }
        public string OrderBy { get; set; }
        public string ShipToCode { get; set; }
        public string ShipToName { get; set; }
        public string ShipToAddress1 { get; set; }
        public string ShipToAddress2 { get; set; }
        public string ShipToAddress3 { get; set; }
        public string ShipToAddress4 { get; set; }
        public string ShipToCountryCode { get; set; }
        public int ShipToPostalCode { get; set; }
        public string ShipToContactPerson { get; set; }
        public string RouteCode { get; set; }
        public string SoldToCode { get; set; }
        public string SoldToName { get; set; }
        public string SoldToAddress { get; set; }
        public string SoldToCountryCode { get; set; }
        public int SoldToPostalCode { get; set; }
        public string Remarks1 { get; set; }
        public string Remarks2 { get; set; }
        public string OnlinePlatform { get; set; }
        public string StoreName { get; set; }
        public string TransporterCode { get; set; }
        public string DeliveryTrackingId { get; set; }
        //public OrderLines[] OrderLines { get; set; }
        public List<OrderLines> OrderLines { get; set; }

    }
    public class RTS
    {
        public string IncomingCode { get; set; }
        public string AccountCode { get; set; }
        public string SalesOrderNo { get; set; }
        public string OnlinePlatform { get; set; }
        public string DeliveryTrackingId { get; set; }

    }
    public class Ship
    {
        public string IncomingCode { get; set; }
        public string AccountCode { get; set; }
        public string SalesOrderNo { get; set; }
    }
    public class OrderLines
    {
        public int OrderLineNo { get; set; }
        public int OrderQuantity { get; set; }
        public string BundleSKUCode { get; set; }
        public string OrderItemType { get; set; }
        public string SKUCode { get; set; }
        public string UOM { get; set; }
        public string OrderLineRemarks1 { get; set; }
        public string OrderLineRemarks2 { get; set; }
        //public int NominatedLot7 { get; set; }
        //public DateTime NominatedLot1 { get; set; }
    }


}