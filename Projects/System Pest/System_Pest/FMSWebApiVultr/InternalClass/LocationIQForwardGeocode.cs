using System;
using System.Collections.Generic;
using System.Linq;
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

    public class LocationIQForwardGeoCode
    {
        public string address { get; set; }
        public string error { get; set; }
    }




}
