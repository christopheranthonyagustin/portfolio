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
    public class DeviceInfoController : ApiController
    {
        private static readonly IDeviceRepository repository = new DeviceRepository();

        //public IEnumerable<DeviceInfo> GetAllAssets()
        //{
        //    return repository.GetAll();
        //}

        public IEnumerable<DeviceInfo> GetByCompany([FromUri]DeviceInfo param)
        {

            //if ((param.CompanyID > 0 || param.ResellerID > 0))
            if ((param.ResellerID > 0 || param.CompanyID > 0))
            {

                return repository.GetByCompany(param);
            }
            else
            {
                //Logger.LogEvent(string.Format("PARAM IS null"), System.Diagnostics.EventLogEntryType.Information);
                return repository.GetAll();
            }
        }

        public DeviceInfo GetAsset(int id)
        {
            DeviceInfo currDevice = repository.Get(id);
            if (currDevice == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currDevice;
        }

        public IEnumerable<DeviceInfo> GetDeviceByName(string devicename)
        {
            return repository.GetAll().Where(
                c => string.Equals(c.Name, devicename,
                         StringComparison.OrdinalIgnoreCase));
        }

        //api/DeviceInfo
        public DeviceInfo PostDevice([FromBody]DeviceInfo currDevice)//Add
        {
            currDevice = repository.Add(currDevice);
            return currDevice;
        }


        public bool PutDevice(int id, [FromBody]DeviceInfo currDevice)
        {
            Logger.LogEvent(string.Format("Enter PutDevice: {0}, ID: {1}", currDevice.Name, id), System.Diagnostics.EventLogEntryType.Information);//testing
            currDevice.DeviceID = id;

            if (repository.Update(currDevice))
           {
                Logger.LogEvent("PutDevice Success", System.Diagnostics.EventLogEntryType.Information);//testing
				return true;

            }
			else
            {
                Logger.LogEvent("PutDevice Failed", System.Diagnostics.EventLogEntryType.Information);//testing
				return false;
        	}
		}
        public void DeleteDevice(int id)
        {
			Logger.LogEvent(string.Format("Enter DeleteDevice: {0}", id), System.Diagnostics.EventLogEntryType.Information);//testing
            DeviceInfo currDevice = repository.Get(id);
            if (currDevice == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }
    }
}
