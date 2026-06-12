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
    public class MaintenanceJobInfoController : ApiController
    {
        private static readonly IMaintenanceJobRepository repository = new MaintenanceJobRepository();

        public IEnumerable<MaintenanceJobInfo> GetMaintenanceJob([FromUri]MaintenanceJobInfo param)
        {
            if ((param.MaintenanceID > 0))
            {
                return repository.GetMaintenanceJob(param);
            }
            else
            {
                return repository.GetAllEx();
            }
        }
		
        // GET: api/MaintenanceJobInfo
        public MaintenanceJobInfo Get(int id)
        {
            MaintenanceJobInfo currMainJob = repository.Get(id);
            if (currMainJob == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currMainJob;
        }


        public MaintenanceJobInfo PostMaintenanceJob([FromBody]MaintenanceJobInfo currMainJob)
        {
            currMainJob = repository.Add(currMainJob);
            return currMainJob;
        }

        public bool PutMaintenanaceJob(int id, [FromBody]MaintenanceJobInfo currMainJob)
        {

            currMainJob.MaintenanceJobID = id;
            if (!repository.Update(currMainJob))
            {
                return false;
            }
            return true;
        }
        public void DeleteMaintenanceJob(int id)
        {
            MaintenanceJobInfo currMainJob = repository.Get(id);
            if (currMainJob == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }

    }
}
