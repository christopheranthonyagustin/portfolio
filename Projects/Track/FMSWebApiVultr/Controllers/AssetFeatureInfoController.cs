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
    public class AssetFeatureInfoController : ApiController
    {
        private static readonly IAssetFeatureRepository repository = new AssetFeatureRepository();

        public IEnumerable<AssetFeatureInfo> GetAllAssetFeatures([FromUri] AssetFeatureInfo param)
        {
            if (!string.IsNullOrEmpty(param.FeatureDesc))
            {
                return repository.GetFeature(param);
            }
            else
            {
                return repository.GetAll();
            }
        }

        public AssetFeatureInfo GetAssetFeature(int id)
        {
            AssetFeatureInfo currFeature = repository.Get(id);
            if (currFeature == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currFeature;
        }

        public IEnumerable<AssetFeatureInfo> GetByDescription(string description)
        {
            return repository.GetAll().Where(
                c => string.Equals(c.FeatureDesc, description,
                         StringComparison.OrdinalIgnoreCase));
        }

        public AssetFeatureInfo PostAssetFeature(AssetFeatureInfo currFeature)
        {
            currFeature = repository.Add(currFeature);
            return currFeature;
        }

        public void PutAssetFeature(int id, AssetFeatureInfo currFeature)
        {
            currFeature.FeatureID = id;
            if (!repository.Update(currFeature))
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
        }

        public void DeleteAssetFeature(int id)
        {
            AssetFeatureInfo currFeature = repository.Get(id);
            if (currFeature == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }

    }
}
