using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    /// <summary>
    /// zone info
    /// </summary>
    public class DistrictInfo
    {
        public long DistrictID { get; set; }
        public long CompanyID { get; set; }
        public int PostalDistrict { get; set; }
        public int PostalSector { get; set; }
        public string GeneralLocation { get; set; }
        public long RegionID { get; set; }
    }
}