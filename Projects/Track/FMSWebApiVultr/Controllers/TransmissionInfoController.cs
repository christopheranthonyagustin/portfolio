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
    public class TransmissionInfoController : ApiController
    {
        private static readonly ITransmissionRepository repository = new TransmissionRepository();


        public IEnumerable<TransmissionInfo> GetAll()
        {
            return repository.GetAll();
        }
    }
}
