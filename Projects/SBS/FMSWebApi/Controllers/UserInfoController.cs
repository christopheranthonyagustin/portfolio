using MySql.Data.MySqlClient;
using FMSWebApi.Models;
using FMSWebApi.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using System.Web;
using System.IO;


namespace FMSWebApi.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class UserInfoController : ApiController
    {
        private static readonly IUserRepository repository = new UserRepository();

       // public IEnumerable<UserInfo> GetAllAssets()
        //{
       //     return repository.GetAll();
       // }

        public UserInfo GetAsset(int userID)
        {
            UserInfo currUser = repository.Get(userID);
            if (currUser == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currUser;
        }

       // public IEnumerable<UserInfo> GetUserByName(string username)
        //{
        //    return repository.GetAll().Where(
       //         c => string.Equals(c.Name, username,
       //                  StringComparison.OrdinalIgnoreCase));
      //  }
		
		
		 public IEnumerable<UserInfo> GetByCompany([FromUri]UserInfo param)
        {


            if ((param.RoleID > 0 || param.ResellerID > 0 || param.CompanyID > 0))
            {

                return repository.GetByCompany(param);
            }
            else
            {
                //Logger.LogEvent(string.Format("PARAM IS null"), System.Diagnostics.EventLogEntryType.Information);
                return repository.GetAll();
			}
        }
		

        public UserInfo PostAsset([FromBody]UserInfo currUser)
        {
            //currUser = repository.Add(currUser);
            //return currUser;


            Logger.LogEvent(string.Format("Enter PostUser: {0},{1},{2},{3},{4},{5},{6},{7},{8},{9},{10},{11},{12},{13}",
            currUser.Name, currUser.User, currUser.Password, currUser.RoleID, currUser.Phone,
            currUser.Email, currUser.Company, currUser.Assets, currUser.Notifications, currUser.LoginRetry, currUser.Reports, currUser.LanguageID, currUser.ApiKey, currUser.Language), System.Diagnostics.EventLogEntryType.Information);//testing
            currUser = repository.Add(currUser);

            Logger.LogEvent(string.Format("Exit PostUser: {0}", currUser.ErrorMessage), System.Diagnostics.EventLogEntryType.Information);//testing
            return currUser;
        }

        //public HttpResponseMessage PostCustomer(Customer customer)
        //{
        //    customer = repository.Add(customer);
        //    var response = Request.CreateResponse
        //            <Customer>(HttpStatusCode.Created, customer);

        //    string uri = Url.Link("DefaultApi",
        //                    new { customerID = customer.CustomerID });
        //    response.Headers.Location = new Uri(uri);
        //    return response;
        //}

        public bool PutUser(int id, [FromBody]UserInfo currUser)
        {
 			Logger.LogEvent(string.Format("Enter PutUser: {0}, ID: {1}", currUser.Name, id), System.Diagnostics.EventLogEntryType.Information);//testing
            
            currUser.UserID = id;
            if (repository.Update(currUser))
            {
                Logger.LogEvent("PutUser Success", System.Diagnostics.EventLogEntryType.Information);//testing
                return true;
            }
            else
            {
                Logger.LogEvent("PutUser Failed", System.Diagnostics.EventLogEntryType.Information);//testing
                return false;
            }
        }

        public void DeleteProduct(int id)
        {
			Logger.LogEvent(string.Format("Enter DeleteUser: {0}", id), System.Diagnostics.EventLogEntryType.Information);//testing

            UserInfo currUser = repository.Get(id);
            if (currUser == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }

        [Route("api/fileupload/uploadfileuser")]
        [HttpPost]
        public void UploadFileUser()
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
                        var fileSavePath = Path.Combine(HttpContext.Current.Server.MapPath("~/images/users"), httpPostedFile.FileName);

                        // Save the uploaded file to "UploadedFiles" folder
                        httpPostedFile.SaveAs(fileSavePath);
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-(Get File User)", System.Diagnostics.EventLogEntryType.Error);
            }
        }
    }
}
