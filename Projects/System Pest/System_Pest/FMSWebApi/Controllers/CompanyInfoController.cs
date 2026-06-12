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
   // [RequireHttps]
    //[Authorize] // Require authenticated requests.
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class CompanyInfoController : ApiController
    {
        private static readonly ICompanyRepository repository = new CompanyRepository();

        public IEnumerable<CompanyInfo> GetByCompany([FromUri]CompanyInfo param)
        {

            if ((param.ResellerID > 0))
            {

                return repository.GetByCompany(param);
            }
            else
            {
                return repository.GetAll();
            }
        }

        public CompanyInfo GetCompany(int id)
        {
            CompanyInfo currCompany = repository.Get(id);
            if (currCompany == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currCompany;
        }


        public CompanyInfo PostCompany([FromBody]CompanyInfo currCompany)
        {
            currCompany = repository.Add(currCompany);
            return currCompany;
        }

        public bool PutCompany(int id, [FromBody]CompanyInfo currCompany)
        {

            currCompany.CompanyID = id;
            if (!repository.Update(currCompany))
            {
                return false;
            }
            return true;
        }

        public void DeleteCompany(int id)
        {
            CompanyInfo currCompany = repository.Get(id);
            if (currCompany == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }
    }
}
