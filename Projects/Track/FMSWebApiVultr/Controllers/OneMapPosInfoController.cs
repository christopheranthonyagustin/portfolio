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
    public class OneMapPosInfoController : ApiController
    {
        private static readonly IPosRepository repository = new PosInfoRepository();

      
        // POST: api/PosInfo
        public PosInfo Post([FromBody]PosInfo value)
        {
            value = repository.AddOneMap(value);
            return value;
        }


    }
}
