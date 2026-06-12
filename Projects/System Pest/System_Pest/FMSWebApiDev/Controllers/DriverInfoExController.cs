using FMSWebApi.Models;
using FMSWebApi.Repository;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Hosting;
using System.Web.Http;
using System.Web.Http.Cors;
using System.Web.UI.WebControls;




namespace FMSWebApi.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class DriverInfoExController : ApiController
    {
        private static readonly IDriverRepository repository = new DriverRepository();

        public IEnumerable<DriverInfo> GetByCompany([FromUri]DriverInfo param)
        {

            if ((param.CompanyID > 0 || param.AssetID > 0))
            {

                return repository.GetByCompanyEx(param);
            }
            else
            {
                return repository.GetAll();
            }
        }

   
    }
}
