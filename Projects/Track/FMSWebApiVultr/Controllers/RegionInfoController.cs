using FMSWebApi.Models;
using FMSWebApi.Repository;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using System.Web.Http.Cors;

namespace FMSWebApi.Controllers
{
    //[EnableCors(origins: "*", headers: "*", methods: "*")]
    public class RegionInfoController : ApiController
    {
        private static readonly IRegionRepository repository = new RegionRepository();

        public IEnumerable<RegionInfo> GetByID([FromUri]RegionInfo param)
        {
            if (param.CompanyID > 0)
            {
                return repository.GetByCompanyID(param);
            }
            else
            {
                return repository.GetAll();
            }
        }

        public RegionInfo GetRegion(int id)
        {
            RegionInfo currRegion = repository.Get(id);
            if (currRegion == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currRegion;
        }


        public RegionInfo PostRegion([FromBody]RegionInfo currRegion)
        {
            currRegion = repository.Add(currRegion);
            return currRegion;
        }

        public bool PutRegion(int id, [FromBody]RegionInfo currRegion)
        {

            currRegion.RegionID = id;
            if (!repository.Update(currRegion))
            {
                return false;
            }
            return true;
        }

        public void DeleteRegion(int id)
        {
            RegionInfo currRegion = repository.Get(id);
            if (currRegion == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }

    }
}
