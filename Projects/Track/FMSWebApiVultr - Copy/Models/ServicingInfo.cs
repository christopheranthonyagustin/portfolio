using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    /// <summary>
    /// zone info
    /// </summary>
    public class ServicingInfo
    {
        public long ServiceID { get; set; }
        public int CompanyID { get; set; }
        public string CompanyName { get; set; }
        public int AssetID { get; set; }
        public string Asset { get; set; }
        public int DriverID { get; set; }
        public string Driver { get; set; }
        public int ServiceTypeID { get; set; }
        public string Services { get; set; }
        public DateTime Timestamp { get; set; }
        public DateTime RxTime { get; set; }
        public string Invoice { get; set; }
        public double Odometer { get; set; }
        public double Price { get; set; }
        public string Address { get; set; }
        public string Remarks { get; set; }
        public int Platform { get; set; }
        public int Flag { get; set; }
        public string Status { get; set; }

    }
}