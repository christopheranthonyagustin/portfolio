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
    public class ServiceInfoController : ApiController
    {
        private static readonly IServicingRepository repository = new ServicingRepository();

        public IEnumerable<ServicingInfo> GetServiceAsset([FromUri]ServicingInfo param)
        {
            if (param.CompanyID > 0)
            {
                return repository.GetServiceAsset(param);
            }
            else
            {
                return repository.GetAll();
            }
        }

    }
}
