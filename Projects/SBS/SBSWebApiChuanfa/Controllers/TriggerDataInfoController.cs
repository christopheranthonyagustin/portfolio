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
    public class TriggerDataInfoController : ApiController
    {
        private static readonly IPosRepository repository = new PosInfoRepository();

        // GET: api/PosInfo
        public IEnumerable<TriggerInfo> GetPosFiltered([FromUri]TriggerInfo param)
        {
            if ((param.Timestamp != DateTime.MinValue && param.RxTime != DateTime.MinValue))
            {
                //Logger.LogEvent(string.Format("Drv: {0} Start: {1} End: {2}", param.Drv, param.Timestamp, param.RxTime, param.Speed), System.Diagnostics.EventLogEntryType.Information);
                return repository.GetTriggerData(param);
            }
            else
            {
                //Logger.LogEvent(string.Format("PARAM IS null"), System.Diagnostics.EventLogEntryType.Information);
                return repository.GetAllEx();
            }
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

        public IEnumerable<TriggerInfo> Post([FromBody]TriggerInfo value)
        {
            Logger.LogEvent(string.Format("Start: {0} End: {1} SvcNo: {2} DrvNo: {3}", value.Timestamp, value.RxTime, value.SvcNo, value.DutyNo), System.Diagnostics.EventLogEntryType.Information);

            return repository.PostTrigger(value);
        }


    }
}
