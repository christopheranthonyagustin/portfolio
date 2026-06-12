using MySqlConnector;
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
    public class ReverseGeocodeController : ApiController
    {
        private static readonly ISettingsRepository repository = new SettingsRepository();


        public IEnumerable<ReverseGeocodeInfo> GetReverseGeocode([FromUri]ReverseGeocodeInfo param)
        {
            Logger.LogEvent(string.Format("Enter Reverse Geocode: Lat: {0} Long: {1}", param.PosY, param.PosX), System.Diagnostics.EventLogEntryType.Information);
            return repository.GetReverseGeocode(param);

        }

    }
}
