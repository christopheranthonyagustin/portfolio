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
    public class LocationInfoController : ApiController
    {
        private static readonly ILocationRepository repository = new LocationRepository();

        public IEnumerable<LocationInfo> GetAllRoutes()
        {
            return repository.GetAll();
        }

        public LocationInfo GetLoc(int locID)
        {
            LocationInfo currLocation = repository.Get(locID);
            if (currLocation == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currLocation;
        }

        public IEnumerable<LocationInfo> GetLocationByName(string location_name)
        {
            return repository.GetAll().Where(
                c => string.Equals(c.Segment, location_name,
                         StringComparison.OrdinalIgnoreCase));
        }

        public LocationInfo PostLoc(LocationInfo currLocation)
        {
            currLocation = repository.Add(currLocation);
            return currLocation;
        }

        public void PutLoc(int locID, LocationInfo currLocation)
        {
            currLocation.LocationID = locID;
            if (!repository.Update(currLocation))
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
        }

        public void DeleteLoc(int locID)
        {
            LocationInfo currLocation = repository.Get(locID);
            if (currLocation == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(locID);
        }

    }
}
