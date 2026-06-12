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
    public class UpdateAllSubInventoryHistoryController : ApiController
    {
        private static readonly ISubInventoryHistoryRepository repository = new SubInventoryHistoryRepository();

        public IEnumerable<SubInventoryHistoryInfo> PostInventory([FromUri] SubInventoryHistoryInfo param)
        {
            return repository.UpdateAll(param);
        }

    }
}
