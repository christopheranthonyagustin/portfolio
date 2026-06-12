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
    public class RoyalSettingsInfoController : ApiController
    {
        private static readonly ISettingsRepository repository = new SettingsRepository();


        public IEnumerable<RoyalSettingsInfo> GetRoyal([FromUri]RoyalSettingsInfo param)
        {

          return repository.GetRoyal();
            
        }

    }
}
