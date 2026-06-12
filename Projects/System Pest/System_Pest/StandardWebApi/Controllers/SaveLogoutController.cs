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
    public class SaveLogoutController : ApiController
    {
        private static readonly IEventRepository repository = new EventRepository();


        public string Get()
        {
            return "Save Logout Events";
        }

        public EventInfo Post([FromBody]EventInfo item)
        {
            //Logger.LogEvent(string.Format("Tag: {0}", item.Tag), System.Diagnostics.EventLogEntryType.Error);
            item = repository.SaveLogoutEvent(item);
            return item;
        }

    }
}
