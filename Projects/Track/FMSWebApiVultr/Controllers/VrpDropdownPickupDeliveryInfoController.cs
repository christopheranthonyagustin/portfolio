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
    public class VrpDropdownPickupDeliveryInfoController : ApiController
    {
        private static readonly IVrpPickupDeliveryRepository repository = new VrpPickupDeliveryRepository();

        public IEnumerable<VrpPickupDeliveryInfo> GetOrders([FromUri]VrpPickupDeliveryInfo param)
        {
            return repository.GetOrders(param);
        }

    }
}
