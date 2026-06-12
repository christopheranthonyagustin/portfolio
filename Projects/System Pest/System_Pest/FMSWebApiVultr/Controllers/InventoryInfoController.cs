using FMSWebApi.Models;
using FMSWebApi.Repository;
using ForceSSL.Modules;
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
   // [RequireHttps]
    //[Authorize] // Require authenticated requests.
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class InventoryInfoController : ApiController
    {
        private static readonly IInventoryRepository repository = new InventoryRepository();

        public IEnumerable<InventoryInfo> GetByCompany([FromUri]InventoryInfo param)
        {
            if ((param.CompanyID > 0))                            
            {
                return repository.GetByCompany(param);
            }
            else
            {
                return repository.GetAll();
            }
        }
		
        // GET: api/InventoryInfo
        public InventoryInfo Get(int id)
        {
            InventoryInfo currInventory = repository.Get(id);
            if (currInventory == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currInventory;
        }


        public InventoryInfo PostInventory([FromBody]InventoryInfo currInventory)
        {
            currInventory = repository.Add(currInventory);
            return currInventory;
        }

        public bool PutInventory(int id, [FromBody]InventoryInfo currInventory)
        {

            currInventory.InventoryID = id;
            if (!repository.Update(currInventory))
            {
                return false;
            }
            return true;
        }

        public void DeleteInventory(int id)
        {
            InventoryInfo currInventory = repository.Get(id);
            if (currInventory == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }

        [Route("api/fileupload/uploadfileinventory")]
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
                        var fileSavePath = Path.Combine(HttpContext.Current.Server.MapPath("~/images/inventory"), httpPostedFile.FileName);

                        // Save the uploaded file to "UploadedFiles" folder
                        httpPostedFile.SaveAs(fileSavePath);
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-(Get File)", System.Diagnostics.EventLogEntryType.Error);
            }
        }

    }
}
