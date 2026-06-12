using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    /// <summary>
    /// zone info
    /// </summary>
    public class VrpSettingsAreaInfo
    {
        public long VrpSettingsAreaID { get; set; }
        public long VrpSettingsID { get; set; }
        public long RegionID { get; set; }
        public DateTime Timestamp { get; set; }
        public DateTime RxTime { get; set; }
        public int CompanyID { get; set; }
    }
}