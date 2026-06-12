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
    public class EventInfoController : ApiController
    {
        private static readonly IEventRepository repository = new EventRepository();

        //public IEnumerable<EventInfo> GetAllEvents()
        //{
        //    return repository.GetAll();
        //}

        // GET: api/PosInfo
        public IEnumerable<EventInfo> GetEventFiltered([FromUri]EventInfo param)
        {
            if ((param.Timestamp != DateTime.MinValue && param.RxTime != DateTime.MinValue) &&
                (param.AssetID > 0 || !string.IsNullOrEmpty(param.Asset)) || param.StatusID > 0 || param.CompanyID > 0)
            {
                //Logger.LogEvent(string.Format("Asset Name: {0} Start: {1} End: {2}", param.Asset, param.Timestamp, param.RxTime, param.Speed), System.Diagnostics.EventLogEntryType.Information);
                return repository.Get(param);
            }
            else
            {
                //Logger.LogEvent(string.Format("PARAM IS null"), System.Diagnostics.EventLogEntryType.Information);
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

        //public IEnumerable<EventInfo> GetEventName(string eventname)
        //{
        //    return repository.GetAll().Where(
        //        c => string.Equals(c.Event, eventname,
        //                 StringComparison.OrdinalIgnoreCase));
        //}

        public EventInfo PostEvent([FromBody]EventInfo currEvent)
        {
            Logger.LogEvent(string.Format("Enter PostEvent: {0},{1}", currEvent.EventID, currEvent.Event), System.Diagnostics.EventLogEntryType.Information);//testing
            currEvent = repository.Add(currEvent);

            Logger.LogEvent(string.Format("Exit PostEvent: {0}", currEvent.ErrorMessage), System.Diagnostics.EventLogEntryType.Information);//testing
            return currEvent;
        }

        public void PutEvent(int id, [FromBody]EventInfo currEvent)
        {
            Logger.LogEvent(string.Format("Enter PutEvent: {0}, ID: {1}", currEvent.Event, id), System.Diagnostics.EventLogEntryType.Information);//testing

            currEvent.EventID = id;
            if (repository.Update(currEvent))
                Logger.LogEvent("PutEvent Success", System.Diagnostics.EventLogEntryType.Information);//testing
				
            else
                Logger.LogEvent("PutEvent Failed", System.Diagnostics.EventLogEntryType.Information);//testing
				
        }

        public void DeleteEvent(int id)
        {
            Logger.LogEvent(string.Format("Enter DeleteEvent: {0}", id), System.Diagnostics.EventLogEntryType.Information);//testing


            EventInfo currEvent = repository.Get(id);
            if (currEvent == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }

    }
}
