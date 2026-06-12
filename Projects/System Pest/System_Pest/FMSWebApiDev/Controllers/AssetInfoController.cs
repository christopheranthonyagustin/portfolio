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
    public class AssetInfoController : ApiController
    {
        private static readonly IAssetRepository repository = new AssetRepository();


        public AssetInfo GetAsset(int id)
        {
            AssetInfo currAsset = repository.Get(id);
            if (currAsset == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currAsset;
        }

        public IEnumerable<AssetInfo> GetAssetByName(string assetname)
        {
            return repository.GetAll().Where(
                c => string.Equals(c.Name, assetname,
                         StringComparison.OrdinalIgnoreCase));
        }


        public IEnumerable<AssetInfo> GetAssetsEx([FromUri]UserInfo param)
        {
            if ((param.UserID > 0 || param.ResellerID > 0 || param.CompanyID > 0))
            {
               
                return repository.GetAssetsEx(param);
            }
            else
            {
                return repository.GetAll();
            }
        }


        public AssetInfo PostAsset([FromBody]AssetInfo currAsset)
        {
              currAsset = repository.Add(currAsset);
              return currAsset;
        }

        public bool PutProduct(int id, [FromBody]AssetInfo currAsset)
        {

            currAsset.AssetID = id;
            if (repository.Update(currAsset))
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public void DeleteProduct(int id)
        {
            AssetInfo currAsset = repository.Get(id);
            if (currAsset == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }
    }
}
