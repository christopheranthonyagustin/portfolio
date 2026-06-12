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
    public class MaintenanceJobInfoExController : ApiController
    {
        private static readonly IMaintenanceJobRepository repository = new MaintenanceJobRepository();
		
        // GET: api/MaintenanceJobInfo
        public MaintenanceJobInfo Get(int id)
        {
            MaintenanceJobInfo currMainJob = repository.GetMaintenance(id);
            if (currMainJob == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currMainJob;
        }


    }
}
