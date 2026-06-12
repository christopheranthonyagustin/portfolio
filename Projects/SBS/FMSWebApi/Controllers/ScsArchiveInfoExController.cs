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
    public class ScsArchiveInfoExController : ApiController
    {
        private static readonly IScsRepository repository = new ScsRepository();

        public IEnumerable<ScsArchiveInfo> GetScs([FromUri]ScsArchiveInfo param)
        {
            if (!string.IsNullOrEmpty(param.Depot) || !string.IsNullOrEmpty(param.Interchange) || param.OP_DATE_START != DateTime.MinValue && param.OP_DATE_END != DateTime.MinValue)
            {
                //Logger.LogEvent(string.Format("SCS: {0} Depot: {1} Intechange: {2} OP_DATE: {3}", param.SVC_NO, param.DepotID, param.InterchangeID, param.OP_DATE), System.Diagnostics.EventLogEntryType.Information);
                return repository.GetScsArchiveEx(param);
            }
            else
            {
                return repository.GetAllEx();
            }
        }


    }
}
