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
   // [Authorize] // Require authenticated requests.
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class LoginController : ApiController
    {
        private static readonly IObjectRepository repository = new InfoRepository();

        public string Get()
        {
            return "Success";
        }

        // POST: api/Login
        public UserInfo Post([FromBody]UserInfo value)
        {
            Logger.LogEvent(string.Format("Username: {0} Password: {1}", value.User, value.Password), System.Diagnostics.EventLogEntryType.Information);
            value = repository.Add(value) as UserInfo;
            return value;
        }
    }
}
