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
    public class SalesOrderInfoController : ApiController
    {
        private static readonly IRouteSalesOrderRepository repository = new RouteSalesOrderRepository();

        public IEnumerable<RouteSalesOrderInfo> GetLocFiltered([FromUri]RouteSalesOrderInfo param)
        {
            if (param.LocationID > 0)
            {
                return repository.GetByID(param);
            }
            else
            {
                return repository.GetAll();
            }
        }

        public RouteSalesOrderInfo GetSO(int id)
        {
            RouteSalesOrderInfo currSO = repository.Get(id);
            if (currSO == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currSO;
        }

        public RouteSalesOrderInfo PostSO(RouteSalesOrderInfo currSO)
        {
            currSO = repository.Add(currSO);
            return currSO;
        }

        public bool PutSO(int id, RouteSalesOrderInfo currSO)
        {
            currSO.SalesOrderID = id;
            if (repository.Update(currSO))
            {         
                return true;
            }
            else
            {
                return false;
            }
        }

        public void DeleteSO(int id)
        {
            RouteSalesOrderInfo currSO = repository.Get(id);
            if (currSO == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }

    }
}
