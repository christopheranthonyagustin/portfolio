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
    public class SearchPatientController : ApiController
    {
        private static readonly IPatientRepository repository = new PatientRepository();

        public IEnumerable<PatientInfo> GetByPatient([FromUri]PatientInfo param)
        {

            if  ((!string.IsNullOrEmpty(param.Name)))                         
            {
                return repository.GetByPatient(param);
            }
            else
            {
                return repository.ClearAll();
            }
        }

    }
}
