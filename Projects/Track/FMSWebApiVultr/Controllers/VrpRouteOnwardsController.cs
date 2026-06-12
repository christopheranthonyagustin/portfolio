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
    public class VrpUpdateRouteController : ApiController
    {
        private static readonly IVrpRouteRepository repository = new VrpRouteRepository();

        public bool PutVrpRoute(long id, [FromBody]VrpRouteInfo currVrpRoute)
        {
            currVrpRoute.VrpRouteID = id;
            if (!repository.UpdateRoutes(currVrpRoute))
            {
                return false;
            }
            return true;
        }

    }
}
