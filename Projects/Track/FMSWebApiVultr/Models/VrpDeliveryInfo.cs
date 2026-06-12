using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    /// <summary>
    /// zone info
    /// </summary>
    public class VrpDeliveryInfo
    {
        public long DeliveryID { get; set; }
        public string RouteNo { get; set; }
        public int PriorityID { get; set; }
        public long DriverID { get; set; }
        public string Driver { get; set; }
        public DateTime Timestamp { get; set; }
        public DateTime RxTime { get; set; }
        public long CustomerID { get; set; }
        public string Customer { get; set; }
        public string OrderNo { get; set; }
        public long AssignID { get; set; }
        public int WaitingDuration { get; set; }
        public int ServiceDuration { get; set; }
        public int UnLoadDuration { get; set; }
        public DateTime TimeWindowStart { get; set; }
        public DateTime TimeWindowEnd { get; set; }
        public string Remarks { get; set; }
        public string Name { get; set; }
        public double Lat { get; set; }
        public double Long { get; set; }
        public string BillingName { get; set; }
        public string BillingAddress { get; set; }
        public string BillingUnit { get; set; }
        public string BillingBuilding { get; set; }
        public string BillingPostal { get; set; }
        public string BillingPhone { get; set; }
        public string BillingMobile { get; set; }
        public string BillingEmail { get; set; }
        public string ShippingName { get; set; }
        public string ShippingAddress { get; set; }
        public string ShippingUnit { get; set; }
        public string ShippingBuilding { get; set; }
        public string ShippingPostal { get; set; }
        public string ShippingPhone { get; set; }
        public string ShippingMobile { get; set; }
        public string ShippingEmail { get; set; }
        public double Amount { get; set; }
        public string Accessories { get; set; }
        public string PickupID { get; set; }
        public string PickupOrderNo { get; set; }
        public int isAssign { get; set; }
        public int Flag { get; set; }
        public int CompanyID { get; set; }
        public string ErrorMessage { get; set; }
        public string DriverRemarks { get; set; }
        public string OrderForm { get; set; }
        public string OrderFormFill { get; set; }
        public string DriverSign { get; set; }
        public string DriverSignFill { get; set; }
        public string RecipientSign { get; set; }
        public string RecipientSignFill { get; set; }
    }
}