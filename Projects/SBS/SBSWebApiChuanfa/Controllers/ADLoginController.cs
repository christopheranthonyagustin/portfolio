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
    //[Authorize(Roles = "Administrators")] // Require authenticated requests.
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class ADLoginController : ApiController
    {
        private static readonly IObjectRepository repository = new InfoRepository();

        public string Get()
        {
            //Logger.LogEvent(string.Format("AuthenticationType: {0} IsAuthenticated: {1} Name: {2}", User.Identity.AuthenticationType, User.Identity.IsAuthenticated, User.Identity.Name), System.Diagnostics.EventLogEntryType.Information);

            //if (User.Identity.IsAuthenticated)
            //{
            //    return "Authenticated: " + User.Identity.Name;
            //}
            //else
            //{
            //    return "Not authenticated";
            //}
            return "Success";
        }

        // POST: api/Login
        public UserInfo Post([FromBody]UserInfo value)
        {
            Logger.LogEvent(string.Format("Enter AD Controller Username: {0} Password: {1}", value.User, value.Password), System.Diagnostics.EventLogEntryType.Information);
            value = repository.AD(value) as UserInfo;
            return value;
        }
    }
}
