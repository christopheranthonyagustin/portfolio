using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    /// <summary>
    ///  utilization report info
    /// </summary>
    public class SummaryInfo
    {
        public long SummaryID { get; set; }
        public int AssetID { get; set; }
        public string Asset { get; set; }
        public string Driver { get; set; }
        public int DriverID { get; set; }
        public DateTime Date { get; set; }
        public DateTime StartTime { get; set; }
        public DateTime EndTime { get; set; }
        public int FCWCount { get; set; }
        public int PCWCount { get; set; }
        public int HMWCount { get; set; }
        public int LDWCount { get; set; }
        public double Mileage { get; set; }

    }
}