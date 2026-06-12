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
    public class DriverPerformanceChartController : ApiController
    {
        private static readonly IDriverPerformanceRepository repository = new DriverPerformanceRepository();

        public IEnumerable<VrpDriverPerformanceChart> GetByDriverChart([FromUri] VrpDriverPerformanceChart param)
        {

            if ((param.EstDepartureTime != DateTime.MinValue && param.EstArrivalTime != DateTime.MinValue))
            {
                return repository.GetByDriverChart(param);
            }
            else
            {
                return repository.ClearChart();
            }
        }


    }
}
