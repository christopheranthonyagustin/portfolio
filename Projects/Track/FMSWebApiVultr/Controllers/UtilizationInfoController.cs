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
    //[EnableCors(origins: "*", headers: "*", methods: "*")]
    public class UtilizationInfoController : ApiController
    {
        private static readonly IUtilizationRepository repository = new UtilizationInfoRepository();
        // GET: api/UtilizationInfo
        public IEnumerable<UtilizationInfo> Get([FromUri]UtilizationInfo param)
        {

            if ((param.StartTime != DateTime.MinValue && param.EndTime != DateTime.MinValue) &&
                (param.AssetID > 0 || !string.IsNullOrEmpty(param.Asset)))
            {
                Logger.LogEvent(string.Format("Asset Name: {0} Start: {1} End: {2}", param.Asset, param.StartTime, param.EndTime), System.Diagnostics.EventLogEntryType.Information);
                return repository.GetUtilizationInfo(param);
            }
            else
            {
                Logger.LogEvent(string.Format("PARAM IS null"), System.Diagnostics.EventLogEntryType.Information);
                return repository.GetAll();
            }
        }


        // GET: api/UtilizationInfo/5
        public UtilizationInfo Get(int id)
        {
            UtilizationInfo currUtil = repository.Get(id);
            if (currUtil == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currUtil;
        }


        // POST: api/UtilizationInfo
        public UtilizationInfo Post([FromBody]UtilizationInfo value)
        {
            value = repository.Add(value);
            return value;
        }

        // PUT: api/UtilizationInfo/5
        public void Put(int id, [FromBody]UtilizationInfo value)
        {
            value.UtilId = id;
            if (!repository.Update(value))
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
        }

        // DELETE: api/UtilizationInfo/5
        public void Delete(int id)
        {
            UtilizationInfo currUtil = repository.Get(id);
            if (currUtil == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }

    }
}
