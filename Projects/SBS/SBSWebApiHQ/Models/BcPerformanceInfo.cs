using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    public class BcPerformanceInfo
    {
        public int RangeID { get; set; }
        public string IndexValue { get; set; }
        public int RangeCount { get; set; }
        //public string DepotID1 { get; set; }
        //public string DepotID2 { get; set; }
        public string DrvNo1 { get; set; }
        public string DrvNo2 { get; set; }
        public DateTime Timestamp1 { get; set; }
        public DateTime RxTime1 { get; set; }
        public DateTime Timestamp2 { get; set; }
        public DateTime RxTime2 { get; set; }
        public string Criteria { get; set; }

    }
}