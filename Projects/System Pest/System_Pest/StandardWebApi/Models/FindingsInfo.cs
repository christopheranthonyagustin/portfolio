using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    /// <summary>
    /// zone info
    /// </summary>
    public class FindingsInfo
    {
        public long FindingsID { get; set; }
        public long JobID { get; set; }
        public string PestDesc { get; set; }
        public string AocDesc { get; set; }
        public string Findings { get; set; }
        public int ItemNo { get; set; }

    }
}