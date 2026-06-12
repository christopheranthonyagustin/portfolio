using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    /// <summary>
    /// zone info
    /// </summary>
    public class VrpPickupInfo
    {
        public long PickupID { get; set; }
        public string RouteNo { get; set; }
        public int PriorityID { get; set; }
        public long DriverID { get; set; }
        public string Driver { get; set; }
        public DateTime Timestamp { get; set; }
        public DateTime RxTime { get; set; }
        public long CustomerID { get; set; }
        public string Customer { get; set; }
        public string OrderNo { get; set; }
        public int WaitingDuration { get; set; }
        public int ServiceDuration { get; set; }
        public int LoadDuration { get; set; }
        public DateTime TimeWindowStart { get; set; }
        public DateTime TimeWindowEnd { get; set; }
        public string Remarks { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public string Unit { get; set; }
        public string Building { get; set; }
        public string Postal { get; set; }
        public double Lat { get; set; }
        public double Long { get; set; }
        public string Phone { get; set; }
        public string Mobile { get; set; }
        public string Email { get; set; }
        public double Amount { get; set; }
        public string Accessories { get; set; }
        public int isAssign { get; set; }
        public int Flag { get; set; }
        public int CompanyID { get; set; }
        public string ErrorMessage { get; set; }
        public string DriverRemarks { get; set; }
        public long VrpRouteID { get; set; }
        public bool isIncomplete { get; set; }
        public string OrderForm { get; set; }
        public string OrderFormFill { get; set; }
        public string DriverSign { get; set; }
        public string DriverSignFill { get; set; }
        public string RecipientSign { get; set; }
        public string RecipientSignFill { get; set; }


    }
}