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
        public string RouteName { get; set; }
        public int AssetID { get; set; }
        public double SvcDuration { get; set; }
        public string Start { get; set; }
        public string End { get; set; }
        public double Distance { get; set; }
        public double Journey { get; set; }
        public double SvcTime { get; set; }
        public DateTime Timestamp { get; set; }
        public DateTime RxTime { get; set; }

    }
}