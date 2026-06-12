using FMSWebApi.Models;
using FMSWebApi.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Cors;

namespace FMSWebApi.Controllers
{
    //[EnableCors(origins: "*", headers: "*", methods: "*")]
    public class ImportVrpPickupItemInfoController : ApiController
    {
        private static readonly IVrpPickupItemRepository repository = new VrpPickupItemRepository();

        public async Task<VrpPickupItemInfo> PostVrpPickup([FromBody]VrpPickupItemInfo currVrpPickup)
        {
            currVrpPickup = await repository.AddImportAsync(currVrpPickup);
            return currVrpPickup;
        }


    }
}
