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
    public class SalesItemInfoController : ApiController
    {
        private static readonly IRouteSalesItemRepository repository = new RouteSalesItemRepository();

        public IEnumerable<RouteSalesItemInfo> GetLocFiltered([FromUri]RouteSalesItemInfo param)
        {
            if (param.SalesOrderID > 0)
            {
                return repository.GetByID(param);
            }
            else
            {
                return repository.GetAll();
            }
        }

        public RouteSalesItemInfo GetSI(int id)
        {
            RouteSalesItemInfo currSI = repository.Get(id);
            if (currSI == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currSI;
        }

        public RouteSalesItemInfo PostSI(RouteSalesItemInfo currSI)
        {
            currSI = repository.Add(currSI);
            return currSI;
        }

        public bool PutSI(int id, RouteSalesItemInfo currSI)
        {
            currSI.SalesItemID = id;
            if (repository.Update(currSI))
            {         
                return true;
            }
            else
            {
                return false;
            }
        }

        public void DeleteSI(int id)
        {
            RouteSalesItemInfo currSI = repository.Get(id);
            if (currSI == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }

    }
}
