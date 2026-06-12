using MySql.Data.MySqlClient;
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
    public class ZoneInfoController : ApiController
    {
        private static readonly IZoneRepository repository = new ZoneRepository();


        public ZoneInfo GetZone(int id)
        {
            ZoneInfo currZone = repository.Get(id);
            if (currZone == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currZone;
        }

        public IEnumerable<ZoneInfo> GetByCompany([FromUri]ZoneInfo param)
        {


            if ((param.CompanyID > 0 || param.ResellerID > 0))
            {

                return repository.GetByCompany(param);
            }
            else
            {
                return repository.GetAll();
            }
        }


        public ZoneInfo PostZone([FromBody]ZoneInfo currZone)
        {
            currZone = repository.Add(currZone);
            return currZone;
        }

        public bool PutZone(int id, [FromBody]ZoneInfo currZone)
        {
            currZone.ZoneID = id;
            if (!repository.Update(currZone))
            {
                return false;
            }
            return true;
        }

        public void DeleteZone(int id)
        {
            ZoneInfo currZone = repository.Get(id);
            if (currZone == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }

    }
}
