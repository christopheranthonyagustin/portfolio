using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    /// <summary>
    /// zone info
    /// </summary>
    public class LocationInfo
    {
        public long LocationID { get; set; }
        public string Segment { get; set; }
        public string LocationFrom { get; set; }
        public string LocationTo { get; set; }
        public double Duration { get; set; }
        public double Distance { get; set; }
        public DateTime ETArrival { get; set; }
        public DateTime ETDeparture { get; set; }
        public int Flag { get; set; }
    }
}