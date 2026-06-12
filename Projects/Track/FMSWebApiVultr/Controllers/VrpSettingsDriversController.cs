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
    public class VrpSettingsDriversController : ApiController
    {
        private static readonly IVrpSettingsRepository repository = new VrpSettingsRepository();

        public bool PostVrpSettingsDriver([FromBody]VrpSettingsInfo currVrpSettings)
        {
            //get driver id
            long driverId = RepoHelpers.GetDriverId(currVrpSettings.Driver, currVrpSettings.CompanyID);
            if (driverId == 0)
            {
                return false;
            }
            else
            {
                return repository.CheckDriver(currVrpSettings.RouteNo, driverId, currVrpSettings.CompanyID);
            }

        }

    }
}
