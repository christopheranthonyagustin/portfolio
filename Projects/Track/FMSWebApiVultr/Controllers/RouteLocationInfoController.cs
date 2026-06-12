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
    public class RouteLocationInfoController : ApiController
    {
        private static readonly IRouteLocationRepository repository = new RouteLocationRepository();

        public IEnumerable<RouteLocationInfo> GetLocFiltered([FromUri]RouteLocationInfo param)
        {
            if (param.CompanyID > 0)
            {
                return repository.GetByDriver(param);
            }
            else
            {
                return repository.GetAll();
            }
        }

        public RouteLocationInfo GetLoc(int id)
        {
            RouteLocationInfo currLocation = repository.Get(id);
            if (currLocation == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currLocation;
        }

        public RouteLocationInfo PostLoc(RouteLocationInfo currLocation)
        {
            currLocation = repository.Add(currLocation);
            return currLocation;
        }

        public bool PutLoc(int id, RouteLocationInfo currLocation)
        {
            currLocation.LocationID = id;
            if (repository.Update(currLocation))
            {              
                return true;
            }
            else
            {
                return false;
            }
        }

        public void DeleteLoc(int id)
        {
            RouteLocationInfo currLocation = repository.Get(id);
            if (currLocation == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }

    }
}
