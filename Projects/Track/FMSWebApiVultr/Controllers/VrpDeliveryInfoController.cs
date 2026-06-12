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
    public class VrpDeliveryInfoController : ApiController
    {
        private static readonly IVrpDeliveryRepository repository = new VrpDeliveryRepository();

        public IEnumerable<VrpDeliveryInfo> GetByRouteNo([FromUri]VrpDeliveryInfo param)
        {
            if (!string.IsNullOrEmpty(param.RouteNo))
            {

                return repository.GetByRouteNo(param);
            }
            else
            {
                return repository.GetAll();
            }
        }

        public VrpDeliveryInfo GetVrpDelivery(int id)
        {
            VrpDeliveryInfo currVrpDelivery = repository.Get(id);
            if (currVrpDelivery == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currVrpDelivery;
        }


        public VrpDeliveryInfo PostVrpDelivery([FromBody]VrpDeliveryInfo currVrpDelivery)
        {
            currVrpDelivery = repository.Add(currVrpDelivery);
            return currVrpDelivery;
        }

        public bool PutVrpDelivery(int id, [FromBody]VrpDeliveryInfo currVrpDelivery)
        {
            Logger.LogEvent(string.Format("Enter PutVrpDelivery: {0}, ID: {1}", currVrpDelivery.RouteNo, id), System.Diagnostics.EventLogEntryType.Information);//testing

            currVrpDelivery.DeliveryID = id;
            if (!repository.Update(currVrpDelivery))
            {
                return false;
            }
            return true;
        }

        public void DeleteVrpDelivery(int id)
        {
            VrpDeliveryInfo currVrpDelivery = repository.Get(id);
            if (currVrpDelivery == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }
    }
}
