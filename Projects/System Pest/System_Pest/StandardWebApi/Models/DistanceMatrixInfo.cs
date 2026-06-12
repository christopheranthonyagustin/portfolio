using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    public class DistanceMatrixInfo
    {
        public string Origin { get; set; }
        public string Destination { get; set; }
        public string Rows { get; set; }
    }
}