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
    public class GetJobDriverController : ApiController
    {
        private static readonly IJobRepository repository = new JobRepository();


        public string Get()
        {
            return "Success";
        }

        // POST: api/getjobdriver
        public JobInfo Post([FromBody]JobInfo item)
        {
            //Logger.LogEvent(string.Format("Tag: {0} DriverID: {1}", item.Tag, item.DriverID), System.Diagnostics.EventLogEntryType.Error);
            item = repository.GetAssetByJobDriver(item);
            return item;
        }

    }
}
