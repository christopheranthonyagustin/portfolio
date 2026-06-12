using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    public class MaintenanceCalJobInfo
    {
        public long MaintenanceJobID { get; set; }
        public DateTime Timestamp { get; set; }
        public DateTime RxTime { get; set; }
        public int Flag { get; set; }
        public string FlagValue { get; set; }
        public List<MainPestTreatmentInfo> Pest { get; set; }
        public int DriverID { get; set; }
        public string DriverName { get; set; }
        public string Technician { get; set; }
        public string CusCompany { get; set; }
        public string Address { get; set; }
        public string Unit { get; set; }
        public string Postal { get; set; }
        public int AssetCompanyID { get; set; }
        //public AcInfo AcInfo { get; set; }
        //public AcMyInfo AcMyInfo { get; set; }
        public string Site { get; set; }
        public string Remarks { get; set; }
        public string GeneralLocation { get; set; }
        public string Groups { get; set; }
    }
}