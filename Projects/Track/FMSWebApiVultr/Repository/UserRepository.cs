using FMSWebApi.Models;
using FMSWebApi.Properties;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Hosting;

namespace FMSWebApi.Repository
{
    public class UserRepository : IUserRepository
    {
        private string mConnStr = Settings.Default.DB;
        private string mProjName = "FMS-Singapore";
        public IEnumerable<UserInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<UserInfo> arrUsers = new List<UserInfo>();

            try
            {
                conn.ConnectionString = mConnStr;
                conn.Open();

                cmd.CommandText = "view_users";
                cmd.Connection = conn;
                cmd.CommandType = CommandType.TableDirect;
                using (MySqlDataReader reader = cmd.ExecuteReader())
                {

                    if ((reader != null) && (reader.HasRows))
                    {
                        while (reader.Read())
                        {
                            UserInfo currUser = DataMgrTools.BuildUser(reader);
                            string strFill = "";
                            currUser.Image = GetImage(String.Format("users/{0}", currUser.UserID), ref strFill);
                            currUser.ImageFill = strFill;
                            arrUsers.Add(currUser);
                        }
                    }
                }
                
            }
            catch (MySqlException ex)
            {
                Logger.LogEvent("view_users: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }

            

            if (conn != null)
                conn.Close();

            return arrUsers.ToArray();
        }
        public IEnumerable<UserInfo> GetAllUser()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<UserInfo> arrUsers = new List<UserInfo>();

            return arrUsers.ToArray();
        }
        public IEnumerable<UserInfo> GetByUser(UserInfo param)
        {
            List<UserInfo> arrUsers = new List<UserInfo>();
            UserInfo currUser = new UserInfo();
            object objTemp = new object();

            string query = "SELECT * FROM view_users WHERE user_name = @User";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        
                        cmd.Parameters.AddWithValue("@User", param.User);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currUser = DataMgrTools.BuildUser(reader);
                                    arrUsers.Add(currUser);
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(GetByUser)", System.Diagnostics.EventLogEntryType.Error);
                }
            }

