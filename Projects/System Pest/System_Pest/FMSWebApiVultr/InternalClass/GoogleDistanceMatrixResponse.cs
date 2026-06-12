using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FMSWebApi
{
//    {
//   "destination_addresses" : [ "Pasir Ris, Singapore", "Jurong East, Singapore" ],
//   "origin_addresses" : [ "Ubi View, Singapore 408544" ],
//   "rows" : [
//      {
//         "elements" : [
//            {
//               "distance" : {
//                  "text" : "11.3 km",
//                  "value" : 11277
//               },
//               "duration" : {
//                  "text" : "14 mins",
//                  "value" : 869
//               },
//               "status" : "OK"
//            },
//            {
//               "distance" : {
//                  "text" : "22.3 km",
//                  "value" : 22315
//               },
//               "duration" : {
//                  "text" : "27 mins",
//                  "value" : 1637
//               },
//               "status" : "OK"
//            }
//         ]
//      }
//   ],
//   "status" : "OK"
//}

    public class Distance
    {
        public string text { get; set; }
        public int value { get; set; }
    }

    public class Duration
    {
        public string text { get; set; }
        public int value { get; set; }
    }

    public class Element
    {
        public Distance distance { get; set; }
        public Duration duration { get; set; }
        public string status { get; set; }
    }

    public class Row
    {
        public Element[] elements { get; set; }
    }

    public class GoogleDistanceMatrixResponse
    {
        public string Destination { get; set; }
        public string Origin { get; set; }
        public string[] destination_addresses { get; set; }
        public string[] origin_addresses { get; set; }
        public Row[] rows { get; set; }
        public string status { get; set; }
    }




}
