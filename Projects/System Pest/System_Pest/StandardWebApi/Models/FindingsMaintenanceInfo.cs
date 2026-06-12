using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    /// <summary>
    /// zone info
    /// </summary>
    public class FindingsMaintenanceInfo
    {
        public long FindingsMaintenanceID { get; set; }
        public long MaintenanceJobID { get; set; }
        public string PestDesc { get; set; }
        public string AocDesc { get; set; }
        public string Findings { get; set; }
        public int ItemNo { get; set; }

    }
}