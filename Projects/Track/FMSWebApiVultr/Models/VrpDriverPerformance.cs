using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    /// <summary>
    /// company info
    /// </summary>
    public class VrpDriverPerformance
    {

        public long VRPRouteReportsID { get; set; }
        public long VRPRoutesID { get; set; }
        public long FromVRPRoutesID { get; set; }
        public string FromAddress { get; set; }
        public string ToAddress { get; set; }
        public long DriverID { get; set; }
        public string DriverName { get; set; }
        public DateTime EstDepartureTime { get; set; }
        public DateTime ActualDepartureTime { get; set; }
        public string StatusDepartureTime { get; set; }
        public DateTime EstArrivalTime { get; set; }
        public DateTime ActualArrivalTime { get; set; }
        public string StatusArrivalTime { get; set; }
        public double TravelDuration { get; set; }
        public DateTime JobStartTime { get; set; }
        public DateTime JobEndTime { get; set; }
        public double JobDuration { get; set; }
        public double EstJobDuration { get; set; }
        public int CompanyID { get; set; }

    }
}