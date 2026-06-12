using MySql.Data.MySqlClient;
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
    public class DistanceMatrixController : ApiController
    {
        private static readonly ISettingsRepository repository = new SettingsRepository();


        public IEnumerable<GoogleDistanceMatrixResponse> GetDistanceMatrix([FromUri]GoogleDistanceMatrixResponse param)
        {
            if (!string.IsNullOrEmpty(param.Origin) && !string.IsNullOrEmpty(param.Destination))
            {
                return repository.GetDistanceMatrix(param);
            }
            else
            {
                return repository.Clear();
            }
        
        }

    }
}
