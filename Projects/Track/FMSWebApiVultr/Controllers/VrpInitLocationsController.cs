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
    public class VrpInitLocationInfoController : ApiController
    {
        private static readonly IVrpInitLocationRepository repository = new VrpInitLocationRepository();

        public IEnumerable<VrpInitLocationInfo> GetByRouteNo([FromUri]VrpInitLocationInfo param)
        {
            if (!string.IsNullOrEmpty(param.RouteNo))
            {

                return repository.GetByRouteNo(param);
            }
            else
            {
                return repository.GetAll();
            }
        }

        public VrpInitLocationInfo GetVrpInitLocation(int id)
        {
            VrpInitLocationInfo currVrpInitLocation = repository.Get(id);
            if (currVrpInitLocation == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currVrpInitLocation;
        }


        public VrpInitLocationInfo PostVrpInitLocation([FromBody]VrpInitLocationInfo currVrpInitLocation)
        {
            currVrpInitLocation = repository.Add(currVrpInitLocation);
            return currVrpInitLocation;
        }

        public bool PutVrpInitLocation(int id, [FromBody]VrpInitLocationInfo currVrpInitLocation)
        {
            Logger.LogEvent(string.Format("Enter PutVrpInitLocation: {0}, ID: {1}", currVrpInitLocation.RouteNo, id), System.Diagnostics.EventLogEntryType.Information);//testing

            currVrpInitLocation.InitialLocationID = id;
            if (!repository.Update(currVrpInitLocation))
            {
                return false;
            }
            return true;
        }

        public void DeleteVrpInitLocation(int id)
        {
            VrpInitLocationInfo currVrpInitLocation = repository.Get(id);
            if (currVrpInitLocation == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }
    }
}
