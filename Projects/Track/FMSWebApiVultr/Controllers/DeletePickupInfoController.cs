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
    public class DeletePickupInfoController : ApiController
    {
        private static readonly IVrpPickupRepository repository = new VrpPickupRepository();

        public bool DeleteVrpPickup(string id, [FromBody]VrpPickupInfo currVrpPickup)
        {
            currVrpPickup.RouteNo = id;
            if (!repository.RemovePickup(currVrpPickup))
            {
                return false;
            }
            return true;
        }
    }
}
