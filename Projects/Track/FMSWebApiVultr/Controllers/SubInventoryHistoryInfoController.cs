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
    public class SubInventoryHistoryInfoController : ApiController
    {
        private static readonly ISubInventoryHistoryRepository repository = new SubInventoryHistoryRepository();

        public IEnumerable<SubInventoryHistoryInfo> GetByCompany([FromUri]SubInventoryHistoryInfo param)
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
		
        // GET: api/SubInventoryHistoryInfo
        public SubInventoryHistoryInfo Get(int id)
        {
            SubInventoryHistoryInfo currInventory = repository.Get(id);
            if (currInventory == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currInventory;
        }


        public SubInventoryHistoryInfo PostInventory([FromBody]SubInventoryHistoryInfo currInventory)
        {
            currInventory = repository.Add(currInventory);
            return currInventory;
        }

        public bool PutInventory(int id, [FromBody]SubInventoryHistoryInfo currInventory)
        {

            currInventory.SubInventoryHistoryID = id;
            if (!repository.Update(currInventory))
            {
                return false;
            }
            return true;
        }

        public void DeleteInventory(int id)
        {
            SubInventoryHistoryInfo currInventory = repository.Get(id);
            if (currInventory == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }

    }
}
