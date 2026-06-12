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
    public class VrpDeliveryItemInfoController : ApiController
    {
        private static readonly IVrpDeliveryItemRepository repository = new VrpDeliveryItemRepository();

        public IEnumerable<VrpDeliveryItemInfo> GetByID([FromUri]VrpDeliveryItemInfo param)
        {
            if (param.DeliveryID > 0)
            {
                return repository.GetByID(param);
            }
            else
            {
                return repository.GetAll();
            }
        }

        public VrpDeliveryItemInfo GetVrpDelivery(int id)
        {
            VrpDeliveryItemInfo currVrpDelivery = repository.Get(id);
            if (currVrpDelivery == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currVrpDelivery;
        }


        public VrpDeliveryItemInfo PostVrpDelivery([FromBody]VrpDeliveryItemInfo currVrpDelivery)
        {
            currVrpDelivery = repository.Add(currVrpDelivery);
            return currVrpDelivery;
        }

        public bool PutVrpDelivery(int id, [FromBody]VrpDeliveryItemInfo currVrpDelivery)
        {

            currVrpDelivery.DeliveryItemID = id;
            if (!repository.Update(currVrpDelivery))
            {
                return false;
            }
            return true;
        }

        public void DeleteVrpDelivery(int id)
        {
            VrpDeliveryItemInfo currVrpDelivery = repository.Get(id);
            if (currVrpDelivery == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }
    }
}
