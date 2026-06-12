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
    public class VrpRouteInfoController : ApiController
    {
        private static readonly IVrpRouteRepository repository = new VrpRouteRepository();

        public IEnumerable<VrpRouteInfo> GetByRouteNo([FromUri]VrpRouteInfo param)
        {
            if (param.TimeWindowStart != DateTime.MinValue && param.TimeWindowEnd != DateTime.MinValue)
            {
                return repository.GetByRouteNo(param);
            }
            else
            {
                return repository.GetAll();
            }
        }

        public VrpRouteInfo GetVrpRoute(long id)
        {
            VrpRouteInfo currVrpRoute = repository.Get(id);
            if (currVrpRoute == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currVrpRoute;
        }

        public bool PutVrpRoute(int id, [FromBody]VrpRouteInfo currVrpRoute)
        {
            currVrpRoute.VrpRouteID = id;
            //Logger.LogEvent(string.Format("Route No: {0} Flag: {1} ", currVrpRoute.RouteNo, currVrpRoute.Flag), System.Diagnostics.EventLogEntryType.Information);
            if (!repository.Cancel(currVrpRoute))
            {
                return false;
            }
            return true;
        }

    }
}
