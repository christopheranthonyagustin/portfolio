using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    /// <summary>
    /// zone info
    /// </summary>
    public class VrpPickupDeliveryInfo
    {
        public long PickupDeliveryID { get; set; }
        public string RouteNo { get; set; }
        public long PickupID { get; set; }
        public long DeliveryID { get; set; }
        public string PickupFromID { get; set; }
        public string OrderType { get; set; }
        public string OrderNo { get; set; }
        public int PriorityID { get; set; }
        public long DriverID { get; set; }
        public string Driver { get; set; }
        public string Features { get; set; }
        public string Accessories { get; set; }
        public double Lat { get; set; }
        public double Long { get; set; }
        public string Address { get; set; }
        public string Unit { get; set; }
        public string Postal { get; set; }
        public int ServiceDuration { get; set; }
        public double TotalWeight { get; set; }
        public double TotalVolume { get; set; }
        public int LoadDuration { get; set; }
        public int UnLoadDuration { get; set; }
        public int WaitingDuration { get; set; }
        public DateTime TimeWindowStart { get; set; }
        public DateTime TimeWindowEnd { get; set; }
        public int isAssign { get; set; }
        public int Flag { get; set; }
        public long CompanyID { get; set; }
        public string OrderForm { get; set; }
        public string OrderFormFill { get; set; }
        public string DriverSign { get; set; }
        public string DriverSignFill { get; set; }
        public string RecipientSign { get; set; }
        public string RecipientSignFill { get; set; }
        public string Platform { get; set; }

    }
}