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
    //[EnableCors(origins: "*", headers: "*", methods: "*")]
    public class TagInfoController : ApiController
    {
        private static readonly IDeviceRepository repository = new DeviceRepository();

        public string Get()
        {
            return "Success";
        }
        public bool PutDevice(int id, [FromBody]DeviceInfo currDevice)
        {
            currDevice.DeviceID = id;

            if (repository.UpdateTag(currDevice))
            {
				return true;

            }
			else
            {
				return false;
        	}
		}

    }
}
