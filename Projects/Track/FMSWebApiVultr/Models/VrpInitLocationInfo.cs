using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    public class VrpInitLocationInfo
    {
        public long InitialLocationID { get; set; }
        public string RouteNo { get; set; }
        public double Lat { get; set; }
        public double Long { get; set; }
        public string Address { get; set; }
        public int Demands { get; set; }
        public int ServiceDuration { get; set; }
        public int LoadDuration { get; set; }
        public int UnloadDuration { get; set; }
        public int WaitingDuration { get; set; }
        public int ItemNo { get; set; }
        public int Node { get; set; }
        public int DeliverToNode { get; set; }
        public DateTime TimeWindowStart { get; set; }
        public DateTime TimeWindowEnd { get; set; }
    }
}
