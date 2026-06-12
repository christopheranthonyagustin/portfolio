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
    public class RouteInfoController : ApiController
    {
        private static readonly IRouteRepository repository = new RouteRepository();

        public IEnumerable<RouteInfo> GetRouteFiltered([FromUri]RouteInfo param)
        {
            if (param.CompanyID > 0)
            {
                return repository.GetByCompany(param);
            }
            else
            {
                return repository.GetAll();
            }
        }

        public RouteInfo GetRoute(int id)
        {
            RouteInfo currRoute = repository.Get(id);
            if (currRoute == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currRoute;
        }

        public RouteInfo PostRoute(RouteInfo currRoute)
        {
            currRoute = repository.Add(currRoute);
            return currRoute;
        }

        public void PutRoute(int id, RouteInfo currRoute)
        {
            currRoute.RouteID = id;
            if (!repository.Update(currRoute))
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
        }

        public void DeleteRoute(int id)
        {
            RouteInfo currRoute = repository.Get(id);
            if (currRoute == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }

    }
}
