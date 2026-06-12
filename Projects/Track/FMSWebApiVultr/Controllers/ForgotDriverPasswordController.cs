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

namespace TMSWebApi.Controllers
{
    //[EnableCors(origins: "*", headers: "*", methods: "*")]
    public class ForgotDriverPasswordController : ApiController
    {
        private static readonly IDriverRepository repository = new DriverRepository();
        public string Get()
        {
            return "Success";
        }

        public DriverInfo PostForgotDriverPassword([FromBody]DriverInfo currDriver)
        {        
            currDriver = repository.GetForgotPassword(currDriver);
            return currDriver;
        }

    }
}
