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
    public class BcRankingInfoController : ApiController
    {
        private static readonly IBcRankingRepository repository = new BcRankingInfoRepository();

        // GET: api/BcRankingInfo
        public IEnumerable<BcRankingInfo> GetBcRanking([FromUri]BcRankingInfo param)
        {
            if ((param.Timestamp != DateTime.MinValue && param.RxTime != DateTime.MinValue))
            {
                return repository.GetBcRanking(param);
            }
            else
            {
                return repository.GetAll();
            }
        }


        // GET: api/BcRankingInfo/5
        public BcRankingInfo Get(int id)
        {
            BcRankingInfo currBcRanking = repository.Get(id);
            if (currBcRanking == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currBcRanking;
        }

    }
}
