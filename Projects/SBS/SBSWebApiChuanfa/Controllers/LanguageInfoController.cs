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
    public class LanguageInfoController : ApiController
    {
        private static readonly ILanguageRepository repository = new LanguageRepository();

        public IEnumerable<LanguageInfo> GetAllLanguages()
        {
            return repository.GetAll();
        }

        public LanguageInfo GetAsset(int id)
        {
            LanguageInfo currLanguage = repository.Get(id);
            if (currLanguage == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currLanguage;
        }

        public IEnumerable<LanguageInfo> GetLanguageByName(string languagename)
        {
            return repository.GetAll().Where(
                c => string.Equals(c.Name, languagename,
                         StringComparison.OrdinalIgnoreCase));
        }

        public LanguageInfo PostAsset([FromBody]LanguageInfo currLanguage)
        {
            Logger.LogEvent(string.Format("Enter PostLanguage: {0},{1}", currLanguage.Name, currLanguage.Culture), System.Diagnostics.EventLogEntryType.Information);//testing
            currLanguage = repository.Add(currLanguage);

            Logger.LogEvent(string.Format("Exit PostLanguage: {0}", currLanguage.ErrorMessage), System.Diagnostics.EventLogEntryType.Information);//testing
            return currLanguage;
        }

        public void PutProduct(int id, [FromBody]LanguageInfo currLanguage)
        {
            Logger.LogEvent(string.Format("Enter PutLanguage: {0}, ID: {1}", currLanguage.Name, id), System.Diagnostics.EventLogEntryType.Information);//testing

            currLanguage.LanguageID = id;
            if (!repository.Update(currLanguage))
                Logger.LogEvent("PutLanguage Success", System.Diagnostics.EventLogEntryType.Information);//testing
            else
                Logger.LogEvent("PutLanguage Failed", System.Diagnostics.EventLogEntryType.Information);//testing
        }

        public void DeleteProduct(int id)
        {
            Logger.LogEvent(string.Format("Enter DeleteLanguage: {0}", id), System.Diagnostics.EventLogEntryType.Information);//testing


            LanguageInfo currLanguage = repository.Get(id);
            if (currLanguage == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }

    }
}
