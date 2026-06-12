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
    public class BigSellerOrderInfoController : ApiController
    {
        private static readonly IBigSellerOrderRepository repository = new BigSellerOrderRepository();

        public IEnumerable<BigSellerOrderInfo> GetByUploadNo([FromUri] BigSellerOrderInfo param)
        {
            if (!string.IsNullOrEmpty(param.UploadNo))
            {
                //Logger.LogEvent(string.Format("Big Seller Order CompanyID: {0} Upload No: {1}", param.CompanyID, param.UploadNo), System.Diagnostics.EventLogEntryType.Information);
                return repository.GetByUploadNo(param);
            }
            else
            {
                return repository.GetAll();
            }
        }

        public BigSellerOrderInfo GetOrder(int id)
        {
            BigSellerOrderInfo currOrder = repository.Get(id);
            if (currOrder == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currOrder;
        }


        public BigSellerOrderInfo PostOrder([FromBody] BigSellerOrderInfo currOrder)
        {
            currOrder = repository.Add(currOrder);
            return currOrder;
        }

        public bool PutOrder(int id, [FromBody] BigSellerOrderInfo currOrder)
        {
            //Logger.LogEvent(string.Format("Enter PutOrder: {0}, ID: {1}", currOrder.RouteNo, id), System.Diagnostics.EventLogEntryType.Information);//testing

            currOrder.OrderID = id;
            if (!repository.Update(currOrder))
            {
                return false;
                //throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return true;
        }

        public void DeleteOrder(int id)
        {
            BigSellerOrderInfo currOrder = repository.Get(id);
            if (currOrder == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }
    }
}
