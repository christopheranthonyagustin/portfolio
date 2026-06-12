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
    public class ScsInfoController : ApiController
    {
        private static readonly IScsRepository repository = new ScsRepository();

        public IEnumerable<ScsInfo> GetScs([FromUri]ScsInfo param)
        {
            if (!string.IsNullOrEmpty(param.Depot) || !string.IsNullOrEmpty(param.Interchange))
            {
                //Logger.LogEvent(string.Format("SCS: {0} Depot: {1} Intechange: {2}", param.SVC_NO, param.DepotID, param.InterchangeID), System.Diagnostics.EventLogEntryType.Information);
                return repository.GetScs(param);
            }
            else
            {
                return repository.GetAll();
            }
        }


    }
}
