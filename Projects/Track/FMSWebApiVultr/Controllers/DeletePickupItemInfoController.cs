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
    public class DeletePickupItemInfoController : ApiController
    {
        private static readonly IVrpPickupItemRepository repository = new VrpPickupItemRepository();

        public bool DeleteVrpPickup(string id, [FromBody]VrpPickupItemInfo currVrpPickup)
        {
            currVrpPickup.RouteNo = id;
            if (!repository.RemovePickupItem(currVrpPickup))
            {
                return false;
            }
            return true;
        }
    }
}
