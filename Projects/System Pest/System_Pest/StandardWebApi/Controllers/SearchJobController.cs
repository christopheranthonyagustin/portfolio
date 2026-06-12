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
    public class SearchJobController : ApiController
    {
        private static readonly ISearchJobRepository repository = new SearchJobRepository();

        public IEnumerable<SearchJob> GetByCompany([FromUri]SearchJob param)
        {

            if  ((!string.IsNullOrEmpty(param.JobNumber)))
                             
            {
                return repository.GetByCompany(param);
            }
            else
            {
                return repository.GetAll();
            }
        }
		
        // GET: api/SearchJob
        public SearchJob Get(int id)
        {
            SearchJob currPos = repository.Get(id);
            if (currPos == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currPos;
        }


        public SearchJob PostJob([FromBody]SearchJob currJob)
        {
            currJob = repository.Add(currJob);
            return currJob;
        }

        public bool PutJob(int id, [FromBody]SearchJob currJob)
        {
            currJob.JobID = id;
            if (!repository.Update(currJob))
            {
                return false;
            }
            return true;
        }

        public void DeleteJob(int id)
        {
            SearchJob currJob = repository.Get(id);
            if (currJob == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }

    }
}
