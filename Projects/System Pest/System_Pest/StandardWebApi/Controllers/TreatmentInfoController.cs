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
    public class TreatmentInfoController : ApiController
    {
        private static readonly ITreatmentRepository repository = new TreatmentRepository();

        public IEnumerable<TreatmentInfo> GetAllTreatment()
        {
            return repository.GetAll();
        }

        public TreatmentInfo GetTreatment(int treatmentID)
        {
            TreatmentInfo currTreatment = repository.Get(treatmentID);
            if (currTreatment == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currTreatment;
        }

        public IEnumerable<TreatmentInfo> GetTreatmentByName(string treatment)
        {
            return repository.GetAll().Where(
                c => string.Equals(c.TreatmentDesc, treatment,
                         StringComparison.OrdinalIgnoreCase));
        }

    }
}
