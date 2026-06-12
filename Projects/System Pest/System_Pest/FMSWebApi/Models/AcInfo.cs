using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    /// <summary>
    /// zone info
    /// </summary>
    public class AcInfo
    {
        public int AcID { get; set; }
        public int PostalDistrict { get; set; }
        public int PostalSector { get; set; }
        public string GeneralLocation { get; set; }
        public string Groups { get; set; }

    }
}