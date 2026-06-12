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
    public class InterchangeInfoController : ApiController
    {
        private static readonly IInterchangeRepository repository = new InterchangeRepository();

        //public IEnumerable<InterchangeInfo> GetAllInterchange()
        //{
        //    return repository.GetAll();
        //}

        public IEnumerable<InterchangeInfo> GetInterchange([FromUri]InterchangeInfo param)
        {
            if (!string.IsNullOrEmpty(param.Depot))
            {
                return repository.GetInterchange(param);
            }
            else
            {            
                return repository.GetAll();
            }
        }

        public InterchangeInfo GetInterchangeID(int id)
        {
            InterchangeInfo currInterchange = repository.Get(id);
            if (currInterchange == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currInterchange;
        }

        public IEnumerable<InterchangeInfo> GetInterchangeName(string interchangename)
        {
            return repository.GetAll().Where(
                c => string.Equals(c.Name, interchangename,
                         StringComparison.OrdinalIgnoreCase));
        }

        public InterchangeInfo PostInterchange([FromBody]InterchangeInfo currInterchange)
        {
            Logger.LogEvent(string.Format("Enter PostInterchange: {0},{1}", currInterchange.InterchangeID, currInterchange.Name), System.Diagnostics.EventLogEntryType.Information);//testing
            currInterchange = repository.Add(currInterchange);

            Logger.LogEvent(string.Format("Exit PostInterchange: {0}", currInterchange.ErrorMessage), System.Diagnostics.EventLogEntryType.Information);//testing
            return currInterchange;
        }

        public void PutInterchange(int id, [FromBody]InterchangeInfo currInterchange)
        {
            Logger.LogEvent(string.Format("Enter PutInterchange: {0}, ID: {1}", currInterchange.Name, id), System.Diagnostics.EventLogEntryType.Information);//testing

            currInterchange.InterchangeID = id;
            if (repository.Update(currInterchange))
                Logger.LogEvent("PutInterchange Success", System.Diagnostics.EventLogEntryType.Information);//testing

            else
                Logger.LogEvent("PutInterchange Failed", System.Diagnostics.EventLogEntryType.Information);//testing

        }

        public void DeleteInterchange(int id)
        {
            Logger.LogEvent(string.Format("Enter DeleteInterchange: {0}", id), System.Diagnostics.EventLogEntryType.Information);//testing


            InterchangeInfo currInterchange = repository.Get(id);
            if (currInterchange == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }



    }
}
