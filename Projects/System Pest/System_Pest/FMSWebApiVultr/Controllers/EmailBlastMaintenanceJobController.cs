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
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class EmailBlastMaintenanceJobController : ApiController
    {
        private static readonly IMaintenanceJobRepository repository = new MaintenanceJobRepository();

        public IEnumerable<MaintenanceJobInfo> PostMaintenanceJob([FromUri] MaintenanceJobInfo currMainJob)
        {

            return repository.EmailBlast(currMainJob);

        }


    }
}
