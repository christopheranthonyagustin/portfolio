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

        public IEnumerable<ZoneInfo> GetAllZones()
        {
            return repository.GetAll();
        }

        public ZoneInfo GetZone(int id)
        {
            ZoneInfo currZone = repository.Get(id);
            if (currZone == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currZone;
        }

        public IEnumerable<ZoneInfo> GetZoneByName(string zonename)
        {
            return repository.GetAll().Where(
                c => string.Equals(c.Name, zonename,
                         StringComparison.OrdinalIgnoreCase));
        }

        public ZoneInfo PostZone([FromBody]ZoneInfo currZone)
        {
            currZone = repository.Add(currZone);
            return currZone;
        }

        public void PutZone(int id, [FromBody]ZoneInfo currZone)
        {
            currZone.ZoneID = id;
            if (!repository.Update(currZone))
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
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
