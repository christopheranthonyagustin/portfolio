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
    public class VrpSettingsAreaInfoController : ApiController
    {
        private static readonly IVrpSettingsAreaRepository repository = new VrpSettingsAreaRepository();

        public IEnumerable<VrpSettingsAreaInfo> GetByRouteNo([FromUri]VrpSettingsAreaInfo param)
        {
            if (param.CompanyID > 0)
            {

                return repository.GetById(param);
            }
            else
            {
                return repository.GetAll();
            }
        }

        public VrpSettingsAreaInfo GetVrpSettings(int id)
        {
            VrpSettingsAreaInfo currVrpSettings = repository.Get(id);
            if (currVrpSettings == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currVrpSettings;
        }


        public VrpSettingsAreaInfo PostVrpSettings([FromBody]VrpSettingsAreaInfo currVrpSettings)
        {
            currVrpSettings = repository.Add(currVrpSettings);
            return currVrpSettings;
        }

        public bool PutVrpSettings(int id, [FromBody]VrpSettingsAreaInfo currVrpSettings)
        {
            //Logger.LogEvent(string.Format("Enter PutVrpSettings: {0}, ID: {1}", currVrpSettings.VrpSettingsID, id), System.Diagnostics.EventLogEntryType.Information);//testing

            currVrpSettings.VrpSettingsAreaID = id;
            if (!repository.Update(currVrpSettings))
            {
                return false;
            }
            return true;
        }

        public void DeleteVrpSettings(int id)
        {
            VrpSettingsAreaInfo currVrpSettings = repository.Get(id);
            if (currVrpSettings == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }
    }
}
