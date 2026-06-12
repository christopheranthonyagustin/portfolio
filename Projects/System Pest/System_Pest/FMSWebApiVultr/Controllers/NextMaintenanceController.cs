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
    public class NextMaintenanceController : ApiController
    {
        private static readonly IMaintenanceRepository repository = new MaintenanceRepository();

        public IEnumerable<MaintenanceInfo> GetMaintenance([FromUri]MaintenanceInfo param)
        {           
            if  ((param.CompanyID > 0))
            {
                return repository.GetNextMaintenance(param);
            }
            else
            {
                return repository.GetAllEx();
            }
        }
    }
}
