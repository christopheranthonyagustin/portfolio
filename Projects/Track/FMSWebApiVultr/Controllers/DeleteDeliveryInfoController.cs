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
    public class DeleteDeliveryInfoController : ApiController
    {
        private static readonly IVrpDeliveryRepository repository = new VrpDeliveryRepository();

        public bool DeleteVrpPickup(string id, [FromBody]VrpDeliveryInfo currVrpDelivery)
        {
            currVrpDelivery.RouteNo = id;
            if (!repository.RemovePickup(currVrpDelivery))
            {
                return false;
            }
            return true;
        }
    }
}
