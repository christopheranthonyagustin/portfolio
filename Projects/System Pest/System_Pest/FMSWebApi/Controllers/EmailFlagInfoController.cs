using FMSWebApi.Models;
using FMSWebApi.Repository;
using ForceSSL.Modules;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;


namespace FMSWebApi.Controllers
{
    //[RequireHttps]
    //[Authorize] // Require authenticated requests.
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class EmailFlagInfoController : ApiController
    {
        private static readonly IEmailFlagRepository repository = new EmailFlagRepository();

        public IEnumerable<EmailFlagInfo> GetAllFlag()
        {
            return repository.GetAll();
        }

        public EmailFlagInfo GetFlag(int emailflagID)
        {
            EmailFlagInfo currEmailFlag = repository.Get(emailflagID);
            if (currEmailFlag == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currEmailFlag;
        }

        public IEnumerable<EmailFlagInfo> GetFlagByName(string ac)
        {
            return repository.GetAll().Where(
                c => string.Equals(c.FlagValue, ac,
                         StringComparison.OrdinalIgnoreCase));
        }

    }
}
