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
        public string FlagValue { get; set; }
        public string Remarks { get; set; }
        public string Receipt { get; set; }
        public int UserID { get; set; }
        public string UserName { get; set; }
        public int DriverID { get; set; }
        public string DriverName { get; set; }
        public int Postal { get; set; }
        public DateTime JobAccepted { get; set; }
        public DateTime JobCompleted { get; set; }
        public string CusEmail { get; set; }
        public string ReportingEmail { get; set; }
        public string Site { get; set; }
        public string Pest { get; set; }
        public DateTime ContractStart { get; set; }
        public DateTime ContractEnd { get; set; }
        public string MaintenanceInterval { get; set; }
        public string NotificationInterval { get; set; }
        public string Image { get; set; }
        public string ImageFill { get; set; }
        public string ErrorMessage { get; set; }
    }
}