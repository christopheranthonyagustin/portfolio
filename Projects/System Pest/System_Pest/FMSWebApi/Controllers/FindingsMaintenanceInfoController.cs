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
    public class FindingsMaintenanceInfoController : ApiController
    {
        private static readonly IFindingsMaintenanceRepository repository = new FindingsMaintenanceRepository();

        public IEnumerable<FindingsMaintenanceInfo> GetAllFindings()
        {
            return repository.GetAll();
        }

        public FindingsMaintenanceInfo GetFindings(int id)
        {
            FindingsMaintenanceInfo currFindings = repository.Get(id);
            if (currFindings == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currFindings;
        }

        public FindingsMaintenanceInfo PostFindings(FindingsMaintenanceInfo currFindings)
        {
            currFindings = repository.Add(currFindings);
            return currFindings;
        }

        public void PutFindings(int id, FindingsMaintenanceInfo currFindings)
        {
            currFindings.FindingsMaintenanceID = id;
            if (!repository.Update(currFindings))
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
        }

        public void DeleteFindings(int id)
        {
            FindingsMaintenanceInfo currFindings = repository.Get(id);
            if (currFindings == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }

    }
}
