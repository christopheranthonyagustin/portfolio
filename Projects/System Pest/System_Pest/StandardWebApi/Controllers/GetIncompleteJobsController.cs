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
   // [RequireHttps]
    //[Authorize] // Require authenticated requests.
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class GetIncompleteJobsController : ApiController
    {
        private static readonly IJobRepository repository = new JobRepository();


        public string Get()
        {
            return "Get Incomplete Job";
        }

        public JobInfo Post([FromBody]JobInfo item)
        {
            item = repository.GetIncompleteJobsEx(item);
            return item;
        }

    }
}
