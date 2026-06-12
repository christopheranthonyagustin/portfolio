using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace FMSWebApi
{
    //place_id	"54599659"
    //licence	"© LocationIQ.com CC BY 4.0, Data © OpenStreetMap contributors, ODbL 1.0"
    //osm_type	"node"
    //osm_id	"4390085189"
    //lat	"1.3317054"
    //lon	"103.8970092"
    //display_name	"Focus one, 1, Ubi View, Ubi, Mei Hwan, Southeast, 408867, Singapore"
    //address
    //attraction  "Focus one"
    //house_number	"1"
    //road	"Ubi View"
    //suburb	"Ubi"
    //hamlet	"Mei Hwan"
    //county	"Southeast"
    //postcode	"408867"
    //country	"Singapore"
    //country_code	"sg"
    //town	"Ubi"
    //boundingbox	
    //0	"1.3316054"
    //1	"1.3318054"
    //2	"103.8969092"
    //3	"103.8971092"

    public class LocationIQGeoCodeResponse
    {
        //public int place_id { get; set; }
        //public string license { get; set; }
        //public string osm_type { get; set; }
        //public long osm_id { get; set; }
        [IgnoreDataMember]
        public double PosY { get; set; }
        [IgnoreDataMember]
        public double PosX { get; set; }
        public string display_name { get; set; }
        public string error { get; set; }
        //public List<address> address { get; set; }
        //public string status { get; set; }      
    }

    //public class address
    //{
    //    public string attraction { get; set; }
    //    public string house_number { get; set; }
    //    public string road { get; set; }
    //    public string suburb { get; set; }
    //    public string hamlet { get; set; }
    //    public string county { get; set; }
    //    public string postcode { get; set; }
    //    public string country { get; set; }
    //    public string country_code { get; set; }
    //    public string town { get; set; }
    //}


}
