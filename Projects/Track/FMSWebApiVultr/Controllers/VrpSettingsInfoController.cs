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
    //[EnableCors(origins: "*", headers: "*", methods: "*")]
    public class VrpSettingsInfoController : ApiController
    {
        private static readonly IVrpSettingsRepository repository = new VrpSettingsRepository();

        public IEnumerable<VrpSettingsInfo> GetByRouteNo([FromUri]VrpSettingsInfo param)
        {
            if (param.CompanyID > 0)
            {
                //Logger.LogEvent(string.Format("VRP Settings CompanyID: {0} Route No: {1}", param.CompanyID, param.RouteNo), System.Diagnostics.EventLogEntryType.Information);
                return repository.GetByRouteNo(param);
            }
            else
            {
                return repository.GetAll();
            }
        }

        public VrpSettingsInfo GetVrpSettings(int id)
        {
            VrpSettingsInfo currVrpSettings = repository.Get(id);
            if (currVrpSettings == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currVrpSettings;
        }


        public VrpSettingsInfo PostVrpSettings([FromBody]VrpSettingsInfo currVrpSettings)
        {
            currVrpSettings = repository.Add(currVrpSettings);
            return currVrpSettings;
        }

        public bool PutVrpSettings(int id, [FromBody]VrpSettingsInfo currVrpSettings)
        {
            //Logger.LogEvent(string.Format("Enter PutVrpSettings: {0}, ID: {1}", currVrpSettings.RouteNo, id), System.Diagnostics.EventLogEntryType.Information);//testing

            currVrpSettings.VrpSettingsID = id;
            if (!repository.Update(currVrpSettings))
            {
                return false;
                //throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return true;
        }

        public void DeleteVrpSettings(int id)
        {
            VrpSettingsInfo currVrpSettings = repository.Get(id);
            if (currVrpSettings == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }
    }
}
