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
    public class GetAssetController : ApiController
    {
        private static readonly IAssetRepository repository = new AssetRepository();


        public string Get()
        {
            return "Get Assets";
        }

        public AssetInfo Post([FromBody]AssetInfo item)
        {
            item = repository.GetAssetByTag(item);
            return item;
        }

    }
}
