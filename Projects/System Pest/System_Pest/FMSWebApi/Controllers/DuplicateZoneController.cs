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
using ForceSSL.Modules;

namespace FMSWebApi.Controllers
{
    //[RequireHttps]
    //[Authorize] // Require authenticated requests.
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class DuplicateZoneController : ApiController
    {
        private static readonly IZoneRepository repository = new ZoneRepository();

        public IEnumerable<ZoneInfo> GetByZone([FromUri]ZoneInfo param)
        {
            if (!string.IsNullOrEmpty(param.Name))
            {
                return repository.GetByZone(param);
            }
            else
            {
                return repository.GetAllZone();
            }
        }

    }
}
