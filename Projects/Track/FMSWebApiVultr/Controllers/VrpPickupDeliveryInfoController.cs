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

    public class VrpPickupDeliveryInfoController : ApiController
    {
        private static readonly IVrpPickupDeliveryRepository repository = new VrpPickupDeliveryRepository();

        public IEnumerable<VrpPickupDeliveryInfo> GetByRouteNo([FromUri]VrpPickupDeliveryInfo param)
        {
            if (param.TimeWindowStart != DateTime.MinValue && param.TimeWindowEnd != DateTime.MinValue && !string.IsNullOrEmpty(param.Platform))
            {
                return repository.GetByRouteNo(param);
            }
            else
            {
                return repository.GetAll();
            }
        }

        public bool PutVrpPickupDelivery(int id, [FromBody] VrpPickupInfo currVrpPickup)
        {
            currVrpPickup.PickupID = id;
            Logger.LogEvent(string.Format("VrpRouteID: {0}", currVrpPickup.VrpRouteID), System.Diagnostics.EventLogEntryType.Warning);
            if (!repository.UpdatePickupDelivery(currVrpPickup))
            {
                return false;
            }
            return true;
        }

    }
}
