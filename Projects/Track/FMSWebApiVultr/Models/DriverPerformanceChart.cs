using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace FMSWebApi.Models
{
    /// <summary>
    /// company info
    /// </summary>
    public class VrpDriverPerformanceChart
    {
        [IgnoreDataMember]
        public int CompanyID { get; set; }
        [IgnoreDataMember]
        public DateTime EstDepartureTime { get; set; }
        [IgnoreDataMember]
        public DateTime EstArrivalTime { get; set; }
        [IgnoreDataMember]
        public long DriverID { get; set; }
        public string DriverName { get; set; }
        public int DepartureOnTime { get; set; }
        public int DepartureLate { get; set; }
        public int ArrivalOnTime { get; set; }
        public int ArrivalLate { get; set; }
        public int IncompleteJob { get; set; }
        public int TotalJobDuration { get; set; }

    }
}