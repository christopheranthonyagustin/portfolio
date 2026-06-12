using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    /// <summary>
    /// asset info and status
    /// </summary>
    public class TripZoneInfo
    {
        public long TripsZoneID { get; set; }
        public DateTime Timestamp { get; set; }
        public DateTime RxTime { get; set; }
        public int ZoneID { get; set; }
        public string ZoneName { get; set; }
        public int CompanyID { get; set; }
        public string CompanyName { get; set; }
        public int TripID { get; set; }
        public int AssetID { get; set; }
        public string AssetName { get; set; }
    }
}