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
    public class DeleteDeliveryItemInfoController : ApiController
    {
        private static readonly IVrpDeliveryItemRepository repository = new VrpDeliveryItemRepository();

        public bool DeleteVrpDelivery(string id, [FromBody]VrpDeliveryItemInfo currVrpDelivery)
        {
            currVrpDelivery.RouteNo = id;
            if (!repository.RemoveDeliveryItem(currVrpDelivery))
            {
                return false;
            }
            return true;
        }
    }
}
