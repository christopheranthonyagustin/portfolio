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

        //public IEnumerable<AssetInfo> GetAllAssets()
        //{
        //    return repository.GetAll();
        //}

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
                //Logger.LogEvent(string.Format("PARAM IS null"), System.Diagnostics.EventLogEntryType.Information);
                return repository.GetAll();
            }
        }


        public AssetInfo PostAsset([FromBody]AssetInfo currAsset)
        {
            /*
             Name: $('#assetName').val(),
	                Category: $('#assetCategory').val(),
	                Tag: $('#assetDevice').val(),
	                Company: $('#assetCompany').val(),
	                Driver: $('#assetDriver').val(),
	                Phone: $('#assetPhone').val(),
	                Email: $('#assetEmail').val(),
	                Image: $('#assetImage').val(),
	                AlertZones: $('#assetZone').val(),
	                Mileage: $('#assetMileage').val(),
	                DistanceAlert: $('#assetDistanceAlert').val(),
	                DateAlert: $('#assetDateAlert').val(),
	                IdlingLimit: $('#assetIdlingLimit').val(),
	                SpeedLimit: $('#assetSpeedLimit').val(),
	                Notifications: $('#assetNotifications').val(),
	                InstallDate: $('#assetInstallDate').val()
             */
            Logger.LogEvent(string.Format("Enter PostAsset: {0},{1},{2},{3},{4},{5},{6}",
                currAsset.Name, currAsset.Category, currAsset.Tag, currAsset.Company, currAsset.DriverID,
                currAsset.Phone, currAsset.Email), System.Diagnostics.EventLogEntryType.Information);//testing
            currAsset = repository.Add(currAsset);

            Logger.LogEvent(string.Format("Exit PostAsset: {0}", currAsset.ErrorMessage), System.Diagnostics.EventLogEntryType.Information);//testing
            return currAsset;
        }

        public bool PutProduct(int id, [FromBody]AssetInfo currAsset)
        {
            Logger.LogEvent(string.Format("Enter PutProduct: {0}, ID: {1}", currAsset.Name, id), System.Diagnostics.EventLogEntryType.Information);//testing

            currAsset.AssetID = id;
            if (repository.Update(currAsset))
            {
                Logger.LogEvent("PutProduct Success", System.Diagnostics.EventLogEntryType.Information);//testing
                return true;
            }
            else
            {
                Logger.LogEvent("PutProduct Failed", System.Diagnostics.EventLogEntryType.Information);//testing
                return false;
            }
        }

        public void DeleteProduct(int id)
        {
            Logger.LogEvent(string.Format("Enter DeleteProduct: {0}", id), System.Diagnostics.EventLogEntryType.Information);//testing

            AssetInfo currAsset = repository.Get(id);
            if (currAsset == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }



    }
}
