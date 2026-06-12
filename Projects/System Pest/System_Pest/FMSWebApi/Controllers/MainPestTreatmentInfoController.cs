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
    public class MainPestTreatmentInfoController : ApiController
    {
        private static readonly IMainPestTreatmentRepository repository = new MainPestTreatmentRepository();

        public IEnumerable<MainPestTreatmentInfo> GetAllPestTreatment()
        {
            return repository.GetAll();
        }

        public MainPestTreatmentInfo GetPestTreatment(int id)
        {
            MainPestTreatmentInfo currPestTreatment = repository.Get(id);
            if (currPestTreatment == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currPestTreatment;
        }

        public MainPestTreatmentInfo PostPestTreatment(MainPestTreatmentInfo currPestTreatment)
        {
            currPestTreatment = repository.Add(currPestTreatment);
            return currPestTreatment;
        }

        public void PutPestTreatment(int id, MainPestTreatmentInfo currPestTreatment)
        {
            currPestTreatment.MainPestTreatmentID = id;
            if (!repository.Update(currPestTreatment))
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
        }

        public void DeletePestTreatment(int id)
        {
            MainPestTreatmentInfo currPestTreatment = repository.Get(id);
            if (currPestTreatment == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }

    }
}
