using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    public class SearchJob
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
        public double Amount { get; set; }
        public string PIC { get; set; }
        public string Destination { get; set; }
        public string Phone { get; set; }
        public string Unit { get; set; }
        public int Flag { get; set; }
        public string Remarks { get; set; }
        public string Remarks2 { get; set; }
        public string Receipt { get; set; }
        public string Agent { get; set; }
        public string JobStatus { get; set; }
        public string JobUser { get; set; }
        public string JobType { get; set; }
        public int Postal { get; set; }
        public string CompanyDestination { get; set; }
        public string ErrorMessage { get; set; }
    }
}