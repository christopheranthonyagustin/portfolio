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
    public class SummaryInfoController : ApiController
    {
        private static readonly ISummaryRepository repository = new SummaryRepository();
        // GET: api/SummaryInfo
        public IEnumerable<SummaryInfo> Get([FromUri]SummaryInfo param)
        {
            //Logger.LogEvent(string.Format("Asset Name: {0} Month: {1} Year: {2}", param.Asset, param.Month, param.Year), System.Diagnostics.EventLogEntryType.Warning);
            if ((!string.IsNullOrEmpty(param.Month) && !string.IsNullOrEmpty(param.Year)) &&
                (param.AssetID > 0 || !string.IsNullOrEmpty(param.Asset)))
            {
                //Logger.LogEvent(string.Format("Asset Name: {0} Month: {1} Year: {2}", param.Asset, param.Month, param.Year), System.Diagnostics.EventLogEntryType.Information);
                return repository.GetSummaryInfo(param);
            }
            else
            {
                //Logger.LogEvent(string.Format("PARAM IS null"), System.Diagnostics.EventLogEntryType.Information);
                return repository.GetAll();
            }
        }


        // GET: api/SummaryInfo/5
        public SummaryInfo Get(int id)
        {
            SummaryInfo currSummary = repository.Get(id);
            if (currSummary == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currSummary;
        }


    }
}
