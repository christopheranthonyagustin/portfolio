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
    public class ResellerInfoController : ApiController
    {
        private static readonly IResellerRepository repository = new ResellerRepository();


        public IEnumerable<ResellerInfo> GetByResellerID([FromUri]ResellerInfo param)
        {
            if ((param.ResellerID > 0))
            {

                return repository.GetByResellerID(param);
            }
            else
            {
                return repository.GetAll();
            }
        }

        public ResellerInfo GetReseller(int id)
        {
            ResellerInfo currReseller = repository.Get(id);
            if (currReseller == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currReseller;
        }


        public ResellerInfo PostReseller([FromBody]ResellerInfo currReseller)
        {
            currReseller = repository.Add(currReseller);
            return currReseller;
        }

        public bool PutReseller(int id, [FromBody]ResellerInfo currReseller)
        {
            currReseller.ResellerID = id;
            if (!repository.Update(currReseller))
            {
                return false;
            }
            return true;
        }

        public void DeleteReseller(int id)
        {
            ResellerInfo currReseller = repository.Get(id);
            if (currReseller == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }
    }
}
