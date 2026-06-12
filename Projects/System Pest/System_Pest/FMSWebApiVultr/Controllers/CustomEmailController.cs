using FMSWebApi.Models;
using FMSWebApi.Repository;
using FMSWebApi.Services;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Cors;

namespace FMSWebApi.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class CustomEmailController : ApiController
    {
        private static readonly MaintenanceJobRepository repository = new MaintenanceJobRepository();

        public async Task<IHttpActionResult> PostMaintenanceJob([FromBody] MaintenanceJobInfo currMainJob)
        {
            try
            {
                var result = await repository.CustomEmailAsync(currMainJob);
                return Ok(result);
            }
            catch (System.Exception ex)
            {
                Logger.LogEvent("CustomEmailAsync Controller Error: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                return InternalServerError(ex);
            }
        }
    }
}
