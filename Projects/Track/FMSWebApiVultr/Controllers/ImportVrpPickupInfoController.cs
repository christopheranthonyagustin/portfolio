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
    public class ImportVrpPickupInfoController : ApiController
    {
        private static readonly IVrpPickupRepository repository = new VrpPickupRepository();

        public VrpPickupInfo PostImportVrpPickup([FromBody]VrpPickupInfo currVrpPickup)
        {
            currVrpPickup = repository.AddImport(currVrpPickup);
            return currVrpPickup;
        }
    }
}
