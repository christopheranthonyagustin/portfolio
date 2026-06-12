using FMSWebApi.Models;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace FMSWebApi.Repository
{
    public class UserRepository : IUserRepository
    {
        //private string mConnStr = "server=127.0.0.1;uid=root;pwd=12345;database=test;";
        private string mConnStr = "server=103.237.168.119;uid=root;pwd=@c3c0M;database=fms;";
        //private string mProjName = "FMS";
        public IEnumerable<UserInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<UserInfo> arrAssets = new List<UserInfo>();

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
                            UserInfo currAsset = DataMgrTools.BuildUser(reader);
                            arrAssets.Add(currAsset);
                        }
                    }
                }
                
            }
            catch (MySqlException ex)
            {
                //Logger.LogEvent(mProjName, ex.Message, System.Diagnostics.EventLogEntryType.Error);
                Logger.LogEvent("view_users: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }

            if (conn != null)
                conn.Close();

            return arrAssets.ToArray();
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
                        int coyId = RepoHelpers.GetCompanyId(currUser.Company);
                        if (coyId < 0)
                        {
                            currUser.ErrorMessage = Consts.ERR_USER_COMPANYERROR;
                            return currUser;
                        }


                        //get role id
                        int roleId = RepoHelpers.GetRoleId(currUser.RoleDesc);
                        if (roleId <= 0)
                        {
                            currUser.ErrorMessage = Consts.ERR_USER_ROLEERROR;
                            return currUser;
                        }


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
                            "login_retry, reports, language_id, api_key) " +
                            "VALUES (@Name, @UserName, @Password, @RoleID, @Phone, @Email, @CompanyID, @Assets, @Notifications, @LoginRetry, @Reports, @LanguageID, @ApiKey)";

                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@Name", currUser.Name);
                        cmd.Parameters.AddWithValue("@UserName", currUser.User);
                        cmd.Parameters.AddWithValue("@Password", currUser.Password);
                        cmd.Parameters.AddWithValue("@RoleID", roleId);
                        cmd.Parameters.AddWithValue("@Phone", currUser.Phone);
                        cmd.Parameters.AddWithValue("@Email", currUser.Email);
                        cmd.Parameters.AddWithValue("@CompanyId", coyId);
                        cmd.Parameters.AddWithValue("@Assets", currUser.Assets);
                        cmd.Parameters.AddWithValue("@Notifications", currUser.Notifications);
                        cmd.Parameters.AddWithValue("@LoginRetry", currUser.LoginRetry);
                        cmd.Parameters.AddWithValue("@Reports", currUser.Reports);
                        cmd.Parameters.AddWithValue("@LanguageID", langId);
                        cmd.Parameters.AddWithValue("@ApiKey", currUser.ApiKey);
                        cmd.ExecuteNonQuery();
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
                    conn.Close();
                }
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
                    try
                    {
                        using (MySqlCommand cmd = new MySqlCommand())
                        {
                            conn.Open();
                            cmd.Connection = conn;

                            //get company id
                            int coyId = RepoHelpers.GetCompanyId(currUser.Company);
                            if (coyId < 0)
                            {
                                currUser.ErrorMessage = Consts.ERR_COMPANYERROR;
                                return false;
                            }


                            //get role id
                            int roleId = RepoHelpers.GetRoleId(currUser.RoleDesc);
                            if (roleId <= 0)
                            {
                                currUser.ErrorMessage = Consts.ERR_USER_ROLEERROR;
                                return false;
                            }


                            //get language id
                            int langId = RepoHelpers.GetLangId(currUser.Language);
                            if (langId <= 0)
                            {
                                currUser.ErrorMessage = Consts.ERR_USER_LANGUAGEERROR;
                                return false;
                            }


                            cmd.CommandText = "UPDATE users SET name = @Name, user_name = @UserName, password = @Passsword, role_id = @RoleID, phone = @Phone, email = @Email, company_id = @CompanyID, assets = @Assets, notifications = @Notifications, " +
                                                "login_retry = @LoginRetry, reports = @Reports, language_id = @LanguageID, api_key = @ApiKey WHERE user_id = @userID";
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
                            //HINT: Missing Param here
                            if (cmd.ExecuteNonQuery() == 1)
                                retVal = true;
                            else
                                retVal = false;
                            conn.Close();
                        }
                    }
                    catch (Exception ex)
                    {
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
    }
}