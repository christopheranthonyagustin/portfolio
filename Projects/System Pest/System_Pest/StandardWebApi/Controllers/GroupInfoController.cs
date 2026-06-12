using FMSWebApi.Models;
using FMSWebApi.Repository;
using ForceSSL.Modules;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;


namespace FMSWebApi.Controllers
{
    //[RequireHttps]
    //[Authorize] // Require authenticated requests.
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class GroupInfoController : ApiController
    {
        private static readonly IAcRepository repository = new AcRepository();

        public IEnumerable<AcInfo> GetAllEx()
        {
            return repository.GetAllEx();
        }

    }
}
