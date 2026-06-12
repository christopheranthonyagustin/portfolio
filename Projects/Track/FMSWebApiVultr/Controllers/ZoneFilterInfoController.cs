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
    //[EnableCors(origins: "*", headers: "*", methods: "*")]
    public class ZoneFilterInfoController : ApiController
    {
        private static readonly IZoneRepository repository = new ZoneRepository();

        public IEnumerable<ZoneInfo> GetByCompanyFilter([FromUri]ZoneInfo param)
        {
            if ((param.CompanyID > 0 || param.ResellerID > 0))
            {

                return repository.GetByCompanyFilter(param);
            }
            else
            {
                return repository.GetAll();
            }
        }

    }
}
