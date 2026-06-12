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
    public class VrpRouteController : ApiController
    {
        private static readonly IVrpRouteRepository repository = new VrpRouteRepository();

        public bool PutVrpRoute(long id, [FromBody]VrpRouteInfo currVrpRoute)
        {
            currVrpRoute.VrpRouteID = id;
            Logger.LogEvent(string.Format("UPDATE Route No: {0} Flag: {1} ", currVrpRoute.RouteNo, currVrpRoute.Flag), System.Diagnostics.EventLogEntryType.Information);
            if (!repository.Update(currVrpRoute))
            {
                return false;
            }
            return true;
        }

    }
}
