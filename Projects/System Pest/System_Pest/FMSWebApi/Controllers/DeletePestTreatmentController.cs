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
    public class DeletePestTreatmentController : ApiController
    {
        private static readonly IPestTreatmentRepository repository = new PestTreatmentRepository();

        public string Get()
        {
            return "Delete Pest Treatment";
        }

        public PestTreatmentInfo Post([FromBody]PestTreatmentInfo currPestTreatment)
        {
            currPestTreatment = repository.GetByPestTreatment(currPestTreatment);
            return currPestTreatment;
        }
		
    }
}
