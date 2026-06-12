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
    public class LogoutAssetController : ApiController
    {
        private static readonly IJobRepository repository = new JobRepository();


        public string Get()
        {
            return "Logout Asset";
        }

        public JobInfo Post([FromBody]JobInfo item)
        {
            //Logger.LogEvent(string.Format("AssetCompanyID: {0} JobUser: {1} Timestamp: {2} RxTime: {3}", item.AssetCompanyID, item.JobUser, item.Timestamp, item.RxTime), System.Diagnostics.EventLogEntryType.Warning);
            item = repository.LogoutAsset(item);
            return item;
        }

    }
}
