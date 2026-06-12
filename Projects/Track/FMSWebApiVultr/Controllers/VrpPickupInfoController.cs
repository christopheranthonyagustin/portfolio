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
    public class VrpPickupInfoController : ApiController
    {
        private static readonly IVrpPickupRepository repository = new VrpPickupRepository();

        public IEnumerable<VrpPickupInfo> GetByRouteNo([FromUri]VrpPickupInfo param)
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

        public VrpPickupInfo GetVrpPickup(int id)
        {
            VrpPickupInfo currVrpPickup = repository.Get(id);
            if (currVrpPickup == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currVrpPickup;
        }


        public VrpPickupInfo PostVrpPickup([FromBody]VrpPickupInfo currVrpPickup)
        {
            currVrpPickup = repository.Add(currVrpPickup);
            return currVrpPickup;
        }

        public bool PutVrpPickup(int id, [FromBody]VrpPickupInfo currVrpPickup)
        {
            currVrpPickup.PickupID = id;
            if (!repository.Update(currVrpPickup))
            {
                return false;
            }
            return true;
        }

        public void DeleteVrpPickup(int id)
        {
            VrpPickupInfo currVrpPickup = repository.Get(id);
            if (currVrpPickup == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }
    }
}
