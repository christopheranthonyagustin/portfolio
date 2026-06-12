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
    public class SearchAssetController : ApiController
    {
        private static readonly IAssetRepository repository = new AssetRepository();

        public IEnumerable<AssetInfo> GetByAssetID([FromUri]AssetInfo param)
        {
            if (param.AssetID > 0)
            {
                return repository.GetByAssetID(param);
            }
            else
            {
                return repository.ClearAssets();
            }
        }

    }
}
