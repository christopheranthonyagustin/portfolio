using FMSWebApi.Models;
using FMSWebApi.Repository;
using ForceSSL.Modules;
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
    //[RequireHttps]
    //[Authorize] // Require authenticated requests.
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class ClientInfoController : ApiController
    {

        [Route("api/fileupload/uploadfileclient")]
        [HttpPost]
        public HttpStatusCode UploadFile()
        {
            HttpStatusCode code = new HttpStatusCode();

            if (HttpContext.Current.Request.Files.AllKeys.Any())
            {
                // Get the uploaded image from the Files collection
                var httpPostedFile = HttpContext.Current.Request.Files["UploadedImage"];

                if (httpPostedFile != null)
                {
                    // Validate the uploaded image(optional)

                    // Get the complete file path
                    var fileSavePath = Path.Combine(HttpContext.Current.Server.MapPath("~/images/maintenance_client_signatures"), httpPostedFile.FileName);

                    // Save the uploaded file to "UploadedFiles" folder
                    httpPostedFile.SaveAs(fileSavePath);
                    code = HttpStatusCode.OK;
                    Logger.LogEvent(string.Format("Client Signature: {0} Filename: {1}", code, httpPostedFile.FileName), System.Diagnostics.EventLogEntryType.Information);

                }
                else
                {
                    code = HttpStatusCode.BadRequest;
                }
            }
            else
            {
                code = HttpStatusCode.BadRequest;
            }

            return code;

            
        }



    }
}
