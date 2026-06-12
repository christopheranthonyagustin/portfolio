using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    /// <summary>
    /// zone info
    /// </summary>
    public class DriverScheduleInfo
    {
        public long ScheduleID { get; set; }
        public long DriverID { get; set; }
        public TimeSpan TimeStart { get; set; }
        public TimeSpan TimeEnd { get; set; }
        public TimeSpan BreaktimeStart { get; set; }
        public TimeSpan BreaktimeEnd { get; set; }
        public int DayID { get; set; }
        public string Address { get; set; }
        public string Unit { get; set; }
        public string Building { get; set; }
        public string Postal { get; set; }
    }
}