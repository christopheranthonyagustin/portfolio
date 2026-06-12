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
    public class MainInventoryItemInfoController : ApiController
    {
        private static readonly IMainInventoryItemRepository repository = new MainInventoryItemRepository();

        public IEnumerable<MainInventoryItemInfo> GetByID([FromUri]MainInventoryItemInfo param)
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

        public MainInventoryItemInfo GetMainInventory(long id)
        {
            MainInventoryItemInfo currMainInventory = repository.Get(id);
            if (currMainInventory == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currMainInventory;
        }


        public MainInventoryItemInfo PostMainInventory([FromBody]MainInventoryItemInfo currMainInventory)
        {
            currMainInventory = repository.Add(currMainInventory);
            return currMainInventory;
        }

        public bool PutMainInventory(int id, [FromBody]MainInventoryItemInfo currMainInventory)
        {

            currMainInventory.MainInventoryItemID = id;
            if (!repository.Update(currMainInventory))
            {
                return false;
            }
            return true;
        }

        public void DeleteMainInventory(int id)
        {
            MainInventoryItemInfo currMainInventory = repository.Get(id);
            if (currMainInventory == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }


        [Route("api/fileupload/uploadfileitem")]
        [HttpPost]
        public void UploadFileItem()
        {
            try
            {

                if (HttpContext.Current.Request.Files.AllKeys.Any())
                {
                    // Get the uploaded image from the Files collection
                    var httpPostedFile = HttpContext.Current.Request.Files["UploadedImageItem"];

                    if (httpPostedFile != null)
                    {
                        // Validate the uploaded image(optional)

                        // Get the complete file path
                        var fileSavePath = Path.Combine(HttpContext.Current.Server.MapPath("~/images/main_items"), httpPostedFile.FileName);

                        // Save the uploaded file to "UploadedFiles" folder
                        httpPostedFile.SaveAs(fileSavePath);
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-(Get File Item)", System.Diagnostics.EventLogEntryType.Error);
            }
        }
    }
}
