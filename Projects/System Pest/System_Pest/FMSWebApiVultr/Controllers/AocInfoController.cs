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
    public class AocInfoController : ApiController
    {
        private static readonly IAocRepository repository = new AocRepository();

        public IEnumerable<AocInfo> GetAllAoc()
        {
            return repository.GetAll();
        }

        public AocInfo GetAoc(int aocID)
        {
            AocInfo currAoc = repository.Get(aocID);
            if (currAoc == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currAoc;
        }

        public IEnumerable<AocInfo> GetAocByName(string aoc)
        {
            return repository.GetAll().Where(
                c => string.Equals(c.AocDesc, aoc,
                         StringComparison.OrdinalIgnoreCase));
        }

    }
}
