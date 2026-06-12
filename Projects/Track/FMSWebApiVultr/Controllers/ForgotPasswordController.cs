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
    public class ForgotPasswordController : ApiController
    {
        private static readonly IUserRepository repository = new UserRepository();
        public string Get()
        {
            return "Success";
        }

        public UserInfo PostForgotPassword([FromBody]UserInfo currUser)
        {        
            currUser = repository.GetForgotPassword(currUser);
            return currUser;
        }

    }
}
