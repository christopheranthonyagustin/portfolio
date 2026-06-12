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
    public class UpdateRouteController : ApiController
    {
        private static readonly IRouteRepository repository = new RouteRepository();

        public bool PutUpdateRoute(int id, RouteInfo currRoute)
        {
            currRoute.RouteID = id;
            if (repository.UpdateRoute(currRoute))
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}
