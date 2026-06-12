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
    public class AcInfoController : ApiController
    {
        private static readonly IAcRepository repository = new AcRepository();

        public IEnumerable<AcInfo> GetByCompany([FromUri]AcInfo param)
        {
            if (!string.IsNullOrEmpty(param.Groups))
            {
                return repository.GetAc(param);
            }
            else
            {
                return repository.GetAll();
            }
        }

        public AcInfo GetAc(int id)
        {
            AcInfo currAc = repository.Get(id);
            if (currAc == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currAc;
        }


    }
}
