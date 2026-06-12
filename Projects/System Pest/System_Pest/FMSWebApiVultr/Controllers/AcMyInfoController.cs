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
    public class AcMyInfoController : ApiController
    {
        private static readonly IAcMyRepository repository = new AcMyRepository();

        public IEnumerable<AcMyInfo> GetByCompany([FromUri]AcMyInfo param)
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

        public AcMyInfo GetAc(int id)
        {
            AcMyInfo currAc = repository.Get(id);
            if (currAc == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currAc;
        }


    }
}
