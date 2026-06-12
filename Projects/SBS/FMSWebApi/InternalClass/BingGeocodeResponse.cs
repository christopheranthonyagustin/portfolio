using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FMSWebApi.Bing
{
    public class BingGeoCodeResponse
    {
        public string authenticationResultCode { get; set; }
        public string brandLogoUri { get; set; }
        public string copyright { get; set; }
        public resourceSets[] resourceSets { get; set; }
        public int statusCode { get; set; }
        public string statusDescription { get; set; }
        public string traceId { get; set; }

    }


    public class resourceSets
    {
        public long estimatedTotal { get; set; }
        public resources[] resources { get; set; }
    }


    public class resources
    {
        public string __type { get; set; }
        public int[] bbox { get; set; }
        public string name { get; set; }
        public point[] point { get; set; }
        public address[] address { get; set; }
        public string confidence { get; set; }
        public string entityType { get; set; }
        public geocodePoints[] geocodePoints { get; set; }
        public string[] matchCodes { get; set; }

    }

    public class point
    {
        public string type { get; set; }
        public int[] coordinates { get; set; }

    }

    public class address
    {
        public string addressLine { get; set; }
        public string adminDistrict { get; set; }
        public string countryRegion { get; set; }
        public string formattedAddress { get; set; }
        public string locality { get; set; }
        public int postalCode { get; set; }

    }

    public class geocodePoints
    {
        public string type { get; set; }
        public int[] coordinates { get; set; }
        public string calculationMethod { get; set; }
        public string[] usageTypes { get; set; }

    }

}
