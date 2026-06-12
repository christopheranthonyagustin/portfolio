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
    public class MainInventoryPurchaseInfoController : ApiController
    {
        private static readonly IMainInventoryPurchaseRepository repository = new MainInventoryPurchaseRepository();

        public IEnumerable<MainInventoryPurchaseInfo> GetByCompany([FromUri]MainInventoryPurchaseInfo param)
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
		
        // GET: api/MainInventoryPurchaseInfo
        public MainInventoryPurchaseInfo Get(int id)
        {
            MainInventoryPurchaseInfo currInventory = repository.Get(id);
            if (currInventory == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currInventory;
        }


        public MainInventoryPurchaseInfo PostInventory([FromBody]MainInventoryPurchaseInfo currInventory)
        {
            currInventory = repository.Add(currInventory);
            return currInventory;
        }

        public bool PutInventory(int id, [FromBody]MainInventoryPurchaseInfo currInventory)
        {

            currInventory.MainInventoryPurchaseID = id;
            if (!repository.Update(currInventory))
            {
                return false;
            }
            return true;
        }

        public void DeleteInventory(int id)
        {
            MainInventoryPurchaseInfo currInventory = repository.Get(id);
            if (currInventory == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }

    }
}
