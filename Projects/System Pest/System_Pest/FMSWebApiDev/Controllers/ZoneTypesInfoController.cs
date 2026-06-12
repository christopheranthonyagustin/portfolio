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
    public class ZoneTypeInfoController : ApiController
    {
        private static readonly IZoneTypeRepository repository = new ZoneTypeRepository();

        public IEnumerable<ZoneTypeInfo> GetAllZoneTypes()
        {
            return repository.GetAll();
        }

        public ZoneTypeInfo GetAsset(int zonetypeID)
        {
            ZoneTypeInfo currZoneType = repository.Get(zonetypeID);
            if (currZoneType == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currZoneType;
        }

        public IEnumerable<ZoneTypeInfo> GetZoneTypeByName(string zonetypename)
        {
            return repository.GetAll().Where(
                c => string.Equals(c.Name, zonetypename,
                         StringComparison.OrdinalIgnoreCase));
        }

        public ZoneTypeInfo PostAsset(ZoneTypeInfo currZoneType)
        {
            currZoneType = repository.Add(currZoneType);
            return currZoneType;
        }

        public bool PutZoneType(int zonetypeID, ZoneTypeInfo currZoneType)
        {
            currZoneType.ZoneTypeID = zonetypeID;
            if (!repository.Update(currZoneType))
            {
                return false;
                //throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return true;
        }

        public void DeleteZoneType(int zonetypeID)
        {
            ZoneTypeInfo currZoneType = repository.Get(zonetypeID);
            if (currZoneType == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(zonetypeID);
        }

    }
}
