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
    public class DailyPerformanceInfoController : ApiController
    {
        private static readonly IDailyPerformanceRepository repository = new DailyPerformanceInfoRepository();

        // GET: api/DailyPerformanceInfo
        public IEnumerable<DailyPerformanceInfo> GetDailyPerformance([FromUri]DailyPerformanceInfo param)
        {
            if ((param.Timestamp != DateTime.MinValue && param.RxTime != DateTime.MinValue))
            {
                return repository.GetDailyPerformance(param);
            }
            else
            {
                return repository.GetAll();
            }
        }


        // GET: api/DailyPerformanceInfo/5
        public DailyPerformanceInfo Get(int id)
        {
            DailyPerformanceInfo currBcRanking = repository.Get(id);
            if (currBcRanking == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currBcRanking;
        }

    }
}
