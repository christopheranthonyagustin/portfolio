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
    public class StockMovementInfoController : ApiController
    {
        private static readonly IStockMovementRepository repository = new StockMovementRepository();

        public IEnumerable<StockMovementInfo> GetByRouteNo([FromUri] StockMovementInfo param)
        {
            if (param.CompanyID > 0)
            {
                //Logger.LogEvent(string.Format("Stock Movement CompanyID: {0} Route No: {1}", param.CompanyID, param.RouteNo), System.Diagnostics.EventLogEntryType.Information);
                return repository.GetByRouteNo(param);
            }
            else
            {
                return repository.GetAll();
            }
        }

        public StockMovementInfo GetStockMovement(int id)
        {
            StockMovementInfo currStockMovement = repository.Get(id);
            if (currStockMovement == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currStockMovement;
        }


        public StockMovementInfo PostStockMovement([FromBody] StockMovementInfo currStockMovement)
        {
            currStockMovement = repository.Add(currStockMovement);
            return currStockMovement;
        }

        public bool PutStockMovement(int id, [FromBody] StockMovementInfo currStockMovement)
        {
            //Logger.LogEvent(string.Format("Enter PutStockMovement: {0}, ID: {1}", currStockMovement.RouteNo, id), System.Diagnostics.EventLogEntryType.Information);//testing

            currStockMovement.StockMovementID = id;
            if (!repository.Update(currStockMovement))
            {
                return false;
                //throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return true;
        }

        public void DeleteStockMovement(int id)
        {
            StockMovementInfo currStockMovement = repository.Get(id);
            if (currStockMovement == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }

        [Route("api/fileupload/uploadfilestockmovement")]
        [HttpPost]
        public void UploadFileStockMovement()
        {
            try
            {
                if (HttpContext.Current.Request.Files.AllKeys.Any())
                {
                    // Get the uploaded image from the Files collection
                    var httpPostedFile = HttpContext.Current.Request.Files["UploadedImageStockMovement"];

                    if (httpPostedFile != null)
                    {
                        // Validate the uploaded image(optional)

                        // Get the complete file path
                        var fileSavePath = Path.Combine(HttpContext.Current.Server.MapPath("~/images/stockmovement"), httpPostedFile.FileName);

                        // Save the uploaded file to "UploadedFiles" folder
                        httpPostedFile.SaveAs(fileSavePath);
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-(Get File Stock Movement)", System.Diagnostics.EventLogEntryType.Error);
            }
        }
    }
}
