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
    public class UpdateMainInventoryItemInfoController : ApiController
    {
        private static readonly IMainInventoryItemRepository repository = new MainInventoryItemRepository();

        public bool PutMainInventory(int id, [FromBody]MainInventoryItemInfo currMainInventory)
        {

            currMainInventory.MainInventoryItemID = id;
            if (!repository.UpdateItem(currMainInventory))
            {
                return false;
            }
            return true;
        }

    }
}
