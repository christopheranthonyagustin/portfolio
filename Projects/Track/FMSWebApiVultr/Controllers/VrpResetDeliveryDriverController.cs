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
    public class VrpResetDeliveryDriverController : ApiController
    {
        private static readonly IVrpDeliveryRepository repository = new VrpDeliveryRepository();

        public bool PutVrpDeliveryDriver([FromBody]VrpDeliveryInfo currVrpDelivery)
        {
            Logger.LogEvent(string.Format("Enter ClearVrpDeliveryDriver: {0}", currVrpDelivery.RouteNo), System.Diagnostics.EventLogEntryType.Information);//testing

            if (!repository.UpdateDeliveryDriver(currVrpDelivery))
            {
                return false;
            }
            return true;
        }

    }
}
