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
   // [RequireHttps]
    //[Authorize] // Require authenticated requests.
    //[EnableCors(origins: "*", headers: "*", methods: "*")]
    public class MainInventoryHistoryInfoController : ApiController
    {
        private static readonly IMainInventoryHistoryRepository repository = new MainInventoryHistoryRepository();

        public IEnumerable<MainInventoryHistoryInfo> GetByCompany([FromUri]MainInventoryHistoryInfo param)
        {
            if ((param.Timestamp != DateTime.MinValue && param.RxTime != DateTime.MinValue) && param.CompanyID > 0)                            
            {
                return repository.GetByCompany(param);
            }
            else
            {
                return repository.GetAll();
            }
        }

        // GET: api/MainInventoryHistoryInfo
        public MainInventoryHistoryInfo Get(int id)
        {
            MainInventoryHistoryInfo currInventory = repository.Get(id);
            if (currInventory == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currInventory;
        }


        public MainInventoryHistoryInfo PostInventory([FromBody]MainInventoryHistoryInfo currInventory)
        {
            currInventory = repository.Add(currInventory);
            return currInventory;
        }

        public bool PutInventory(int id, [FromBody]MainInventoryHistoryInfo currInventory)
        {

            currInventory.MainInventoryHistoryID = id;
            if (!repository.Update(currInventory))
            {
                return false;
            }
            return true;
        }

        public void DeleteInventory(int id)
        {
            MainInventoryHistoryInfo currInventory = repository.Get(id);
            if (currInventory == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }

    }
}
