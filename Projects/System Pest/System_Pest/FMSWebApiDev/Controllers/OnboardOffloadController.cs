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
    public class OnboardOffloadController : ApiController
    {
        private static readonly IAssetRepository repository = new AssetRepository();

               public string Get()
        {
            return "Onboard/Offload";
        }

        public AssetInfo Post([FromBody]AssetInfo item)
        {
            //Logger.LogEvent(string.Format("OnboardOffload - Tag: {0} DriverID: {1} Flag: {2} Driver: {3} Timestamp: {4} RxTime: {5}", item.Tag, item.DriverID, item.Flag, item.DriverName, item.Timestamp, item.RxTime), System.Diagnostics.EventLogEntryType.Error);
            //Logger.LogEvent(string.Format("OnboardOffload - Patient: {0} Origin: {1} Destination: {2}", item.Patient, item.Origin, item.Destination), System.Diagnostics.EventLogEntryType.Warning);
            item = repository.OnboardOffload(item);
            return item;
        }

    }
}
