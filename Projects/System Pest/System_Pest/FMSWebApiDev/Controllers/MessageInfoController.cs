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
    public class MessageInfoController : ApiController
    {
        private static readonly IMessageRepository repository = new MessageRepository();


        public IEnumerable<MessageInfo> GetMesageFiltered([FromUri]MessageInfo param)
        {
            if ((param.Timestamp != DateTime.MinValue && param.RxTime != DateTime.MinValue) &&
                (param.Flag > 0 || param.AssetID > 0 || !string.IsNullOrEmpty(param.Asset)))
            {            
                return repository.Get(param);
            }
            else
            {
                return repository.GetAll();
            }
        }

        public MessageInfo GetMessage(int id)
        {
            MessageInfo currMessage = repository.Get(id);
            if (currMessage == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currMessage;
        }


        public MessageInfo PostMessage([FromBody]MessageInfo currMessage)
        {
            currMessage = repository.Add(currMessage);
            return currMessage;
        }

        public bool PutMessage(int id, [FromBody]MessageInfo currMessage)
        {
            currMessage.MessageID = id;
            if (repository.Update(currMessage))
            {
                Logger.LogEvent("PutMessage Success", System.Diagnostics.EventLogEntryType.Information);
                return true;
            }
            else
            {
                Logger.LogEvent("PutMessage Failed", System.Diagnostics.EventLogEntryType.Information);
                return false;
            }
        }

        public void DeleteMessage(int id)
        {
            MessageInfo currMessage = repository.Get(id);
            if (currMessage == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }
    }
}
