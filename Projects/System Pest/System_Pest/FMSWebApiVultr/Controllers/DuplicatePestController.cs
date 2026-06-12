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
using ForceSSL.Modules;

namespace FMSWebApi.Controllers
{
    //[RequireHttps]
   // [Authorize] // Require authenticated requests.
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class DuplicatePestController : ApiController
    {
        private static readonly IPestRepository repository = new PestRepository();

        public IEnumerable<PestInfo> GetByPestName([FromUri] PestInfo param)
        {

            if (!string.IsNullOrEmpty(param.PestDesc))
            {

                return repository.GetByPestName(param);
            }
            else
            {
                return repository.GetAllEx();
            }
        }

    }
}
