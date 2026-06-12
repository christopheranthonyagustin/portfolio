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
    public class BcPerformanceInfoController : ApiController
    {
        private static readonly IBcPerformanceRepository repository = new BcPerformanceInfoRepository();

        // GET: api/BcPerformanceInfo
        public IEnumerable<BcPerformanceInfo> GetBcPerformance([FromUri]BcPerformanceInfo param)
        {
            if ((param.Timestamp1 != DateTime.MinValue && param.RxTime1 != DateTime.MinValue))
            {
                //Logger.LogEvent(string.Format("Start: {0} End: {1}", param.Timestamp1, param.RxTime1), System.Diagnostics.EventLogEntryType.Information);
                return repository.GetBcPerformance(param);
            }
            else
            {
                return repository.GetAll();
            }
        }


        // GET: api/BcPerformanceInfo/5
        public BcPerformanceInfo Get(int id)
        {
            BcPerformanceInfo currBcPerformance = repository.Get(id);
            if (currBcPerformance == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currBcPerformance;
        }

    }
}
