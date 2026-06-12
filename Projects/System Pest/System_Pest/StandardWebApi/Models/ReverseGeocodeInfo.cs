using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    public class ReverseGeocodeInfo
    {
        public double PosX { get; set; }
        public double PosY { get; set; }
        public string Location { get; set; }     
    }
}