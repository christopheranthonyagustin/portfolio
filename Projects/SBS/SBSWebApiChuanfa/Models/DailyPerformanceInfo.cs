using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    public class DailyPerformanceInfo
    {
        public string DepotID { get; set; }
        public string DrvNo { get; set; }
        public string SvcNo { get; set; }
        public DateTime Timestamp { get; set; }
        public DateTime RxTime { get; set; }
        public List<DailyPerformanceInfoQuery1> Query1 { get; set; }
        public DailyPerformanceInfoQuery2 Query2 { get; set; }
        public DailyPerformanceInfoQuery3 Query3 { get; set; }
    }
}