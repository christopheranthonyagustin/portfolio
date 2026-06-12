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
    public class DriverAttendanceChartController : ApiController
    {
        private static readonly IDriverAttendanceRepository repository = new DriverAttendanceRepository();

        public IEnumerable<DriverAttendanceChart> GetByDriverChart([FromUri] DriverAttendanceChart param)
        {

            if ((param.ScheduledWorkTimeStart != DateTime.MinValue && param.ScheduledWorkTimeEnd != DateTime.MinValue))
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
