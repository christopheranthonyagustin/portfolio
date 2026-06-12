using MySql.Data.MySqlClient;
using FMSWebApi.Models;
using FMSWebApi.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using ForceSSL.Modules;

namespace FMSWebApi.Controllers
{
    //[RequireHttps]
    //[Authorize] // Require authenticated requests.
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class IncompleteJobsController : ApiController
    {
        private static readonly IJobRepository repository = new JobRepository();

        public IEnumerable<JobInfo> GetIncompleteJobs([FromUri]JobInfo param)
        {
            //Logger.LogEvent(string.Format("Timestamp: {0} AssetID: {1}", param.Timestamp, param.AssetID), System.Diagnostics.EventLogEntryType.Warning);
            if ((param.Timestamp != DateTime.MinValue) && (param.AssetResellerID > 0 || param.AssetCompanyID > 0 || param.AssetID > 0 || param.Flag > 0))         
            {
                return repository.GetIncompleteJobs(param);
            }
            else
            {
                return repository.ClearJobs();
            }
        }

    }
}
