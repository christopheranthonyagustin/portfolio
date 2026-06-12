using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    /// <summary>
    ///  utilization report info
    /// </summary>
    public class UtilizeReport
    {
        public long UtilID { get; set; }
        public int AssetID { get; set; }
        public string Asset { get; set; }
        public string Driver { get; set; }
        public int CategoryID { get; set; }
         public string Category { get; set; }
        public string Tag { get; set; }
        public DateTime Date { get; set; }
        public string DateEx { get; set; }
        public DateTime StartTime { get; set; }
        public string StartTimeEx { get; set; }
        public DateTime EndTime { get; set; }
        public string EndTimeEx { get; set; }
        public string TotalTime { get; set; }
        public double Stop1 { get; set; }
        public string Stop1Ex { get; set; }
        public double Stop2 { get; set; }
        public string Stop2Ex { get; set; }
        public double Idle { get; set; }
        public string Idle1Ex { get; set; }
        public string Idle2Ex { get; set; }
        public double Move { get; set; }
        public string Move1Ex { get; set; }
        public string Move2Ex { get; set; }
        public int StopCount { get; set; }
        public double Mileage { get; set; }
        public DateTime LastIgnition { get; set; }
        public double Idle1ExMins { get; set; }
        public double AveIdle1ExMins { get; set; }
        public string Location { get; set; }
    }
}