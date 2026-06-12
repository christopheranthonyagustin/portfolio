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
    public class UpdateAllHqInventoryHistoryController : ApiController
    {
        private static readonly IMainInventoryHistoryRepository repository = new MainInventoryHistoryRepository();

        public IEnumerable<MainInventoryHistoryInfo> PostInventory([FromUri] MainInventoryHistoryInfo param)
        {
            return repository.UpdateAll(param);
        }

    }
}
