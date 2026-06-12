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
    public class OaPerfDrvInfoController : ApiController
    {
        private static readonly IOaPerfDrvRepository repository = new OaPerfDrvInfoRepository();

        public IEnumerable<OaPerfDrvInfo> GetOverallPerformance([FromUri]OaPerfDrvInfo param)
        {
            if ((param.SessionID > 0))
            {
                return repository.GetOverallPerformanceParam(param);
            }
            else
            {
                return repository.GetAll();
            }
        }
        public OaPerfDrvInfo GetOaPerfParams(int id)
        {
            OaPerfDrvInfo currOAPerfParams = repository.Get(id);
            if (currOAPerfParams == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currOAPerfParams;
        }

        public OaPerfDrvInfo PostAsset([FromBody]OaPerfDrvInfo currOAPerfParams)
        {
            //Logger.LogEvent(string.Format("Enter PostOAPerfParams: {0}", currOAPerfParams.SessionID), System.Diagnostics.EventLogEntryType.Warning);//testing
            currOAPerfParams = repository.Add(currOAPerfParams);
            //Logger.LogEvent(string.Format("Exit PostOAPerfParams: {0}", currOAPerfParams.ErrorMessage), System.Diagnostics.EventLogEntryType.Information);//testing
            return currOAPerfParams;
        }

        public void DeleteProduct(int id)
        {
            //Logger.LogEvent(string.Format("Enter DeleteProduct: {0}", id), System.Diagnostics.EventLogEntryType.Information);//testing

            OaPerfDrvInfo currOAPerfParams = repository.Get(id);
            if (currOAPerfParams == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }



    }
}
