using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Runtime.Serialization;

namespace FMSWebApi.Models
{
    /// <summary>
    /// zone info
    /// </summary>
    public class VrpRouteInfo
    {
        public long VrpRouteID { get; set; }
        public string RouteNo { get; set; }
        public long AssetID { get; set; }
        public string Asset { get; set; }
        public long DriverID { get; set; }
        public string Driver { get; set; }
        public string OrderType { get; set; }
        public string PickupID { get; set; }
        public string DeliveryID { get; set; }
        public string PickupFromID { get; set; }
        public double RouteDistance { get; set; }
        public int RouteTime { get; set; }
        //[IgnoreDataMember]
        public DateTime CurrentArrivalTime { get; set; }
        public DateTime ArrivalTime { get; set; }
        //[IgnoreDataMember]
        public DateTime CurrentDepartureTime { get; set; }
        public DateTime DepartureTime { get; set; }
        public int Scenario { get; set; }
        public int Sequence { get; set; }
        public string Status { get; set; }
        public string Features { get; set; }
        public string Accessories { get; set; }
        public int Flag { get; set; }
        public DateTime Timestamp { get; set; }
        public DateTime RxTime { get; set; }
        public double TotalWeight { get; set; }
        public double TotalVolume { get; set; }
        public int ServiceDuration { get; set; }
        public int LoadDuration { get; set; }
        public int UnLoadDuration { get; set; }
        public int WaitingDuration { get; set; }
        public int PriorityID { get; set; }
        public double Lat { get; set; }
        public double Long { get; set; }
        public DateTime TimeWindowStart { get; set; }
        public DateTime TimeWindowEnd { get; set; }
        public string Address { get; set; }
       
    }
}