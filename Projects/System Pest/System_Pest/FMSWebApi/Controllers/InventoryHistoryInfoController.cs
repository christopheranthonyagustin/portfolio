using FMSWebApi.Models;
using FMSWebApi.Repository;
using ForceSSL.Modules;
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
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class InventoryHistoryInfoController : ApiController
    {
        private static readonly IInventoryHistoryRepository repository = new InventoryHistoryRepository();

        public IEnumerable<InventoryHistoryInfo> GetByCompany([FromUri]InventoryHistoryInfo param)
        {
            if ((param.CompanyID > 0))                            
            {
                return repository.GetByCompany(param);
            }
            else
            {
                return repository.GetAll();
            }
        }
		
        // GET: api/InventoryHistoryInfo
        public InventoryHistoryInfo Get(int id)
        {
            InventoryHistoryInfo currInventory = repository.Get(id);
            if (currInventory == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currInventory;
        }


        public InventoryHistoryInfo PostInventory([FromBody]InventoryHistoryInfo currInventory)
        {
            currInventory = repository.Add(currInventory);
            return currInventory;
        }

        public bool PutInventory(int id, [FromBody]InventoryHistoryInfo currInventory)
        {

            currInventory.InventoryID = id;
            if (!repository.Update(currInventory))
            {
                return false;
            }
            return true;
        }

        public void DeleteInventory(int id)
        {
            InventoryHistoryInfo currInventory = repository.Get(id);
            if (currInventory == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }

    }
}
