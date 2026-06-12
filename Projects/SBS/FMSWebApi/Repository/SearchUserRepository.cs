using FMSWebApi.Models;
using FMSWebApi.Properties;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Hosting;

namespace FMSWebApi.Repository
{
    public class SearchUserRepository : ISearchUserRepository
    {
        private string mConnStr = Settings.Default.DB;
        private string mProjName = "SBS";
        public IEnumerable<SearchUser> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<SearchUser> arrUsers = new List<SearchUser>();


            return arrUsers.ToArray();
        }

        public IEnumerable<SearchUser> GetByCompany(SearchUser param)
        {

            List<SearchUser> arrUsers = new List<SearchUser>();
            SearchUser currUser = new SearchUser();
            object objTemp = new object();

            //string query = "";

            string query = "SELECT * FROM view_users WHERE user_name = @User";


            //Logger.LogEvent("GetQuery: " + query, System.Diagnostics.EventLogEntryType.Information);//TESTING

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@User", param.User);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currUser = DataMgrTools.BuildSearchUser(reader);
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

        public SearchUser Get(int userID)
        {
            SearchUser currUser = new SearchUser();
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
                            currUser = DataMgrTools.BuildSearchUser(reader);
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

        public SearchUser Add(SearchUser currUser)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;

                     
                        Logger.LogEvent("Entered Repository: " + currUser.Name, System.Diagnostics.EventLogEntryType.Information);//testing
                        cmd.CommandText = "INSERT INTO users (name, user_name, password, role_id, phone, email, company_id, assets, notifications, " +
                            "login_retry, reports, language_id, api_key, reseller_id) " +
                            "VALUES (@Name, @UserName, @Password, @RoleID, @Phone, @Email, @CompanyID, @Assets, @Notifications, @LoginRetry, @Reports, @LanguageID, @ApiKey, @ResellerID)";

                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@Name", currUser.Name);
                        cmd.Parameters.AddWithValue("@UserName", currUser.User);
                        cmd.Parameters.AddWithValue("@Password", currUser.Password);
                        cmd.Parameters.AddWithValue("@RoleID", currUser.RoleID);
                        cmd.Parameters.AddWithValue("@Phone", currUser.Phone);
                        cmd.Parameters.AddWithValue("@Email", currUser.Email);
                        cmd.Parameters.AddWithValue("@CompanyId", currUser.CompanyID);
                        cmd.Parameters.AddWithValue("@Assets", currUser.Assets);
                        cmd.Parameters.AddWithValue("@Notifications", currUser.Notifications);
                        cmd.Parameters.AddWithValue("@LoginRetry", currUser.LoginRetry);
                        cmd.Parameters.AddWithValue("@Reports", currUser.Reports);
                        cmd.Parameters.AddWithValue("@LanguageID", currUser.LanguageID);
                        cmd.Parameters.AddWithValue("@ApiKey", currUser.ApiKey);
                        cmd.Parameters.AddWithValue("@ResellerID", currUser.ResellerID);

                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(SearchUser)", System.Diagnostics.EventLogEntryType.Error);
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

        public bool Update(SearchUser currUser)
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

                        cmd.CommandText = "UPDATE users SET name = @Name, user_name = @UserName, password = @Password, role_id = @RoleID, " +
                            "phone = @Phone, email = @Email, company_id = @CompanyID, assets = @Assets, notifications = @Notifications, " +
                                            "login_retry = @LoginRetry, reports = @Reports, language_id = @LanguageID, api_key = @ApiKey, reseller_id = @ResellerID WHERE user_id = @UserID";
                        cmd.Prepare();
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
                        cmd.Parameters.AddWithValue("@LanguageID", currUser.LanguageID);
                        cmd.Parameters.AddWithValue("@ApiKey", currUser.ApiKey);
                        cmd.Parameters.AddWithValue("@ResellerID", currUser.ResellerID);
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
                retVal = false;
                Logger.LogEvent(ex.Message + "-Update(UserRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }

        /// <summary>
        /// gets image file
        /// </summary>
        /// <param name="strName"></param>
        /// <param name="strDefault"></param>
        /// <param name="strFill"></param>
        /// <returns></returns>
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
                    //string strUri = String.Format("{0}/images/{1}", ConfigurationManager.AppSettings["ServerPath"], strTemp);
                    string strUri = String.Format("{0}/images/{1}", "http://103.237.168.119/trackdemowebapi", strTemp);

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

        /// <summary>
        /// deletes image file
        /// </summary>
        /// <param name="strName"></param>
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