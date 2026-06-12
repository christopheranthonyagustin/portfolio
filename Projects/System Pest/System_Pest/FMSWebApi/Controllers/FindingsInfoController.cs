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
    public class FindingsInfoController : ApiController
    {
        private static readonly IFindingsRepository repository = new FindingsRepository();

        public IEnumerable<FindingsInfo> GetAllFindings()
        {
            return repository.GetAll();
        }

        public FindingsInfo GetFindings(int id)
        {
            FindingsInfo currFindings = repository.Get(id);
            if (currFindings == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currFindings;
        }

        public FindingsInfo PostFindings(FindingsInfo currFindings)
        {
            currFindings = repository.Add(currFindings);
            return currFindings;
        }

        public void PutFindings(int id, FindingsInfo currFindings)
        {
            currFindings.FindingsID = id;
            if (!repository.Update(currFindings))
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
        }

        public void DeleteFindings(int id)
        {
            FindingsInfo currFindings = repository.Get(id);
            if (currFindings == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }

    }
}
