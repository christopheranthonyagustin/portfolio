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
    //[EnableCors(origins: "*", headers: "*", methods: "*")]
    public class JobFilterInfoController : ApiController
    {
        private static readonly IJobRepository repository = new JobRepository();

        public IEnumerable<JobInfo> GetByDriver([FromUri]JobInfo param)
        {
            if (param.CompanyID > 0 && param.DriverID > 0)                       
            {
                return repository.GetByDriver(param);
            }
            else
            {
                return repository.GetAll();
            }
        }
		


    }
}
