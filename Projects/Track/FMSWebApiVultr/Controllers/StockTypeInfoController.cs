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
    public class StockTypeInfoController : ApiController
    {
        private static readonly IStockTypeRepository repository = new StockTypeRepository();

        public IEnumerable<StockTypeInfo> GetAllStockType()
        {
            return repository.GetAll();
        }

        public StockTypeInfo GetStockType(int id)
        {
            StockTypeInfo currStockType = repository.Get(id);
            if (currStockType == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currStockType;
        }

        public StockTypeInfo PostStockType(StockTypeInfo currStockType)
        {
            currStockType = repository.Add(currStockType);
            return currStockType;
        }

        public void PutStockType(int id, StockTypeInfo currStockType)
        {
            currStockType.StockTypeID = id;
            if (!repository.Update(currStockType))
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
        }

        public void DeleteStockType(int id)
        {
            StockTypeInfo currStockType = repository.Get(id);
            if (currStockType == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }

    }
}
