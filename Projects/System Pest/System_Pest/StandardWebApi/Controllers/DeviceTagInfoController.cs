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
    //[RequireHttps]
    //[Authorize] // Require authenticated requests.
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class DeviceTagInfoController : ApiController
    {
        private static readonly IDeviceRepository repository = new DeviceRepository();

        public IEnumerable<DeviceInfo> GetTagCompany([FromUri]DeviceInfo param)
        {

            if ((param.ResellerID > 0 || param.CompanyID > 0 || param.AssetID > 0))
            {

                return repository.GetTagCompany(param);
            }
            else
            {
                return repository.GetAllTags();
            }
        }
    }
}
