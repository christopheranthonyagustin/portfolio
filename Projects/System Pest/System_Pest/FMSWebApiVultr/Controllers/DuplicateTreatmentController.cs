using MySqlConnector;
using FMSWebApi.Models;
using FMSWebApi.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using ForceSSL.Modules;

namespace FMSWebApi.Controllers
{
    //[RequireHttps]
   // [Authorize] // Require authenticated requests.
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class DuplicateTreatmentController : ApiController
    {
        private static readonly ITreatmentRepository repository = new TreatmentRepository();

        public IEnumerable<TreatmentInfo> GetByTreatmentName([FromUri] TreatmentInfo param)
        {

            if (!string.IsNullOrEmpty(param.TreatmentDesc))
            {

                return repository.GetByTreatmentName(param);
            }
            else
            {
                return repository.GetAllEx();
            }
        }

    }
}
