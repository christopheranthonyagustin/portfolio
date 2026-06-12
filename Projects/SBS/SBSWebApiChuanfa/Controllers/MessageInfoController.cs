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

        //public IEnumerable<AssetInfo> GetAllAssets()
        //{
        //    return repository.GetAll();
        //}

        public IEnumerable<MessageInfo> GetMesageFiltered([FromUri]MessageInfo param)
        {
            if ((param.Timestamp != DateTime.MinValue && param.RxTime != DateTime.MinValue) &&
                (param.AssetID > 0 || !string.IsNullOrEmpty(param.Asset)))
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

            Logger.LogEvent(string.Format("Enter PostMessage: {0},{1},{2},{3},{4},{5},{6}",
                currMessage.Asset, currMessage.AssetID, currMessage.Company, currMessage.CompanyID, currMessage.Message,
                currMessage.Recipients, currMessage.Sender), System.Diagnostics.EventLogEntryType.Information);//testing
            currMessage = repository.Add(currMessage);

            Logger.LogEvent(string.Format("Exit PostMessage: {0}", currMessage.ErrorMessage), System.Diagnostics.EventLogEntryType.Information);//testing
            return currMessage;
        }

        public bool PutMessage(int id, [FromBody]MessageInfo currMessage)
        {
            Logger.LogEvent(string.Format("Enter PutMessage: {0}, ID: {1}", currMessage.Message, id), System.Diagnostics.EventLogEntryType.Information);//testing

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
            Logger.LogEvent(string.Format("Enter DeleteMessage: {0}", id), System.Diagnostics.EventLogEntryType.Information);//testing

            MessageInfo currMessage = repository.Get(id);
            if (currMessage == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }
    }
}
