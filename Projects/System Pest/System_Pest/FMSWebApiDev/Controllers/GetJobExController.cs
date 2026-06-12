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
    public class GetJobExController : ApiController
    {
        private static readonly IJobRepository repository = new JobRepository();


        public string Get()
        {
            return "Success";
        }

        // POST: api/getjobex
        public JobInfo Post([FromBody]JobInfo value)
        {
            //Logger.LogEvent(string.Format("Tag: {0} DriverID: {1}", item.Tag, item.DriverID), System.Diagnostics.EventLogEntryType.Error);
            value = repository.GetAssetByJobEx(value) as JobInfo;
            return value;
        }

    }
}
