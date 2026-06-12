using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    public class OverallPerformanceInfo
    {
        public string ParamDesc { get; set; }
        public string EventCode { get; set; }
        public double PerfRating { get; set; }
        public int SessionID { get; set; }

    }
}