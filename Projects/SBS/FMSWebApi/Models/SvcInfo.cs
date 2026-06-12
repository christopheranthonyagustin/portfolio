using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    /// <summary>
    /// zone info
    /// </summary>
    public class SvcInfo
    {
        public int SvcID { get; set; }
        public string SvcNo { get; set; }
        public int InterchangeID { get; set; }
        public string Interchange { get; set; }
        public int DepotID { get; set; }
        public string Depot { get; set; }
        public string ErrorMessage { get; set; }

    }
}