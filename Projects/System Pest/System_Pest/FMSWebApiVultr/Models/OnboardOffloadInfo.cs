using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    /// <summary>
    /// asset info and status
    /// </summary>
    public class OnboardOffloadInfo
    {
        public string Tag { get; set; }
        public int DriverID { get; set; }
        public string DriverName { get; set; }
        public DateTime Timestamp { get; set; }
        public DateTime RxTime { get; set; } 
        public string Patient { get; set; }
        public string Origin { get; set; }
        public string Destination { get; set; }
        public string JobNumber { get; set; }
        public string ErrorMessage { get; set; }
    }
}