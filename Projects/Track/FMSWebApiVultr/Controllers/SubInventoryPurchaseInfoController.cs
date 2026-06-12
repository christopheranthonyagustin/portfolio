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
    public class SubInventoryPurchaseInfoController : ApiController
    {
        private static readonly ISubInventoryPurchaseRepository repository = new SubInventoryPurchaseRepository();

        public IEnumerable<SubInventoryPurchaseInfo> GetByCompany([FromUri]SubInventoryPurchaseInfo param)
        {
            if ((param.CompanyID > 0))                            
            {
                return repository.GetByCompany(param);
            }
            else
            {
                return repository.ClearPurchase();
            }
        }
		
        // GET: api/SubInventoryPurchaseInfo
        public SubInventoryPurchaseInfo Get(int id)
        {
            SubInventoryPurchaseInfo currInventory = repository.Get(id);
            if (currInventory == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currInventory;
        }


        public SubInventoryPurchaseInfo PostInventory([FromBody]SubInventoryPurchaseInfo currInventory)
        {
            currInventory = repository.Add(currInventory);
            return currInventory;
        }

        public bool PutInventory(int id, [FromBody]SubInventoryPurchaseInfo currInventory)
        {

            currInventory.SubInventoryPurchaseID = id;
            if (!repository.Update(currInventory))
            {
                return false;
            }
            return true;
        }

        public void DeleteInventory(int id)
        {
            SubInventoryPurchaseInfo currInventory = repository.Get(id);
            if (currInventory == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }

    }
}