            return arrUsers;
        }
        public IEnumerable<UserInfo> GetByEmail(UserInfo param)
        {
            List<UserInfo> arrUsers = new List<UserInfo>();
            UserInfo currUser = new UserInfo();
            object objTemp = new object();

            string query = "SELECT * FROM view_users WHERE email = @Email";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        
                        cmd.Parameters.AddWithValue("@Email", param.Email);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currUser = DataMgrTools.BuildUser(reader);
                                    arrUsers.Add(currUser);
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(GetByEmail)", System.Diagnostics.EventLogEntryType.Error);
                }
            }

            return arrUsers;
        }
        public IEnumerable<UserInfo> GetByCompany(UserInfo param)
        {

            List<UserInfo> arrUsers = new List<UserInfo>();
            UserInfo currUser = new UserInfo();
            object objTemp = new object();

            //string query = "";

            string query = "SELECT * FROM view_users WHERE reseller_id = @ResellerID";

            if (param.CompanyID > 0) query += " and company_id = @CompanyID";

            if (param.RoleID > 0) query += " and role_id >= @RoleID";


            //Logger.LogEvent("GetQuery: " + query, System.Diagnostics.EventLogEntryType.Information);//TESTING

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        
                        cmd.Parameters.AddWithValue("@CompanyID", param.CompanyID);
                        cmd.Parameters.AddWithValue("@RoleID", param.RoleID);
                        cmd.Parameters.AddWithValue("@ResellerID", param.ResellerID);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currUser = DataMgrTools.BuildUser(reader);
                                    string strFill = "";
                                    currUser.Image = GetImage(String.Format("users/{0}", currUser.UserID), ref strFill);
                                    currUser.ImageFill = strFill;
                                    arrUsers.Add(currUser);
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(ByCompany)", System.Diagnostics.EventLogEntryType.Error);

                }


            }

            return arrUsers;
        }
        public UserInfo Get(int userID)
        {
            UserInfo currUser = new UserInfo();
            string query = string.Format("SELECT * FROM view_users WHERE user_id = {0}", userID);

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        MySqlDataReader reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            currUser = DataMgrTools.BuildUser(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(UserRepository)", System.Diagnostics.EventLogEntryType.Error);
                    conn.Close();
                }
            }
            return currUser;
        }
        public UserInfo Add(UserInfo currUser)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;

                        //get company id
                        //int coyId = RepoHelpers.GetCompanyId(currUser.Company);
                        //if (coyId < 0)
                        //{
                        //    currUser.ErrorMessage = Consts.ERR_COMPANYERROR;
                        //    return currUser;
                        //}


                        //get role id
                        //int roleId = RepoHelpers.GetRoleId(currUser.RoleDesc);
                        //if (roleId <= 0)
                        //{
                        //    currUser.ErrorMessage = Consts.ERR_USER_ROLEERROR;
                        //    return currUser;
                        //}


                        //get language id
                        int langId = RepoHelpers.GetLangId(currUser.Language);
                        if (langId <= 0)
                        {
                            Logger.LogEvent("Language Id(User Repository): " + currUser.Language, System.Diagnostics.EventLogEntryType.Information);//testing
                            currUser.ErrorMessage = Consts.ERR_USER_LANGUAGEERROR;
                            return currUser;
                        }

                        Logger.LogEvent("Entered Repository: " + currUser.Name, System.Diagnostics.EventLogEntryType.Information);//testing
                        cmd.CommandText = "INSERT INTO users (name, user_name, password, role_id, phone, email, company_id, assets, notifications, " +
                            "login_retry, reports, language_id, api_key, reseller_id) " +
                            "VALUES (@Name, @UserName, @Password, @RoleID, @Phone, @Email, @CompanyID, @Assets, @Notifications, @LoginRetry, @Reports, @LanguageID, @ApiKey, @ResellerID)";

                        
                        cmd.Parameters.AddWithValue("@Name", currUser.Name);
                        cmd.Parameters.AddWithValue("@UserName", currUser.User);
                        cmd.Parameters.AddWithValue("@Password", currUser.Password);
                        cmd.Parameters.AddWithValue("@RoleID", currUser.RoleID);
                        cmd.Parameters.AddWithValue("@Phone", currUser.Phone);
                        cmd.Parameters.AddWithValue("@Email", currUser.Email);
                        //cmd.Parameters.AddWithValue("@CompanyId", coyId);
                        cmd.Parameters.AddWithValue("@CompanyId", currUser.CompanyID);
                        cmd.Parameters.AddWithValue("@Assets", currUser.Assets);
                        cmd.Parameters.AddWithValue("@Notifications", currUser.Notifications);
                        cmd.Parameters.AddWithValue("@LoginRetry", currUser.LoginRetry);
                        cmd.Parameters.AddWithValue("@Reports", currUser.Reports);
                        cmd.Parameters.AddWithValue("@LanguageID", langId);
                        cmd.Parameters.AddWithValue("@ApiKey", currUser.ApiKey);
                        cmd.Parameters.AddWithValue("@ResellerID", currUser.ResellerID);
                        cmd.ExecuteNonQuery();

                        long id = cmd.LastInsertedId;
                        currUser.UserID = id;


                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(UserInfo)", System.Diagnostics.EventLogEntryType.Error);
            }

            return currUser;
        }
        public bool Remove(int userID)
        {
            bool retVal = false;
            string query = string.Format("DELETE FROM users WHERE user_id = {0}", userID);

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        if (cmd.ExecuteNonQuery() == 1)
                            retVal = true;
                        else
                            retVal = false;
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-GetUserId", System.Diagnostics.EventLogEntryType.Error);
                  
                }

                DeleteImage(String.Format("users/{0}", userID));
            }

            return retVal;
        }
        public bool Update(UserInfo currUser)
        {
            bool retVal = false;
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;

                        int coyId = currUser.CompanyID;
                        int roleId = currUser.RoleID;
                        int langId = currUser.LanguageID;

                        try
                        {
                            //get company id
                            
                            //if (coyId <= 0)
                            //{
                            //    coyId = RepoHelpers.GetCompanyId(currUser.Company);
                            //    if (coyId < 0)
                            //    {
                            //        currUser.ErrorMessage = Consts.ERR_COMPANYERROR;
                            //        return false;
                            //    }
                            //}

                            //get role id
                            if (roleId <= 0)
                            {
                                roleId = RepoHelpers.GetRoleId(currUser.RoleDesc);
                                if (roleId <= 0)
                                {
                                    currUser.ErrorMessage = Consts.ERR_USER_ROLEERROR;
                                    return false;
                                }
                            }

                            //get language id
                            if (langId <= 0)
                            {
                                langId = RepoHelpers.GetLangId(currUser.Language);
                                if (langId <= 0)
                                {
                                    currUser.ErrorMessage = Consts.ERR_USER_LANGUAGEERROR;
                                    return false;
                                }
                            }
                        }
                        catch(Exception ex)
                        {
                            Logger.LogEvent(ex.Message + "-Update(Values Validation)", System.Diagnostics.EventLogEntryType.Error);
                            return false;
                        }

                        cmd.CommandText = "UPDATE users SET name = @Name, user_name = @UserName, password = @Password, role_id = @RoleID, " +
                                          "phone = @Phone, email = @Email, company_id = @CompanyID, assets = @Assets, notifications = @Notifications, " +
                                            "login_retry = @LoginRetry, reports = @Reports, language_id = @LanguageID, api_key = @ApiKey, reseller_id = @ResellerID, " + 
                                            "created_date = @CreatedDate, modified_date = @ModifiedDate, last_login = @LastLogin WHERE user_id = @UserID";
                        
                        cmd.Parameters.AddWithValue("@Name", currUser.Name);
                        cmd.Parameters.AddWithValue("@UserName", currUser.User);
                        cmd.Parameters.AddWithValue("@Password", currUser.Password);
                        cmd.Parameters.AddWithValue("@RoleID", currUser.RoleID);
                        cmd.Parameters.AddWithValue("@Phone", currUser.Phone);
                        cmd.Parameters.AddWithValue("@Email", currUser.Email);
                        cmd.Parameters.AddWithValue("@CompanyID", currUser.CompanyID);
                        cmd.Parameters.AddWithValue("@Assets", currUser.Assets);
                        cmd.Parameters.AddWithValue("@Notifications", currUser.Notifications);
                        cmd.Parameters.AddWithValue("@LoginRetry", currUser.LoginRetry);
                        cmd.Parameters.AddWithValue("@Reports", currUser.Reports);
                        cmd.Parameters.AddWithValue("@LanguageID", langId);
                        cmd.Parameters.AddWithValue("@ApiKey", currUser.ApiKey);
                        cmd.Parameters.AddWithValue("@ResellerID", currUser.ResellerID);
                        cmd.Parameters.AddWithValue("@CreatedDate", currUser.CreatedDate);
                        cmd.Parameters.AddWithValue("@ModifiedDate", currUser.ModifiedDate);
                        cmd.Parameters.AddWithValue("@LastLogin", currUser.LastLogin);
                        cmd.Parameters.AddWithValue("@UserID", currUser.UserID);

                        //cmd.ToString();
                        //HINT: Missing Param here
                        if (cmd.ExecuteNonQuery() == 1)
                            retVal = true;
                        else
                            retVal = false;
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Update(UserRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }

        public bool UpdateUserPassword(UpdateUserInfo currUser)
        {
            bool retVal = false;

            //if (!string.IsNullOrEmpty(currUser.User))
            if (currUser.ModifiedDate != DateTime.MinValue)
            {
                Logger.LogEvent("Password Expiration", System.Diagnostics.EventLogEntryType.Information);
                try
                {
                    using (MySqlConnection conn = new MySqlConnection(mConnStr))
                    {
                        using (MySqlCommand cmd = new MySqlCommand())
                        {
                            conn.Open();
                            cmd.Connection = conn;
                            cmd.CommandText = "UPDATE users SET password = @Password, login_retry = @LoginRetry, modified_date = @ModifiedDate, last_login = @LastLogin WHERE user_name = @User";
                            
                            cmd.Parameters.AddWithValue("@Password", currUser.Password);
                            cmd.Parameters.AddWithValue("@LoginRetry", currUser.LoginRetry);
                            cmd.Parameters.AddWithValue("@ModifiedDate", currUser.ModifiedDate);
                            cmd.Parameters.AddWithValue("@LastLogin", currUser.LastLogin);
                            cmd.Parameters.AddWithValue("@User", currUser.User);

                            if (cmd.ExecuteNonQuery() == 1)
                                retVal = true;
                            else
                                retVal = false;
                            conn.Close();
                        }
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-UpdateUserPassword(UserLoginRepository by User)", System.Diagnostics.EventLogEntryType.Error);
                }
            }
            else
            {
                Logger.LogEvent("First Time Login", System.Diagnostics.EventLogEntryType.Information);

                try
                {
                    using (MySqlConnection conn = new MySqlConnection(mConnStr))
                    {
                        using (MySqlCommand cmd = new MySqlCommand())
                        {
                            conn.Open();
                            cmd.Connection = conn;
                            cmd.CommandText = "UPDATE users SET password = @Password, login_retry = @LoginRetry WHERE user_id = @UserID";
                            
                            cmd.Parameters.AddWithValue("@Password", currUser.Password);
                            cmd.Parameters.AddWithValue("@LoginRetry", currUser.LoginRetry);
                            cmd.Parameters.AddWithValue("@UserID", currUser.UserID);

                            if (cmd.ExecuteNonQuery() == 1)
                                retVal = true;
                            else
                                retVal = false;
                            conn.Close();
                        }
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-UpdateUserPassword(UserLoginRepository by ID)", System.Diagnostics.EventLogEntryType.Error);
                }
            }




            return retVal;
        }
        public bool UpdateUser(UpdateUserInfo currUser)
        {
            bool retVal = false;

            if (!string.IsNullOrEmpty(currUser.User))
            {
                try
                {
                    using (MySqlConnection conn = new MySqlConnection(mConnStr))
                    {
                        using (MySqlCommand cmd = new MySqlCommand())
                        {
                            conn.Open();
                            cmd.Connection = conn;
                            cmd.CommandText = "UPDATE users SET login_retry = @LoginRetry, last_login = @LastLogin WHERE user_name = @User";
                            
                            cmd.Parameters.AddWithValue("@LoginRetry", currUser.LoginRetry);
                            cmd.Parameters.AddWithValue("@LastLogin", currUser.LastLogin);
                            cmd.Parameters.AddWithValue("@User", currUser.User);

                            if (cmd.ExecuteNonQuery() == 1)
                                retVal = true;
                            else
                                retVal = false;
                            conn.Close();
                        }
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Update(UserLoginRepository by User)", System.Diagnostics.EventLogEntryType.Error);
                }
            }
            else
            {
                try
                {
                    using (MySqlConnection conn = new MySqlConnection(mConnStr))
                    {
                        using (MySqlCommand cmd = new MySqlCommand())
                        {
                            conn.Open();
                            cmd.Connection = conn;
                            cmd.CommandText = "UPDATE users SET login_retry = @LoginRetry WHERE user_id = @UserID";
                            
                            cmd.Parameters.AddWithValue("@LoginRetry", currUser.LoginRetry);
                            cmd.Parameters.AddWithValue("@UserID", currUser.UserID);

                            if (cmd.ExecuteNonQuery() == 1)
                                retVal = true;
                            else
                                retVal = false;
                            conn.Close();
                        }
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Update(UserLoginRepository by ID)", System.Diagnostics.EventLogEntryType.Error);
                }
            }




            return retVal;
        }

        public UserInfo GetForgotPassword(UserInfo param)
        {

            List<UserInfo> arrUsers = new List<UserInfo>();
            UserInfo currUser = new UserInfo();

            //currUser.Email = param.Email;
            //currUser.TempPassword = param.TempPassword;
            //currUser.Password = param.Password;

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {

                #region GET THE LINKED EMAIL ACCOUNT
                try
                {
                    currUser = GetUserByEmail(param.Email);
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(mProjName, ex.Message, System.Diagnostics.EventLogEntryType.Error);
                }
                #endregion

                using (MySqlCommand cmd = new MySqlCommand())
                {
                    conn.Open();
                    cmd.Connection = conn;

                    try
                    {
                        cmd.CommandText = "UPDATE users SET password = @Password WHERE user_id = @UserID";
                        
                        cmd.Parameters.AddWithValue("@Password", param.Password);
                        cmd.Parameters.AddWithValue("@UserID", currUser.UserID);
                        cmd.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        Logger.LogEvent(ex.Message + "-Update User Password", System.Diagnostics.EventLogEntryType.Error);
                    }

                    try
                    {
                        string strSender = "tracksupport@acecom.com.sg";
                        string strSource = "TRACK";
                        MailMessage eMail = new MailMessage();
                        eMail.From = new MailAddress(strSender, strSource);
                        try
                        {
                            string[] arrData = param.Email.Split(",".ToCharArray());

                            if (arrData.Length > 1)
                            {
                                for (int j = 0; j < arrData.Length; j++)
                                {
                                    eMail.To.Add(new MailAddress(arrData[j]));
                                }
                            }
                            else
                            {
                                eMail.To.Add(new MailAddress(param.Email));
                            }

                        }
                        catch (Exception ex)
                        {
                            Logger.LogEvent("Parse Email Address: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                        }

                        string body = createEmailBodyForgotPassword(currUser.Name, currUser.User, param.TempPassword, Settings.Default.Website);

                        eMail.Subject = "EMAIL RECOVERY: " + currUser.Company;
                        eMail.Body = body;
                        eMail.IsBodyHtml = true;

                        try
                        {
                            // send default email
                            SmtpClient smtp = new SmtpClient();
                            smtp.Port = 587;
                            smtp.Host = "mail.acecom.com.sg";
                            smtp.EnableSsl = false;
                            smtp.UseDefaultCredentials = false;
                            NetworkCredential credentials = new NetworkCredential("tracksupport@acecom.com.sg", "Acecom2018123");
                            smtp.Credentials = credentials;
                            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                            smtp.Send(eMail);

                            Logger.LogEvent("Email Sent to: " + currUser.Email, System.Diagnostics.EventLogEntryType.Information);
                        }
                        catch (Exception ex)
                        {
                            Logger.LogEvent(String.Format("Email Sent Failed to: {0} Exception: {1}", currUser.Email, ex.Message), System.Diagnostics.EventLogEntryType.Error);
                        }
                    }
                    catch (Exception ex)
                    {
                        Logger.LogEvent("Process Email: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                    }

                    conn.Close();
                }
            }

            currUser.ErrorMessage = "Success";

            return currUser;
        }
        private string createEmailBodyForgotPassword(string name, string user, string password, string website)
        {
            string body = string.Empty;
            //using streamreader for reading my htmltemplate   

            try
            {
                using (StreamReader reader = new StreamReader(System.Web.HttpContext.Current.Server.MapPath("~/ForgotPassword_en.html")))
                {
                    body = reader.ReadToEnd();
                }

                body = body.Replace("{Name}", name);
                body = body.Replace("{User}", user);
                body = body.Replace("{Password}", password);
                body = body.Replace("{Website}", website);

            }
            catch (Exception ex)
            {
                Logger.LogEvent("createEmailBodyForgotPassword: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }

            return body;

        }

        public UserInfo GetUserByEmail(string email)
        {
            UserInfo currAsset = new UserInfo();
            string query = string.Format("SELECT * FROM view_users WHERE email = @Email LIMIT 1");


            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = query;
                        
                        cmd.Parameters.AddWithValue("@Email", email);
                        MySqlDataReader reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            currAsset = DataMgrTools.BuildUser(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-GetUserByEmail", System.Diagnostics.EventLogEntryType.Error);
                }
            }
            return currAsset;
        }

        public string GetImage(string strName, ref string strFill)
        {
            try
            {
                // loop through image file types
                List<string> arrTypes = new List<string>() { "jpg", "png", "gif", "bmp" };
                foreach (string strType in arrTypes)
                {
                    string strTemp = String.Format("{0}.{1}", strName, strType);
                    string strFile = String.Format("{0}images\\{1}", HostingEnvironment.ApplicationPhysicalPath, strTemp);
                    string strUri = String.Format("{0}/images/{1}", ConfigurationManager.AppSettings["ServerPath"], strTemp);

                    // check file path
                    if (File.Exists(strFile))
                    {
                        // return image path
                        strFill = "Uniform";
                        return String.Format("{0}?dt={1:ddMMMyyHHmmss}", strUri, File.GetLastWriteTimeUtc(strFile));
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(ex.Message + "-(Get Image)", System.Diagnostics.EventLogEntryType.Error);
            }

            // image file not found
            strFill = "None";
            return strName;
        }

        public void DeleteImage(string strName)
        {
            try
            {
                // loop through image file types
                List<string> arrTypes = new List<string>() { "jpg", "png", "gif", "bmp" };
                foreach (string strType in arrTypes)
                {
                    // check file path
                    string strFile = String.Format("{0}images\\{1}.{2}",
                        HostingEnvironment.ApplicationPhysicalPath, strName, strType);
                    if (File.Exists(strFile))
                    {
                        // return image path
                        File.Delete(strFile);
                        break;
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent(ex.Message + "-(Delete Image)", System.Diagnostics.EventLogEntryType.Error);
            }
        }
    }
}