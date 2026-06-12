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
    public class PestInfoController : ApiController
    {
        private static readonly IPestRepository repository = new PestRepository();

        public IEnumerable<PestInfo> GetAllPest()
        {
            return repository.GetAll();
        }

        public PestInfo GetPest(int pestID)
        {
            PestInfo currPest = repository.Get(pestID);
            if (currPest == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currPest;
        }

        public IEnumerable<PestInfo> GetPestByName(string pestname)
        {
            return repository.GetAll().Where(
                c => string.Equals(c.PestDesc, pestname,
                         StringComparison.OrdinalIgnoreCase));
        }

        public PestInfo PostPest([FromBody] PestInfo currPest)
        {
            currPest = repository.Add(currPest);
            return currPest;
        }

        public bool PutPest(int id, [FromBody] PestInfo currPest)
        {

            currPest.PestID = id;
            if (repository.Update(currPest))
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public void DeletePest(int id)
        {
            PestInfo currPest = repository.Get(id);
            if (currPest == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }

    }
}
