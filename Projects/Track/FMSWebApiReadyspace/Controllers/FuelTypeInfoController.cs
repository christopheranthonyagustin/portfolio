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
    public class FuelTypeInfoController : ApiController
    {
        private static readonly IFuelTypeRepository repository = new FuelTypeRepository();


        public IEnumerable<FuelTypeInfo> GetAll()
        {
            return repository.GetAll();
        }
    }
}
