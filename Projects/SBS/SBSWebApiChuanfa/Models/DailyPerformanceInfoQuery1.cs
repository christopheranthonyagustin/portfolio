using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    public class DailyPerformanceInfoQuery1
    {
        public DateTime Date { get; set; }
        public double LDW { get; set; }
        public double HW { get; set; }
        public double FCW { get; set; }
        public double PCW { get; set; }
        public double TotalLDW { get; set; }
        public double TotalEvents { get; set; }
        public string DepotID { get; set; }
        public string DrvNo { get; set; }
        public string SvcNo { get; set; }
        public DateTime Timestamp { get; set; }
        public DateTime RxTime { get; set; }

    }
}