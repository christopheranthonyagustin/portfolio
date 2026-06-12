using FMSWebApi.Models;
using FMSWebApi.Repository;
using ForceSSL.Modules;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Hosting;
using System.Web.Http;
using System.Web.Http.Cors;
using System.Web.UI.WebControls;


namespace FMSWebApi.Controllers
{
    //[RequireHttps]
    //[Authorize] // Require authenticated requests.
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class CheckKeyController : ApiController
    {
        private static readonly IDeviceRepository repository = new DeviceRepository();

        public IEnumerable<DeviceInfo> GetByKey([FromUri]DeviceInfo param)
        {
            if (param.Key > 0)
            {
                return repository.GetByKey(param);
            }
            else
            {
                return repository.GetAllDevice();
            }
        }

    }  
}
