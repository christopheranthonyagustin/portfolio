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
    public class DriverAttendanceChart
    {
        [IgnoreDataMember]
        public int CompanyID { get; set; }
        [IgnoreDataMember]
        public DateTime ScheduledWorkTimeStart { get; set; }
        [IgnoreDataMember]
        public DateTime ScheduledWorkTimeEnd { get; set; }
        [IgnoreDataMember]
        public long DriverID { get; set; }
        public string DriverName { get; set; }
        public int WorkTimeStartOnTime { get; set; }
        public int WorkTimeStartLate { get; set; }
        public int WorkTimeEndOnTime { get; set; }
        public int WorkTimeEndEarly { get; set; }
        public int IncompleteTime { get; set; }
        public int TotalWorkDuration { get; set; }

    }
}