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
    public class TriggerDataController : ApiController
    {
        private static readonly IPosRepository repository = new PosInfoRepository();

        // GET: api/PosInfo
        public IEnumerable<TriggerInfo> GetPosFiltered([FromBody]TriggerInfo param)
        {
            Logger.LogEvent(string.Format("Start: {0} End: {1} SvcNo: {2} Drv: {3}", param.Timestamp, param.RxTime, param.SvcNo, param.DutyNo), System.Diagnostics.EventLogEntryType.Information);
            return repository.GetTriggerData(param);
        }


        // GET: api/PosInfo/5
        public PosInfo Get(int id)
        {
            PosInfo currPos = repository.Get(id);
            if (currPos == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currPos;
        }

    }
}
