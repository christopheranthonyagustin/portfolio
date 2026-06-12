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
        public string Company { get; set; }
        public int AssetID { get; set; }
        public string Asset { get; set; }
        public DriverInfo DriverInfo { get; set; }
        public int AssetCompanyID { get; set; }
        public string AssetCompany { get; set; }
        public int AssetResellerID { get; set; }
        public string AssetReseller { get; set; }
        public DateTime Timestamp { get; set; }
        public DateTime RxTime { get; set; }
        public string Remarks { get; set; }
		public string ErrorMessage { get; set; }
    }
}