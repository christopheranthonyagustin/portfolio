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
    public class PosInfoExController : ApiController
    {
        private static readonly IPosRepository repository = new PosInfoRepository();

        // GET: api/PosInfo
        public IEnumerable<PosInfo> GetPosFiltered([FromUri]PosInfo param)
        {
            if ((param.Timestamp != DateTime.MinValue && param.RxTime != DateTime.MinValue))
            {
                //Logger.LogEvent(string.Format("Asset ID: {0} Start: {1} End: {2}", param.Asset, param.Timestamp, param.RxTime, param.Speed), System.Diagnostics.EventLogEntryType.Information);
                return repository.GetEx(param);
            }
            else
            {
                //Logger.LogEvent(string.Format("PARAM IS null"), System.Diagnostics.EventLogEntryType.Information);
                return repository.GetAllEx();
            }
        }


        //// GET: api/PosInfo
        //public IEnumerable<PosInfo> GetAll()
        //{
        //    return repository.GetAll();
        //}

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
        

        // POST: api/PosInfo
        public PosInfo Post([FromBody]PosInfo value)
        {
            value = repository.Add(value);
            return value;
        }

        // PUT: api/PosInfo/5
        public void Put(int id, [FromBody]PosInfo value)
        {
            value.AssetID = id;
            if (!repository.Update(value))
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
        }

        // DELETE: api/PosInfo/5
        public void Delete(int id)
        {
            PosInfo currAsset = repository.Get(id);
            if (currAsset == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }
    }
}
