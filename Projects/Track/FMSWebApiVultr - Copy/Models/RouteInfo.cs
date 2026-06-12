using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    /// <summary>
    /// zone info
    /// </summary>
    public class RouteInfo
    {
        public long RouteID { get; set; }
        public int CompanyID { get; set; }
        public string RouteName { get; set; }
        public string RouteNo { get; set; }
        public int DriverID { get; set; }
        public string Driver { get; set; }
        public double SvcDuration { get; set; }
        public string Start { get; set; }
        public string End { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public double Distance { get; set; }
        public double Journey { get; set; }
        public double SvcTime { get; set; }
        public List<RouteLocationInfo> Locations { get; set; }
        public int Flag { get; set; }
        public string Status { get; set; }

    }
}