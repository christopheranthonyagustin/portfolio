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
    public class CheckDriverController : ApiController
    {
        private static readonly IAppRepository repository = new AppRepository();


        public string Get()
        {
            return "Check Driver";
        }

        public DriverInfo Post([FromBody]DriverInfo value)
        {
            //Logger.LogEvent(string.Format("Username: {0} Password: {1}", value.Name, value.Password), System.Diagnostics.EventLogEntryType.Information);
            value = repository.CheckDriver(value) as DriverInfo;
            return value;
        }

    }
}
