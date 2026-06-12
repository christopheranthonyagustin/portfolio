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

namespace FMSWebApi.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class UpdateAssetController : ApiController
    {
        private static readonly IAssetRepository repository = new AssetRepository();

        public AssetInfo UpdateAsset([FromBody]AssetInfo currAsset)
        {

            currAsset = repository.UpdateAsset(currAsset);
            return currAsset;
        }


    }
}
