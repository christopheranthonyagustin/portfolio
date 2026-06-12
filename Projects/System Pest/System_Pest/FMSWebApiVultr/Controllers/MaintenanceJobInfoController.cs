using FMSWebApi.Models;
using FMSWebApi.Repository;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using System.Web.Http.Cors;

namespace FMSWebApi.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class MaintenanceJobInfoController : ApiController
    {
        private static readonly IMaintenanceJobRepository repository = new MaintenanceJobRepository();

        public IEnumerable<MaintenanceJobInfo> GetMaintenanceJob([FromUri]MaintenanceJobInfo param)
        {
            if ((param.MaintenanceID > 0))
            {
                return repository.GetMaintenanceJob(param);
            }
            else
            {
                return repository.GetAllEx();
            }
        }
		
        // GET: api/MaintenanceJobInfo
        public MaintenanceJobInfo Get(long id)
        {
            MaintenanceJobInfo currMainJob = repository.Get(id);
            if (currMainJob == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currMainJob;
        }


        public MaintenanceJobInfo PostMaintenanceJob([FromBody]MaintenanceJobInfo currMainJob)
        {
            currMainJob = repository.Add(currMainJob);
            return currMainJob;
        }

        public bool PutMaintenanaceJob(int id, [FromBody]MaintenanceJobInfo currMainJob)
        {

            currMainJob.MaintenanceJobID = id;
            if (!repository.Update(currMainJob))
            {
                return false;
            }
            return true;
        }
        public void DeleteMaintenanceJob(long id)
        {
            MaintenanceJobInfo currMainJob = repository.Get(id);
            if (currMainJob == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }

        [Route("api/fileupload/uploadfilemaintenancejob")]
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
                    var fileSavePath = Path.Combine(HttpContext.Current.Server.MapPath("~/images/maintenance_forms"), httpPostedFile.FileName);

                    // Save the uploaded file to "UploadedFiles" folder
                    httpPostedFile.SaveAs(fileSavePath);
                    code = HttpStatusCode.OK;
                    Logger.LogEvent(string.Format("Maintenance Form: {0} Filename: {1}", code, httpPostedFile.FileName), System.Diagnostics.EventLogEntryType.Information);


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
