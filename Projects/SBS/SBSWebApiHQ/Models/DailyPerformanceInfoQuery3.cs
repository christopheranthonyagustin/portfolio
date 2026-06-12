using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    public class DailyPerformanceInfoQuery3
    {
        public int LDW { get; set; }
        public int HW { get; set; }
        public int FCW { get; set; }
        public int PCW { get; set; }
        public int TotalLDW { get; set; }
        public int TotalEvents { get; set; }
        public string DepotID { get; set; }
        public string DrvNo { get; set; }
        public string SvcNo { get; set; }
        public DateTime Timestamp { get; set; }
        public DateTime RxTime { get; set; }

    }
}