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
    public class ResellerInfoController : ApiController
    {
        private static readonly IResellerRepository repository = new ResellerRepository();

        //public IEnumerable<ResellerInfo> GetAllReseller()
        //{
        //    return repository.GetAll();
        //}

        public IEnumerable<ResellerInfo> GetByResellerID([FromUri]ResellerInfo param)
        {

            //if ((param.CompanyID > 0 || param.ResellerID > 0))
            if ((param.ResellerID > 0))
            {

                return repository.GetByResellerID(param);
            }
            else
            {
                //Logger.LogEvent(string.Format("PARAM IS null"), System.Diagnostics.EventLogEntryType.Information);
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

        //public IEnumerable<CompanyInfo> GetCompanyByName(string companyname)
        //{
        //    return repository.GetAll().Where(
        //        c => string.Equals(c.Name, companyname,
        //                 StringComparison.OrdinalIgnoreCase));
        //}

        public ResellerInfo PostReseller([FromBody]ResellerInfo currReseller)
        {
            currReseller = repository.Add(currReseller);
            return currReseller;
        }

        public bool PutReseller(int id, [FromBody]ResellerInfo currReseller)
        {
            Logger.LogEvent(string.Format("Enter PutReseller: {0}, ID: {1}", currReseller.Name, id), System.Diagnostics.EventLogEntryType.Information);//testing

            currReseller.ResellerID = id;
            if (!repository.Update(currReseller))
            {
                return false;
                //throw new HttpResponseException(HttpStatusCode.NotFound);
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
