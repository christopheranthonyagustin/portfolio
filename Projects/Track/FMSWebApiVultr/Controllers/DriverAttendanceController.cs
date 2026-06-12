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
    public class DriverAttendanceController : ApiController
    {
        private static readonly IDriverAttendanceRepository repository = new DriverAttendanceRepository();

        public IEnumerable<DriverAttendance> GetByDriver([FromUri] DriverAttendance param)
        {

            if ((param.ScheduledWorkTimeStart != DateTime.MinValue && param.ScheduledWorkTimeEnd != DateTime.MinValue))
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
