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
using ForceSSL.Modules;


namespace FMSWebApi.Controllers
{
    //[RequireHttps]
    //[Authorize] // Require authenticated requests.
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class EventInfoController : ApiController
    {
        private static readonly IEventRepository repository = new EventRepository();

        // GET: api/PosInfo
        public IEnumerable<EventInfo> GetEventFiltered([FromUri]EventInfo param)
        {
            if ((param.Timestamp != DateTime.MinValue && param.RxTime != DateTime.MinValue) &&
                (param.AssetID > 0 || !string.IsNullOrEmpty(param.Asset)) || param.StatusID > 0 || param.CompanyID > 0 || param.AckRoleID > 0)
            {           
                return repository.Get(param);
            }
            else
            {
                return repository.GetAll();
            }
        }


        public EventInfo GetEvent(int id)
        {
            EventInfo currEvent = repository.Get(id);
            if (currEvent == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currEvent;
        }


        public EventInfo PostEvent([FromBody]EventInfo currEvent)
        {
            currEvent = repository.Add(currEvent);
            return currEvent;
        }

        public void PutEvent(int id, [FromBody]EventInfo currEvent)
        {
            currEvent.EventID = id;
            if (repository.Update(currEvent))
                Logger.LogEvent("PutEvent Success", System.Diagnostics.EventLogEntryType.Information);//testing
				
            else
                Logger.LogEvent("PutEvent Failed", System.Diagnostics.EventLogEntryType.Information);//testing
				
        }

        public void DeleteEvent(int id)
        {
            EventInfo currEvent = repository.Get(id);
            if (currEvent == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }

    }
}
