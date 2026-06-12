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
    public class PestTreatmentInfoController : ApiController
    {
        private static readonly IPestTreatmentRepository repository = new PestTreatmentRepository();

        public IEnumerable<PestTreatmentInfo> GetAllPestTreatment()
        {
            return repository.GetAll();
        }

        public PestTreatmentInfo GetPestTreatment(int id)
        {
            PestTreatmentInfo currPestTreatment = repository.Get(id);
            if (currPestTreatment == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currPestTreatment;
        }

        public PestTreatmentInfo PostPestTreatment(PestTreatmentInfo currPestTreatment)
        {
            currPestTreatment = repository.Add(currPestTreatment);
            return currPestTreatment;
        }

        public void PutPestTreatment(int id, PestTreatmentInfo currPestTreatment)
        {
            currPestTreatment.PestTreatmentID = id;
            if (!repository.Update(currPestTreatment))
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
        }

        public void DeletePestTreatment(int id)
        {
            PestTreatmentInfo currPestTreatment = repository.Get(id);
            if (currPestTreatment == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }

    }
}
