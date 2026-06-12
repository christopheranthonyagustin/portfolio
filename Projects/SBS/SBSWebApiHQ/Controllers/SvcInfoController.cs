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
    public class SvcInfoController : ApiController
    {
        private static readonly ISvcRepository repository = new SvcRepository();

        //public IEnumerable<SvcInfo> GetAllSvc()
        //{
        //    return repository.GetAll();
        //}

        public IEnumerable<SvcInfo> GetSvc([FromUri]SvcInfo param)
        {
            if (!string.IsNullOrEmpty(param.Depot) || !string.IsNullOrEmpty(param.Interchange))
            {
                return repository.GetSvc(param);
            }
            else
            {
                return repository.GetAll();
            }
        }

        public SvcInfo GetSvc(int id)
        {
            SvcInfo currSvc = repository.Get(id);
            if (currSvc == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currSvc;
        }

        public IEnumerable<SvcInfo> GetSvcNumber(string svcnumber)
        {
            return repository.GetAll().Where(
                c => string.Equals(c.SvcNo, svcnumber,
                         StringComparison.OrdinalIgnoreCase));
        }

        public SvcInfo PostSvc([FromBody]SvcInfo currSvc)
        {
            Logger.LogEvent(string.Format("Enter PostSvc: {0},{1}", currSvc.SvcID, currSvc.SvcNo), System.Diagnostics.EventLogEntryType.Information);//testing
            currSvc = repository.Add(currSvc);

            Logger.LogEvent(string.Format("Exit PostSvc: {0}", currSvc.ErrorMessage), System.Diagnostics.EventLogEntryType.Information);//testing
            return currSvc;
        }

        public void PutSvc(int id, [FromBody]SvcInfo currSvc)
        {
            Logger.LogEvent(string.Format("Enter PutSvc: {0}, ID: {1}", currSvc.SvcNo, id), System.Diagnostics.EventLogEntryType.Information);//testing

            currSvc.SvcID = id;
            if (repository.Update(currSvc))
                Logger.LogEvent("PutSvc Success", System.Diagnostics.EventLogEntryType.Information);//testing
				
            else
                Logger.LogEvent("PutSvc Failed", System.Diagnostics.EventLogEntryType.Information);//testing
				
        }

        public void DeleteSvc(int id)
        {
            Logger.LogEvent(string.Format("Enter DeleteSvc: {0}", id), System.Diagnostics.EventLogEntryType.Information);//testing


            SvcInfo currSvc = repository.Get(id);
            if (currSvc == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }

    }
}
