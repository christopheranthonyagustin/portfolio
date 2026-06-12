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
    public class SubInventoryBranchInfoController : ApiController
    {
        private static readonly ISubInventoryBranchRepository repository = new SubInventoryBranchRepository();


        public IEnumerable<SubInventoryBranchInfo> GetByID([FromUri]SubInventoryBranchInfo param)
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

        public SubInventoryBranchInfo GetBranch(int id)
        {
            SubInventoryBranchInfo currBranch = repository.Get(id);
            if (currBranch == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currBranch;
        }

        public SubInventoryBranchInfo PostBranch(SubInventoryBranchInfo currBranch)
        {
            currBranch = repository.Add(currBranch);
            return currBranch;
        }

        public void PutBranch(int id, SubInventoryBranchInfo currBranch)
        {
            currBranch.BranchID = id;
            if (!repository.Update(currBranch))
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
        }

        public void DeleteBranch(int id)
        {
            SubInventoryBranchInfo currBranch = repository.Get(id);
            if (currBranch == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }


        [Route("api/fileupload/uploadfilesubbranches")]
        [HttpPost]
        public void UploadFileBranches()
        {
            try
            {
                if (HttpContext.Current.Request.Files.AllKeys.Any())
                {
                    // Get the uploaded image from the Files collection
                    var httpPostedFile = HttpContext.Current.Request.Files["UploadedImageSubBranches"];

                    if (httpPostedFile != null)
                    {
                        // Validate the uploaded image(optional)

                        // Get the complete file path
                        var fileSavePath = Path.Combine(HttpContext.Current.Server.MapPath("~/images/sub_branches"), httpPostedFile.FileName);

                        // Save the uploaded file to "UploadedFiles" folder
                        httpPostedFile.SaveAs(fileSavePath);
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-(UploadFileBranches)", System.Diagnostics.EventLogEntryType.Error);
            }
        }

    }
}
