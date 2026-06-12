using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FMSWebApi
{
    public class OneMapReverseGeoCodeResponse
    {
        public GeocodeInfo[] GeocodeInfo { get; set; }
        public string error { get; set; }
    }

    public class GeocodeInfo
    {
        public string BUILDINGNAME { get; set; }
        public string BLOCK { get; set; }
        public string ROAD { get; set; }
        public long POSTALCODE { get; set; }
        public double XCOORD { get; set; }
        public double YCOORD { get; set; }
        public double LATITUDE { get; set; }
        public double LONGITUDE { get; set; }
        public double LONGTITUDE { get; set; }

    }


}
