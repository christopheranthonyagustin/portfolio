using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    /// <summary>
    /// zone info
    /// </summary>
    public class AcMyInfo
    {
        public int RangeID { get; set; }
        public string Groups { get; set; }
        public int LowerBound { get; set; }
        public int UpperBound { get; set; }
    }
}