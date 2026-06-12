using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    public class JobInfo
    {
        public long JobID { get; set; }
        public string JobNumber { get; set; }
        public int DriverID { get; set; }
        public string Driver { get; set; }
        public int CompanyID { get; set; }
        public string Company { get; set; }
        public int ResellerID { get; set; }
        public string Reseller { get; set; }
        public int UserID { get; set; }
        public string User { get; set; }
        public DateTime Timestamp { get; set; }
        public DateTime RxTime { get; set; }
        public DateTime Cancelled { get; set; }
        public string Remarks { get; set; }
        public int Flag { get; set; }
        public string Signature { get; set; }
        public string SignatureFill { get; set; }
        public string Forms { get; set; }
        public string FormsFill { get; set; }

    }
}