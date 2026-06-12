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
    public class DuplicateDriverController : ApiController
    {
        private static readonly IDriverRepository repository = new DriverRepository();


        public IEnumerable<DriverInfo> GetByDriver([FromUri]DriverInfo param)
        {

            if (!string.IsNullOrEmpty(param.Name))
            {

                return repository.GetByDriver(param);
            }
            else
            {
                return repository.GetAllDriver();
            }
        }

    }
}
