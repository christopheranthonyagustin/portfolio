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
    public class UpdateUserPasswordController : ApiController
    {
        private static readonly IUserRepository repository = new UserRepository();

        public bool PutUser(int id, [FromBody]UpdateUserInfo currUser)
        {          
            currUser.UserID = id;
            if (repository.UpdateUserPassword(currUser))
            {
                Logger.LogEvent("PutUser Success", System.Diagnostics.EventLogEntryType.Information);
                return true;
            }
            else
            {
                Logger.LogEvent("PutUser Failed", System.Diagnostics.EventLogEntryType.Information);
                return false;
            }
        }


    }
}
