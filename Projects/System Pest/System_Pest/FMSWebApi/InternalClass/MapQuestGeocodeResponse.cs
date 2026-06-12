using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FMSWebApi.MapQuest
{
    public class MapQuestGeoCodeResponse
    {
        public info info { get; set; }
        public options options { get; set; }
        public result[] results { get; set; }

    }


    public class info
    {
        public int statuscode { get; set; }
        public copyright copyright { get; set; }
        public string[] messages { get; set; }
    }

    public class options
    {
        public int maxResults { get; set; }
        public bool thumbMaps { get; set; }
        public bool ignoreLatLngInput { get; set; }
    }
    public class result
    {
        public providedLocation providedLocation { get; set; }
        public locations[] locations { get; set; }
    }

    public class copyright
    {
        public string text { get; set; }
        public string imageUrl { get; set; }
        public string imageAltText { get; set; }
    }

    public class providedLocation
    {

        public latLng latLng { get; set; }

    }

    public class latLng
    {
        public string lat { get; set; }
        public string lng { get; set; }

    }

    public class locations
    {
        public string street { get; set; }
        public string adminArea6 { get; set; }
        public string adminArea6Type { get; set; }
        public string adminArea5 { get; set; }
        public string adminArea5Type { get; set; }
        public string adminArea4 { get; set; }
        public string adminArea4Type { get; set; }
        public string adminArea3 { get; set; }
        public string adminArea3Type { get; set; }
        public string adminArea1 { get; set; }
        public string adminArea1Type { get; set; }
        public int postalCode { get; set; }
        public string geocodeQualityCode { get; set; }
        public string geocodeQuality { get; set; }
        public string dragPoint { get; set; }
        public string sideOfStreet { get; set; }
        public int linkId { get; set; }
        public string unknownInput { get; set; }
        public string type { get; set; }
        public latLng latLng { get; set; }
        public latLng displayLatLng { get; set; }
        public string mapUrl { get; set; }

    }


}
