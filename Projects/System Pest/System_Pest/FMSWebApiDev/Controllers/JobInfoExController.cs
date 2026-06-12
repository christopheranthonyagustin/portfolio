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
    public class JobInfoExController : ApiController
    {
        private static readonly IJobRepository repository = new JobRepository();

        public IEnumerable<JobInfo> GetByCompanyEx([FromUri]JobInfo param)
        {

            //Logger.LogEvent(string.Format("Timestamp: {0} RxTime: {1}", param.Timestamp, param.RxTime), System.Diagnostics.EventLogEntryType.Information);
            if  ((param.Timestamp != DateTime.MinValue) &&
                (param.AssetResellerID > 0 || param.AssetCompanyID > 0 || param.AssetID > 0 || !string.IsNullOrEmpty(param.Asset) || param.Flag > 0 || !string.IsNullOrEmpty(param.JobStatus) || !string.IsNullOrEmpty(param.Agent)))
                             
            {
                return repository.GetByCompanyEx(param);
            }
            else
            {
                return repository.GetAll();
            }
        }
		
        // GET: api/JobInfoEx
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
