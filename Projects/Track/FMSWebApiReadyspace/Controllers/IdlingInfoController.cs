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
    public class IdlingInfoController : ApiController
    {
        private static readonly IIdlingRepository repository = new IdlingInfoRepository();
        // GET: api/IdlingInfo
        public IEnumerable<IdlingInfo> Get([FromUri]IdlingInfo param)
        {

            if ((param.IdleStart != DateTime.MinValue && param.IdleEnd != DateTime.MinValue) &&
                (param.AssetID > 0 || !string.IsNullOrEmpty(param.Asset)))
            {
                //Logger.LogEvent(string.Format("Asset Name: {0} Start: {1} End: {2}", param.Asset, param.IdleStart, param.IdleEnd), System.Diagnostics.EventLogEntryType.Information);
                return repository.GetIdlingInfo(param);
            }
            else
            {
                Logger.LogEvent(string.Format("PARAM IS null"), System.Diagnostics.EventLogEntryType.Information);
                return repository.GetAll();
            }
        }


        // GET: api/IdlingInfo/5
        public IdlingInfo Get(int id)
        {
            IdlingInfo currUtil = repository.Get(id);
            if (currUtil == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currUtil;
        }

    }
}
