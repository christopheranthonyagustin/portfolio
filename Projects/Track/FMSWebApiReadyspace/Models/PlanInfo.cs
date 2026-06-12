using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    /// <summary>
    /// asset info and status
    /// </summary>
    public class PlanInfo
    {
        public int PlanID { get; set; }
        public int OriginID { get; set; }
        public string Origin { get; set; }
        public int DestinationID { get; set; }
        public string Destination { get; set; }
        public double Duration { get; set; }
        public string DurationEx { get; set; }
        public double Price { get; set; }
        public string Company { get; set; }
        public DateTime Timestamp { get; set; }
        public DateTime LastTrip { get; set; }
    }
}