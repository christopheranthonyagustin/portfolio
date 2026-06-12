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
    public class GroupMyInfoController : ApiController
    {
        private static readonly IAcMyRepository repository = new AcMyRepository();

        public IEnumerable<AcMyInfo> GetAllEx()
        {
            return repository.GetAllEx();
        }

    }
}
