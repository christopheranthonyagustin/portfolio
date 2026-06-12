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
    public class StatusInfoController : ApiController
    {
        private static readonly IStatusRepository repository = new StatusRepository();

        public IEnumerable<StatusInfo> GetAllStatus()
        {
            return repository.GetAll();
        }

        public StatusInfo GetStatus(int id)
        {
            StatusInfo currStatus = repository.Get(id);
            if (currStatus == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currStatus;
        }

        public IEnumerable<StatusInfo> GetStatusName(string statusname)
        {
            return repository.GetAll().Where(
                c => string.Equals(c.StatusDesc, statusname,
                         StringComparison.OrdinalIgnoreCase));
        }

        public StatusInfo PostStatus([FromBody]StatusInfo currStatus)
        {
            Logger.LogEvent(string.Format("Enter PostStatus: {0},{1}", currStatus.StatusID, currStatus.StatusDesc), System.Diagnostics.EventLogEntryType.Information);//testing
            currStatus = repository.Add(currStatus);

            Logger.LogEvent(string.Format("Exit PostStatus: {0}", currStatus.ErrorMessage), System.Diagnostics.EventLogEntryType.Information);//testing
            return currStatus;
        }

        public void PutStatus(int id, [FromBody]StatusInfo currStatus)
        {
            Logger.LogEvent(string.Format("Enter PutStatus: {0}, ID: {1}", currStatus.StatusDesc, id), System.Diagnostics.EventLogEntryType.Information);//testing

            currStatus.StatusID = id;
            if (repository.Update(currStatus))
                Logger.LogEvent("PutStatus Success", System.Diagnostics.EventLogEntryType.Information);//testing
				
            else
                Logger.LogEvent("PutStatus Failed", System.Diagnostics.EventLogEntryType.Information);//testing
				
        }

        public void DeleteStatus(int id)
        {
            Logger.LogEvent(string.Format("Enter DeleteStatus: {0}", id), System.Diagnostics.EventLogEntryType.Information);//testing


            StatusInfo currStatus = repository.Get(id);
            if (currStatus == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }

    }
}
