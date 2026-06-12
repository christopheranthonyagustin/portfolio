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
    //[EnableCors(origins: "*", headers: "*", methods: "*")]
    public class DecryptController : ApiController
    {
        public Decrypt Get([FromUri]Decrypt currDecrypt)
        {
            try
            {
                currDecrypt.Result = EncryptionHelper.Decrypt(currDecrypt.Value, currDecrypt.Secret);
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Encrypt", System.Diagnostics.EventLogEntryType.Error);
            }


            return currDecrypt;
        }
    }
}
