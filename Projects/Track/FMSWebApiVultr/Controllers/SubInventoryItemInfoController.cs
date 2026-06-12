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
    public class SubInventoryItemInfoController : ApiController
    {
        private static readonly ISubInventoryItemRepository repository = new SubInventoryItemRepository();

        public IEnumerable<SubInventoryItemInfo> GetByID([FromUri]SubInventoryItemInfo param)
        {
            if (param.CompanyID > 0)
            {
                return repository.GetByCompanyID(param);
            }
            else
            {
                return repository.GetAll();
            }
        }

        public SubInventoryItemInfo GetSubInventory(int id)
        {
            SubInventoryItemInfo currInventory = repository.Get(id);
            if (currInventory == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currInventory;
        }


        public SubInventoryItemInfo PostSubInventory([FromBody]SubInventoryItemInfo currInventory)
        {
            currInventory = repository.Add(currInventory);
            return currInventory;
        }

        public bool PutSubInventory(int id, [FromBody]SubInventoryItemInfo currInventory)
        {

            currInventory.SubInventoryItemID = id;
            if (!repository.Update(currInventory))
            {
                return false;
            }
            return true;
        }

        public void DeleteSubInventory(int id)
        {
            SubInventoryItemInfo currInventory = repository.Get(id);
            if (currInventory == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }


        [Route("api/fileupload/uploadfilesubitem")]
        [HttpPost]
        public void UploadFileItem()
        {
            try
            {

                if (HttpContext.Current.Request.Files.AllKeys.Any())
                {
                    // Get the uploaded image from the Files collection
                    var httpPostedFile = HttpContext.Current.Request.Files["UploadedImageSubItem"];

                    if (httpPostedFile != null)
                    {
                        // Validate the uploaded image(optional)

                        // Get the complete file path
                        var fileSavePath = Path.Combine(HttpContext.Current.Server.MapPath("~/images/sub_items"), httpPostedFile.FileName);

                        // Save the uploaded file to "UploadedFiles" folder
                        httpPostedFile.SaveAs(fileSavePath);
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-(Get File Sub Item)", System.Diagnostics.EventLogEntryType.Error);
            }
        }
    }
}
