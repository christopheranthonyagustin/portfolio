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
    public class JobOverviewController : ApiController
    {
        private static readonly IJobRepository repository = new JobRepository();

        public IEnumerable<JobOverviewInfo> GetOverview([FromUri]JobOverviewInfo param)
        {
            if ((param.Timestamp != DateTime.MinValue && param.RxTime != DateTime.MinValue) &&
                (param.AssetResellerID > 0 || param.AssetCompanyID > 0))
            {
                return repository.GetJobOverview(param);
            }
            else
            {
                return repository.GetAllOverview();
            }
        }

    }
}
