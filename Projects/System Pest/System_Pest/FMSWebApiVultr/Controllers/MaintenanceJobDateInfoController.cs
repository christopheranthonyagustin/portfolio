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
    public class MaintenanceJobDateInfoController : ApiController
    {
        private static readonly IMaintenanceJobRepository repository = new MaintenanceJobRepository();

        public IEnumerable<MaintenanceCalJobInfo> GetMaintenanceJob([FromUri]MaintenanceCalJobInfo param)
        {
            if ((param.Timestamp != DateTime.MinValue) && (param.AssetCompanyID > 0))
            {
                return repository.GetMaintenanceJobByCal(param);
            }
            else
            {
                return repository.GetAllCal();
            }
        }
		
    }
}
