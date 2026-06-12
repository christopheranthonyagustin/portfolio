using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    public class BcRankingInfo
    {
        public int DrvNo { get; set; }
        public int LDW { get; set; }
        public int HW { get; set; }
        public int FCW { get; set; }
        public int PCW { get; set; }
        public int TotalLDW { get; set; }
        public int TotalEvents { get; set; }
        public string DepotID { get; set; }
        public string InterchangeID { get; set; }
        public string SvcNo { get; set; }
        public DateTime Timestamp { get; set; }
        public DateTime RxTime { get; set; }
        public string Criteria { get; set; }
        public string Performance { get; set; }
        public int LIMIT { get; set; }

    }
}