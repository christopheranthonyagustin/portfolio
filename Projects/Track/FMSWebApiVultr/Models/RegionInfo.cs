using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    /// <summary>
    /// zone info
    /// </summary>
    public class RegionInfo
    {
        public long RegionID { get; set; }
        public long CompanyID { get; set; }
        public string RegionName { get; set; }
        public string ErrorMessage { get; set; }
    }
}