using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    /// <summary>
    /// event info
    /// </summary>
    public class IdlingInfo
    {

        public long IdleReportID { get; set; }

        public string Driver { get; set; }

        public int AssetID { get; set; }

        public DateTime IdleStart { get; set; }

        public DateTime IdleEnd { get; set; }

        public string Location { get; set; }
 
        public string ErrorMessage { get; set; }

    }
}