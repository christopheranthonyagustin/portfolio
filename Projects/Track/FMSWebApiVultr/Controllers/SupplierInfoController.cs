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
    //[EnableCors(origins: "*", headers: "*", methods: "*")]
    public class SupplierInfoController : ApiController
    {
        private static readonly ISupplierRepository repository = new SupplierRepository();


        public IEnumerable<SupplierInfo> GetByCompanyID([FromUri]SupplierInfo param)
        {
            if ((param.CompanyID > 0))
            {

                return repository.GetByCompanyID(param);
            }
            else
            {
                return repository.GetAll();
            }
        }

        public SupplierInfo GetSupplier(int id)
        {
            SupplierInfo currSupplier = repository.Get(id);
            if (currSupplier == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currSupplier;
        }


        public SupplierInfo PostSupplier([FromBody]SupplierInfo currSupplier)
        {
            currSupplier = repository.Add(currSupplier);
            return currSupplier;
        }

        public bool PutSupplier(int id, [FromBody]SupplierInfo currSupplier)
        {
            currSupplier.SupplierID = id;
            if (!repository.Update(currSupplier))
            {
                return false;
            }
            return true;
        }

        public void DeleteSupplier(int id)
        {
            SupplierInfo currSupplier = repository.Get(id);
            if (currSupplier == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }


        [Route("api/fileupload/uploadfilesupplier")]
        [HttpPost]
        public void UploadFileSupplier()
        {
            try
            {
                if (HttpContext.Current.Request.Files.AllKeys.Any())
                {
                    // Get the uploaded image from the Files collection
                    var httpPostedFile = HttpContext.Current.Request.Files["UploadedImageSupplier"];

                    if (httpPostedFile != null)
                    {
                        // Validate the uploaded image(optional)

                        // Get the complete file path
                        var fileSavePath = Path.Combine(HttpContext.Current.Server.MapPath("~/images/suppliers"), httpPostedFile.FileName);

                        // Save the uploaded file to "UploadedFiles" folder
                        httpPostedFile.SaveAs(fileSavePath);
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-(Get File Supplier)", System.Diagnostics.EventLogEntryType.Error);
            }
        }
    }
}
