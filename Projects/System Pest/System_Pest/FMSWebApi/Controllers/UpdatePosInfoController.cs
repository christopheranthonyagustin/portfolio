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
   // [Authorize] // Require authenticated requests.
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class UpdatePosInfoController : ApiController
    {
        private static readonly IPosRepository repository = new PosInfoRepository();

        // PUT: api/PosInfo/5
        public void Put(int id, [FromBody]PosInfo value)
        {
            value.AssetID = id;
            if (!repository.UpdateLocation(value))
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
        }
    }
}
