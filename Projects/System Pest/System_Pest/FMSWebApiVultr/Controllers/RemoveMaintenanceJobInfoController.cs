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
    public class RemoveMaintenanceJobInfoController : ApiController
    {
        private static readonly IMaintenanceJobRepository repository = new MaintenanceJobRepository();
		
        public void DeleteMaintenanceJob(long id)
        {
            MaintenanceJobInfo currMainJob = repository.Get(id);
            if (currMainJob == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.RemoveMainJob(id);
        }

    }
}
