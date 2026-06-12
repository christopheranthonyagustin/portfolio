using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FMSWebApi
{
    public class OneMapGeoCodeResponse
    {
        public int found { get; set; }
        public int totalNumPages { get; set; }
        public int pageNum { get; set; }
        public _results[] results { get; set; }
        public string error { get; set; }

    }

    public class _results
    {
        public string SEARCHVAL { get; set; }
        public string BLK_NO { get; set; }
        public string ROAD_NAME { get; set; }
        public string BUILDING { get; set; }
        public string ADDRESS { get; set; }
        public int POSTAL { get; set; }
        public double X { get; set; }
        public double Y { get; set; }
        public double LATITUDE { get; set; }
        public double LONGITUDE { get; set; }
        public double LONGTITUDE { get; set; }

    }


}
