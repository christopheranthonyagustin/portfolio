using FMSWebApi.Models;
using FMSWebApi.Repository;
using ForceSSL.Modules;
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
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class JobInfoController : ApiController
    {
        private static readonly IJobRepository repository = new JobRepository();

        public IEnumerable<AppInfo> GetByCompany([FromUri]AppInfo param)
        {
            //Logger.LogEvent(string.Format("Timestamp: {0} RxTime: {1}", param.Timestamp, param.RxTime), System.Diagnostics.EventLogEntryType.Information);
            //Logger.LogEvent(string.Format("AssetID: {0} DriverID: {1}", param.AssetCompanyID, param.DriverID), System.Diagnostics.EventLogEntryType.Information);
            //if  ((param.Timestamp != DateTime.MinValue && param.RxTime != DateTime.MinValue) &&
            //    (param.AssetResellerID > 0 || param.AssetCompanyID > 0))                          
            //{
            //    return repository.GetByCompany(param);
            //}
            //else
            //{
            //    return repository.Clear();
            //}
            if ((param.AssetResellerID > 0 || param.AssetCompanyID > 0))
            {
                return repository.GetByCompany(param);
            }
            else
            {
                return repository.Clear();
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
