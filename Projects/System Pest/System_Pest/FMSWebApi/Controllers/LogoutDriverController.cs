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
    public class LogoutDriverController : ApiController
    {
        private static readonly IAssetRepository repository = new AssetRepository();


        public string Get()
        {
            return "Logout Driver";
        }

        public AssetInfo Post([FromBody]AssetInfo item)
        {
            //Logger.LogEvent(string.Format("Tag: {0} DriverID: {1}", item.Tag, item.DriverID), System.Diagnostics.EventLogEntryType.Error);
            item = repository.LogoutAssetByTag(item);
            return item;
        }

    }
}
