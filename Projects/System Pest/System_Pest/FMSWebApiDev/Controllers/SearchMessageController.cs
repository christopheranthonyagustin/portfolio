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
    public class SearchMessageController : ApiController
    {
        private static readonly ISearchMessageRepository repository = new SearchMessageRepository();


        public IEnumerable<SearchMessage> GetMesageFiltered([FromUri]SearchMessage param)
        {
            if ((param.Timestamp != DateTime.MinValue && param.RxTime != DateTime.MinValue) &&
               (param.AssetID > 0 || param.Notified > 0 || !string.IsNullOrEmpty(param.JobNumber)))
            {          
                return repository.Get(param);
            }
            else
            {
                return repository.GetAll();
            }
        }

        public SearchMessage GetMessage(int id)
        {
            SearchMessage currMessage = repository.Get(id);
            if (currMessage == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currMessage;
        }


        public SearchMessage PostMessage([FromBody]SearchMessage currMessage)
        {
            currMessage = repository.Add(currMessage);
            return currMessage;
        }

        public bool PutMessage(int id, [FromBody]SearchMessage currMessage)
        {
            currMessage.MessageID = id;
            if (repository.Update(currMessage))
            {
                Logger.LogEvent("PutMessage Success", System.Diagnostics.EventLogEntryType.Information);//testing
                return true;
            }
            else
            {
                Logger.LogEvent("PutMessage Failed", System.Diagnostics.EventLogEntryType.Information);//testing
                return false;
            }
        }

        public void DeleteMessage(int id)
        {
            SearchMessage currMessage = repository.Get(id);
            if (currMessage == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }
    }
}
