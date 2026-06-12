using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    /// <summary>
    /// zone info
    /// </summary>
    public class InterchangeInfo
    {
        public int InterchangeID { get; set; }
        public string Name { get; set; }
        public int DepotID { get; set; }
        public string Desc { get; set; }
        public string Depot { get; set; }
        public string ErrorMessage { get; set; }

    }
}