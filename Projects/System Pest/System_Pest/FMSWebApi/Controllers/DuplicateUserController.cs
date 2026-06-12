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
using ForceSSL.Modules;

namespace FMSWebApi.Controllers
{
   // [RequireHttps]
    //[Authorize] // Require authenticated requests.
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class DuplicateUserController : ApiController
    {
        private static readonly IUserRepository repository = new UserRepository();

        public IEnumerable<UserInfo> GetByUser([FromUri]UserInfo param)
        {
            if (!string.IsNullOrEmpty(param.User))
            {
                return repository.GetByUser(param);
            }
            else
            {
                return repository.GetAllUser();
            }
        }

    }
}
