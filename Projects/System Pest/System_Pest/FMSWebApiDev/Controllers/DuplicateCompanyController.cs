using MySql.Data.MySqlClient;
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
    public class DuplicateCompanyController : ApiController
    {
        private static readonly ICompanyRepository repository = new CompanyRepository();

        public IEnumerable<CompanyInfo> GetByCompanyName([FromUri]CompanyInfo param)
        {

            if (!string.IsNullOrEmpty(param.Name))
            {

                return repository.GetByCompanyName(param);
            }
            else
            {
                //Logger.LogEvent(string.Format("PARAM IS null"), System.Diagnostics.EventLogEntryType.Information);
                return repository.GetAllCompany();
            }
        }

    }
}
