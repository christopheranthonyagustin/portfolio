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
using System.Web;
using System.IO;


namespace FMSWebApi.Controllers
{
    //[EnableCors(origins: "*", headers: "*", methods: "*")]
    public class UpdateDriverInfoController : ApiController
    {
        private static readonly IDriverRepository repository = new DriverRepository();

        public bool PutDriver(int id, [FromBody]UpdateDriverInfo currDriver)
        {
            currDriver.DriverID = id;
            if (repository.UpdateDriver(currDriver))
            {
                Logger.LogEvent("PutDriver Success", System.Diagnostics.EventLogEntryType.Information);
                return true;
            }
            else
            {
                Logger.LogEvent("PutDriver Failed", System.Diagnostics.EventLogEntryType.Information);
                return false;
            }
        }


    }
}
