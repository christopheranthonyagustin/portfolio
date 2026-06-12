using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FMSWebApi
{
    //{
    //  "distance": 90.0,
    //  "duration": 300.0,
    //  "weight": 300.0,
    //  "weight_name": "duration",
    //  "geometry": {"type": "LineString", "coordinates": [[120.0, 10.0], [120.1, 10.0], [120.2, 10.0], [120.3, 10.0]]},
    //  "legs": [
    //    {
    //      "distance": 30.0,
    //      "duration": 100.0,
    //      "steps": []
    //    },
    //    {
    //      "distance": 60.0,
    //      "duration": 200.0,
    //      "steps": []
    //    }
    //  ]
    //}



    public class LocationIQDistanceMatrixResponse
    {
        public double Distance { get; set; }
        public double Duration { get; set; }
        public double Weight { get; set; }
        public double WeightName { get; set; }
        public List<Geometry> Geometry { get; set; }
        public legs[] legs { get; set; }
    }

    public class Geometry
    {
        public string type { get; set; }
        public double[] coordinates { get; set; }
    }

    public class legs
    {
        public double distance { get; set; }
        public double duration { get; set; }
    }




}
