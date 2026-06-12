using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    /// <summary>
    /// zone info
    /// </summary>
    public class RouteSalesOrderInfo
    {
        public long SalesOrderID { get; set; }
        public long LocationID { get; set; }
        public DateTime Timestamp { get; set; }
        public DateTime RxTime { get; set; }
        public string OrderNo { get; set; }
        public string BillingName { get; set; }
        public string BillingAddress { get; set; }
        public string BillingPhone { get; set; }
        public string BillingMobile { get; set; }
        public string BillingEmail { get; set; }
        public string ShippingName { get; set; }
        public string ShippingAddress { get; set; }
        public string ShippingPhone { get; set; }
        public string ShippingMobile { get; set; }
        public string ShippingEmail { get; set; }
        public string Remarks { get; set; }
        public int Flag { get; set; }
        public string Forms { get; set; }
        public string FormsFill { get; set; }
    }
}