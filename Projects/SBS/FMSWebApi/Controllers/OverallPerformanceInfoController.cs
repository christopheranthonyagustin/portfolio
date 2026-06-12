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
    public class OverallPerformanceInfoController : ApiController
    {
        private static readonly IOverallPerformanceRepository repository = new OverallPerformanceInfoRepository();

        // GET: api/BcPerformanceInfo
        public IEnumerable<OverallPerformanceInfo> GetOverallPerformance([FromUri]OverallPerformanceInfo param)
        {
            if ((param.Timestamp != DateTime.MinValue && param.RxTime != DateTime.MinValue))
            {
                return repository.GetOverallPerformance(param);
            }
            else
            {
                return repository.GetAll();
            }
        }


        // GET: api/OverallPerformanceInfo/5
        public OverallPerformanceInfo Get(int id)
        {
            OverallPerformanceInfo currOverallPerformance = repository.Get(id);
            if (currOverallPerformance == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currOverallPerformance;
        }

    }
}
