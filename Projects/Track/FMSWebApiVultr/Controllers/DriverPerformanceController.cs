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
    public class DriverPerformanceController : ApiController
    {
        private static readonly IDriverPerformanceRepository repository = new DriverPerformanceRepository();

        public IEnumerable<VrpDriverPerformance> GetByDriver([FromUri] VrpDriverPerformance param)
        {

            if ((param.EstDepartureTime != DateTime.MinValue && param.EstArrivalTime != DateTime.MinValue))
            {

                return repository.GetByDriver(param);
            }
            else
            {
                return repository.ClearAll();
            }
        }


    }
}
