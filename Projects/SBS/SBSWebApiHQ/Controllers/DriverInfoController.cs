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
    public class DriverInfoController : ApiController
    {
        private static readonly IDriverRepository repository = new DriverRepository();

        //public IEnumerable<DriverInfo> GetAllDrivers()
        //{
        //    return repository.GetAll();
        //}


        public IEnumerable<DriverInfo> GetByCompany([FromUri]DriverInfo param)
        {
            //if ((param.CompanyID > 0 || param.ResellerID > 0))
            if ((param.ResellerID > 0 || param.CompanyID > 0))
            {

                return repository.GetByCompany(param);
            }
            else
            {
                //Logger.LogEvent(string.Format("PARAM IS null"), System.Diagnostics.EventLogEntryType.Information);
                return repository.GetAll();
            }
        }

        public DriverInfo GetDriver(int id)
        {
            DriverInfo currDriver = repository.Get(id);
            if (currDriver == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currDriver;
        }

        public DriverInfo PostDriver([FromBody]DriverInfo currDriver)
        {
            currDriver = repository.Add(currDriver);
            return currDriver;
        }

        public bool PutDriver(int id, [FromBody]DriverInfo currDriver)
        {

            currDriver.DriverID = id;
            if (!repository.Update(currDriver))
            {
                return false;
                //throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return true;
        }

        public void DeleteDriver(int id)
        {
            DriverInfo currDriver = repository.Get(id);
            if (currDriver == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }


        [Route("api/fileupload/uploadfile")]
        [HttpPost]
        public void UploadFile()
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
                        var fileSavePath = Path.Combine(HttpContext.Current.Server.MapPath("~/images/drivers"), httpPostedFile.FileName);

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
