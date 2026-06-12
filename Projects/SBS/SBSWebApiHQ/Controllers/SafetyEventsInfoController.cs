using FMSWebApi.Models;
using FMSWebApi.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;

namespace FMSWebApi.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class SafetyEventsInfoController : ApiController
    {
        private static readonly ISafetyEventsRepository repository = new SafetyEventsRepository();
        // GET: api/SafetyEventsInfo
        public IEnumerable<SafetyEventsInfo> Get([FromUri]SafetyEventsInfo param)
        {

            if ((param.StartTime != DateTime.MinValue && param.EndTime != DateTime.MinValue) &&
                (param.AssetID > 0 || !string.IsNullOrEmpty(param.Asset)))
            {
                Logger.LogEvent(string.Format("Asset Name: {0} Start: {1} End: {2}", param.Asset, param.StartTime, param.EndTime), System.Diagnostics.EventLogEntryType.Information);
                return repository.GetSafetyEventsInfo(param);
            }
            else
            {
                //Logger.LogEvent(string.Format("PARAM IS null"), System.Diagnostics.EventLogEntryType.Information);
                return repository.GetAll();
            }
        }


        // GET: api/SafetyEventsInfo/5
        public SafetyEventsInfo Get(int id)
        {
            SafetyEventsInfo currUtil = repository.Get(id);
            if (currUtil == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currUtil;
        }


    }
}
