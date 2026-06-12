using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    /// <summary>
    /// trip info
    /// </summary>
    public class TripInfo
    {
        public long TripID { get; set; }
        public int PlanID { get; set; }
        public int AssetID { get; set; }
        public string Asset { get; set; }
        public string Tag { get; set; }
        public string Driver { get; set; }
        public int OriginID { get; set; }
        public string Origin { get; set; }
        public DateTime OriginEnter { get; set; }
        public DateTime OriginExit { get; set; }
        public string OriginDuration { get; set; }
        public int DestinationID { get; set; }
        public string Destination { get; set; }
        public DateTime DestinationEnter { get; set; }
        public DateTime DestinationExit { get; set; }
        public string DestinationDuration { get; set; }
        public string TravelDuration { get; set; }
        public double Mileage { get; set; }
        public double Price { get; set; }
        public double Diesel { get; set; }
    }
}