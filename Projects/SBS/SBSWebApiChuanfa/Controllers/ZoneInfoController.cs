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

        //public IEnumerable<ZoneInfo> GetAllZones()
        //{
        //    return repository.GetAll();
        //}

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
                //Logger.LogEvent(string.Format("PARAM IS null"), System.Diagnostics.EventLogEntryType.Information);
                return repository.GetAll();
            }
        }

        //public IEnumerable<ZoneInfo> GetZoneByName(string zonename)
        //{
        //    return repository.GetAll().Where(
        //        c => string.Equals(c.Name, zonename,
        //                 StringComparison.OrdinalIgnoreCase));
        //}

        public ZoneInfo PostZone([FromBody]ZoneInfo currZone)
        {
            currZone = repository.Add(currZone);
            return currZone;
        }

        public bool PutZone(int id, [FromBody]ZoneInfo currZone)
        {
            Logger.LogEvent(string.Format("Enter PutZone: {0}, ID: {1}", currZone.Name, id), System.Diagnostics.EventLogEntryType.Information);//testing

            currZone.ZoneID = id;
            if (!repository.Update(currZone))
            {
                return false;
                //throw new HttpResponseException(HttpStatusCode.NotFound);
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
