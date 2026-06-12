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
    public class CustomerInfoController : ApiController
    {
        private static readonly ICustomerRepository repository = new CustomerRepository();

        public IEnumerable<CustomerInfo> GetByCompany([FromUri]CustomerInfo param)
        {
            if ((param.ResellerID > 0) && (param.CompanyID > 0))
            {

                return repository.GetByCompany(param);
            }
            else
            {
                return repository.GetAll();
            }
        }

        public CustomerInfo GetCustomer(int id)
        {
            CustomerInfo currCustomer = repository.Get(id);
            if (currCustomer == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currCustomer;
        }

        public CustomerInfo PostCustomer([FromBody]CustomerInfo currCustomer)
        {
            currCustomer = repository.Add(currCustomer);
            return currCustomer;
        }

        public bool PutCustomer(int id, [FromBody]CustomerInfo currCustomer)
        {

            currCustomer.CustomerID = id;
            if (!repository.Update(currCustomer))
            {
                return false;
            }
            return true;
        }

        public void DeleteCustomer(int id)
        {
            CustomerInfo currCustomer = repository.Get(id);
            if (currCustomer == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }


        [Route("api/fileupload/uploadfilecustomer")]
        [HttpPost]
        public void UploadFileCustomer()
        {
            try
            {

                if (HttpContext.Current.Request.Files.AllKeys.Any())
                {
                    // Get the uploaded image from the Files collection
                    var httpPostedFile = HttpContext.Current.Request.Files["UploadedImageMember"];

                    if (httpPostedFile != null)
                    {
                        // Validate the uploaded image(optional)

                        // Get the complete file path
                        var fileSavePath = Path.Combine(HttpContext.Current.Server.MapPath("~/images/customers"), httpPostedFile.FileName);

                        // Save the uploaded file to "UploadedFiles" folder
                        httpPostedFile.SaveAs(fileSavePath);
                    }
                }
            }
            catch(Exception ex)
            {
                Logger.LogEvent(ex.Message + "-(Get File Customer)", System.Diagnostics.EventLogEntryType.Error);     
            }
        }



    }
}
