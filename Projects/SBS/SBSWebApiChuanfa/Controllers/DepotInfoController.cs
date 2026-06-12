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
    public class DepotInfoController : ApiController
    {
        private static readonly IDepotRepository repository = new DepotRepository();

        public IEnumerable<DepotInfo> GetAllDepot()
        {
            return repository.GetAll();
        }

        public DepotInfo GetDepot(int id)
        {
            DepotInfo currDepot = repository.Get(id);
            if (currDepot == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currDepot;
        }

        public IEnumerable<DepotInfo> GetDepotName(string dapotname)
        {
            return repository.GetAll().Where(
                c => string.Equals(c.Name, dapotname,
                         StringComparison.OrdinalIgnoreCase));
        }

        public DepotInfo PostDepot([FromBody]DepotInfo currDepot)
        {
            Logger.LogEvent(string.Format("Enter PostDepot: {0},{1}", currDepot.DepotID, currDepot.Name), System.Diagnostics.EventLogEntryType.Information);//testing
            currDepot = repository.Add(currDepot);

            Logger.LogEvent(string.Format("Exit PostDepot: {0}", currDepot.ErrorMessage), System.Diagnostics.EventLogEntryType.Information);//testing
            return currDepot;
        }

        public void PutDepot(int id, [FromBody]DepotInfo currDepot)
        {
            Logger.LogEvent(string.Format("Enter PutDepot: {0}, ID: {1}", currDepot.Name, id), System.Diagnostics.EventLogEntryType.Information);//testing

            currDepot.DepotID = id;
            if (repository.Update(currDepot))
                Logger.LogEvent("PutDepot Success", System.Diagnostics.EventLogEntryType.Information);//testing
				
            else
                Logger.LogEvent("PutDepot Failed", System.Diagnostics.EventLogEntryType.Information);//testing
				
        }

        public void DeleteDepot(int id)
        {
            Logger.LogEvent(string.Format("Enter DeleteDepot: {0}", id), System.Diagnostics.EventLogEntryType.Information);//testing


            DepotInfo currDepot = repository.Get(id);
            if (currDepot == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }

    }
}
