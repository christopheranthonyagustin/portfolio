using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    public class MaintenanceJobApp
    {
        public long MaintenanceJobID { get; set; }
        public long MaintenanceID { get; set; }
        public DateTime AlertDate { get; set; }
        public DateTime Timestamp { get; set; }
        public DateTime RxTime { get; set; }
        public int Flag { get; set; }
        public string FlagValue { get; set; }
        public DateTime JobCancelled { get; set; }
        public string CancelRemarks { get; set; }
        public string AdminRemarks { get; set; }
        public int isSent { get; set; }
        public string ParamFlag { get; set; }
        public List<MainPestTreatmentInfo> Pest { get; set; }
        public List<FindingsMaintenanceInfo> Findings { get; set; }
        public string ReferenceNo { get; set; }
        public int DriverID { get; set; }
        public string DriverName { get; set; }
        public string Technician { get; set; }
        public int AssetID { get; set; }
        public string Asset { get; set; }
        public string CusCompany { get; set; }
        public string PIC { get; set; }
        public string Address { get; set; }
        public string Unit { get; set; }
        public string Postal { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public int AssetCompanyID { get; set; }
        public string Site { get; set; }
        public string Remarks { get; set; }      
    }
}