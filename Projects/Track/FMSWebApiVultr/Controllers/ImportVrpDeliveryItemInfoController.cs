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
    public class ImportVrpDeliveryItemInfoController : ApiController
    {
        private static readonly IVrpDeliveryItemRepository repository = new VrpDeliveryItemRepository();

        public async Task<VrpDeliveryItemInfo> PostVrpDelivery([FromBody] VrpDeliveryItemInfo currVrpDelivery)
        {
            currVrpDelivery = await repository.AddImportAsync(currVrpDelivery);
            return currVrpDelivery;
        }


    }
}
