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
    public class DeleteVrpSettingsAreaInfoController : ApiController
    {
        private static readonly IVrpSettingsAreaRepository repository = new VrpSettingsAreaRepository();

        public bool DeleteVrpSettingsArea(long id, [FromBody]VrpSettingsAreaInfo currVrpSettings)
        {
            currVrpSettings.VrpSettingsID = id;
            if (!repository.RemoveVrpSettingsArea(currVrpSettings))
            {
                return false;
            }
            return true;
        }


    }
}
