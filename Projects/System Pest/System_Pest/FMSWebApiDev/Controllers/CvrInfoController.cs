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
    public class CvrInfoController : ApiController
    {
        private static readonly IPosRepository repository = new PosInfoRepository();

        // GET: api/PosInfo
        public IEnumerable<PosInfo> GetPosFiltered([FromUri]PosInfo param)
        {
            if ((param.Timestamp != DateTime.MinValue && param.RxTime != DateTime.MinValue) &&
                (param.CompanyID > 0 || param.AssetID > 0 || !string.IsNullOrEmpty(param.Asset)))
            {           
                return repository.GetCvr(param);
            }
            else
            {
                return repository.GetAll();
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
        
    }
}
