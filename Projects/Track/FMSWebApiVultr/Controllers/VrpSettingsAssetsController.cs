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
    //[EnableCors(origins: "*", headers: "*", methods: "*")]
    public class VrpSettingsAssetsController : ApiController
    {
        private static readonly IVrpSettingsRepository repository = new VrpSettingsRepository();

        public bool PostVrpSettingsAsset([FromBody]VrpSettingsInfo currVrpSettings)
        {
            //get asset id
            long assetId = RepoHelpers.GetAssetId(currVrpSettings.Asset, currVrpSettings.CompanyID);
            if (assetId == 0)
            {
                return false;
            }
            else
            {
                return repository.CheckAsset(currVrpSettings.RouteNo, assetId, currVrpSettings.CompanyID);
            }

        }

    }
}
