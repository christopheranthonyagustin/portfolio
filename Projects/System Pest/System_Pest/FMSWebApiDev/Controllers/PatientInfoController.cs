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
    public class PatientInfoController : ApiController
    {
        private static readonly IPatientRepository repository = new PatientRepository();

        public IEnumerable<PatientInfo> GetByCompany([FromUri]PatientInfo param)
        {

            if ((param.ResellerID > 0 || param.CompanyID > 0))
            {

                return repository.GetByCompany(param);
            }
            else
            {
                return repository.GetAll();
            }
        }

        public PatientInfo GetPatient(int id)
        {
            PatientInfo currPatient = repository.Get(id);
            if (currPatient == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currPatient;
        }

        public PatientInfo PostPatient([FromBody]PatientInfo currPatient)
        {
            currPatient = repository.Add(currPatient);
            return currPatient;
        }

        public bool PutPatient(int id, [FromBody]PatientInfo currPatient)
        {

            currPatient.PatientID = id;
            if (!repository.Update(currPatient))
            {
                return false;
            }
            return true;
        }

        public void DeleteDriver(int id)
        {
            PatientInfo currPatient = repository.Get(id);
            if (currPatient == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }


        [Route("api/fileupload/uploadfilepatient")]
        [HttpPost]
        public void UploadFilePatient()
        {
            try
            {

                if (HttpContext.Current.Request.Files.AllKeys.Any())
                {
                    // Get the uploaded image from the Files collection
                    var httpPostedFile = HttpContext.Current.Request.Files["UploadedImage"];

                    if (httpPostedFile != null)
                    {
                        // Validate the uploaded image(optional)

                        // Get the complete file path
                        var fileSavePath = Path.Combine(HttpContext.Current.Server.MapPath("~/images/patients"), httpPostedFile.FileName);

                        // Save the uploaded file to "UploadedFiles" folder
                        httpPostedFile.SaveAs(fileSavePath);
                    }
                }
            }
            catch(Exception ex)
            {
                Logger.LogEvent(ex.Message + "-(Get File)", System.Diagnostics.EventLogEntryType.Error);     
            }
        }



    }
}
