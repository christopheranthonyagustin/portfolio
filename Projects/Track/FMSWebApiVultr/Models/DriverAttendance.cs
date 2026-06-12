using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    /// <summary>
    /// company info
    /// </summary>
    public class DriverAttendance
    {

        public long DriverReportID { get; set; }
        public long DriverID { get; set; }
        public string DriverName { get; set; }
        public DateTime ScheduledWorkTimeStart { get; set; }
        public DateTime ActualWorkTimeStart { get; set; }
        public string LocationWorkTimeStart { get; set; }
        public string StatusWorkTimeStart { get; set; }
        public DateTime ScheduledWorkTimeEnd { get; set; }
        public DateTime ActualWorkTimeEnd { get; set; }
        public string LocationWorkTimeEnd { get; set; }
        public string StatusWorkTimeEnd { get; set; }

        public double ActualWorkDuration { get; set; }

    }
}