using FMSWebApi.Models;
using FMSWebApi.Repository;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using System.Web.Http.Cors;

namespace FMSWebApi.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class MaintenanceJobBulkInfoController : ApiController
    {
        private static readonly IMaintenanceJobRepository repository = new MaintenanceJobRepository();

        public MaintenanceJobInfo PostMaintenanceJobBulkDelete([FromBody]MaintenanceJobInfo currMainJob)
        {
            currMainJob = repository.BulkDelete(currMainJob);
            return currMainJob;
        }
    }
}
