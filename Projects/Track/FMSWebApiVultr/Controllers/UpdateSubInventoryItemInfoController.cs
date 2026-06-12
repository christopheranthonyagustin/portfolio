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
    public class UpdateSubInventoryItemInfoController : ApiController
    {
        private static readonly ISubInventoryItemRepository repository = new SubInventoryItemRepository();

        public bool PutMainInventory(int id, [FromBody]SubInventoryItemInfo currSubInventory)
        {

            currSubInventory.SubInventoryItemID = id;
            if (!repository.UpdateItem(currSubInventory))
            {
                return false;
            }
            return true;
        }

    }
}
