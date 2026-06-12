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


        public UserInfo GetAsset(int userID)
        {
            UserInfo currUser = repository.Get(userID);
            if (currUser == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currUser;
        }

	
		 public IEnumerable<UserInfo> GetByCompany([FromUri]UserInfo param)
        {


            if ((param.RoleID > 0 || param.ResellerID > 0 || param.CompanyID > 0))
            {

                return repository.GetByCompany(param);
            }
            else
            {
                return repository.GetAll();
			}
        }
		

        public UserInfo PostAsset([FromBody]UserInfo currUser)
        {
            currUser = repository.Add(currUser);

            return currUser;
        }


        public bool PutUser(int id, [FromBody]UserInfo currUser)
        {
            
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
