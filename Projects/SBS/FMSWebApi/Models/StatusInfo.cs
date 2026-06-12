using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    /// <summary>
    /// zone info
    /// </summary>
    public class StatusInfo
    {
        public int StatusID { get; set; }
        public string StatusDesc { get; set; }
        public int Flag { get; set; }
        public int Type { get; set; }
        public string ErrorMessage { get; set; }

    }
}