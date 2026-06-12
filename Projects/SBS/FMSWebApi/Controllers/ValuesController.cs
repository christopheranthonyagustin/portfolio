using FMSWebApi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Web.Http;

namespace FMSWebApi.Controllers
{
    public class GeoPoint
    {
        public double Latitude { get; set; }
        public double Longitude { get; set; }
        public string Name { get; set; }
    }

    public class ValuesController : ApiController
    {
        //http://103.237.168.119/WebApi/TestSite/api/values?Latitude=47.678558&Longitude=-122.130989
        //[Route("GetUseDateTime")]
        //[HttpGet]
        //public HttpResponseMessage Get([FromUri] GeoPoint location) 
        //public HttpResponseMessage Get(double latitude) 
        public HttpResponseMessage Get([FromUri] PosInfo currPos) 
        {
            //string logs = string.Format("timestamp:{3} name:{2} lat:{0} lon:{1}", 
            //    location.Latitude, location.Longitude, location.Name, DateTime.Now.ToLocalTime());
            string logs = string.Format(string.Format("Name:{0} StartDT:{1} EndDT{2}", currPos.Asset, currPos.Timestamp, currPos.RxTime));
            Logger.LogEvent(logs, System.Diagnostics.EventLogEntryType.Information);
            //Logger.LogEvent(string.Format("lat:{0}", latitude), System.Diagnostics.EventLogEntryType.Information);
            HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.OK, "value");
            response.Content = new StringContent(logs, Encoding.Unicode);
            response.Headers.CacheControl = new CacheControlHeaderValue()
            {
                MaxAge = TimeSpan.FromMinutes(20)
            };
            return response;
        }
    }
}
