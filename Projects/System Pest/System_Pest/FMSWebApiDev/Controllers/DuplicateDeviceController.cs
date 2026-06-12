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
    public class DuplicateDeviceController : ApiController
    {
        private static readonly IDeviceRepository repository = new DeviceRepository();

        public IEnumerable<DeviceInfo> GetByDevice([FromUri]DeviceInfo param)
        {
            if (!string.IsNullOrEmpty(param.Name))
            {
                return repository.GetByDevice(param);
            }
            else
            {
                return repository.GetAllDevice();
            }
        }

    }
}
