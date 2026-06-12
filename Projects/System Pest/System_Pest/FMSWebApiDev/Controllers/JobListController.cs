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
    public class JobListController : ApiController
    {
        private static readonly IJobRepository repository = new JobRepository();

        public IEnumerable<JobInfo> GetJobList([FromUri]JobInfo param)
        {
            //Logger.LogEvent(string.Format("Timestamp: {0} RxTime: {1}", param.Timestamp, param.RxTime), System.Diagnostics.EventLogEntryType.Information);
            if ((param.Timestamp != DateTime.MinValue && param.RxTime != DateTime.MinValue) &&
                (param.AssetResellerID > 0 || param.AssetCompanyID > 0 || !string.IsNullOrEmpty(param.JobUser)))                    
            {
                return repository.GetJobList(param);
            }
            else
            {
                return repository.GetAll();
            }
        }
		
        // GET: api/JobList
        public JobInfo Get(int id)
        {
            JobInfo currPos = repository.Get(id);
            if (currPos == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currPos;
        }

    }
}
