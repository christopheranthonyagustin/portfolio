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
    public class ServiceTypeInfoController : ApiController
    {
        private static readonly IServiceTypeRepository repository = new ServiceTypeRepository();


        public IEnumerable<ServiceTypeInfo> GetAll()
        {
            return repository.GetAll();
        }
    }
}
