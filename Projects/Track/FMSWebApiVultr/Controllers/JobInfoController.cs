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
    public class JobInfoController : ApiController
    {
        private static readonly IJobRepository repository = new JobRepository();

        //// GET: api/JobInfo
        //public IEnumerable<JobInfo> GetAll()
        //{
        //    return repository.GetAll();
        //}

        public IEnumerable<JobInfo> GetByCompany([FromUri]JobInfo param)
        {
            if  ((param.Timestamp != DateTime.MinValue && param.RxTime != DateTime.MinValue) && (param.ResellerID > 0 || param.CompanyID > 0))                         
            {
                return repository.GetByCompany(param);
            }
            else
            {
                return repository.GetAll();
            }
        }
		
        // GET: api/JobInfo
        public JobInfo Get(int id)
        {
            JobInfo currPos = repository.Get(id);
            if (currPos == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currPos;
        }


        public JobInfo PostJob([FromBody]JobInfo currJob)
        {
            currJob = repository.Add(currJob);
            return currJob;
        }

        public bool PutJob(int id, [FromBody]JobInfo currJob)
        {
            currJob.JobID = id;
            if (!repository.Update(currJob))
            {
                return false;
            }
            return true;
        }

        public void DeleteJob(int id)
        {
            JobInfo currJob = repository.Get(id);
            if (currJob == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }

    }
}
