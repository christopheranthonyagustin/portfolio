using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    public class AppInfo
    {
        public int AssetResellerID { get; set; }
        public int AssetCompanyID { get; set; }
        public int DriverID { get; set; }
        public DateTime Timestamp { get; set; }
        public DateTime RxTime { get; set; }
        public List<JobInfo> Jobs { get; set; }
        //public List<MaintenanceInfo> Maintenance { get; set; }
        public List<MaintenanceJobApp> Maintenance { get; set; }
    }
}