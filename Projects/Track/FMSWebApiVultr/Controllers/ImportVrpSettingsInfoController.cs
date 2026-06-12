using FMSWebApi.Models;
using FMSWebApi.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Cors;

namespace FMSWebApi.Controllers
{
    //[EnableCors(origins: "*", headers: "*", methods: "*")]
    public class ImportVrpSettingsInfoController : ApiController
    {
        private static readonly IVrpSettingsRepository repository = new VrpSettingsRepository();

        public async Task<VrpSettingsInfo> PostImportVrpSettings([FromBody]VrpSettingsInfo currVrpSettings)
        {
            currVrpSettings = await repository.AddImportAsync(currVrpSettings);
            return currVrpSettings;
        }

    }
}
