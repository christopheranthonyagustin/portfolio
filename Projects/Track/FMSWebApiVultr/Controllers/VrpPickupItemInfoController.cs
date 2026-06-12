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
    public class VrpPickupItemInfoController : ApiController
    {
        private static readonly IVrpPickupItemRepository repository = new VrpPickupItemRepository();

        public IEnumerable<VrpPickupItemInfo> GetByID([FromUri]VrpPickupItemInfo param)
        {
            if (param.PickupID > 0)
            {
                return repository.GetByID(param);
            }
            else
            {
                return repository.GetAll();
            }
        }

        public VrpPickupItemInfo GetVrpPickup(int id)
        {
            VrpPickupItemInfo currVrpPickup = repository.Get(id);
            if (currVrpPickup == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currVrpPickup;
        }


        public VrpPickupItemInfo PostVrpPickup([FromBody]VrpPickupItemInfo currVrpPickup)
        {
            currVrpPickup = repository.Add(currVrpPickup);
            return currVrpPickup;
        }

        public bool PutVrpPickup(int id, [FromBody]VrpPickupItemInfo currVrpPickup)
        {

            currVrpPickup.PickupItemID = id;
            if (!repository.Update(currVrpPickup))
            {
                return false;
            }
            return true;
        }

        public void DeleteVrpPickup(int id)
        {
            VrpPickupItemInfo currVrpPickup = repository.Get(id);
            if (currVrpPickup == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }
    }
}
