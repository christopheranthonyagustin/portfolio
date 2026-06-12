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
    public class DistrictInfoController : ApiController
    {
        private static readonly IDistrictRepository repository = new DistrictRepository();

        public IEnumerable<DistrictInfo> GetByID([FromUri]DistrictInfo param)
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

        public DistrictInfo GetDistrict(int id)
        {
            DistrictInfo currDistrict = repository.Get(id);
            if (currDistrict == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currDistrict;
        }


        public DistrictInfo PostDistrict([FromBody]DistrictInfo currDistrict)
        {
            currDistrict = repository.Add(currDistrict);
            return currDistrict;
        }

        public bool PutDistrict(int id, [FromBody]DistrictInfo currDistrict)
        {

            currDistrict.DistrictID = id;
            if (!repository.Update(currDistrict))
            {
                return false;
            }
            return true;
        }

        public void DeleteDistrict(int id)
        {
            DistrictInfo currDistrict = repository.Get(id);
            if (currDistrict == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }

    }
}
