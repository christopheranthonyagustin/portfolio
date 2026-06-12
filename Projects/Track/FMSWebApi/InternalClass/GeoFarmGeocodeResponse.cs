using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FMSWebApi.GeoFarm
{
    public class GeoFarmGeoCodeResponse
    {
        public geocoding_results geocoding_results { get; set; }
    }


    public class geocoding_results 
    {
        public LEGAL_COPYRIGHT LEGAL_COPYRIGHT { get; set; }
        public STATUS STATUS { get; set; }
        public ACCOUNT ACCOUNT { get; set; }
        public RESULTS[] RESULTS { get; set; }
        public STATISTICS STATISTICS { get; set; }
    }

    public class LEGAL_COPYRIGHT 
    {
        public string copyright_notice { get; set; }
        public string copyright_logo { get; set; }
        public string terms_of_service { get; set; }
        public string privacy_policy { get; set; }

    }
    public class STATUS
    {
        public string access { get; set; }
        public string status { get; set; }
        public string latitude_provided { get; set; }
        public string longitude_provided { get; set; }
        public int result_count { get; set; }
    }
    public class ACCOUNT
    {
        public string ip_address { get; set; }
        public string distribution_license { get; set; }
        public int usage_limit { get; set; }
        public int used_today { get; set; }
        public int used_total { get; set; }
        public string first_used { get; set; }
    }

    public class RESULTS
    {
        public int result_number { get; set; }
        public string formatted_address { get; set; }
        public string accuracy { get; set; }
        public ADDRESS ADDRESS { get; set; }
        public LOCATION_DETAILS LOCATION_DETAILS { get; set; }
        public COORDINATES COORDINATES { get; set; }
        public BOUNDARIES BOUNDARIES { get; set; }
    }

    public class ADDRESS
    {
        public string street_number { get; set; }
        public string street_name { get; set; }
        public string neighborhood { get; set; }
        public string locality { get; set; }
        public string postal_code { get; set; }
        public string country { get; set; }


    }
    public class LOCATION_DETAILS
    {
        public string elevation { get; set; }
        public string timezone_long { get; set; }
        public string timezone_short { get; set; }
    }

    public class COORDINATES
    {
        public string latitude { get; set; }
        public string longitude { get; set; }
    }

    public class BOUNDARIES
    {
        public string northeast_latitude { get; set; }
        public string northeast_longitude { get; set; }
        public string southwest_latitude { get; set; }
        public string southwest_longitude { get; set; }
    }

    public class STATISTICS
    {
        public string https_ssl { get; set; }
    }


}
