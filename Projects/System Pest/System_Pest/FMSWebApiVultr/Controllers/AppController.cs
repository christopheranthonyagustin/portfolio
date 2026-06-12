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
    //[RequireHttps]
    //[Authorize] // Require authenticated requests.
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class AppController : ApiController
    {
        private static readonly IAppRepository repository = new AppRepository();

        public string Get()
        {
            return "Success";
        }

        // POST: api/app
        public DriverInfo Post([FromBody]DriverInfo value)
        {
            //Logger.LogEvent(string.Format("Username: {0} Password: {1}", value.Name, value.Password), System.Diagnostics.EventLogEntryType.Information);
            value = repository.Add(value) as DriverInfo;
            return value;
        }
    }
}
