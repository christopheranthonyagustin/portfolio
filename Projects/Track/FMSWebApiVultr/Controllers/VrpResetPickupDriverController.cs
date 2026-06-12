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
    public class VrpResetPickupDriverController : ApiController
    {
        private static readonly IVrpPickupRepository repository = new VrpPickupRepository();

        public bool PutVrpPickupDriver([FromBody]VrpPickupInfo currVrpPickup)
        {
            Logger.LogEvent(string.Format("Enter ClearVrpPickupDriver: {0}", currVrpPickup.RouteNo), System.Diagnostics.EventLogEntryType.Information);//testing

            if (!repository.UpdatePickupDriver(currVrpPickup))
            {
                return false;
            }
            return true;
        }

    }
}
