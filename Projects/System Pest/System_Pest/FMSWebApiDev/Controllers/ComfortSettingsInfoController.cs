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
    public class ComfortSettingsInfoController : ApiController
    {
        private static readonly ISettingsRepository repository = new SettingsRepository();


        public IEnumerable<ComfortSettingsInfo> GetComfort([FromUri]ComfortSettingsInfo param)
        {

          return repository.GetComfort();
            
        }

    }
}
