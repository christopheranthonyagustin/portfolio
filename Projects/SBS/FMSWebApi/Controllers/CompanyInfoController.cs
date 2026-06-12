using FMSWebApi.Models;
using FMSWebApi.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;

namespace FMSWebApi.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class CompanyInfoController : ApiController
    {
        private static readonly ICompanyRepository repository = new CompanyRepository();

        //public IEnumerable<CompanyInfo> GetAllCompanies()
        //{
        //    return repository.GetAll();
        //}

        public IEnumerable<CompanyInfo> GetByCompany([FromUri]CompanyInfo param)
        {


            //if ((param.CompanyID > 0 || param.ResellerID > 0))
            if ((param.ResellerID > 0))
            {

                return repository.GetByCompany(param);
            }
            else
            {
                //Logger.LogEvent(string.Format("PARAM IS null"), System.Diagnostics.EventLogEntryType.Information);
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

        //public IEnumerable<CompanyInfo> GetCompanyByName(string companyname)
        //{
        //    return repository.GetAll().Where(
        //        c => string.Equals(c.Name, companyname,
        //                 StringComparison.OrdinalIgnoreCase));
        //}

        public CompanyInfo PostCompany([FromBody]CompanyInfo currCompany)
        {
            currCompany = repository.Add(currCompany);
            return currCompany;
        }

        public bool PutCompany(int id, [FromBody]CompanyInfo currCompany)
        {
            Logger.LogEvent(string.Format("Enter PutCompany: {0}, ID: {1}", currCompany.Name, id), System.Diagnostics.EventLogEntryType.Information);//testing

            currCompany.CompanyID = id;
            if (!repository.Update(currCompany))
            {
                return false;
                //throw new HttpResponseException(HttpStatusCode.NotFound);
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
