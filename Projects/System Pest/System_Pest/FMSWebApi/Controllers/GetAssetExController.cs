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
    public class GetAssetExController : ApiController
    {
        private static readonly IAssetRepository repository = new AssetRepository();


        public string Get()
        {
            return "Success";
        }

        // POST: api/getassetex
        public AssetInfo Post([FromBody]AssetInfo value)
        {
            //Logger.LogEvent(string.Format("Tag: {0} DriverID: {1}", item.Tag, item.DriverID), System.Diagnostics.EventLogEntryType.Error);
            value = repository.GetAssetByTagEx(value) as AssetInfo;
            return value;
        }

    }
}
