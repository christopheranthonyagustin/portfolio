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
    public class DeviceTypeInfoController : ApiController
    {
        private static readonly IDeviceTypeRepository repository = new DeviceTypeRepository();

        public IEnumerable<DeviceTypeInfo> GetAllDeviceTypes()
        {
            return repository.GetAll();
        }

        public DeviceTypeInfo GetDeviceType(int devicetypeID)
        {
            DeviceTypeInfo currDeviceType = repository.Get(devicetypeID);
            if (currDeviceType == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currDeviceType;
        }

        public IEnumerable<DeviceTypeInfo> GetDeviceTypeByName(string devicetypename)
        {
            return repository.GetAll().Where(
                c => string.Equals(c.Name, devicetypename,
                         StringComparison.OrdinalIgnoreCase));
        }

        public DeviceTypeInfo PostDeviceType(DeviceTypeInfo currDeviceType)
        {
            currDeviceType = repository.Add(currDeviceType);
            return currDeviceType;
        }

        public bool PutDeviceType(int devicetypeID, DeviceTypeInfo currDeviceType)
        {
            currDeviceType.DeviceTypeID = devicetypeID;
            if (!repository.Update(currDeviceType))
            {
                return false;
                //throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return true;
        }

        public void DeleteDeviceType(int devicetypeID)
        {
            DeviceTypeInfo currDeviceType = repository.Get(devicetypeID);
            if (currDeviceType == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(devicetypeID);
        }

    }
}
