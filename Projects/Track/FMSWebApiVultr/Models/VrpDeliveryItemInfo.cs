using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    /// <summary>
    /// zone info
    /// </summary>
    public class VrpDeliveryItemInfo
    {
        public long DeliveryItemID { get; set; }
        public long DeliveryID { get; set; }
        public string RouteNo { get; set; }
        public DateTime Timestamp { get; set; }
        public DateTime RxTime { get; set; }
        public string ReferenceNo { get; set; }
        public string ItemName { get; set; }
        public string Description { get; set; }
        public double Price { get; set; }
        public double TotalPrice { get; set; }
        public double Weight { get; set; }
        public double Width { get; set; }
        public double Height { get; set; }
        public double Length { get; set; }
        public double Volume { get; set; }
        public int StockType { get; set; }
        public double PreviousQuantity { get; set; }
        public int Quantity { get; set; }
        public string Remarks { get; set; }
        public string FeatureID { get; set; }
        public string Features { get; set; }
        public int ItemNo { get; set; }
        public int Flag { get; set; }
        public long MainInventoryItemID { get; set; }
        public long SubInventoryItemID { get; set; }
        public long PickupID { get; set; }
        public int PickupFlag { get; set; }
        public long CompanyID { get; set; }
        public string Category { get; set; }
    }
}