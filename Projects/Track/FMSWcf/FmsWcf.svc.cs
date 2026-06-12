using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Drawing;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net;
using System.Runtime.Serialization;
using System.Runtime.InteropServices;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.Text;
using System.Text.RegularExpressions;
using System.Xml;
using System.Web;
using System.Web.Hosting;
using System.Web.Script.Serialization;
using System.Web.Security;
using ICSharpCode.SharpZipLib.Zip;
using FmsWcf.Properties;

namespace WlocateWeb
{
    /// <summary>
    /// definition of constants
    /// </summary>
    public class Constant
    {
        // define custom namespace
        public const string Namespace = "http://w-locate.com/services";

        // engine status
        public const string ENGINE_STOP = "STOP";
        public const string ENGINE_IDLE = "IDLE";
        public const string ENGINE_MOVE = "MOVE";
    }

    /// <summary>
    /// find web service interface
    /// </summary>
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Required)]
    public class FmsWcf : IFmsWcf
    {
        /// <summary>
        /// checks application license
        /// </summary>
        /// <returns></returns>
        public string CheckLicense(int iUserID)
        {
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            DbDataReader dbRdr = null;
            string strRet = "";
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // get company info
                    CompanyInfo udtCompany = null;
                    dbRdr = dbMgr.ExecuteReader(String.Format("SELECT * FROM companies WHERE company_id = (SELECT company_id " +
                        "FROM users WHERE user_id = {0})", iUserID));
                    if ((dbRdr != null) && dbRdr.HasRows && dbRdr.Read())
                        udtCompany = BuildCompany(dbRdr, "images/edit.png");
                    if (dbRdr != null) dbRdr.Close();

                    // check company
                    if (udtCompany == null)
                    {
                        // company not found
                        dbMgr.Close();
                        return "Invalid license. Please contact software provider.";
                    }

                    // check user limit
                    if (udtCompany.UserLimit > 0)
                    {
                        // count users
                        int iCount = dbMgr.Count(String.Format("SELECT COUNT(user_id) FROM users WHERE company_id = {0}", udtCompany.CompanyID));
                        if (iCount > udtCompany.UserLimit)
                        {
                            // limit users
                            dbMgr.ExecuteNonQuery(String.Format("DELETE FROM users WHERE user_id IN " +
                                "(SELECT TOP({0}) user_id FROM users WHERE company_id = {1} " +
                                "ORDER BY user_id DESC)", iCount - udtCompany.UserLimit, udtCompany.CompanyID));
                        }
                    }

                    // check zone limit
                    if (udtCompany.ZoneLimit > 0)
                    {
                        // count zones
                        int iCount = dbMgr.Count(String.Format("SELECT COUNT(zone_id) FROM zones WHERE company_id = {0}", udtCompany.CompanyID));
                        if (iCount > udtCompany.ZoneLimit)
                        {
                            // limit zones
                            dbMgr.ExecuteNonQuery(String.Format("DELETE FROM zones WHERE zone_id IN " +
                                "(SELECT TOP({0}) zone_id FROM zones WHERE company_id = {1} " +
                                "ORDER BY zone_id DESC)", iCount - udtCompany.ZoneLimit, udtCompany.CompanyID));
                        }
                    }

                    // check asset limit
                    if (udtCompany.AssetLimit > 0)
                    {
                        // count assets
                        int iCount = dbMgr.Count(String.Format("SELECT COUNT(asset_id) FROM assets WHERE company_id = {0}", udtCompany.CompanyID));
                        if (iCount > udtCompany.AssetLimit)
                        {
                            // limit assets
                            dbMgr.ExecuteNonQuery(String.Format("DELETE FROM assets WHERE asset_id IN " +
                                "(SELECT TOP({0}) asset_id FROM assets WHERE company_id = {1} " +
                                "ORDER BY asset_id DESC)", iCount - udtCompany.AssetLimit, udtCompany.CompanyID));
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                strRet = DatabaseMgrMySQL.LogError(ex.Message, "CheckLicense");
            }

            // close database
            if (dbRdr != null) dbRdr.Close();
            dbMgr.Close();
            return strRet;
        }

        /// <summary>
        /// get ota commands
        /// </summary>
        /// <param name="userID"></param>
        /// <returns></returns>
        public List<OTACommand> GetOTACommands(int userID)
        {
            List<OTACommand> arrOtaCmds = new List<OTACommand>();
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            DbDataReader dbRdr = null;

            try
            {
                // open database connection
                if (dbMgr.Open())
                {
                    // get ota commands
                    dbRdr = dbMgr.ExecuteReader("SELECT ota_commands.*, ota_tag_types.tag_type_desc " +
                        "FROM ota_commands INNER JOIN ota_tag_types ON ota_commands.tag_type_id = ota_tag_types.tag_type_id");

                    // check query results
                    if ((dbRdr != null) && (dbRdr.HasRows))
                    {
                        // read results
                        while(dbRdr.Read())
                        {
                            // build ota commands
                            OTACommand otaCmd = new OTACommand();
                            otaCmd.CommandID = dbRdr.ToInt32("cmd_id");
                            otaCmd.TagTypeID = dbRdr.ToInt32("tag_type_id");
                            otaCmd.TagTypeName = dbRdr.ToString("tag_type_desc");
                            otaCmd.CommandString = dbRdr.ToString("cmd_str");
                            otaCmd.CommandName = dbRdr.ToString("cmd_name");
                            otaCmd.ParamCount = dbRdr.ToInt32("param_count");
                            otaCmd.Notes = dbRdr.ToString("param_notes");

                            arrOtaCmds.Add(otaCmd);
                        }
                    }

                    // close data reader
                    if (dbRdr != null)
                        dbRdr.Close();
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "GetOTACommands");
                // close data reader
                if (dbRdr != null) dbRdr.Close();
            }

            // close database connection
            dbMgr.Close();

            return arrOtaCmds;
        }

        /// <summary>
        /// check OTA reply
        /// </summary>
        /// <param name="dtOTASent"></param>
        /// <param name="udtAsset"></param>
        /// <returns></returns>
        public string CheckOTAReply(DateTime dtOTASent, string assetName)
        {
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            string reply = "";
            
            try
            {
                if (dbMgr.Open())
                {
                    // check OTA reply using date and asset name
                    var objMessage = dbMgr.ExecuteScalar("SELECT TOP (1) message FROM messages WHERE sender = @AssetName " +
                        "AND recipients = @Recipients AND timestamp > @Timestamp ORDER BY timestamp ASC",
                        new object[] { assetName, "FIND", dtOTASent });

                    if (objMessage != null)
                        reply = objMessage.ToString();
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "CheckOTAReply");
            }

            dbMgr.Close();

            return reply;
        }

        /// <summary>
        /// gets server's system time
        /// </summary>
        /// <returns></returns>
        public DateTime GetServerTime()
        {
            // return server time
            return DateTime.Now.ToUniversalTime();
        }

        /// <summary>
        /// gets app settings key
        /// </summary>
        /// <param name="strKey"></param>
        public string GetAppKey(string strKey)
        {
            // check config
            switch (strKey)
            {
            case "BingKey":
            case "GoogleKey":
            case "GoogleClientID":
            case "GoogleBusinessKey":
            case "OneMapKey":
            case "YahooMapKey":
            case "MapPath":
            case "HelpFile":
            case "AdminEmail": return ConfigurationManager.AppSettings[strKey];
            }
            return "";
        }

        /// <summary>
        /// gets all api keys
        /// </summary>
        /// <returns></returns>
        public Dictionary<string, string> GetApiKeys()
        {
            Dictionary<string, string> arrKeys = new Dictionary<string, string>();
            try
            {
                // list all api keys
                arrKeys.Add("GoogleKey", ConfigurationManager.AppSettings["GoogleKey"]);
                arrKeys.Add("GoogleClientID", ConfigurationManager.AppSettings["GoogleClientID"]);
                arrKeys.Add("GoogleBusinessKey", ConfigurationManager.AppSettings["GoogleBusinessKey"]);
                arrKeys.Add("BingKey", ConfigurationManager.AppSettings["BingKey"]);
                arrKeys.Add("OneMapKey", ConfigurationManager.AppSettings["OneMapKey"]);
                arrKeys.Add("YahooMapKey", ConfigurationManager.AppSettings["YahooMapKey"]);
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "GetApiKeys");
            }
            return arrKeys;
        }

        /// <summary>
        /// gets all features
        /// </summary>
        /// <returns></returns>
        public List<FeatureInfo> GetFeatures()
        {
            List<FeatureInfo> arrFeatures = new List<FeatureInfo>();
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            DbDataReader dbRdr = null;
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // get features
                    dbRdr = dbMgr.ExecuteReader("SELECT * FROM features ORDER BY feature_id");
                    if ((dbRdr != null) && dbRdr.HasRows)
                    {
                        // loop through records
                        while (dbRdr.Read())
                        {
                            // add feature to list
                            FeatureInfo udtFeature = new FeatureInfo();
                            udtFeature.FeatureID = dbRdr.ToInt32("feature_id");
                            udtFeature.Name = dbRdr.ToString("name");
                            udtFeature.RoleID = dbRdr.ToInt32("role_id");
                            udtFeature.Tag = dbRdr.ToString("tag");
                            udtFeature.Image = String.Format("{0}/images/theme_{1}/resources/{2}.png",
                                ConfigurationManager.AppSettings["WebPath"], 
                                ConfigurationManager.AppSettings["UITheme"], udtFeature.Tag);
                            arrFeatures.Add(udtFeature);
                        }
                    }
                    if (dbRdr != null) dbRdr.Close();
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "GetFeatures");
            }

            // close database
            if (dbRdr != null) dbRdr.Close();
            dbMgr.Close();
            return arrFeatures;
        }

        /// <summary>
        /// gets all companies
        /// </summary>
        /// <returns></returns>
        public List<CompanyInfo> GetCompanies(int iUserID)
        {
            List<CompanyInfo> arrCompanies = new List<CompanyInfo>();
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            DbDataReader dbRdr = null;
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // get default image
                    object objTemp = dbMgr.ExecuteScalar("SELECT tag FROM features WHERE name = 'Companies'");
                    string strImage = (objTemp != null ? String.Format("{0}/images/resources/{1}.png",
                        ConfigurationManager.AppSettings["ServerPath"], objTemp) : "images/edit.png");

                    // initialize query
                    string strSql = "SELECT * FROM companies";
                    if (GetUserRole(ref dbMgr, iUserID) > 0)
                        strSql += String.Format(" WHERE company_id = (SELECT company_id FROM users WHERE user_id = {0})", iUserID);

                    // get companies
                    dbRdr = dbMgr.ExecuteReader(strSql + " ORDER BY name");
                    if ((dbRdr != null) && dbRdr.HasRows)
                    {
                        // loop through companies
                        while (dbRdr.Read())
                        {
                            if (dbRdr.ToInt32("flag") == 1)//show only active companies
                            {
                                arrCompanies.Add(BuildCompany(dbRdr, strImage));
                            }
                        }
                    }
                    if (dbRdr != null) dbRdr.Close();
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "GetCompanies");
            }

            // close database
            if (dbRdr != null) dbRdr.Close();
            dbMgr.Close();
            return arrCompanies;
        }

        /// <summary>
        /// gets all companies
        /// </summary>
        /// <returns></returns>
        public List<CompanyInfo> GetAllCompanies(int iUserID)
        {
            List<CompanyInfo> arrCompanies = new List<CompanyInfo>();
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            DbDataReader dbRdr = null;
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // get default image
                    object objTemp = dbMgr.ExecuteScalar("SELECT tag FROM features WHERE name = 'Companies'");
                    string strImage = (objTemp != null ? String.Format("{0}/images/resources/{1}.png",
                        ConfigurationManager.AppSettings["ServerPath"], objTemp) : "images/edit.png");

                    // initialize query
                    string strSql = "SELECT * FROM companies";
                    if (GetUserRole(ref dbMgr, iUserID) > 0)
                        strSql += String.Format(" WHERE company_id = (SELECT company_id FROM users WHERE user_id = {0})", iUserID);

                    // get companies
                    dbRdr = dbMgr.ExecuteReader(strSql + " ORDER BY name");
                    if ((dbRdr != null) && dbRdr.HasRows)
                    {
                        // loop through companies
                        while (dbRdr.Read())
                        {
                            arrCompanies.Add(BuildCompany(dbRdr, strImage));
                        }
                    }
                    if (dbRdr != null) dbRdr.Close();
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "GetAllCompanies");
            }

            // close database
            if (dbRdr != null) dbRdr.Close();
            dbMgr.Close();
            return arrCompanies;
        }

        /// <summary>
        /// gets user role of user
        /// </summary>
        /// <param name="dbMgr"></param>
        /// <param name="iUserID"></param>
        /// <returns></returns>
        private int GetUserRole(ref DatabaseMgrMySQL dbMgr, int iUserID)
        {
            int iRoleID = 3;
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // check user role
                    object objTemp = dbMgr.ExecuteScalar(String.Format("SELECT role_id FROM users WHERE user_id = {0}", iUserID));
                    if (objTemp != null) iRoleID = Convert.ToInt32(objTemp);
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "GetUserRole");
            }
            return iRoleID;
        }

        /// <summary>
        /// builds company info from database record
        /// </summary>
        /// <param name="dbRdr"></param>
        /// <returns></returns>
        private CompanyInfo BuildCompany(DbDataReader dbRdr, string strImage)
        {
            CompanyInfo udtCompany = new CompanyInfo();
            try
            {
                // set company parameters
                
                udtCompany.CompanyID = dbRdr.ToInt32("company_id");
                udtCompany.Name = dbRdr.ToString("name");
                udtCompany.UserLimit = dbRdr.ToInt32("user_limit");
                udtCompany.ZoneLimit = dbRdr.ToInt32("zone_limit");
                udtCompany.AssetLimit = dbRdr.ToInt32("asset_limit");
                udtCompany.SmsLimit = dbRdr.ToInt32("sms_limit");
                udtCompany.Reports = dbRdr.ToString("reports");
                udtCompany.Categories = dbRdr.ToString("categories");
                udtCompany.Flag = dbRdr.ToInt32("flag");

                // set company image
                string strFill = "";
                udtCompany.Image = GetImage(String.Format("companies/{0}", udtCompany.CompanyID), strImage, ref strFill);
                udtCompany.ImageFill = strFill;
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "BuildCompany");
            }
            return udtCompany;
        }

        /// <summary>
        /// updates company information
        /// </summary>
        /// <param name="udtCompany"></param>
        /// <returns></returns>
        public string SaveCompany(CompanyInfo udtCompany)
        {
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            string strRet = "";
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // check company name
                    if (dbMgr.Exists("SELECT TOP(1) company_id FROM companies WHERE name = @Name AND company_id <> @CompanyID",
                        new object[] { udtCompany.Name, udtCompany.CompanyID }))
                    {
                        // prompt user to select different company name
                        dbMgr.Close();
                        return "Company name is already in database. Please input a different company name.";
                    }

                    // check if new company
                    if (udtCompany.CompanyID == 0)
                    {
                        // add new company
                        dbMgr.ExecuteNonQuery("INSERT INTO companies (name, user_limit, zone_limit, asset_limit, sms_limit, reports, " +
                            "categories, flag) VALUES (@Name, @UserLimit, @ZoneLimit, @AssetLimit, @SmsLimit, @Reports, @Categories, @Flag)", 
                            new object[] { udtCompany.Name, udtCompany.UserLimit, udtCompany.ZoneLimit, udtCompany.AssetLimit, 
                            udtCompany.SmsLimit, udtCompany.Reports, udtCompany.Categories, udtCompany.Flag });
                    }
                    else
                    {
                        // update company info
                        dbMgr.ExecuteNonQuery("UPDATE companies SET name = @Name, user_limit = @UserLimit, zone_limit = @ZoneLimit, " +
                            "asset_limit = @AssetLimit, sms_limit = @SmsLimit, reports = @Reports, categories = @Categories, flag = @Flag " +
                            "WHERE company_id = @CompanyID",  new object[] { udtCompany.Name, udtCompany.UserLimit, udtCompany.ZoneLimit, 
                            udtCompany.AssetLimit, udtCompany.SmsLimit, udtCompany.Reports, udtCompany.Categories, udtCompany.Flag, 
                            udtCompany.CompanyID });
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                strRet = DatabaseMgrMySQL.LogError(ex.Message, "SaveCompany");
            }

            // close database
            dbMgr.Close();
            return strRet;
        }

        /// <summary>
        /// deletes company record
        /// </summary>
        /// <param name="iCompanyID"></param>
        /// <returns></returns>
        public string DeleteCompany(int iCompanyID)
        {
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            string strRet = "";
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // delete company from database
                    string strFilter = String.Format(" WHERE company_id = {0}", iCompanyID);
                    dbMgr.ExecuteNonQuery("UPDATE users SET company_id = 0" + strFilter);
                    dbMgr.ExecuteNonQuery("UPDATE zones SET company_id = 0" + strFilter);
                    dbMgr.ExecuteNonQuery("UPDATE assets SET company_id = 0" + strFilter);
                    dbMgr.ExecuteNonQuery("DELETE FROM companies" + strFilter);
                }
            }
            catch (Exception ex)
            {
                // log error
                strRet = DatabaseMgrMySQL.LogError(ex.Message, "DeleteCompany");
            }

            // close database
            dbMgr.Close();
            return strRet;
        }

        /// <summary>
        /// gets all users
        /// </summary>
        /// <returns></returns>
        public List<UserInfo> GetUsers(int iUserID)
        {
            List<UserInfo> arrUsers = new List<UserInfo>();
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            DbDataReader dbRdr = null;
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // get default image
                    object objTemp = dbMgr.ExecuteScalar("SELECT tag FROM features WHERE name = 'Users'");
                    string strImage = (objTemp != null ? String.Format("{0}/images/resources/{1}.png",
                        ConfigurationManager.AppSettings["ServerPath"], objTemp) : "images/edit.png");

                    // initialize sql query
                    string strSql = "SELECT users.*, roles.role_desc, companies.name AS company, " +
                        "languages.name AS language, languages.culture " +
                        "FROM users LEFT JOIN roles ON users.role_id = roles.role_id " +
                        "LEFT JOIN companies ON users.company_id = companies.company_id " +
                        "LEFT JOIN languages ON users.language_id = languages.language_id";
                    if (GetUserRole(ref dbMgr, iUserID) > 0) 
                        strSql += String.Format(" WHERE users.company_id = (SELECT company_id FROM users WHERE user_id = {0})", iUserID);

                    // get users
                    dbRdr = dbMgr.ExecuteReader(strSql + " ORDER BY users.name");
                    if ((dbRdr != null) && dbRdr.HasRows)
                    {
                        // list users
                        while (dbRdr.Read())
                            arrUsers.Add(BuildUser(dbRdr, strImage));
                    }
                    if (dbRdr != null) dbRdr.Close();
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "GetUsers");
            }

            // close database
            dbMgr.Close();
            return arrUsers;
        }

        /// <summary>
        /// builds user info from database record
        /// </summary>
        /// <param name="dbRdr"></param>
        /// <returns></returns>
        private UserInfo BuildUser(DbDataReader dbRdr, string strImage)
        {
            UserInfo udtUser = new UserInfo();
            try
            {
                // set users parameters
                udtUser.UserID = dbRdr.ToInt32("user_id");
                udtUser.Name = dbRdr.ToString("name");
                udtUser.User = dbRdr.ToString("user_name");
                udtUser.Password = dbRdr.ToString("password");
                udtUser.RoleID = dbRdr.ToInt32("role_id");
                udtUser.Role = dbRdr.ToString("role_desc");
                udtUser.Phone = dbRdr.ToString("phone");
                udtUser.Email = dbRdr.ToString("email");
                udtUser.CompanyID = dbRdr.ToInt32("company_id");
                udtUser.Company = dbRdr.ToString("company");
                udtUser.Assets = dbRdr.ToString("assets");
                udtUser.Notifications = dbRdr.ToString("notifications");
                udtUser.Status = (dbRdr.ToInt32("login_retry") > 0 ? "Active" : "Locked");
                udtUser.Reports = dbRdr.ToString("reports");
                udtUser.LanguageID = dbRdr.ToInt32("language_id");
                udtUser.Language = dbRdr.ToString("language");
                udtUser.Culture = dbRdr.ToString("culture");
                udtUser.ApiKey = dbRdr.ToString("api_key");

                // get user image
                string strFill = "";
                udtUser.Image = GetImage(String.Format("users/{0}", udtUser.UserID), strImage, ref strFill);
                udtUser.ImageFill = strFill;
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "BuildUser");
            }
            return udtUser;
        }

        /// <summary>
        /// gets image file
        /// </summary>
        /// <param name="strName"></param>
        /// <param name="strDefault"></param>
        /// <param name="strFill"></param>
        /// <returns></returns>
        private string GetImage(string strName, string strDefault, ref string strFill)
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
                DatabaseMgrMySQL.LogError(ex.Message, "GetImage");
            }

            // image file not found
            strFill = "None";
            return strDefault;
        }

        /// <summary>
        /// deletes image file
        /// </summary>
        /// <param name="strName"></param>
        private void DeleteImage(string strName)
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
                DatabaseMgrMySQL.LogError(ex.Message, "DeleteImage");
            }
        }

        /// <summary>
        /// updates user info
        /// </summary>
        /// <param name="udtUser"></param>
        /// <returns></returns>
        public string SaveUser(UserInfo udtUser)
        {
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            string strRet = "";
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // check user name
                    if (dbMgr.Exists("SELECT TOP(1) user_id FROM users WHERE name = @Name " +
                        "AND user_id <> @UserID", new object[] { udtUser.Name, udtUser.UserID }))
                    {
                        // prompt user to select different name
                        dbMgr.Close();
                        return "User's name is already in database. Please input a different name.";
                    }

                    // check log in name
                    if (dbMgr.Exists("SELECT TOP(1) user_id FROM users WHERE user_name = @User " +
                        "AND user_id <> @UserID", new object[] { udtUser.Name, udtUser.UserID }))
                    {
                        // prompt user to select different name
                        dbMgr.Close();
                        return "User log in name is already in use. Please input another user name for log in.";
                    }

                    // check if new user
                    int iCompanyID = GetCompanyID(ref dbMgr, udtUser.Company);
                    if (udtUser.UserID == 0)
                    {
                        // check license limit
                        object objTemp = dbMgr.ExecuteScalar(String.Format("SELECT user_limit FROM companies WHERE company_id = {0}", iCompanyID));
                        int iLimit = (objTemp != null ? Convert.ToInt32(objTemp) : 0);
                        if ((iLimit > 0) && (dbMgr.Count(String.Format("SELECT COUNT(user_id) FROM users WHERE company_id = {0}", iCompanyID)) > iLimit))
                        {
                            // prompt user to upgrade license
                            dbMgr.Close();
                            return "User count is at maximum limit. Please contact software provider for license upgrade.";
                        }

                        // add new user
                        udtUser.Name = udtUser.Name.ToTitleCase();
                        dbMgr.ExecuteNonQuery("INSERT INTO users (name, user_name, password, role_id, phone, email, company_id, assets, " +
                            "notifications, login_retry, reports, language_id) VALUES (@Name, @User, @Password, @RoleID, @Phone, @Email, " +
                            "@CompanyID, @Assets, @Notifications, @LogInRetry, @Reports, @LanguageID)", new object[] { udtUser.Name, 
                            udtUser.User, FormsAuthentication.HashPasswordForStoringInConfigFile(udtUser.Password, "MD5"), udtUser.RoleID, 
                            udtUser.Phone, udtUser.Email, iCompanyID, udtUser.Assets, udtUser.Notifications, 
                            Convert.ToInt32(ConfigurationManager.AppSettings["LogInRetry"]), udtUser.Reports, udtUser.LanguageID });
                    }
                    else
                    {
                        // encrypt password if changed
                        object objTemp = dbMgr.ExecuteScalar(String.Format("SELECT password FROM users WHERE user_id = {0}", udtUser.UserID));
                        if ((objTemp != null) && (udtUser.Password != objTemp.ToString()))
                            udtUser.Password = FormsAuthentication.HashPasswordForStoringInConfigFile(udtUser.Password, "MD5");

                        // update user
                        dbMgr.ExecuteNonQuery("UPDATE users SET name = @Name, user_name = @User, password = @Password, role_id = @RoleID, " +
                            "phone = @Phone, email = @Email, company_id = @CompanyID, assets = @Assets, notifications = @Notifications, " +
                            "reports = @Reports, language_id = @LanguageID WHERE user_id = @UserID", new object[] { udtUser.Name, udtUser.User, 
                            udtUser.Password, udtUser.RoleID, udtUser.Phone, udtUser.Email, iCompanyID, udtUser.Assets, udtUser.Notifications, 
                            udtUser.Reports, udtUser.LanguageID, udtUser.UserID });
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                strRet = DatabaseMgrMySQL.LogError(ex.Message, "SaveUser");
            }

            // close database
            dbMgr.Close();
            return strRet;
        }

        /// <summary>
        /// gets company id
        /// </summary>
        /// <param name="strCompany"></param>
        /// <returns></returns>
        private int GetCompanyID(ref DatabaseMgrMySQL dbMgr, string strCompany)
        {
            int iCompanyID = 0;
            try
            {
                // check company name
                if ((strCompany == null) || (strCompany == ""))
                    return 0;

                // open database
                if (dbMgr.Open())
                {
                    // get company id
                    object objTemp = dbMgr.ExecuteScalar("SELECT company_id FROM companies WHERE name = @Company",
                        new object[] { strCompany });
                    if (objTemp != null) iCompanyID = Convert.ToInt32(objTemp);
                    else
                    {
                        // save new company
                        objTemp = dbMgr.ExecuteScalar("INSERT INTO companies (name, user_limit, zone_limit, asset_limit, sms_limit, reports) " +
                            "OUTPUT INSERTED.company_id VALUES (@Company, 0, 0, 0, 0, '')", new object[] { strCompany });
                        if (objTemp != null) iCompanyID = Convert.ToInt32(objTemp);
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "GetCompanyID");
            }
            return iCompanyID;
        }

        /// <summary>
        /// deletes user record
        /// </summary>
        /// <param name="iUserID"></param>
        /// <returns></returns>
        public string DeleteUser(int iUserID)
        {
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            string strRet = "";
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // delete user
                    dbMgr.ExecuteNonQuery(String.Format("DELETE FROM users WHERE user_id = {0}", iUserID));
                    DeleteImage(String.Format("users/{0}", iUserID));
                }
            }
            catch (Exception ex)
            {
                // log error
                strRet = DatabaseMgrMySQL.LogError(ex.Message, "DeleteUser");
            }

            // close database
            dbMgr.Close();
            return strRet;
        }

        /// <summary>
        /// logs the user out
        /// </summary>
        /// <param name="strUser"></param>
        /// <param name="strPassword"></param>
        /// <param name="dtLogin"></param>
        /// <param name="dtLogout"></param>
        public void LogOutUser(string strUser, string strPassword, DateTime dtLogin, DateTime dtLogout)
        {
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            EventInfo udtEvent = new EventInfo();
            string username = "";

            try
            {
                object temp = dbMgr.ExecuteScalar("SELECT user_name FROM users WHERE user_id = @UserID",
                    new object[] { Convert.ToInt32(strUser) });

                if (temp != null)
                    username = temp.ToString();
            }
            catch { }

            if (dbMgr != null) dbMgr.Close();
            
            udtEvent.Event = "User Activity Duration";
            udtEvent.Timestamp = DateTime.Now.ToUniversalTime();
            udtEvent.RxTime = udtEvent.Timestamp;

            // format: [user activity duration]|[ip address]|[username]
            udtEvent.Remarks = String.Format("{0:g}|{1}|{2}", (dtLogout - dtLogin),
                HttpContext.Current.Request.UserHostAddress, username);

            // save event
            SaveEvent(udtEvent);
            
            // save logout event
            LogInUser(strUser, strPassword);

            return;
        }

        /// <summary>
        /// gets user account details after successful login
        /// </summary>
        /// <param name="Key"></param>
        /// <returns></returns>
        public UserInfo GetUser(string Key)
        {
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            UserInfo udtUser = null;
            try
            {
                // get user account
                udtUser = GetUser(ref dbMgr, Key);
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "GetUser");
            }

            // close database
            dbMgr.Close();
            return udtUser;
        }

        /// <summary>
        /// gets user account associated to api key
        /// </summary>
        /// <param name="dbMgr"></param>
        /// <param name="strKey"></param>
        /// <returns></returns>
        private UserInfo GetUser(ref DatabaseMgrMySQL dbMgr, string strKey)
        {
            DbDataReader dbRdr = null;
            UserInfo udtUser = null;
            try
            {
                // check api key
                if ((strKey != null) && (strKey.Trim() != ""))
                {
                    // open database
                    if (dbMgr.Open())
                    {
                        // check user credentials
                        dbRdr = dbMgr.ExecuteReader("SELECT * FROM view_users WHERE api_key = @ApiKey",
                            new object[] { strKey.Trim() });
                        if ((dbRdr != null) && dbRdr.HasRows && dbRdr.Read())
                            udtUser = BuildUser(dbRdr, "");
                        if (dbRdr != null) dbRdr.Close();

                        // no user found with given key
                        if (udtUser == null)
                            DatabaseMgrMySQL.LogError(String.Format("No user found with API key = {0}.", strKey), "GetUser*");
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "GetUser*");
            }

            // close database
            if (dbRdr != null) dbRdr.Close();
            return udtUser;
        }

        /// <summary>
        /// checks user login credentials if valid
        /// </summary>
        /// <param name="User"></param>
        /// <param name="Password"></param>
        /// <returns></returns>
        public string LogInUser(string User, string Password)
        {
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            DbDataReader dbRdr = null;
            UserInfo udtUser = null;
            string strError = "";
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // extract client ip from username if any
                    string[] arrTemp = User.Split("\r".ToCharArray());
                    User = arrTemp[0];
                    string strClientIP = (arrTemp.Length > 1 ? arrTemp[1] : "");

                    // check client ip
                    if (strClientIP == "")
                    {
                        // get client ip
                        strClientIP = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
                        if (String.IsNullOrEmpty(strClientIP)) strClientIP = HttpContext.Current.Request.UserHostAddress;
                    }

                    // initialize event
                    bool bLogIn = ((Password != "LOG_OUT") && (Password != "CLOSE"));
                    EventInfo udtEvent = new EventInfo();
                    udtEvent.Event = (bLogIn ? "User Login" : "User Logout");
                    udtEvent.Timestamp = DateTime.UtcNow;
                    udtEvent.RxTime = udtEvent.Timestamp;

                    // check if logging in
                    if (bLogIn)
                    {
                        int iCompanyID = 0;
                        int iUserID = 1;
                        int iLogInRetry = 0;

                        // check user credentials
                        Password = FormsAuthentication.HashPasswordForStoringInConfigFile(Password, "MD5");
                        dbRdr = dbMgr.ExecuteReader("SELECT * FROM users WHERE user_name = @Username AND password = @Password",
                            new object[] { User, Password });
                        if ((dbRdr != null) && dbRdr.HasRows && dbRdr.Read())
                        {
                            // set user's parameters
                            udtUser = new UserInfo();
                            udtUser.UserID = dbRdr.ToInt32("user_id");
                            udtUser.ApiKey = dbRdr.ToString("api_key");
                            iCompanyID = dbRdr.ToInt32("company_id");
                            iLogInRetry = dbRdr.ToInt32("login_retry");
                            iUserID = udtUser.UserID;
                        }
                        if (dbRdr != null) dbRdr.Close();

                        // check if failed login
                        if (udtUser == null)
                        {
                            // check user credentials
                            dbRdr = dbMgr.ExecuteReader("SELECT * FROM users WHERE user_name = @Username", new object[] { User });
                            if ((dbRdr != null) && dbRdr.HasRows && dbRdr.Read())
                            {
                                // set user's parameters
                                udtUser = new UserInfo();
                                udtUser.UserID = dbRdr.ToInt32("user_id");
                                udtUser.Name = dbRdr.ToString("name");
                                udtUser.Password = dbRdr.ToString("password");
                                udtUser.Email = dbRdr.ToString("email");
                                iCompanyID = dbRdr.ToInt32("company_id");
                                iLogInRetry = dbRdr.ToInt32("login_retry");
                                iUserID = udtUser.UserID;
                            }
                            if (dbRdr != null) dbRdr.Close();

                            // check if invalid user name
                            if (udtUser == null) strError = " - Invalid Username";
                            else
                            {
                                // check if incorrect password
                                if (Password != udtUser.Password)
                                    strError = " - Incorrect Password";

                                // check retry count
                                if (iLogInRetry > 0)
                                {
                                    // decrement login retry
                                    dbMgr.ExecuteNonQuery("UPDATE users SET login_retry = @LogInRetry WHERE user_id = @UserID",
                                        new object[] { --iLogInRetry, udtUser.UserID });

                                    // suspend account if retry reaches zero
                                    if (iLogInRetry == 0)
                                    {
                                        // check email address
                                        if (udtUser.Email != "")
                                        {
                                            // inform user of suspension
                                            string strEmailNotify = ConfigurationManager.AppSettings["AdminEmail"];
                                            string[] arrEmail = udtUser.Email.Split(",".ToCharArray());
                                            MessageInfo udtMessage = new MessageInfo();
                                            udtMessage.Sender = "FIND";
                                            udtMessage.Message = String.Format("ACCOUNT SUSPENDED\rYour user account ({0}) has been suspended due to multiple " +
                                                "failed login attempts. Please contact your company administrator to reactivate your account.", User);
                                            udtMessage.Timestamp = DateTime.UtcNow;
                                            udtMessage.StatusID = 1;
                                            udtMessage.CompanyID = iCompanyID;
                                            udtMessage.Recipients = arrEmail[0];
                                            SaveMessage(ref dbMgr, udtMessage);
                                        }
                                    }
                                }

                                // check account if locked out
                                if (iLogInRetry == 0) strError = " - Account Suspended.";
                                udtUser = null;
                            }
                        }
                        else
                        {
                            // check account if locked out
                            if (iLogInRetry == 0)
                            {
                                // prevent logging in
                                udtUser = null;
                                strError = " - Account Suspended.";
                            }
                            else
                            {
                                // reset login retry
                                dbMgr.ExecuteNonQuery("UPDATE users SET login_retry = @LogInRetry WHERE user_id = @UserID",
                                    new object[] { Convert.ToInt32(ConfigurationManager.AppSettings["LogInRetry"]), udtUser.UserID });

                                // check api key
                                if (String.IsNullOrEmpty(udtUser.ApiKey))
                                {
                                    // reset api key
                                    udtUser.ApiKey = CreateGuid(false);
                                    dbMgr.ExecuteNonQuery("UPDATE users SET api_key = @ApiKey WHERE user_id = @UserID",
                                        new object[] { udtUser.ApiKey, udtUser.UserID });
                                }

                                // cancel last log out
                                List<object> arrParams = new List<object>();
                                arrParams.Add("User Logout");
                                arrParams.Add(String.Format("Success ({0})", User));
                                arrParams.Add(0);
                                string strFilter = "WHERE status_id = (SELECT TOP 1 status_id FROM status " +
                                    "WHERE status_desc = @Event) AND remarks = @Remarks AND flag <> @Flag";
                                if (dbMgr.Exists(String.Format("SELECT TOP 1 event_id FROM events {0}", strFilter), arrParams.ToArray()))
                                    dbMgr.ExecuteNonQuery(String.Format("UPDATE events SET flag = 0 {0}", strFilter), arrParams.ToArray());
                            }
                        }

                        // save login event
                        udtEvent.Remarks = String.Format("{0}{1}", (udtUser != null ? "Success" : "Failed"), strError);
                        if (strError.Contains("Invalid Username")) udtEvent.Remarks += String.Format(": {0}", User);
                        if (strClientIP != "") udtEvent.Remarks += String.Format(" ({0})", strClientIP);
                        udtEvent.CompanyID = iCompanyID;
                        udtEvent.AckUserID = iUserID;
                        SaveEvent(ref dbMgr, udtEvent, true, true);
                    }
                    else
                    {
                        // get user info
                        dbRdr = dbMgr.ExecuteReader("SELECT * FROM users WHERE api_key = @ApiKey", new object[] { User });
                        if ((dbRdr != null) && dbRdr.HasRows && dbRdr.Read())
                        {
                            // set user's parameters
                            udtUser = new UserInfo();
                            udtUser.UserID = dbRdr.ToInt32("user_id");
                            udtUser.User = dbRdr.ToString("user_name");
                            udtUser.CompanyID = dbRdr.ToInt32("company_id");
                        }
                        if (dbRdr != null) dbRdr.Close();

                        // check user info
                        if (udtUser != null)
                        {
                            // check if not system admin
                            if ((udtUser.UserID != 1) && (Password == "LOG_OUT"))
                            {
                                // regenerate api key
                                dbMgr.ExecuteNonQuery("UPDATE users SET api_key = @ApiKey WHERE user_id = @UserID",
                                    new object[] { CreateGuid(false), udtUser.UserID });
                            }

                            // save log out event
                            udtEvent.Remarks = String.Format("Success ({0})", udtUser.User);
                            udtEvent.Flag = 1;
                            udtEvent.CompanyID = udtUser.CompanyID;
                            udtEvent.AckUserID = udtUser.UserID;
                            SaveEvent(ref dbMgr, udtEvent, true, true);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "LogInUser");
            }

            // close database
            if (dbRdr != null) dbRdr.Close();
            dbMgr.Close();
            return (udtUser != null ? udtUser.ApiKey : String.Format("LOGIN ERROR{0}", strError));
        }

        /// <summary> 
        /// creates unique id for api usage
        /// </summary> 
        /// <returns></returns> 
        private string CreateGuid(bool bPassword)
        {
            // create guid
            Guid guid = Guid.Empty;
            while (Guid.Empty == guid) guid = Guid.NewGuid();

            // shorten guid
            string strKey = Convert.ToBase64String(guid.ToByteArray());
            strKey = strKey.TrimEnd("=".ToCharArray());

            // check if password
            if (bPassword)
            {
                // replace confusing characters
                strKey = strKey.Substring(0, 9).ToTitleCase();
                strKey = strKey.Replace("I", "L");
                strKey = strKey.Replace("l", "i");
                strKey = strKey.Replace("1", "2");
                strKey += new Random().Next(999).ToString();
            }
            return strKey;
        }

        /// <summary>
        /// resets user forgotten password
        /// </summary>
        /// <param name="User"></param>
        /// <param name="Email"></param>
        /// <returns></returns>
        public Response ResetPassword(string User, string Email)
        {
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            DbDataReader dbRdr = null;
            UserInfo udtUser = null;
            ErrorCode retCode = ErrorCode.OK;
            try
            {
                // check required parameters
                if ((User == null) || (User.Trim() == "")) retCode = ErrorCode.MISSING_PARAM;
                else if ((Email == null) || (Email.Trim() == "")) retCode = ErrorCode.MISSING_PARAM;
                else
                {
                    // open database
                    if (dbMgr.Open())
                    {
                        // get user info
                        dbRdr = dbMgr.ExecuteReader("SELECT TOP 1 * FROM view_users WHERE user_name = @Username",
                            new object[] { User });
                        if ((dbRdr != null) && dbRdr.HasRows && dbRdr.Read())
                            udtUser = BuildUser(dbRdr, "");
                        if (dbRdr != null) dbRdr.Close();

                        // check user                    
                        if (udtUser == null) retCode = ErrorCode.ACCESS_DENIED;
                        else if (udtUser.Status != "Active") retCode = ErrorCode.ACCESS_DENIED;
                        else
                        {
                            // check contact info
                            User = udtUser.Name;
                            if ((udtUser.Phone == "") && (udtUser.Email == ""))
                                retCode = ErrorCode.INVALID_PARAM;
                            else
                            {
                                // check email address
                                if (!udtUser.Email.Contains(Email))
                                    retCode = ErrorCode.INVALID_PARAM;
                                else
                                {
                                    // generate new password
                                    string strPassword = CreateGuid(true);
                                    string strEncrypted = FormsAuthentication.HashPasswordForStoringInConfigFile(strPassword, "MD5");
                                    dbMgr.ExecuteNonQuery("UPDATE users SET password = @Password WHERE user_id = @UserID",
                                        new object[] { strEncrypted, udtUser.UserID });

                                    // log event
                                    LogSettings(ref dbMgr, String.Format("User password reset ({0})", User), udtUser, 0, 0);

                                    // send login details to user
                                    udtUser.Password = strPassword;
                                    MessageInfo udtMessage = new MessageInfo();
                                    udtMessage.Sender = "FIND";
                                    udtMessage.Message = String.Format("PASSWORD RESET\rYour new password is: {0}.", strPassword);
                                    udtMessage.Timestamp = DateTime.Now.ToUniversalTime();
                                    udtMessage.StatusID = 1;
                                    udtMessage.CompanyID = udtUser.CompanyID;
                                    udtMessage.AssetID = 0;
                                    udtMessage.Recipients = Email;
                                    SaveMessage(ref dbMgr, udtMessage);
                                }
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "ResetPassword");
                retCode = ErrorCode.OPERATION_FAILED;
            }

            // close database
            if (dbRdr != null) dbRdr.Close();
            dbMgr.Close();
            return retCode.FormatResponse();
        }

        /// <summary>
        /// saves settings update event
        /// </summary>
        /// <param name="dbMgr"></param>
        /// <param name="strRemarks"></param>
        /// <param name="udtUser"></param>
        /// <param name="iAssetID"></param>
        /// <param name="iTagID"></param>
        /// <returns></returns>
        private long LogSettings(ref DatabaseMgrMySQL dbMgr, string strRemarks, UserInfo udtUser, int iAssetID, int iTagID)
        {
            long iRet = (long)ErrorCode.OK;
            try
            {
                // save event
                EventInfo udtEvent = new EventInfo();
                udtEvent.Event = "Settings Update";
                udtEvent.Remarks = strRemarks;
                udtEvent.Timestamp = DateTime.UtcNow;
                udtEvent.RxTime = udtEvent.Timestamp;
                udtEvent.CompanyID = (udtUser != null ? udtUser.CompanyID : 0);
                udtEvent.AckUserID = (udtUser != null ? udtUser.UserID : 1);
                udtEvent.AssetID = iAssetID;
                udtEvent.TagID = iTagID;
                SaveEvent(ref dbMgr, udtEvent, true, true);
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "LogSettings");
                iRet = (long)ErrorCode.OPERATION_FAILED;
            }
            return iRet;
        }

        /// <summary>
        /// unlocks user account
        /// </summary>
        /// <param name="iUserID"></param>
        /// <returns></returns>
        public string UnlockUser(int iUserID)
        {
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            string strRet = "";
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // reset login retry
                    dbMgr.ExecuteNonQuery("UPDATE users SET login_retry = @LogInRetry WHERE user_id = @UserID",
                        new object[] { Convert.ToInt32(ConfigurationManager.AppSettings["LogInRetry"]), iUserID });
                }
            }
            catch (Exception ex)
            {
                // log error
                strRet = DatabaseMgrMySQL.LogError(ex.Message, "UnlockUser");
            }

            // close database
            dbMgr.Close();
            return strRet;
        }

        /// <summary>
        /// downloads coordinates of specified address
        /// </summary>
        /// <param name="strLocation"></param>
        /// <returns></returns>
        public string Geocode(string strLocation)
        {
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            DbDataReader dbRdr = null;
            string strRet = "";
            try
            {
                // check location
                string strLoc = strLocation.Trim();
                if (strLoc == "")
                    return strRet;

                // open database
                if (dbMgr.Open())
                {
                    // check geocode from database
                    dbRdr = dbMgr.ExecuteReader("SELECT TOP(1) lat, lon FROM locations WHERE loc = @Loc", new object[] { strLocation });
                    if ((dbRdr != null) && dbRdr.HasRows && dbRdr.Read())
                        strRet = String.Format("{0},{1}\r{2}", dbRdr.ToDouble("lat"), dbRdr.ToDouble("lon"), strLocation);
                    if (dbRdr != null) dbRdr.Close();
                    bool bNew = (strRet == "");

                    // check geocode
                    if (strRet == "")
                        strRet = Geocoder.Geocode(strLocation);

                    // check geocode
                    if (bNew && (strRet != ""))
                    {
                        // parse geocode
                        string[] arrTemp = strRet.Split("\r".ToCharArray());
                        string[] arrCoord = arrTemp[0].Split(",".ToCharArray());
                        double lLatitude = Convert.ToDouble(arrCoord[0]);
                        double lLongitude = Convert.ToDouble(arrCoord[1]);

                        // add geocode to database
                        object objTemp = dbMgr.ExecuteScalar("INSERT INTO locations (lat, lon, loc) OUTPUT INSERTED.loc_id " +
                            "VALUES (@Latitude, @Longitude, @Location)", new object[] { lLatitude, lLongitude, strLocation });
                        strRet = String.Format("{0},{1}\r{2}", lLatitude, lLongitude, strLocation);
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "Geocode");
            }

            // close database
            if (dbRdr != null) dbRdr.Close();
            dbMgr.Close();
            return strRet;
        }

        /// <summary>
        /// downloads address of specified coordinates
        /// </summary>
        /// <param name="lLatitude"></param>
        /// <param name="lLongitude"></param>
        /// <returns></returns>
        public string ReverseGeocode(double lLatitude, double lLongitude)
        {
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            string strRet = "";
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // get reverse geocode
                    strRet = ReverseGeocode(ref dbMgr, lLatitude, lLongitude, 2);
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "ReverseGeocode");
            }

            // close database
            dbMgr.Close();
            return strRet;
        }

        /// <summary>
        /// locates address of position
        /// </summary>
        /// <param name="dbMgr"></param>
        /// <param name="lLatitude"></param>
        /// <param name="lLongitude"></param>
        /// <param name="iDownload"></param>
        /// <returns></returns>
        private string ReverseGeocode(ref DatabaseMgrMySQL dbMgr, double lLatitude, double lLongitude, int iDownload)
        {
            DbDataReader dbRdr = null;
            string strRet = "";
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // check download flag (0 = database, 1 = geocoding service, 2 = both)
                    if ((iDownload == 0) || (iDownload == 2))
                    {
                        // check reverse geocode from database
                        dbRdr = dbMgr.ExecuteReader("SELECT TOP(1) loc, loc_id FROM locations WHERE lat = @Latitude AND lon = @Longitude",
                            new object[] { lLatitude, lLongitude });
                        if ((dbRdr != null) && dbRdr.HasRows && dbRdr.Read())
                            strRet = String.Format("{0}\r{1}", dbRdr.ToString("loc"), dbRdr.ToInt32("loc_id"));
                        if (dbRdr != null) dbRdr.Close();
                    }

                    // download reverse geocode
                    bool bNew = (strRet == "");
                    if (bNew && ((iDownload == 1) || (iDownload == 2)))
                        strRet = Geocoder.ReverseGeocode(lLatitude, lLongitude);

                    // check reverse geocode
                    if (bNew && (strRet != ""))
                    {
                        // add geocode to database
                        object objTemp = dbMgr.ExecuteScalar(String.Format("INSERT INTO locations (lat, lon, loc, position) " +
                            "OUTPUT INSERTED.loc_id VALUES ({0}, {1}, @Location, geography::Point({0}, {1}, 4326))",
                            lLatitude, lLongitude), new object[] { strRet });
                        strRet += String.Format("\r{0}", objTemp);
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "ReverseGeocode");
            }

            // close database
            if (dbRdr != null) dbRdr.Close();
            return strRet;
        }

        /// <summary>
        /// gets all zones
        /// </summary>
        /// <returns></returns>
        public List<ZoneInfo> GetZones(int iUserID)
        {
            List<ZoneInfo> arrZones = new List<ZoneInfo>();
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            DbDataReader dbRdr = null;
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // get default image
                    object objTemp = dbMgr.ExecuteScalar("SELECT tag FROM features WHERE name = 'Zones'");
                    string strImage = (objTemp != null ? String.Format("{0}/images/resources/{1}.png",
                        ConfigurationManager.AppSettings["ServerPath"], objTemp) : "images/edit.png");

                    // initialize sql query
                    string strSql = "SELECT * FROM view_zones";
                    if (GetUserRole(ref dbMgr, iUserID) > 0)
                        strSql += String.Format(" WHERE company_id = (SELECT company_id FROM users WHERE user_id = {0})", iUserID);
                    else strSql += " WHERE zone_id > 0";

                    // get zones
                    dbRdr = dbMgr.ExecuteReader(strSql + " ORDER BY name");
                    if ((dbRdr != null) && dbRdr.HasRows)
                    {
                        // list zones
                        while (dbRdr.Read())
                            arrZones.Add(BuildZone(dbRdr, strImage));
                    }
                    if (dbRdr != null) dbRdr.Close();
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "GetZones");
            }

            // close database
            if (dbRdr != null) dbRdr.Close();
            dbMgr.Close();
            return arrZones;
        }

        /// <summary>
        /// gets all active zones for the day
        /// </summary>
        /// <returns></returns>
        public List<ZoneInfo> GetActiveZones(int iUserID)
        {
            List<ZoneInfo> arrZones = new List<ZoneInfo>();
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            DbDataReader dbRdr = null;
            object objTemp = null;
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // get all zones if system admin
                    int iRoleID = GetUserRole(ref dbMgr, iUserID);
                    bool bGetAll = (iRoleID == 0);
                    int iCompanyID = 0;

                    // check if non-admin
                    if (iRoleID > 0)
                    {
                        // get company id
                        objTemp = dbMgr.ExecuteScalar(String.Format("SELECT company_id FROM users WHERE user_id = {0}", iUserID));
                        if (objTemp != null) iCompanyID = Convert.ToInt32(objTemp);

                        // get all zones if no record of trip or activity
                        if (!dbMgr.Exists(String.Format("SELECT TOP(1) plan_id FROM plans WHERE company_id = {0}", iCompanyID)) &&
                            !dbMgr.Exists(String.Format("SELECT TOP(1) activity_id FROM activities WHERE asset_id IN " +
                            "(SELECT asset_id FROM assets WHERE company_id = {0})", iCompanyID)))
                            bGetAll = true;
                    }

                    // check get all flag
                    if (bGetAll)
                    {
                        // get all zones
                        dbMgr.Close();
                        return GetZones(iUserID);
                    }
                    
                    // get zones for trip plans
                    List<string> arrZoneIds = new List<string>();
                    string strSql = "SELECT origin_id, destination_id FROM plans";
                    if (iRoleID > 0) strSql += String.Format(" WHERE company_id = {0}", iCompanyID);
                    dbRdr = dbMgr.ExecuteReader(strSql);
                    if ((dbRdr != null) && dbRdr.HasRows)
                    {
                        // list zones
                        while (dbRdr.Read())
                        {
                            // add origin zone to list
                            int iZoneID = dbRdr.ToInt32("origin_id");
                            if (!arrZoneIds.Contains(iZoneID.ToString()))
                                arrZoneIds.Add(iZoneID.ToString());

                            // add destination zone to list
                            iZoneID = dbRdr.ToInt32("destination_id");
                            if (!arrZoneIds.Contains(iZoneID.ToString()))
                                arrZoneIds.Add(iZoneID.ToString());
                        }
                    }
                    if (dbRdr != null) dbRdr.Close();

                    // get active zones for the day
                    DateTime dtToday = DateTime.Today.ToUniversalTime();
                    strSql = String.Format("SELECT DISTINCT zone_id FROM activities WHERE (start_time BETWEEN " +
                        "'{0:dd-MMM-yyyy HH:mm:ss}' AND '{1:dd-MMM-yyyy HH:mm:ss}')", dtToday, dtToday.AddDays(1));
                    if (iRoleID > 0)
                        strSql += String.Format(" AND asset_id IN (SELECT asset_id FROM assets WHERE company_id = {0})", iCompanyID);
                    dbRdr = dbMgr.ExecuteReader(strSql);
                    if ((dbRdr != null) && dbRdr.HasRows)
                    {
                        // list zones
                        while (dbRdr.Read())
                        {
                            // add customer zone to list
                            int iZoneID = dbRdr.ToInt32("zone_id");
                            if (!arrZoneIds.Contains(iZoneID.ToString()))
                                arrZoneIds.Add(iZoneID.ToString());
                        }
                    }
                    if (dbRdr != null) dbRdr.Close();

                    // check zones
                    if (arrZoneIds.Count > 0)
                    {
                        // get default image
                        objTemp = dbMgr.ExecuteScalar("SELECT tag FROM features WHERE name = 'Zones'");
                        string strImage = (objTemp != null ? String.Format("{0}/images/resources/{1}.png",
                            ConfigurationManager.AppSettings["ServerPath"], objTemp) : "images/edit.png");

                        // initialize sql query
                        strSql = String.Format("SELECT * FROM view_zones WHERE zone_id IN ({0})",
                            String.Join(",", arrZoneIds.ToArray()));

                        // get active zones
                        dbRdr = dbMgr.ExecuteReader(strSql + " ORDER BY name");
                        if ((dbRdr != null) && dbRdr.HasRows)
                        {
                            // list zones
                            while (dbRdr.Read())
                                arrZones.Add(BuildZone(dbRdr, strImage));
                        }
                        if (dbRdr != null) dbRdr.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "GetActiveZones");
            }

            // close database
            if (dbRdr != null) dbRdr.Close();
            dbMgr.Close();
            return arrZones;
        }

        /// <summary>
        /// gets all zones active for the day for asset
        /// </summary>
        /// <returns></returns>
        public List<ZoneInfo> GetAssetZones(int iAssetID, int iCompanyID)
        {
            List<ZoneInfo> arrZones = new List<ZoneInfo>();
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            DbDataReader dbRdr = null;
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // get company zones
                    dbRdr = dbMgr.ExecuteReader(String.Format("SELECT * FROM view_zones WHERE company_id = {0} ORDER BY name", iCompanyID));
                    if ((dbRdr != null) && dbRdr.HasRows)
                    {
                        // list zones
                        while (dbRdr.Read())
                            arrZones.Add(BuildZone(dbRdr, "images/edit.png"));
                    }
                    if (dbRdr != null) dbRdr.Close();
                    /*
                    // get all zones if no record of trip or activity
                    if (!dbMgr.Exists(String.Format("SELECT TOP(1) plan_id FROM plans WHERE company_id = {0}", iCompanyID)) &&
                        !dbMgr.Exists(String.Format("SELECT TOP(1) activity_id FROM activities WHERE asset_id = {0}", iAssetID)))
                    {
                        // get company zones
                        dbRdr = dbMgr.ExecuteReader(String.Format("SELECT * FROM view_zones WHERE company_id = {0} ORDER BY name", iCompanyID));
                        if ((dbRdr != null) && dbRdr.HasRows)
                        {
                            // list zones
                            while (dbRdr.Read())
                                arrZones.Add(BuildZone(dbRdr, "images/edit.png"));
                        }
                        if (dbRdr != null) dbRdr.Close();
                    }
                    else
                    {
                        // get zones for trip plans
                        List<string> arrZoneIds = new List<string>();
                        dbRdr = dbMgr.ExecuteReader(String.Format("SELECT origin_id, destination_id FROM plans WHERE company_id = {0}", iCompanyID));
                        if ((dbRdr != null) && dbRdr.HasRows)
                        {
                            // list zones
                            while (dbRdr.Read())
                            {
                                // add origin zone to list
                                int iZoneID = dbRdr.ToInt32("origin_id");
                                if (!arrZoneIds.Contains(iZoneID.ToString()))
                                    arrZoneIds.Add(iZoneID.ToString());

                                // add destination zone to list
                                iZoneID = dbRdr.ToInt32("destination_id");
                                if (!arrZoneIds.Contains(iZoneID.ToString()))
                                    arrZoneIds.Add(iZoneID.ToString());
                            }
                        }
                        if (dbRdr != null) dbRdr.Close();

                        // get active zones for the day
                        DateTime dtToday = DateTime.Today.ToUniversalTime();
                        dbRdr = dbMgr.ExecuteReader(String.Format("SELECT DISTINCT zone_id FROM activities " +
                            "WHERE asset_id = {0} AND (start_time BETWEEN '{1:dd-MMM-yyyy HH:mm:ss}' AND " +
                            "'{2:dd-MMM-yyyy HH:mm:ss}')", iAssetID, dtToday, dtToday.AddDays(1)));
                        if ((dbRdr != null) && dbRdr.HasRows)
                        {
                            // list zones
                            while (dbRdr.Read())
                            {
                                // add customer zone to list
                                int iZoneID = dbRdr.ToInt32("zone_id");
                                if (!arrZoneIds.Contains(iZoneID.ToString()))
                                    arrZoneIds.Add(iZoneID.ToString());
                            }
                        }
                        if (dbRdr != null) dbRdr.Close();

                        // check zones
                        if (arrZoneIds.Count > 0)
                        {
                            // initialize sql query
                            string strSql = String.Format("SELECT * FROM view_zones WHERE zone_id IN ({0})",
                                String.Join(",", arrZoneIds.ToArray()));

                            // get active zones
                            dbRdr = dbMgr.ExecuteReader(strSql + " ORDER BY name");
                            if ((dbRdr != null) && dbRdr.HasRows)
                            {
                                // list zones
                                while (dbRdr.Read())
                                    arrZones.Add(BuildZone(dbRdr, "images/edit.png"));
                            }
                            if (dbRdr != null) dbRdr.Close();
                        }
                    }
                    */
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "GetAssetZones");
            }

            // close database
            if (dbRdr != null) dbRdr.Close();
            dbMgr.Close();
            return arrZones;
        }

        /// <summary>
        /// builds zone info from database record
        /// </summary>
        /// <param name="dbRdr"></param>
        /// <returns></returns>
        private ZoneInfo BuildZone(DbDataReader dbRdr, string strImage)
        {
            ZoneInfo udtZone = new ZoneInfo();
            try
            {
                // set zone parameters
                udtZone.ZoneID = dbRdr.ToInt32("zone_id");
                udtZone.Name = dbRdr.ToString("name");
                udtZone.Type = dbRdr.ToString("type");
                udtZone.Perimeter = dbRdr.ToString("perimeter");
                udtZone.CellIds = dbRdr.ToString("cell_ids");
                udtZone.Company = dbRdr.ToString("company");
                udtZone.Location = dbRdr.ToString("loc");
                udtZone.Color = dbRdr.ToString("color");

                // get zone image
                string strFill = "";
                udtZone.Image = GetImage(String.Format("zones/{0}", udtZone.ZoneID), strImage, ref strFill);
                udtZone.ImageFill = strFill;
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "BuildZone");
            }
            return udtZone;
        }


        //private ZoneTap BuildZoneTapInfo(DbDataReader dbRdr)
        //{
        //    ZoneTap udtZone = new ZoneTap();
        //    try
        //    {
        //        // set zone parameters
        //        udtZone.ZoneTapID = dbRdr.ToInt32("zonetap_id");
        //        udtZone.Driver = dbRdr.ToString("driver");
        //        udtZone.RFID = dbRdr.ToString("rfid_code");
        //        udtZone.TagID = dbRdr.ToString("tag");
        //        udtZone.TapIn = dbRdr.ToDateTime("tap_in");
        //        udtZone.TapOut = dbRdr.ToDateTime("tap_out");
        //        udtZone.ZoneIn = dbRdr.ToString("zoneloc_in");
        //        udtZone.ZoneOut = dbRdr.ToString("zoneloc_out");
        //        udtZone.Asset = dbRdr.ToString("asset");
        //        udtZone.Remarks = dbRdr.ToString("remarks");
        //        udtZone.EmployeeType = "Passenger";
        //    }
        //    catch (Exception ex)
        //    {
        //        // log error
        //        DatabaseMgrMySQL.LogError(ex.Message, "BuildZoneTapInfo");
        //    }
        //    return udtZone;
        //}



        /// <summary>
        /// updates zone info
        /// </summary>
        /// <param name="udtZone"></param>
        /// <returns></returns>
        public string SaveZone(ZoneInfo udtZone)
        {
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            string strRet = "";
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // check zone name
                    int iCompanyID = GetCompanyID(ref dbMgr, udtZone.Company);
                    if (dbMgr.Exists("SELECT TOP(1) zone_id FROM zones WHERE name = @Name AND zone_id <> @ZoneID " +
                        "AND company_id = @CompanyID", new object[] { udtZone.Name, udtZone.ZoneID, iCompanyID }))
                    {
                        // prompt user to change zone name
                        dbMgr.Close();
                        return "Zone name is already in database. Please input a different zone name.";
                    }
                    try
                    {
                        // check if no perimeter
                        if ((udtZone.Perimeter == "") && (udtZone.Location != ""))
                        {
                            // get geocode
                            string[] arrTemp = Geocode(udtZone.Location).Split(",".ToCharArray());
                            if (arrTemp.Length > 1)
                            {
                                // update boundary
                                udtZone.Perimeter = String.Format("{0},{1} {0},{2}", arrTemp[0],
                                    arrTemp[1], Convert.ToDouble(arrTemp[1]) + 0.0022);
                            }
                        }

                        // check if no location
                        if ((udtZone.Perimeter != "") && (udtZone.Location == ""))
                        {
                            // check first point
                            string[] arrTemp = udtZone.Perimeter.Split();
                            if (arrTemp.Length > 0)
                            {
                                // get reverse geocode
                                string[] arrPt = arrTemp[0].Split(",".ToCharArray());
                                arrTemp = ReverseGeocode(ref dbMgr, Convert.ToDouble(arrPt[0]),
									Convert.ToDouble(arrPt[1]), 2).Split("\r".ToCharArray());
                                udtZone.Location = arrTemp[0];
                            }
                        }
                    }
                    catch { }

                    // check zone geocode
                    if ((udtZone.Location == "") || (udtZone.Perimeter == ""))
                    {
                        // close database
                        dbMgr.Close();
                        return String.Format("Failed to locate \"{0}\".", udtZone.Name);
                    }

                    // get zone type
                    int iTypeID = 0;
                    object objTemp = dbMgr.ExecuteScalar("SELECT type_id FROM zone_types WHERE name = @Type",
                        new object[] { udtZone.Type });
                    if (objTemp != null) iTypeID = Convert.ToInt32(objTemp);

                    // check if new zone
                    if (udtZone.ZoneID == 0)
                    {
                        // check license limit
                        objTemp = dbMgr.ExecuteScalar(String.Format("SELECT zone_limit FROM companies WHERE company_id = {0}", iCompanyID));
                        int iLimit = (objTemp != null ? Convert.ToInt32(objTemp) : 0);
                        if ((iLimit > 0) && (dbMgr.Count(String.Format("SELECT COUNT(zone_id) FROM zones WHERE company_id = {0}", iCompanyID)) > iLimit))
                        {
                            // prompt user to upgrade license
                            dbMgr.Close();
                            return "Zone count is at maximum limit. Please contact software provider for license upgrade.";
                        }

                        // format name and address
                        udtZone.Name = udtZone.Name.ToTitleCase();
                        udtZone.Location = udtZone.Location.ToTitleCase();

                        // add new zone
                        dbMgr.ExecuteNonQuery("INSERT INTO zones (name, type_id, perimeter, cell_ids, loc, company_id) " +
                            "VALUES (@Name, @TypeID, @Perimeter, @CellIds, @Location, @CompanyID)", new object[] { udtZone.Name, 
                            iTypeID, udtZone.Perimeter, udtZone.CellIds, udtZone.Location, iCompanyID });
                    }
                    else
                    {
                        // update zone
                        dbMgr.ExecuteNonQuery("UPDATE zones SET name = @Name, type_id = @TypeID, perimeter = @Perimeter, " +
                            "cell_ids = @CellIds, loc = @Location, company_id = @CompanyID WHERE zone_id = @ZoneID",
                            new object[] { udtZone.Name, iTypeID, udtZone.Perimeter, udtZone.CellIds, udtZone.Location, 
                            iCompanyID, udtZone.ZoneID });
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                strRet = DatabaseMgrMySQL.LogError(ex.Message, "SaveZone");
            }

            // close database
            dbMgr.Close();
            return strRet;
        }

        /// <summary>
        /// deletes zone record
        /// </summary>
        /// <param name="iZoneID"></param>
        /// <returns></returns>
        public string DeleteZone(int iZoneID)
        {
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            string strRet = "";
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // delete zone
                    dbMgr.ExecuteNonQuery("UPDATE assets SET home = 0 WHERE home = @ZoneID", new object[] { iZoneID });
                    dbMgr.ExecuteNonQuery(String.Format("DELETE FROM plans WHERE origin_id = {0} OR destination_id = {0}", iZoneID));
                    dbMgr.ExecuteNonQuery("DELETE FROM zones WHERE zone_id = @ZoneID", new object[] { iZoneID });
                    DeleteImage(String.Format("zones/{0}", iZoneID));
                }
            }
            catch (Exception ex)
            {
                // log error
                strRet = DatabaseMgrMySQL.LogError(ex.Message, "DeleteZone");
            }

            // close database
            dbMgr.Close();
            return strRet;
        }

        /// <summary>
        /// gets all tags
        /// </summary>
        /// <returns></returns>
        public List<TagInfo> GetTags(int iUserID)
        {
            List<TagInfo> arrTags = new List<TagInfo>();
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            DbDataReader dbRdr = null;
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // get default image
                    object objTemp = dbMgr.ExecuteScalar("SELECT tag FROM features WHERE name = 'Tags'");
                    string strImage = (objTemp != null ? String.Format("{0}/images/resources/{1}.png",
                        ConfigurationManager.AppSettings["ServerPath"], objTemp) : "images/edit.png");

                    // initialize sql query
                    string strSql = "SELECT tags.*, assets.name AS asset, assets.asset_id, companies.name AS company FROM tags " +
                        "LEFT JOIN assets ON tags.tag_id = assets.tag_id " +
                        "LEFT JOIN companies ON assets.company_id = companies.company_id";
                    if (GetUserRole(ref dbMgr, iUserID) > 0)
                    {
                        // get free tags and tags assigned to company assets
                        strSql += String.Format(" WHERE tags.tag_id NOT IN (SELECT tag_id FROM assets WHERE tag_id <> 0) " +
                            "OR assets.company_id = (SELECT company_id FROM users WHERE user_id = {0})", iUserID);
                    }
                    else strSql += " WHERE tags.tag_id > 0";
                    
                    // get tags
                    dbRdr = dbMgr.ExecuteReader(strSql + " ORDER BY tags.name");
                    if ((dbRdr != null) && dbRdr.HasRows)
                    {
                        // loop through tags
                        while (dbRdr.Read())
                        {
                            // set tag parameters
                            TagInfo udtTag = new TagInfo();
                            udtTag.TagID = dbRdr.ToInt32("tag_id");
                            udtTag.Asset = dbRdr.ToString("asset");
                            udtTag.Name = dbRdr.ToString("name");
                            udtTag.Imei = dbRdr.ToString("imei");
                            udtTag.Phone = dbRdr.ToString("phone");
                            udtTag.Interval = dbRdr.ToInt32("interval");
                            udtTag.Company = dbRdr.ToString("company");
                            udtTag.ServerIP = dbRdr.ToString("APN");
                            udtTag.ServerPort = dbRdr.ToInt32("port");
                            udtTag.LastModified = dbRdr.ToDateTime("modified_timestamp").ToLocalTime();
                            udtTag.InstallDate = dbRdr.ToDateTime("install_date").ToLocalTime();
                            udtTag.InstallRemarks = dbRdr.ToString("remarks");

                            // set tag image (use asset image)
                            string strFill = "";
                            udtTag.Image = GetImage(String.Format("assets/{0}", dbRdr.ToInt32("asset_id")), strImage, ref strFill);
                            udtTag.ImageFill = strFill;
                            arrTags.Add(udtTag);
                        }
                    }
                    if (dbRdr != null) dbRdr.Close();
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "GetTags");
            }

            // close database
            if (dbRdr != null) dbRdr.Close();
            dbMgr.Close();
            return arrTags;
        }

        /// <summary>
        /// get a specific tag
        /// [Dan:25Mar14]
        /// </summary>
        /// <param name="Imei"></param>
        /// <returns></returns>
        public TagInfo GetTag(string Imei)
        {
            if (string.IsNullOrEmpty(Imei))
                return new TagInfo();

            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            DbDataReader dbRdr = null;
            TagInfo udtTag = new TagInfo();

            try
            {
                dbRdr = dbMgr.ExecuteReader("SELECT * FROM tags WHERE imei = @Imei", new object[] { Imei });
                if ((dbRdr != null) && dbRdr.HasRows)
                {
                    // loop through tags
                    while (dbRdr.Read())
                    {

                        //udtTag.TagID = dbRdr.ToInt32("tag_id");
                        udtTag.Name = dbRdr.ToString("name");
                        udtTag.Imei = dbRdr.ToString("imei");
                        //udtTag.Phone = dbRdr.ToString("phone");
                        //udtTag.Interval = dbRdr.ToInt32("interval");
                        //udtTag.Company = dbRdr.ToString("company");
                        //udtTag.Port = dbRdr.ToInt32("port");
                        //udtTag.APN = dbRdr.ToString("APN");
                        //udtTag.InstallDate = dbRdr.ToDateTime("install_date").ToLocalTime();
                        //udtTag.LastModified = dbRdr.ToDateTime("modified_timestamp").ToLocalTime();
                        //udtTag.InstallRemarks = dbRdr.ToString("remarks"); ;
                        udtTag.IsSentOut = (dbRdr.ToInt32("isSentOut") == 1 ? true : false);//[Dan:24Mar14] Greenbanks specs

                    }

                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "GetTag: " + Imei);
            }


            // close database
            if (dbRdr != null) dbRdr.Close();
            dbMgr.Close();

            return udtTag;
        }

        /// <summary>
        /// updates tag information
        /// </summary>
        /// <param name="udtTag"></param>
        /// <returns></returns>
        public string SaveTag(TagInfo udtTag)
        {
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            string strRet = "";
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // check tag name
                    if (dbMgr.Exists("SELECT TOP(1) tag_id FROM tags WHERE name = @Name AND tag_id <> @TagID", 
                        new object[] { udtTag.Name, udtTag.TagID }))
                    {
                        // prompt user to select different tag name
                        dbMgr.Close();
                        return "Device ID is already in database. Please input a different device ID.";
                    }

                    // check if new tag
                    if (udtTag.TagID == 0)
                    {
                        // add new tag
                        dbMgr.ExecuteNonQuery("INSERT INTO tags (name, imei, phone, interval, port, APN, install_date, modified_timestamp, " +
                            "remarks) VALUES (@Name, @Imei, @Phone, @Interval, @ServerPort, @ServerIP, @Install, @Modified, @Remarks)",
                            new object[] { udtTag.Name, udtTag.Imei, udtTag.Phone, udtTag.Interval, udtTag.ServerPort, udtTag.ServerIP,
                            udtTag.InstallDate.ToUniversalTime(), DateTime.Now.ToUniversalTime(), udtTag.InstallRemarks});
                    }
                    else
                    {
                        // update tag info
                        dbMgr.ExecuteNonQuery("UPDATE tags SET name = @Name, imei = @Imei, phone = @Phone, interval = @Interval, " +
                            "port = @ServerPort, APN = @ServerIP, install_date = @Install, modified_timestamp = @Modified, " +
                            "remarks = @Remarks WHERE tag_id = @TagID", new object[] { udtTag.Name, udtTag.Imei, udtTag.Phone, 
                            udtTag.Interval, udtTag.ServerPort, udtTag.ServerIP, udtTag.InstallDate.ToUniversalTime(), DateTime.UtcNow,
                            udtTag.InstallRemarks, udtTag.TagID});
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                strRet = DatabaseMgrMySQL.LogError(ex.Message, "SaveTag");
            }

            // close database
            dbMgr.Close();
            return strRet;
        }

        /// <summary>
        /// deletes tag record
        /// </summary>
        /// <param name="iTagID"></param>
        /// <returns></returns>
        public string DeleteTag(int iTagID)
        {
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            string strRet = "";
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // delete tag from database
                    dbMgr.ExecuteNonQuery("UPDATE assets SET tag_id = 0 WHERE tag_id = @TagID", new object[] { iTagID });
                    dbMgr.ExecuteNonQuery("DELETE FROM tags WHERE tag_id = @TagID", new object[] { iTagID });
                }
            }
            catch (Exception ex)
            {
                // log error
                strRet = DatabaseMgrMySQL.LogError(ex.Message, "DeleteTag");
            }

            // close database
            dbMgr.Close();
            return strRet;
        }

        /// <summary>
        /// gets all assets
        /// </summary>
        /// <param name="iUserID"></param>
        /// <returns></returns>
        public List<AssetInfo> GetAssets(int iUserID)
        {
            List<AssetInfo> arrAssets = new List<AssetInfo>();
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            DbDataReader dbRdr = null;
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // get default image
                    object objTemp = dbMgr.ExecuteScalar("SELECT tag FROM features WHERE name = 'Assets'");
                    string strImage = (objTemp != null ? String.Format("{0}/images/resources/{1}.png",
                        ConfigurationManager.AppSettings["ServerPath"], objTemp) : "images/edit.png");

                    // initialize query
                    string strSql = "SELECT * FROM view_assets";
                    if (GetUserRole(ref dbMgr, iUserID) > 0)
                    {
                        // limit assets to user's company only
                        strSql += String.Format(" WHERE company_id = (SELECT company_id FROM users WHERE user_id = {0})", iUserID);
                        objTemp = dbMgr.ExecuteScalar(String.Format("SELECT assets FROM users WHERE user_id = {0}", iUserID));
                        if ((objTemp != null) && (objTemp.ToString() != ""))
                            strSql += String.Format(" AND asset_id IN ({0})", objTemp);
                    }
                    else strSql += " WHERE asset_id > 0";

                    // get assets
                    dbRdr = dbMgr.ExecuteReader(strSql + " ORDER BY name");
                    if ((dbRdr != null) && dbRdr.HasRows)
                    {
                        // loop through assets
                        while (dbRdr.Read())
                            arrAssets.Add(BuildAsset(dbRdr, strImage));
                    }
                    if (dbRdr != null) dbRdr.Close();

                    // update other asset info
                    BuildAssetEx(ref dbMgr, ref arrAssets);
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "GetAssets");
            }

            // close database
            if (dbRdr != null) dbRdr.Close();
            dbMgr.Close();
            return arrAssets;
        }

        /// <summary>
        /// gets assets
        /// </summary>
        /// <param name="iUserID"></param>
        /// <returns></returns>
        public List<AssetInfo> GetAssetsAll(int iUserID)
        {
            List<AssetInfo> arrAssets = new List<AssetInfo>();
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            DbDataReader dbRdr = null;
            string strImage = "";

            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // get default image
                    object objTemp = dbMgr.ExecuteScalar("SELECT tag FROM features WHERE name = 'Assets'");
                    strImage = (objTemp != null ? String.Format("{0}/images/resources/{1}.png",
                    ConfigurationManager.AppSettings["ServerPath"], objTemp) : "images/edit.png");

                    string strSql = "SELECT * from view_assets_ex";
                    dbRdr = dbMgr.ExecuteReader(strSql);
                }
                if ((dbRdr != null) && dbRdr.HasRows)
                {
                    while (dbRdr.Read()) { arrAssets.Add(BuildAsset(dbRdr, strImage)); }
                }
                if (dbRdr != null) dbRdr.Close();

                // update other asset info
                BuildAssetEx(ref dbMgr, ref arrAssets);

            }
            catch (Exception ex)
            {
                DatabaseMgrMySQL.LogError(ex.Message, "GetAssetsAll");
            }
            // close database
            if (dbRdr != null) dbRdr.Close();
            dbMgr.Close();
            return arrAssets;
        }

        public PosInfo GetLastestAssetInfo(int AssetID, int PostypeID, int PosID)
        {
            PosInfo udtPos = new PosInfo();
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            DbDataReader dbRdr = null;
         
            try
            {
                if (dbMgr.Open())
                {
                    // get drivers
                    string strSql = String.Format("SELECT top (1) * from assetinfo WHERE asset_id = {0} AND postype_id = {1}", AssetID, PostypeID);
                    if (PosID > 0) strSql += String.Format(" AND pos_id = {0}", PosID);
                    
                    dbRdr = dbMgr.ExecuteReader(strSql + " ORDER BY timestamp DESC");
                    
                    // check if there are rows
                    if ((dbRdr != null) && dbRdr.HasRows)
                    {
                        while (dbRdr.Read())
                        {
                            udtPos.AssetID = dbRdr.ToInt32("asset_id");
                            udtPos.Timestamp = dbRdr.ToDateTime("timestamp");                          
                        }
                    }
                    if (dbRdr != null) dbRdr.Close();
                }
            }
            catch (Exception ex)
            {
                DatabaseMgrMySQL.LogError(ex.Message, "GetLastestAssetInfo");
            }

            if (dbRdr != null) dbRdr.Close();
            dbMgr.Close();

            return udtPos;
        }

        /// <summary>
        /// gets all assets by company
        /// </summary>
        /// <param name="iUserID"></param>
        /// <param name="iCompanyID"></param>
        /// <returns></returns>
        public List<AssetInfo> GetAssetsEx(int iUserID, int iCompanyID)
        {
            List<AssetInfo> arrAssets = new List<AssetInfo>();
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            DbDataReader dbRdr = null;
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // get default image
                    object objTemp = dbMgr.ExecuteScalar("SELECT tag FROM features WHERE name = 'Assets'");
                    string strImage = (objTemp != null ? String.Format("{0}/images/resources/{1}.png",
                        ConfigurationManager.AppSettings["ServerPath"], objTemp) : "images/edit.png");

                    // initialize query
                    string strSql = String.Format("SELECT * FROM view_assets WHERE company_id = {0}", iCompanyID);
                    if (GetUserRole(ref dbMgr, iUserID) > 0)
                    {
                        // limit assets to user's company only
                        objTemp = dbMgr.ExecuteScalar(String.Format("SELECT assets FROM users WHERE user_id = {0}", iUserID));
                        if ((objTemp != null) && (objTemp.ToString() != ""))
                            strSql += String.Format(" AND asset_id IN ({0})", objTemp);
                    }

                    // get assets
                    dbRdr = dbMgr.ExecuteReader(strSql + " ORDER BY name");
                    if ((dbRdr != null) && dbRdr.HasRows)
                    {
                        // loop through assets
                        while (dbRdr.Read())
                            arrAssets.Add(BuildAsset(dbRdr, strImage));
                    }
                    if (dbRdr != null) dbRdr.Close();

                    // get live status
                    BuildAssetEx(ref dbMgr, ref arrAssets);
                    LocateAssets(ref dbMgr, ref arrAssets);
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "GetAssetsEx");
            }

            // close database
            if (dbRdr != null) dbRdr.Close();
            dbMgr.Close();
            return arrAssets;
        }

        /// <summary>
        /// gets all assets by company
        /// Support for PUB company using our backend to gather data
        /// [Dan:xxXXXxxxx]
        /// </summary>
        /// <param name="strKey"></param>
        /// <returns></returns>
        public List<AssetInfo> GetAssetsApi(string strKey)
        {
            List<AssetInfo> arrAssets = new List<AssetInfo>();
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            SqlDataReader dbRdr = null;
            try
            {
                UserInfo currUser = GetUserbyPassword(strKey);

                // check user
                if (currUser.UserID > 0)
                    arrAssets = GetAssetsEx(currUser.UserID, currUser.CompanyID);
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "GetAssetsApi");
            }

            // close database
            if (dbRdr != null) dbRdr.Close();
            dbMgr.Close();
            return arrAssets;
        }

        /// <summary>
        /// builds asset info from database record
        /// </summary>
        /// <param name="dbRdr"></param>
        /// <param name="strImage"></param>
        /// <returns></returns>
        private AssetInfo BuildAsset(DbDataReader dbRdr, string strImage)
        {
            AssetInfo udtAsset = new AssetInfo();
            try
            {
                // check assigned tag
                string strTag = dbRdr.ToString("tag");
                if (strTag == "") strTag = "--";

                // get curfew times
                DateTime dtStart = dbRdr.ToDateTime("curfew_start");
                DateTime dtEnd = dbRdr.ToDateTime("curfew_end");

                // adjust curfew times
                dtStart = Convert.ToDateTime(String.Format("{0:dd-MMM-yy} {1:HH:mm:ss}", DateTime.Now, dtStart));
                dtEnd = Convert.ToDateTime(String.Format("{0:dd-MMM-yy} {1:HH:mm:ss}", DateTime.Now, dtEnd));
                if (dtStart > dtEnd)
                    dtEnd = dtEnd.AddDays(1.0);

                // set asset parameters
                udtAsset.AssetID = dbRdr.ToInt32("asset_id");
                udtAsset.Name = dbRdr.ToString("name");
                udtAsset.CategoryID = dbRdr.ToInt32("category_id");
                udtAsset.Category = dbRdr.ToString("category_desc");
                udtAsset.TagID = dbRdr.ToInt32("tag_id");
                udtAsset.Tag = strTag;
                udtAsset.TagPhone = dbRdr.ToString("tagphone");
                udtAsset.IdleLimit = dbRdr.ToDouble("idle_limit");
                udtAsset.SpeedLimit = dbRdr.ToDouble("speed_limit");
                udtAsset.BaseMileage = dbRdr.ToDouble("base_mileage");
                udtAsset.Mileage = dbRdr.ToDouble("mileage");
                udtAsset.MileageDist = Math.Abs(dbRdr.ToDouble("mileage_dist"));
                udtAsset.MileageDate = dbRdr.ToDateTime("mileage_date");
                udtAsset.CompanyID = dbRdr.ToInt32("company_id");
                udtAsset.Company = dbRdr.ToString("company");
                udtAsset.Driver = dbRdr.ToString("driver");
                udtAsset.Phone = dbRdr.ToString("phone");
                udtAsset.Email = dbRdr.ToString("email");
                udtAsset.Notifications = dbRdr.ToString("notifications");
                udtAsset.Home = dbRdr.ToInt32("home");
                udtAsset.AlertZones = dbRdr.ToString("restricted");
                udtAsset.CurfewStart = dtStart;
                udtAsset.CurfewEnd = dtEnd;
               // udtAsset.Timestamp = dbRdr.ToDateTime("timestamp");
                udtAsset.Temperature = 0.0;
                udtAsset.Temperature2 = 0.0;
                udtAsset.RFID = "";
                try
                {
                    udtAsset.Temperature = dbRdr.ToDouble("temperature");
                    udtAsset.Temperature2 = dbRdr.ToDouble("temperature2");
                    udtAsset.RFID = dbRdr.ToString("rfid");
                }
                catch { }

                // get asset image
                string strFill = "";
                udtAsset.Image = GetImage(String.Format("assets/{0}", udtAsset.AssetID), strImage, ref strFill);
                udtAsset.ImageFill = strFill;

                // initialize asset status
                udtAsset.StatusID = dbRdr.ToInt32("status_id");
                udtAsset.Status = dbRdr.ToString("status_desc");
                udtAsset.StatusEx = dbRdr.ToString("status_ex");
                udtAsset.Remarks = "";
                udtAsset.AlertLevel = 0;
                udtAsset.Ignition = dbRdr.ToInt32("ignition");
                udtAsset.Gps = 2;
                udtAsset.Gprs = 2;
                
                // initialize last event / position
                //[Chinky:14Nov2014] Added Try/Catch 
                try
                {
                    udtAsset.LastEventID = dbRdr.ToInt64("last_event");
                    udtAsset.LastEnterID = dbRdr.ToInt64("last_enter");
                    udtAsset.LastExitID = dbRdr.ToInt64("last_exit");
                    udtAsset.LastPosID = dbRdr.ToInt64("last_pos");
                    udtAsset.LastFixID = dbRdr.ToInt64("last_fix");
                    udtAsset.LastGpsID = dbRdr.ToInt64("last_gps");
                    udtAsset.LastIdle = dbRdr.ToDateTime("last_idle");
                    udtAsset.LastMove = dbRdr.ToDateTime("last_move"); //GetAssetInfoTimeStamp(PosInfoType.Move, udtAsset.AssetID);
                }
                catch (Exception ex)
                {
                    DatabaseMgrMySQL.LogError(ex.Message, "Initialize Event/Position");
                }

                // initialize activity list
                udtAsset.Activities = new List<ActivityInfo>();
                udtAsset.Trips = new List<TripInfo>();
                //udtAsset.TapInfo = GetZoneTapInfo(udtAsset.Tag);
                udtAsset.RFID_Status = 0;
                udtAsset.InstallDate = dbRdr.ToDateTime("install_date");
                udtAsset.InstallRemarks = dbRdr.ToString("asset_remarks");

                
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "BuildAsset: Error:");
            }
            return udtAsset;
        }

        /// <summary>
        /// gets latest settings of asset
        /// </summary>
        /// <param name="dbMgr"></param>
        /// <param name="arrAssets"></param>
        private void BuildAssetEx(ref DatabaseMgrMySQL dbMgr, ref List<AssetInfo> arrAssets)
        {
            DbDataReader dbRdr = null;
            try
            {
                // loop through assets
                foreach (AssetInfo udtAsset in arrAssets)
                {
                    // get asset's  latest position
                    dbRdr = dbMgr.ExecuteReader("SELECT * FROM assetinfo WHERE asset_id = @AssetID", new object[] { udtAsset.AssetID });
                    
                    if ((dbRdr != null) && dbRdr.HasRows)
                    {
                        // loop through asset info
                        while (dbRdr.Read())
                        {
                            // check parameter type
                            switch ((PosInfoType)dbRdr.ToInt32("postype_id"))
                            {
                            case PosInfoType.Event: udtAsset.LastEventID = dbRdr.ToInt64("pos_id"); break;
                            case PosInfoType.Enter: udtAsset.LastEnterID = dbRdr.ToInt64("pos_id"); break;
                            case PosInfoType.Exit: udtAsset.LastExitID = dbRdr.ToInt64("pos_id"); break;
                            case PosInfoType.Pos: udtAsset.LastPosID = dbRdr.ToInt64("pos_id"); break;
                            case PosInfoType.Fix: udtAsset.LastFixID = dbRdr.ToInt64("pos_id"); break;
                            case PosInfoType.GPS: udtAsset.LastGpsID = dbRdr.ToInt64("pos_id"); break;
                            case PosInfoType.Move: udtAsset.LastMove = dbRdr.ToDateTime("timestamp"); break;
                            case PosInfoType.Idle: udtAsset.LastIdle = dbRdr.ToDateTime("timestamp"); break;
                            case PosInfoType.Ignition: udtAsset.Ignition = dbRdr.ToInt32("pos_id"); break;
                            case PosInfoType.MileageDist: udtAsset.MileageDist = dbRdr.ToInt64("pos_id"); break;
                            case PosInfoType.Mileage: udtAsset.Mileage = dbRdr.ToInt64("pos_id"); break;
                            }
                        }
                    }
                    if (dbRdr != null) dbRdr.Close();
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "BuildAssetEx");
            }

            // close database
            if (dbRdr != null) dbRdr.Close();
        }

        //public List<ZoneTap> GetZoneTapInfo(string tag)
        //{
        //    List<ZoneTap> arrZoneTap = new List<ZoneTap>();
        //    DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
        //    DbDataReader dbRdr = null;
        //    try
        //    {
        //        // open database
        //        if (dbMgr.Open())
        //        {
        //            /////////////////////
        //            ////Get Project Site with Job Requests
        //            /////////////////////
        //            string strSql = string.Format("Select * from view_ZoneTap where tag = '{0}' and tap_out is null and tap_in >= '{1:dd-MMM-yy HH:mm:ss}' Order by tap_in desc", tag, DateTime.Today.ToUniversalTime());
        //            //DatabaseMgrMySQL.LogEvent(strSql, 1);

        //            // get zones
        //            dbRdr = dbMgr.ExecuteReader(strSql);
        //            if ((dbRdr != null) && dbRdr.HasRows)
        //            {
        //                // list zones
        //                while (dbRdr.Read())
        //                    arrZoneTap.Add(BuildZoneTapInfo(dbRdr));
        //            }
        //            if (dbRdr != null) dbRdr.Close();
        //            //DatabaseMgrMySQL.LogEvent(string.Format("Zonecount:{0} from Asset:{1}",arrZoneTap.Count,tag),1);
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        // log error
        //        DatabaseMgrMySQL.LogError(ex.Message, "GetZoneTapInfo");
        //    }

        //    // close database
        //    if (dbRdr != null) dbRdr.Close();
        //    dbMgr.Close();
        //    return arrZoneTap;
        //}
        //private List<ZoneTap> GetZoneTap(EventInfo evtInfo)
        //{
        //    List<ZoneTap> arrZoneTap = new List<ZoneTap>();
        //    DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
        //    DbDataReader dbRdr = null;
        //    try
        //    {
        //        // open database
        //        if (dbMgr.Open())
        //        {
        //            /////////////////////
        //            ////Get Project Site with Job Requests
        //            /////////////////////
        //            string strSql = string.Format("Select * from view_ZoneTap where tap_in >= '{0:dd-MMM-yy HH:mm:ss}' and tap_in <= '{1:dd-MMM-yy HH:mm:ss}' and tag = '{2}' Order by tap_in desc", evtInfo.Timestamp, evtInfo.RxTime, evtInfo.Tag);
        //            //DatabaseMgrMySQL.LogEvent(strSql, 1);

        //            // get zones
        //            dbRdr = dbMgr.ExecuteReader(strSql);
        //            if ((dbRdr != null) && dbRdr.HasRows)
        //            {
        //                // list zones
        //                while (dbRdr.Read())
        //                    arrZoneTap.Add(BuildZoneTapInfo(dbRdr));
        //            }
        //            if (dbRdr != null) dbRdr.Close();
        //            //DatabaseMgrMySQL.LogEvent(string.Format("Zonecount:{0} from Asset:{1}",arrZoneTap.Count,tag),1);
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        // log error
        //        DatabaseMgrMySQL.LogError(ex.Message, "GetZoneTapInfo");
        //    }

        //    // close database
        //    if (dbRdr != null) dbRdr.Close();
        //    dbMgr.Close();
        //    return arrZoneTap;
        //}

        /// <summary>
        /// gets all assets' location
        /// </summary>
        /// <param name="iUserID"></param>
        /// <param name="bLocate"></param>
        /// <returns></returns>
        private string LocateAssets(ref DatabaseMgrMySQL dbMgr, ref List<AssetInfo> arrAssets)
        {
            DbDataReader dbRdr = null;
            string strRet = "";
            object objTemp = null;
            try
            {
                // open database
                if (dbMgr.Open())
                {

                    //Temporary Disable
                    //// loop through assets
                    //foreach (AssetInfo udtAsset in arrAssets)
                    //{
                    //    // check pending alert
                    //    if (udtAsset.StatusID > 0)
                    //    {
                    //        // get alert event
                    //        dbRdr = dbMgr.ExecuteReader(String.Format("SELECT alert_level, remarks FROM events " +
                    //            "WHERE event_id = {0}", udtAsset.LastEventID));
                    //        if (((dbRdr != null) && dbRdr.HasRows) && dbRdr.Read())
                    //        {
                    //            // set alert status
                    //            udtAsset.AlertLevel = dbRdr.ToInt32("alert_level");
                    //            udtAsset.Remarks = dbRdr.ToString("remarks");
                    //        }
                    //        if (dbRdr != null) dbRdr.Close();
                    //    }
                    //}

                    // loop through assets
                    foreach (AssetInfo udtAsset in arrAssets)
                    {
                        // get asset's last position
                        udtAsset.LastPos = GetPosition(ref dbMgr, udtAsset.LastFixID);
                        //if ((udtAsset.LastPos != null) && (udtAsset.LastPos.FixID == -1))
                        //    udtAsset.LastGps = GetPosition(ref dbMgr, udtAsset.LastGpsID);

                        // check fix
                        if ((udtAsset.LastFixID == udtAsset.LastPosID) && (udtAsset.LastPos != null))
                        {
                            // check gps status
                            switch (udtAsset.LastPos.FixID)
                            {
                            case -1: udtAsset.Gps = 1; break;
                            case 1:
                            case 2: udtAsset.Gps = 0; break;
                            }
                        }

                        // get last position
                        dbRdr = dbMgr.ExecuteReader(String.Format("SELECT timestamp, fix FROM positions " +
                            "WHERE pos_id = {0}", udtAsset.LastPosID));
                        if (((dbRdr != null) && dbRdr.HasRows) && dbRdr.Read())
                        {
                            // check last position
                            if (udtAsset.LastPos != null)
                            {
                                // override last position timestamp
                                udtAsset.LastPos.Timestamp = dbRdr.ToDateTime("timestamp");
                                
                                // check if last position is no fix
                                if (dbRdr.ToInt32("fix") == 0)
                                {
                                    // check last gps fix
                                    switch (udtAsset.LastPos.FixID)
                                    {
                                    case 1: udtAsset.LastPos.FixID = 3; break;
                                    case 2: udtAsset.LastPos.FixID = 4; break;
                                    }

                                    // check last gps fix
                                    switch (udtAsset.LastPos.FixID)
                                    {
                                    case 3:
                                    case 4: udtAsset.LastPos.Fix = "Last Known GPS"; break;
                                    }
                                }
                            }
                        }
                        if (dbRdr != null) dbRdr.Close();

                        // check last position
                        if (udtAsset.LastPos != null)
                        {
                            // check position if expired
                            TimeSpan tsDiff = DateTime.Now.ToUniversalTime() - udtAsset.LastPos.Timestamp;
                            if (udtAsset.Status == "Position Expired")
                            {
                                // get length of position expiration
                                udtAsset.Remarks = String.Format("{0:00}:{1:00}:{2:00}", Math.Abs(tsDiff.Hours),
                                    Math.Abs(tsDiff.Minutes), Math.Abs(tsDiff.Seconds));
                            }

                            // get tag update interval
                            objTemp = dbMgr.ExecuteScalar(String.Format("SELECT interval FROM tags WHERE tag_id = {0}", udtAsset.TagID));
                            if (objTemp != null)
                            {
                                try
                                {
                                    // check report interval
                                    double lLimit = Convert.ToDouble(objTemp);
                                    if (lLimit > 0)
                                    {
                                        // check gprs status
                                        if (tsDiff.TotalMinutes < lLimit * 2)
                                            udtAsset.Gprs = 0;
                                        else if (tsDiff.TotalMinutes < lLimit * 3)
                                            udtAsset.Gprs = 1;
                                    }
                                }
                                catch { }
                            }
                        }
                    }

                    // loop through assets
                    foreach (AssetInfo udtAsset in arrAssets)
                    {
                        // get trips for the day
                        EventInfo udtEvent = new EventInfo();
                        udtEvent.EventID = 0;
                        udtEvent.AssetID = udtAsset.AssetID;
                        udtEvent.PosID = 0;
                        udtEvent.Timestamp = DateTime.Today.ToUniversalTime();
                        udtEvent.RxTime = DateTime.Now.ToUniversalTime();
                        udtAsset.Trips = GetTrips(ref dbMgr, udtEvent, 1, udtAsset.Company);
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                strRet = DatabaseMgrMySQL.LogError(ex.Message, "LocateAssets");
            }

            // close database
            if (dbRdr != null) dbRdr.Close();
            return strRet;
        }

        /// <summary>
        /// locates the center of a group of points
        /// </summary>
        /// <param name="arrLocations"></param>
        /// <returns></returns>
        private PointF GetCenter(List<PointF> arrLocations)
        {
            double lMinLat = 0.0;
            double lMaxLat = 0.0;
            double lMinLong = 0.0;
            double lMaxLong = 0.0;

            // check zone points
            if (arrLocations.Count > 0)
            {
                // return first point circle
                if (arrLocations.Count == 2)
                    return arrLocations[0];

                // initialize limit points
                lMinLat = arrLocations[0].Y;
                lMaxLat = lMinLat;
                lMinLong = arrLocations[0].X;
                lMaxLong = lMinLong;
            }

            // loop through zone points
            foreach (PointF locPos in arrLocations)
            {
                // check limit points
                if (locPos.Y < lMinLat)
                    lMinLat = locPos.Y;
                if (locPos.Y > lMaxLat)
                    lMaxLat = locPos.Y;
                if (locPos.X < lMinLong)
                    lMinLong = locPos.X;
                if (locPos.X > lMaxLong)
                    lMaxLong = locPos.X;
            }

            // return center point
            return new PointF((float)((lMaxLat + lMinLat) / 2), (float)((lMaxLong + lMinLong) / 2));
        }

        /// <summary>
        /// gets asset assigned with specified tag
        /// [Dan:10Oct2013] Created the function
        /// </summary>
        /// <param name="strTag"></param>
        /// <returns></returns>
        public AssetInfo GetAsset(string strTag)
        {
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            AssetInfo asset = null;
            asset = GetAsset(ref dbMgr, strTag);
            dbMgr.Close();
            return asset;
        }
        private AssetInfo GetPartialAssetInfo(string assetname)
        {
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            AssetInfo udtAsset = null;
            DbDataReader dbRdr = null;
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // get asset associated to tag
                    dbRdr = dbMgr.ExecuteReader("select asset_id,name,tag_id,company_id,(select name from companies c where c.company_id = a.company_id) as company from assets a where a.name = @Name", new object[] { assetname });
                    if ((dbRdr != null) && dbRdr.HasRows && dbRdr.Read())
                    {
                        udtAsset.AssetID = dbRdr.ToInt32("asset_id");
                        udtAsset.Name = dbRdr.ToString("name");
                        udtAsset.TagID = dbRdr.ToInt32("tag_id");
                        udtAsset.CompanyID = dbRdr.ToInt32("company_id");
                        udtAsset.Company = dbRdr.ToString("company");
                    }
                    if (dbRdr != null) dbRdr.Close();
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "GetPartialAssetInfo");
            }

            // close database
            if (dbRdr != null) dbRdr.Close();
            dbMgr.Close();
            return udtAsset;
        }

        /// <summary>
        /// gets asset assigned with specified tag
        /// </summary>
        /// <param name="strTag"></param>
        /// <returns></returns>
        private AssetInfo GetAsset(ref DatabaseMgrMySQL dbMgr, string strTag)
        {
            List<AssetInfo> arrAssets = new List<AssetInfo>();
            DbDataReader dbRdr = null;
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // get asset associated to tag
                    dbRdr = dbMgr.ExecuteReader("SELECT * FROM view_assets WHERE tag = @Tag", new object[] { strTag });
                    if ((dbRdr != null) && dbRdr.HasRows && dbRdr.Read())
                        arrAssets.Add(BuildAsset(dbRdr, "images/edit.png"));
                    if (dbRdr != null) dbRdr.Close();

                    // update other asset info
                    BuildAssetEx(ref dbMgr, ref arrAssets);
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "GetAsset");
            }

            // close database
            if (dbRdr != null) dbRdr.Close();
            return (arrAssets.Count > 0 ? arrAssets[0] : null);
        }

        /// <summary>
        /// checks asset's current position and status
        /// </summary>
        /// <param name="strName"></param>
        /// <returns></returns>
        public List<AssetInfo> FindAssets(string strPhone, string strName)
        {
            List<AssetInfo> arrAssets = new List<AssetInfo>();
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            DbDataReader dbRdr = null;
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // get user id
                    object objTemp = dbMgr.ExecuteScalar("SELECT user_id FROM users WHERE phone = @Phone", new object[] { strPhone });
                    int iUserID = (objTemp != null ? Convert.ToInt32(objTemp) : 0);

                    // check if not a registered user
                    if (iUserID == 0)
                    {
                        // close database
                        dbMgr.Close();
                        return null;
                    }

                    // get default image
                    objTemp = dbMgr.ExecuteScalar("SELECT tag FROM features WHERE name = 'Assets'");
                    string strImage = (objTemp != null ? String.Format("{0}/images/resources/{1}.png",
                        ConfigurationManager.AppSettings["ServerPath"], objTemp) : "images/edit.png");

                    // initialize query
                    string strSql = "SELECT * FROM view_assets";
                    bool bAll = (strName.ToUpper() == "ALL");
                    if (!bAll) strSql += " WHERE (name = @Name OR tag = @Tag)";

                    // check if non-admin
                    if (GetUserRole(ref dbMgr, iUserID) > 0)
                    {
                        // limit assets to user's company
                        strSql += String.Format(" {0} company_id = (SELECT company_id FROM users WHERE user_id = {1})", 
                            (strSql.Contains("WHERE") ? "AND" : "WHERE"), iUserID);
                        objTemp = dbMgr.ExecuteScalar(String.Format("SELECT assets FROM users WHERE user_id = {0}", iUserID));
                        if ((objTemp != null) && (objTemp.ToString() != ""))
                            strSql += String.Format(" AND asset_id IN ({0})", objTemp);
                    }

                    // get assets
                    dbRdr = dbMgr.ExecuteReader(strSql, new object[] { strName, strName });
                    if ((dbRdr != null) && dbRdr.HasRows)
                    {
                        // loop through assets
                        while (dbRdr.Read())
                            arrAssets.Add(BuildAsset(dbRdr, strImage));
                    }
                    if (dbRdr != null) dbRdr.Close();

                    // update other asset info
                    BuildAssetEx(ref dbMgr, ref arrAssets);

                    // get live status
                    LocateAssets(ref dbMgr, ref arrAssets);
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "FindAssets");
            }

            // close database
            if (dbRdr != null) dbRdr.Close();
            dbMgr.Close();
            return arrAssets;
        }

        /// <summary>
        /// gets asset's last position
        /// </summary>
        /// <param name="iPosID"></param>
        public AssetInfo FindAsset(long iPosID)
        {
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            DbDataReader dbRdr = null;
            List<AssetInfo> arrAssets = new List<AssetInfo>();
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // get asset position
                    PosInfo udtPos = GetPosition(ref dbMgr, iPosID);
                    if (udtPos != null)
                    {
                        // get default image
                        object objTemp = dbMgr.ExecuteScalar("SELECT tag FROM features WHERE name = 'Assets'");
                        string strImage = (objTemp != null ? String.Format("{0}/images/resources/{1}.png",
                            ConfigurationManager.AppSettings["ServerPath"], objTemp) : "images/edit.png");

                        // get asset info
                        dbRdr = dbMgr.ExecuteReader("SELECT * FROM view_assets WHERE asset_id = @AssetID", new object[] { udtPos.AssetID });
                        if ((dbRdr != null) && dbRdr.HasRows && dbRdr.Read())
                            arrAssets.Add(BuildAsset(dbRdr, strImage));
                        if (dbRdr != null) dbRdr.Close();

                        // check asset
                        if (arrAssets.Count > 0)
                        {
                            // update other asset info
                            BuildAssetEx(ref dbMgr, ref arrAssets);

                            // update asset position
                            arrAssets[0].LastPosID = iPosID;
                            arrAssets[0].LastPos = udtPos;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "FindAsset");
            }

            // close database
            if (dbRdr != null) dbRdr.Close();
            dbMgr.Close();
            return (arrAssets.Count > 0 ? arrAssets[0] : null);
        }


        /// <summary>
        /// [Incomplete] checks asset's current position and status
        /// [Dan:14Dec12]
        /// </summary>
        /// <param name="strName"></param>
        /// <returns></returns>
        public AssetInfo FindAssetByName(string strName)
        {
            AssetInfo udtAsset = new AssetInfo();
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            DbDataReader dbRdr = null;
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    //// get user id
                    //object objTemp = dbMgr.ExecuteScalar("SELECT user_id FROM users WHERE phone = @Phone", new object[] { strPhone });
                    //int iUserID = (objTemp != null ? Convert.ToInt32(objTemp) : 0);

                    //// check if not a registered user
                    //if (iUserID == 0)
                    //{
                    //    // close database
                    //    dbMgr.Close();
                    //    return null;
                    //}

                    // get default image
                    //object objTemp = dbMgr.ExecuteScalar("SELECT tag FROM features WHERE name = 'Assets'");
                    //string strImage = (objTemp != null ? String.Format("{0}/images/resources/{1}.png",
                    //    ConfigurationManager.AppSettings["ServerPath"], objTemp) : "images/edit.png");
                    
                    // initialize query
                    //string strSql = "SELECT * FROM view_assets";
                    string strSql = "SELECT asset_id FROM view_assets";
                    bool bAll = (strName.ToUpper() == "ALL");
                    if (!bAll) strSql += " WHERE (name = @Name)";

                    // get assets
                    //dbRdr = dbMgr.ExecuteReader(strSql, new object[] { strName, strName });
                    //if ((dbRdr != null) && dbRdr.HasRows)
                    //{
                    //    // loop through assets
                    //    while (dbRdr.Read())
                    //        udtAsset = BuildAsset(dbRdr, strImage);
                    //}
                    //else
                    //if (dbRdr != null) dbRdr.Close();
                    object objTemp = dbMgr.ExecuteScalar(strSql, new object[] { strName });
                    udtAsset.AssetID = (objTemp != null ? Convert.ToInt32(objTemp) : 0);

                    //// get live status
                    //LocateAssets(ref dbMgr, ref arrAssets);
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "FindAssetByName");
            }

            // close database
            if (dbRdr != null) dbRdr.Close();
            dbMgr.Close();
            return udtAsset;
        }

        /// <summary>
        /// updates asset info
        /// </summary>
        /// <param name="udtAsset"></param>
        /// <param name="iUserID"></param>
        /// <returns></returns>
        public string SaveAsset(AssetInfo udtAsset, int iUserID)
        {
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            DbDataReader dbRdr = null;
            string strRet = "";
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // check asset name
                    int iCompanyID = GetCompanyID(ref dbMgr, udtAsset.Company);
                    if (dbMgr.Exists("SELECT TOP(1) asset_id FROM assets WHERE name = @Name AND asset_id <> @AssetID",
                        new object[] { udtAsset.Name, udtAsset.AssetID }))
                    {
                        // prompt user to select different asset name
                        dbMgr.Close();
                        return "Asset name is already in database. Please input a different asset name.";
                    }

                    // check tag if already assigned
                    if ((udtAsset.TagID != 0) && dbMgr.Exists(String.Format("SELECT TOP(1) asset_id FROM assets " +
                        "WHERE tag_id = {0} AND asset_id <> {1}", udtAsset.TagID, udtAsset.AssetID)))
                    {
                        // prompt user to select different tag
                        dbMgr.Close();
                        return "Device is already assigned to another asset. Select a different device for asset.";
                    }

                    // initialize current settings
                    double lMileageDist = 0;
                    int iTagID = 0;

                    // check if new asset
                    if (udtAsset.AssetID == 0)
                    {
                        // check license limit
                        object objTemp = dbMgr.ExecuteScalar(String.Format("SELECT asset_limit FROM companies WHERE company_id = {0}", iCompanyID));
                        int iLimit = (objTemp != null ? Convert.ToInt32(objTemp) : 0);
                        if ((iLimit > 0) && (dbMgr.Count(String.Format("SELECT COUNT(asset_id) FROM assets WHERE company_id = {0}", iCompanyID)) > iLimit))
                        {
                            // prompt user to upgrade license
                            dbMgr.Close();
                            return "Asset count is at maximum limit. Please contact software provider for license upgrade.";
                        }

                        // add new asset
                        udtAsset.Driver = udtAsset.Driver.ToTitleCase();
                        dbMgr.ExecuteNonQuery("INSERT INTO assets (name, category_id, tag_id, phone, email, home, restricted, " +
                            "curfew_start, curfew_end, status_id, idle_limit, speed_limit, base_mileage, mileage_dist, mileage_date, " +
                            "driver, last_event, last_pos, last_fix, last_gps, company_id, notifications) VALUES (@Name, @CategoryID, " +
                            "@TagID, @Phone, @Email, @Home, @AlertZones, @CurfewStart, @CurfewEnd, 0, @IdleLimit, @SpeedLimit, " +
                            "@BaseMileage, @MileageDist, @MileageDate, @Driver, 0, 0, 0, 0, @CompanyID, @Notifications)", 
                            new object[] { udtAsset.Name, udtAsset.CategoryID, udtAsset.TagID, udtAsset.Phone, udtAsset.Email, 
                            udtAsset.Home, udtAsset.AlertZones, udtAsset.CurfewStart, udtAsset.CurfewEnd, udtAsset.IdleLimit, 
                            udtAsset.SpeedLimit, udtAsset.BaseMileage, udtAsset.MileageDist, udtAsset.MileageDate, udtAsset.Driver,
                            iCompanyID, udtAsset.Notifications });
                    }
                    else
                    {
                        // get current settings
                        dbRdr = dbMgr.ExecuteReader(String.Format("SELECT tag_id, mileage_dist FROM assets WHERE asset_id = {0}", udtAsset.AssetID));
                        if ((dbRdr != null) && dbRdr.HasRows && dbRdr.Read())
                        {
                            // update current settings
                            iTagID = dbRdr.ToInt32("tag_id");
                            lMileageDist = dbRdr.ToDouble("mileage_dist");
                        }
                        if (dbRdr != null) dbRdr.Close();

                        // check mileage reminder if already expired
                        if (lMileageDist == udtAsset.MileageDist * -1)
                            udtAsset.MileageDist = lMileageDist;

                        // update asset info
                        dbMgr.ExecuteNonQuery("UPDATE assets SET name = @Name, category_id = @CategoryID, tag_id = @TagID, phone = @Phone, " +
                            "email = @Email, home = @Home, restricted = @AlertZones, curfew_start = @CurfewStart, curfew_end = @CurfewEnd, " +
                            "idle_limit = @IdleLimit, speed_limit = @SpeedLimit, base_mileage = @BaseMileage, mileage_dist = @MileageDist, " +
                            "mileage_date = @MileageDate, driver = @Driver, company_id = @CompanyID, notifications = @Notifications " +
                            "WHERE asset_id = @AssetID", new object[] { udtAsset.Name, udtAsset.CategoryID, udtAsset.TagID, udtAsset.Phone, 
                            udtAsset.Email, udtAsset.Home, udtAsset.AlertZones, udtAsset.CurfewStart, udtAsset.CurfewEnd, udtAsset.IdleLimit, 
                            udtAsset.SpeedLimit, udtAsset.BaseMileage, udtAsset.MileageDist, udtAsset.MileageDate, udtAsset.Driver, iCompanyID, 
                            udtAsset.Notifications, udtAsset.AssetID });
                    }

                    // check tag if changed
                    if (udtAsset.TagID != iTagID)
                    {
                        // save event
                        EventInfo udtEvent = new EventInfo();
                        udtEvent.AssetID = udtAsset.AssetID;
                        udtEvent.TagID = (udtAsset.TagID != 0 ? udtAsset.TagID : iTagID);
                        udtEvent.Event = (udtAsset.TagID != 0 ? "Device Issued" : "Device Returned");
                        udtEvent.Remarks = "";
                        udtEvent.AlertLevel = 0;
                        udtEvent.Flag = 0;
                        udtEvent.Timestamp = DateTime.Now.ToUniversalTime();
                        udtEvent.RxTime = udtEvent.Timestamp;
                        udtEvent.AckUserID = iUserID;
                        SaveEvent(udtEvent);
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                strRet = DatabaseMgrMySQL.LogError(ex.Message, "SaveAsset");
            }

            // close database
            if (dbRdr != null) dbRdr.Close();
            dbMgr.Close();
            return strRet;
        }

        /// <summary>
        /// deletes asset record
        /// </summary>
        /// <param name="iAssetID"></param>
        /// <returns></returns>
        public string DeleteAsset(int iAssetID)
        {
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            string strRet = "";
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // delete asset
                    dbMgr.ExecuteNonQuery(String.Format("DELETE FROM assets WHERE asset_id = {0}", iAssetID));
                    DeleteImage(String.Format("assets/{0}", iAssetID));
                }
            }
            catch (Exception ex)
            {
                // log error
                strRet = DatabaseMgrMySQL.LogError(ex.Message, "DeleteAsset");
            }

            // close database
            dbMgr.Close();
            return strRet;
        }

        /// <summary>
        /// gets all activities
        /// </summary>
        /// <param name="actFilter"></param>
        /// <param name="iUserID"></param>
        /// <returns></returns>
        public List<ActivityInfo> GetActivities(ActivityInfo actFilter, int iUserID, string strCompany)
        {
            List<ActivityInfo> arrActivities = new List<ActivityInfo>();

            //[Dan:25Jun14] Add Support for DB Archive
            //DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL(ConfigurationManager.AppSettings["ConnectionString2"]);
            DatabaseMgrMySQL dbMgr = GetDatabaseConnection(actFilter.StartTime);

            DbDataReader dbRdr = null;
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // initialize sql command
                    string strSql = String.Format("SELECT * FROM view_activities WHERE (start_time BETWEEN '{0:dd-MMM-yyyy HH:mm:ss}' " +
                        "AND '{1:dd-MMM-yyyy HH:mm:ss}')", actFilter.StartTime, actFilter.EndTime);
                    if (actFilter.ActivityID > 0) strSql += String.Format(" AND activity_id < {0}", actFilter.ActivityID);
                    if (actFilter.ActivityNum != "") strSql += String.Format(" AND activity_num LIKE '%{0}%'", actFilter.ActivityNum);
                    if (actFilter.AccountNum != "") strSql += String.Format(" AND account_num LIKE '%{0}%'", actFilter.AccountNum);
                    if (actFilter.ZoneID > 0) strSql += String.Format(" AND zone_id = {0}", actFilter.ZoneID);
                    if (actFilter.AssetID > 0) strSql += String.Format(" AND asset_id = {0}", actFilter.AssetID);
                    else if (GetUserRole(ref dbMgr, iUserID) > 0)
                    {
                        // filter by company
                        object objTemp = dbMgr.ExecuteScalar(String.Format("SELECT company_id FROM users WHERE user_id = {0}", iUserID));
                        if (objTemp != null) strSql += String.Format(" AND company_id = {0}", objTemp);

                        // limit to assigned assets only
                        objTemp = dbMgr.ExecuteScalar(String.Format("SELECT assets FROM users WHERE user_id = {0}", iUserID));
                        if ((objTemp != null) && (objTemp.ToString() != ""))
                            strSql += String.Format(" AND asset_id IN ({0})", objTemp);
                    }
                    else
                    {
                        // filter by company
                        object objTemp = dbMgr.ExecuteScalar(String.Format("SELECT company_id FROM companies WHERE name = '{0}'", strCompany));
                        if (objTemp != null) strSql += String.Format(" AND company_id = {0}", objTemp);
                    }
                    
                    // get activities
                    dbRdr = dbMgr.ExecuteReader(strSql + " ORDER BY start_time DESC");
                    if ((dbRdr != null) && dbRdr.HasRows)
                    {
                        // list activities
                        while (dbRdr.Read())
                            arrActivities.Add(BuildActivity(dbRdr));
                    }
                    if (dbRdr != null) dbRdr.Close();
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "GetActivities");
            }

            // close database
            if (dbRdr != null) dbRdr.Close();
            dbMgr.Close();
            return arrActivities;
        }

        /// <summary>
        /// builds activity info from database record
        /// </summary>
        /// <param name="dbRdr"></param>
        /// <returns></returns>
        private ActivityInfo BuildActivity(DbDataReader dbRdr)
        {
            ActivityInfo udtActivity = new ActivityInfo();
            try
            {
                // set activity parameters
                udtActivity.ActivityID = dbRdr.ToInt64("activity_id");
                udtActivity.AssetID = dbRdr.ToInt32("asset_id");
                udtActivity.Asset = dbRdr.ToString("asset");
                udtActivity.Tag = dbRdr.ToString("tag");
                udtActivity.Driver = dbRdr.ToString("driver");
                udtActivity.StartTime = dbRdr.ToDateTime("start_time");
                udtActivity.EndTime = dbRdr.ToDateTime("end_time");
                udtActivity.ArriveTime = dbRdr.ToDateTimeMin("arrive_time");
                udtActivity.ArriveTimeEx = "";
                udtActivity.DepartTime = dbRdr.ToDateTimeMin("depart_time");
                udtActivity.DepartTimeEx = "";
                udtActivity.StartOffset = "";
                udtActivity.EndOffset = "";
                udtActivity.ActivityNum = dbRdr.ToString("activity_num");
                udtActivity.AccountNum = dbRdr.ToString("account_num");
                udtActivity.ZoneID = dbRdr.ToInt32("zone_id");
                udtActivity.Zone = dbRdr.ToString("loc");
                udtActivity.CategoryID = dbRdr.ToInt32("category");
                udtActivity.Category = (udtActivity.CategoryID == 0 ? "Regular" : "VIP");
                udtActivity.StatusID = dbRdr.ToInt32("status");
                udtActivity.Status = "";

                // check status
                switch (udtActivity.StatusID)
                {
                case 0: udtActivity.Status = "Completed"; break;
                case 1: udtActivity.Status = "Pending"; break;
                case 2: udtActivity.Status = "Missed"; break;
                }

                // check arrival time
                if (udtActivity.ArriveTime != DateTime.MinValue)
                {
                    // get start time offset
                    TimeSpan tsDiff = udtActivity.ArriveTime - udtActivity.StartTime;
                    udtActivity.StartOffset = String.Format("{0:00}:{1:00}:{2:00} {3}", Math.Abs(tsDiff.Hours),
                        Math.Abs(tsDiff.Minutes), Math.Abs(tsDiff.Seconds), tsDiff.TotalSeconds > 0 ? "Late" : "Early");
                }

                // check departure time
                if (udtActivity.DepartTime != DateTime.MinValue)
                {
                    // get end time offset
                    TimeSpan tsDiff = udtActivity.DepartTime - udtActivity.EndTime;
                    udtActivity.EndOffset = String.Format("{0:00}:{1:00}:{2:00} {3}", Math.Abs(tsDiff.Hours),
                        Math.Abs(tsDiff.Minutes), Math.Abs(tsDiff.Seconds), tsDiff.TotalSeconds > 0 ? "Late" : "Early");
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "BuildActivity");
            }
            return udtActivity;
        }

        /// <summary>
        /// updates activity information
        /// </summary>
        /// <param name="udtActivity"></param>
        /// <returns></returns>
        public string SaveActivity(ActivityInfo udtActivity, int iUserID)
        {
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            string strRet = "";
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // save activity
                    strRet = SaveActivity(ref dbMgr, udtActivity, iUserID);
                }
            }
            catch (Exception ex)
            {
                // log error
                strRet = DatabaseMgrMySQL.LogError(ex.Message, "SaveActivity");
            }

            // close database
            dbMgr.Close();
            return strRet;
        }

        /// <summary>
        /// updates list of activity information
        /// </summary>
        /// <param name="arrActivities"></param>
        /// <returns></returns>
        public string SaveActivities(List<ActivityInfo> arrActivities, int iUserID)
        {
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            int iCount = 0;
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // loop through activities
                    foreach (ActivityInfo udtActivity in arrActivities)
                    {
                        // save activity
                        if (SaveActivity(ref dbMgr, udtActivity, iUserID) == "")
                            iCount++;
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "SaveActivities");
            }

            // close database
            dbMgr.Close();
            return String.Format("{0} {1} successfully saved.", iCount, iCount > 1 ? "activities" : "activity");
        }

        /// <summary>
        /// updates activity information
        /// </summary>
        /// <param name="dbMgr"></param>
        /// <param name="udtActivity"></param>
        /// <returns></returns>
        private string SaveActivity(ref DatabaseMgrMySQL dbMgr, ActivityInfo udtActivity, int iUserID)
        {
            DbDataReader dbRdr = null;
            string strRet = "";
            object objTemp = null;
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // check asset
                    if ((udtActivity.AssetID == 0) && (udtActivity.Asset != ""))
                    {
                        // get asset id
                        objTemp = dbMgr.ExecuteScalar("SELECT TOP(1) asset_id FROM assets WHERE name = @Asset",
                            new object[] { udtActivity.Asset });
                        if (objTemp != null) udtActivity.AssetID = Convert.ToInt32(objTemp);
                    }

                    // check asset
                    if (udtActivity.AssetID == 0)
                    {
                        // set asset parameters
                        AssetInfo udtAsset = new AssetInfo();
                        udtAsset.AssetID = 0;
                        udtAsset.Name = udtActivity.Asset;
                        udtAsset.Driver = udtActivity.Asset;
                        udtAsset.CategoryID = 0;
                        udtAsset.Phone = "";
                        udtAsset.Mileage = 0;

                        // create new asset
                        if (SaveAsset(udtAsset, iUserID) == "")
                        {
                            // get asset id
                            objTemp = dbMgr.ExecuteReader("SELECT TOP(1) asset_id FROM assets WHERE assets.name = @Asset", 
                                new object[] { udtActivity.Asset });
                            if (objTemp != null) udtActivity.AssetID = Convert.ToInt32(objTemp);
                        }
                    }

                    // check asset
                    if (udtActivity.AssetID == 0)
                    {
                        // prompt user to create asset record
                        return String.Format("Asset \"{0}\" not found. Create asset record first before saving activity.",
                            udtActivity.Asset);
                    }

                    // get asset's company
                    objTemp = dbMgr.ExecuteScalar(String.Format("SELECT name FROM companies WHERE company_id = (SELECT company_id " +
                        "FROM assets WHERE asset_id = {0})", udtActivity.AssetID));
                    string strCompany = (objTemp != null ? objTemp.ToString() : "");

                    // check if new activity
                    if (udtActivity.ActivityID == 0)
                    {
                        // get activity id if existing already
                        objTemp = dbMgr.ExecuteScalar("SELECT TOP(1) activity_id FROM activities WHERE activity_num = @ActivityNum",
                            new object[] { udtActivity.ActivityNum });
                        if (objTemp != null) udtActivity.ActivityID = Convert.ToInt32(objTemp);
                    }

                    // check location
                    if ((udtActivity.ZoneID == 0) && (udtActivity.Zone != ""))
                        udtActivity.ZoneID = GetZoneID(ref dbMgr, udtActivity.Zone, "Customer Site", strCompany);
                    if (udtActivity.ZoneID == 0)
                        return String.Format("Failed to locate \"{0}\".", udtActivity.Zone);

                    // check if new activity
                    udtActivity.StatusID = 1;
                    if (udtActivity.ActivityID == 0)
                    {
                        // add new activity
                        dbMgr.ExecuteNonQuery("INSERT INTO activities (asset_id, start_time, end_time, activity_num, account_num, " +
                            "zone_id, category, status) VALUES (@AssetID, @StartTime, @EndTime, @ActivityNum, @AccountNum, @ZoneID, " +
                            "@CategoryID, @StatusID)", new object[] { udtActivity.AssetID, udtActivity.StartTime, udtActivity.EndTime, 
                            udtActivity.ActivityNum, udtActivity.AccountNum, udtActivity.ZoneID, udtActivity.CategoryID, udtActivity.StatusID });
                    }
                    else
                    {
                        // update activity info
                        dbMgr.ExecuteNonQuery("UPDATE activities SET asset_id = @AssetID, start_time = @StartTime, end_time = @EndTime, " +
                            "activity_num = @ActivityNum, account_num = @AccountNum, zone_id = @ZoneID, category = @CategoryID, " +
                            "status = @StatusID WHERE activity_id = @ActivityID", new object[] { udtActivity.AssetID, udtActivity.StartTime, 
                            udtActivity.EndTime, udtActivity.ActivityNum, udtActivity.AccountNum, udtActivity.ZoneID, udtActivity.CategoryID,
                            udtActivity.StatusID, udtActivity.ActivityID });
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                strRet = DatabaseMgrMySQL.LogError(ex.Message, "SaveActivity");
            }

            // close database
            if (dbRdr != null) dbRdr.Close();
            return strRet;
        }

        /// <summary>
        /// updates activity status
        /// </summary>
        /// <param name="iActivityID"></param>
        /// <param name="iStatusID"></param>
        /// <returns></returns>
        public string UpdateActivity(long iActivityID, int iStatusID)
        {
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            string strRet = "";
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // update activity status
                    dbMgr.ExecuteNonQuery(String.Format("UPDATE activities SET status = {0}0 " +
                            "WHERE activity_id = {1}", iStatusID, iActivityID));
                }
            }
            catch (Exception ex)
            {
                // log error
                strRet = DatabaseMgrMySQL.LogError(ex.Message, "UpdateActivity");
            }

            // close database
            dbMgr.Close();
            return strRet;
        }

        /// <summary>
        /// deletes activity records
        /// </summary>
        /// <param name="strActivityIds"></param>
        /// <returns></returns>
        public string DeleteActivities(string strActivityIds)
        {
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            string strRet = "";
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // loop through activities
                    string[] arrActivityIds = strActivityIds.Split(",".ToCharArray(), StringSplitOptions.RemoveEmptyEntries);
                    foreach (string strActivityID in arrActivityIds)
                    {
                        // delete activity
                        try { DeleteActivity(ref dbMgr, Convert.ToInt64(strActivityID)); }
                        catch {}
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                strRet = DatabaseMgrMySQL.LogError(ex.Message, "DeleteActivities");
            }

            // close database
            dbMgr.Close();
            return strRet;
        }

        /// <summary>
        /// deletes activity record
        /// </summary>
        /// <param name="iActivityID"></param>
        /// <returns></returns>
        public string DeleteActivity(long iActivityID)
        {
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            string strRet = "";
            try
            {
                // delete activity
                strRet = DeleteActivity(ref dbMgr, iActivityID);
            }
            catch (Exception ex)
            {
                // log error
                strRet = DatabaseMgrMySQL.LogError(ex.Message, "DeleteActivity");
            }

            // close database
            dbMgr.Close();
            return strRet;
        }

        /// <summary>
        /// deletes activity record
        /// </summary>
        /// <param name="iActivityID"></param>
        /// <returns></returns>
        private string DeleteActivity(ref DatabaseMgrMySQL dbMgr, long iActivityID)
        {
            DbDataReader dbRdr = null;
            string strRet = "";
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // get activity asset
                    dbRdr = dbMgr.ExecuteReader(String.Format("SELECT asset_id, activity_num FROM activities " +
                        "WHERE activity_id = {0}", iActivityID));
                    if ((dbRdr != null) && dbRdr.HasRows && dbRdr.Read())
                    {
                        // reset all activity alerts
                        EventInfo udtEvent = new EventInfo();
                        udtEvent.AssetID = dbRdr.ToInt32("asset_id");
                        udtEvent.Remarks = String.Format("%{0}%", dbRdr.ToString("activity_num"));
                        udtEvent.Flag = 0;
                        udtEvent.Event = "Pre-Activity Reminder";
                        FlagEvent(udtEvent);
                        udtEvent.Event = "Post-Activity Reminder";
                        FlagEvent(udtEvent);
                        udtEvent.Event = "Activity Missed";
                        udtEvent.AckUserID = 1;
                        CancelEvent(udtEvent, true);
                    }
                    if (dbRdr != null) dbRdr.Close();

                    // delete activity from database
                    dbMgr.ExecuteNonQuery(String.Format("DELETE FROM activities WHERE activity_id = {0}", iActivityID));
                }
            }
            catch (Exception ex)
            {
                // log error
                strRet = DatabaseMgrMySQL.LogError(ex.Message, "DeleteActivity");
            }

            // close database
            if (dbRdr != null) dbRdr.Close();
            return strRet;
        }

        /// <summary>
        /// gets all trip plans
        /// </summary>
        /// <returns></returns>
        public List<PlanInfo> GetPlans(int iUserID, string strCompany)
        {
            List<PlanInfo> arrPlans = new List<PlanInfo>();
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // check company name
                    if (strCompany == "")
                    {
                        // get company name
                        object objTemp = dbMgr.ExecuteScalar("SELECT name FROM companies WHERE company_id = " +
                            "(SELECT company_id FROM users WHERE user_id = @UserID)", new object[] { iUserID });
                    }

                    // get trip plans
                    arrPlans = GetPlans(ref dbMgr, 0, strCompany);
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "GetPlans");
            }

            // close database
            dbMgr.Close();
            return arrPlans;
        }

        /// <summary>
        /// gets all trip plans (with zone filter if supplied)
        /// </summary>
        /// <param name="iDestID"></param>
        /// <param name="iUserID"></param>
        /// <returns></returns>
        private List<PlanInfo> GetPlans(ref DatabaseMgrMySQL dbMgr, int iDestID, string strCompany)
        {
            List<PlanInfo> arrPlans = new List<PlanInfo>();
            DbDataReader dbRdr = null;
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // initialize query
                    List<object> arrParams = new List<object>();
                    string strSql = "SELECT plans.*, zones.name AS origin, companies.name AS company FROM plans " +
                        "INNER JOIN zones ON plans.origin_id = zones.zone_id " +
                        "INNER JOIN companies ON plans.company_id = companies.company_id " +
                        "WHERE plans.company_id = (SELECT company_id FROM companies WHERE name = @Company)";
                    arrParams.Add(strCompany);

                    // check destination zone
                    if (iDestID > 0)
                    {
                        // filter by specified destination zone
                        strSql += " AND plans.destination_id = @DestinationID";
                        arrParams.Add(iDestID);
                    }

                    // get trip plans
                    dbRdr = dbMgr.ExecuteReader(strSql + " ORDER BY origin", arrParams.ToArray());
                    if ((dbRdr != null) && dbRdr.HasRows)
                    {
                        // loop through records
                        while (dbRdr.Read())
                            arrPlans.Add(BuildPlan(dbRdr));
                    }
                    if (dbRdr != null) dbRdr.Close();

                    // loop through trip plans
                    foreach (PlanInfo udtPlan in arrPlans)
                    {
                        // get destination zone name
                        object objTemp = dbMgr.ExecuteScalar(String.Format("SELECT TOP(1) name FROM zones " +
                            "WHERE zone_id = {0}", udtPlan.DestinationID));
                        if (objTemp != null) udtPlan.Destination = objTemp.ToString();
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "GetPlans");
            }

            // close database
            if (dbRdr != null) dbRdr.Close();
            return arrPlans;
        }


        public List<PlanInfo> RegenGetPlans(int iDestID, string strCompany)
        {
            List<PlanInfo> arrPlans = new List<PlanInfo>();
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();

            try
            {
                // open database
                if (dbMgr.Open())
                {
                    arrPlans = GetPlans(ref dbMgr, iDestID, strCompany);
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "GetPlans");
            }
            
            dbMgr.Close();
            return arrPlans;
        }

        /// <summary>
        /// builds plan info from database record
        /// </summary>
        /// <param name="dbRdr"></param>
        /// <returns></returns>
        private PlanInfo BuildPlan(DbDataReader dbRdr)
        {
            PlanInfo udtPlan = new PlanInfo();
            try
            {
                // add trip plan to list
                udtPlan.PlanID = dbRdr.ToInt32("plan_id");
                udtPlan.OriginID = dbRdr.ToInt32("origin_id");
                udtPlan.Origin = dbRdr.ToString("origin");
                udtPlan.DestinationID = dbRdr.ToInt32("destination_id");
                udtPlan.Destination = "";
                udtPlan.Duration = dbRdr.ToDouble("duration");
                udtPlan.Price = dbRdr.ToDouble("price");
                udtPlan.Company = dbRdr.ToString("company");
                udtPlan.Timestamp = dbRdr.ToDateTime("timestamp");
                udtPlan.LastTrip = dbRdr.ToDateTime("last_trip");

                // format duration
                double lSeconds = (udtPlan.Duration - Math.Round(udtPlan.Duration)) * 60;
                TimeSpan tsDiff = new TimeSpan(0, (int)udtPlan.Duration, (int)lSeconds);
                udtPlan.DurationEx = String.Format("{0:00}:{1:00}:{2:00}",
                    tsDiff.Hours, tsDiff.Minutes, tsDiff.Seconds);
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "BuildPlan");
            }
            return udtPlan;
        }

        /// <summary>
        /// updates trip information
        /// </summary>
        /// <param name="udtPlan"></param>
        /// <returns></returns>
        public string SavePlan(PlanInfo udtPlan)
        {
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            string strRet = "";
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // save trip plan
                    strRet = SavePlan(ref dbMgr, udtPlan);
                }
            }
            catch (Exception ex)
            {
                // log error
                strRet = DatabaseMgrMySQL.LogError(ex.Message, "SavePlan");
            }

            // close database
            dbMgr.Close();
            return strRet;
        }

        /// <summary>
        /// updates list of trip information
        /// </summary>
        /// <param name="arrPlans"></param>
        /// <returns></returns>
        public string SavePlans(List<PlanInfo> arrPlans)
        {
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            int iCount = 0;
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // loop through activity plans
                    foreach (PlanInfo udtPlan in arrPlans)
                    {
                        // save activity plan
                        if (SavePlan(ref dbMgr, udtPlan) == "")
                            iCount++;
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "SavePlans");
            }

            // close database
            dbMgr.Close();
            return String.Format("{0} {1} successfully saved.", iCount, iCount > 1 ? "activities" : "activity");
        }

        /// <summary>
        /// updates trip plan information
        /// </summary>
        /// <param name="dbMgr"></param>
        /// <param name="udtPlan"></param>
        /// <returns></returns>
        private string SavePlan(ref DatabaseMgrMySQL dbMgr, PlanInfo udtPlan)
        {
            DbDataReader dbRdr = null;
            string strRet = "";
            object objTemp = null;
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // check origin zone
                    if ((udtPlan.OriginID == 0) && (udtPlan.Origin != ""))
                        udtPlan.OriginID = GetZoneID(ref dbMgr, udtPlan.Origin, "Project Site", udtPlan.Company);
                    if (udtPlan.OriginID == 0)
                        return String.Format("Failed to locate \"{0}\".", udtPlan.Origin);

                    // check destination zone
                    if ((udtPlan.DestinationID == 0) && (udtPlan.Destination != ""))
                        udtPlan.DestinationID = GetZoneID(ref dbMgr, udtPlan.Destination, "Dump Site", udtPlan.Company);
                    if (udtPlan.DestinationID == 0)
                        return String.Format("Failed to locate \"{0}\".", udtPlan.Destination);

                    // check if new trip plan
                    if (udtPlan.PlanID == 0)
                    {
                        // get plan id if existing already
                        objTemp = dbMgr.ExecuteScalar("SELECT TOP(1) plan_id FROM plans " +
                            "WHERE origin_id = @OriginID AND destination_id = @DestinationID",
                            new object[] { udtPlan.OriginID, udtPlan.DestinationID });
                        if (objTemp != null) udtPlan.PlanID = Convert.ToInt32(objTemp);
                    }

                    // initialize settings
                    DateTime dtTimestamp = DateTime.Now.ToUniversalTime();
                    DateTime dtLastTrip = dtTimestamp;
                    int iCompanyID = GetCompanyID(ref dbMgr, udtPlan.Company);

                    // check if new trip plan
                    if (udtPlan.PlanID == 0)
                    {
                        // get earliest exit from destination
                        objTemp = dbMgr.ExecuteScalar("SELECT MIN(timestamp) FROM view_events WHERE status_id = " +
                            "(SELECT status_id FROM status WHERE status_desc = 'Zone Exit') AND remarks = @Destination " +
                            "AND company_id = @CompanyID", new object[] { udtPlan.Destination, iCompanyID });
                        if ((objTemp != null) && (objTemp.ToString() != "")) dtLastTrip = Convert.ToDateTime(objTemp);

                        // add new trip plan
                        dbMgr.ExecuteNonQuery("INSERT INTO plans (origin_id, destination_id, duration, price, company_id, timestamp, " +
                            "last_trip) VALUES (@OriginID, @DestinationID, @Duration, @Price, @CompanyID, @Timestamp, @LastTrip)", 
                            new object[] { udtPlan.OriginID, udtPlan.DestinationID, udtPlan.Duration, udtPlan.Price, 
                                iCompanyID, dtTimestamp, dtLastTrip });
                    }
                    else
                    {
                        // update trip plan
                        dbMgr.ExecuteNonQuery("UPDATE plans SET origin_id = @OriginID, destination_id = @DestinationID, " +
                            "duration = @Duration, price = @Price, company_id = @CompanyID, timestamp = @Timestamp, " +
                            "last_trip = @LastTrip WHERE plan_id = @PlanID", new object[] { udtPlan.OriginID, udtPlan.DestinationID, 
                            udtPlan.Duration, udtPlan.Price, iCompanyID, dtTimestamp, dtLastTrip, udtPlan.PlanID });
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                strRet = DatabaseMgrMySQL.LogError(ex.Message, "SavePlan");
            }

            // close database
            if (dbRdr != null) dbRdr.Close();
            return strRet;
        }

        /// <summary>
        /// saves new zone to database
        /// </summary>
        /// <param name="dbMgr"></param>
        /// <param name="strZone"></param>
        /// <param name="strType"></param>
        /// <returns></returns>
        private int GetZoneID(ref DatabaseMgrMySQL dbMgr, string strZone, string strType, string strCompany)
        {
            int iZoneID = 0;
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // check zone
                    if ((strZone != "") && (strCompany != ""))
                    {
                        // get zone id
                        object objTemp = dbMgr.ExecuteScalar("SELECT TOP(1) zone_id FROM view_zones WHERE " +
                            "(name = @Zone OR loc = @Loc) AND company = @Company", new object[] { strZone, strZone, strCompany });
                        if (objTemp != null) iZoneID = Convert.ToInt32(objTemp);
                        else
                        {
                            // build zone info
                            ZoneInfo udtZone = new ZoneInfo();
                            udtZone.ZoneID = 0;
                            udtZone.Name = strZone;
                            udtZone.Type = strType;
                            udtZone.Perimeter = "";
                            udtZone.CellIds = "";
                            udtZone.Location = strZone;
                            udtZone.Company = strCompany;

                            // save zone
                            string strRet = SaveZone(udtZone);
                            if (strRet == "")
                            {
                                // get zone id
                                objTemp = dbMgr.ExecuteScalar("SELECT TOP(1) zone_id FROM view_zones " +
                                    "WHERE (name = @Zone OR loc = @Loc) AND company = @Company", 
                                    new object[] { strZone, strZone, strCompany });
                                if (objTemp != null) iZoneID = Convert.ToInt32(objTemp);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "GetZoneID");
            }
            return iZoneID;
        }

        /// <summary>
        /// deletes trip plan
        /// </summary>
        /// <param name="iPlanID"></param>
        /// <returns></returns>
        public string DeletePlan(int iPlanID)
        {
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            string strRet = "";
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // delete trip plan from database
                    dbMgr.ExecuteNonQuery(String.Format("DELETE FROM plans WHERE plan_id = {0}", iPlanID));
                }
            }
            catch (Exception ex)
            {
                // log error
                strRet = DatabaseMgrMySQL.LogError(ex.Message, "DeletePlan");
            }

            // close database
            dbMgr.Close();
            return strRet;
        }

        /// <summary>
        /// gets trips
        /// </summary>
        /// <param name="evtFilter"></param>
        /// <param name="iUserID"></param>
        /// <returns></returns>
        public List<TripInfo> GetTrips(EventInfo evtFilter, int iUserID, string strCompany)
        {
            List<TripInfo> arrTrips = new List<TripInfo>();

            //[Dan:25Jun14] Add Support for DB Archive
            //DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL(ConfigurationManager.AppSettings["ConnectionString2"]);
            DatabaseMgrMySQL dbMgr = GetDatabaseConnection(evtFilter.Timestamp);

            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // get trips
                    arrTrips = GetTrips(ref dbMgr, evtFilter, iUserID, strCompany);
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "GetTrips");
            }

            // close database
            dbMgr.Close();
            return arrTrips;
        }

        /// <summary>
        /// gets trips
        /// </summary>
        /// <param name="evtFilter"></param>
        /// <param name="iUserID"></param>
        /// <param name="strCompany"></param>
        /// <returns></returns>
        private List<TripInfo> GetTrips(ref DatabaseMgrMySQL dbMgr, EventInfo evtFilter, int iUserID, string strCompany)
        {
            List<TripInfo> arrTrips = new List<TripInfo>();
            DbDataReader dbRdr = null;
            object objTemp = null;
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    //[Dan:04Oct2013] Changed the "WHERE destination_exit" to "WHERE origin_enter"
                    // initialize sql command
                    string strSql = String.Format("SELECT TOP {0} * FROM view_trips", ConfigurationManager.AppSettings["DownloadCount"]);
                    strSql += String.Format(" WHERE origin_enter BETWEEN '{0:dd-MMM-yyyy HH:mm:ss}' AND '{1:dd-MMM-yyyy HH:mm:ss}'", 
                        evtFilter.Timestamp, evtFilter.RxTime);
                    if (evtFilter.EventID > 0) strSql += String.Format(" AND trip_id < {0}", evtFilter.EventID);
                    if (evtFilter.AssetID > 0) strSql += String.Format(" AND asset_id = {0}", evtFilter.AssetID);
                    else if (GetUserRole(ref dbMgr, iUserID) > 0)
                    {
                        // filter by company
                        objTemp = dbMgr.ExecuteScalar(String.Format("SELECT company_id FROM users WHERE user_id = {0}", iUserID));
                        if (objTemp != null) strSql += String.Format(" AND company_id = {0}", objTemp);

                        // limit to assigned assets only
                        objTemp = dbMgr.ExecuteScalar(String.Format("SELECT assets FROM users WHERE user_id = {0}", iUserID));
                        if ((objTemp != null) && (objTemp.ToString() != ""))
                            strSql += String.Format(" AND asset_id IN ({0})", objTemp); 

                        // check if chuan lim
                        if (strCompany.ToLower().Contains("chuan lim"))
                            strSql += String.Format(" AND asset_id NOT IN (SELECT asset_id FROM assets WHERE" +
                                " name = 'XD5172' OR " +
                                " name = 'XB5059' OR " +
                                " name = 'GQ7797R' OR " +
                                " name = 'GT7977Y' OR " +
                                " name = 'GZ4131J' OR " +
                                " name = 'GR7977H' OR " +
                                " name = 'GR7797K' OR " +
                                " name = 'GZ5947R' OR " +
                                " name = 'GV7337J' OR " +
                                " name = 'YM6391S' OR " +
                                " name = 'YK7797J' OR " +
                                " name = 'YM7901P' OR " +
                                " name = 'YN2580J' OR " +
                                " name = 'YN3021A' OR " +
                                " name = 'GQ1751L')");
                    }
                    else
                    {
                        // filter by company
                        objTemp = dbMgr.ExecuteScalar(String.Format("SELECT company_id FROM companies WHERE name = '{0}'", strCompany));
                        if (objTemp != null) strSql += String.Format(" AND company_id = {0}", objTemp);
                    }

                    // get trips
                    dbRdr = dbMgr.ExecuteReader(strSql + " ORDER BY trip_id DESC");
                    if ((dbRdr != null) && dbRdr.HasRows)
                    {
                        // loop through records
                        while (dbRdr.Read())
                        {
                            // build trip info
                            TripInfo udtTrip = new TripInfo();
                            udtTrip.TripID = dbRdr.ToInt64("trip_id");
                            udtTrip.PlanID = dbRdr.ToInt32("plan_id");
                            udtTrip.AssetID = dbRdr.ToInt32("asset_id");
                            udtTrip.Asset = dbRdr.ToString("asset");
                            udtTrip.Tag = dbRdr.ToString("tag");
                            udtTrip.Driver = dbRdr.ToString("driver");
                            udtTrip.OriginID = dbRdr.ToInt32("origin_id");
                            udtTrip.Origin = dbRdr.ToString("origin");
                            udtTrip.OriginEnter = dbRdr.ToDateTime("origin_enter");
                            udtTrip.OriginExit = dbRdr.ToDateTime("origin_exit");
                            udtTrip.DestinationID = dbRdr.ToInt32("destination_id");
                            udtTrip.Destination = dbRdr.ToString("destination");
                            udtTrip.DestinationEnter = dbRdr.ToDateTime("destination_enter");
                            udtTrip.DestinationExit = dbRdr.ToDateTime("destination_exit");

                            // get duration stayed in origin site
                            TimeSpan tsDiff = udtTrip.OriginExit - udtTrip.OriginEnter;
                            udtTrip.OriginDuration = String.Format("{0:00}:{1:00}:{2:00}",
                                tsDiff.Hours, tsDiff.Minutes, tsDiff.Seconds);

                            // get duration stayed in destination site
                            tsDiff = udtTrip.DestinationExit - udtTrip.DestinationEnter;
                            udtTrip.DestinationDuration = String.Format("{0:00}:{1:00}:{2:00}",
                                tsDiff.Hours, tsDiff.Minutes, tsDiff.Seconds);

                            // get total travel time
                            tsDiff = udtTrip.DestinationEnter - udtTrip.OriginExit;
                            udtTrip.TravelDuration = String.Format("{0:00}:{1:00}:{2:00}",
                                tsDiff.Hours, tsDiff.Minutes, tsDiff.Seconds);

                            // check trip duration if ok
                            double lPlanDuration = dbRdr.ToDouble("duration");
                            udtTrip.Price = ((lPlanDuration == 0) || (lPlanDuration >= tsDiff.TotalMinutes) ? dbRdr.ToDouble("price") : 0);
                            udtTrip.Mileage = Math.Round(dbRdr.ToDouble("mileage"), 1);

                            // add trip to list
                            arrTrips.Add(udtTrip);
                        }
                    }
                    if (dbRdr != null) dbRdr.Close();
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "GetTrips");
            }

            // close database
            if (dbRdr != null) dbRdr.Close();
            return arrTrips;
        }


        /// <summary>
        /// gets tripszone report
        /// [Dan:23DEC12]
        /// </summary>
        /// <param name="evtFilter"></param>
        /// <param name="iUserID"></param>
        /// <returns></returns>
        public List<TripZoneInfo> GetTripsZone(TripZoneInfo udtTripZone, int iUserID, string strCompany)
        {
            List<TripZoneInfo> arrTripsInfo = new List<TripZoneInfo>();

            //[Dan:25Jun14] Add Support for DB Archive
            //DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL(ConfigurationManager.AppSettings["ConnectionString2"]);
            DatabaseMgrMySQL dbMgr = GetDatabaseConnection(udtTripZone.Timestamp);

            DbDataReader dbRdr = null;

            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // initialize sql command
                    string strSql = String.Format("SELECT TOP {0} * FROM view_tripszone", ConfigurationManager.AppSettings["DownloadCount"]);
                    strSql += 
                        String.Format(" WHERE timestamp BETWEEN '{0:dd-MMM-yyyy HH:mm:ss}' AND '{1:dd-MMM-yyyy HH:mm:ss}'", 
                        udtTripZone.Timestamp, udtTripZone.RxTime);

                    strSql += String.Format(" AND name = '{0}'", udtTripZone.ZoneName);
                    if (udtTripZone.TripsZoneID > 0)
                    {
                        strSql += String.Format(" AND tripzone_id < {0}", udtTripZone.TripsZoneID);
                    }

                    //// filter by company
                    //object objTemp = 
                    //    dbMgr.ExecuteScalar(String.Format("SELECT company_id FROM users WHERE user_id = {0}", iUserID));
                    //if (objTemp != null) strSql += String.Format(" AND company_id = {0}", objTemp);

                    // log debug info
                    DatabaseMgrMySQL.LogEvent(strSql + " ORDER BY timestamp DESC", 0);

                    // get trips
                    dbRdr = dbMgr.ExecuteReader(strSql + " ORDER BY timestamp DESC");
                    if ((dbRdr != null) && dbRdr.HasRows)
                    {
                        // loop through records
                        while (dbRdr.Read())
                        {
                            // build trip info
                            TripZoneInfo udtTripsZone = new TripZoneInfo();
                            udtTripsZone.TripsZoneID = dbRdr.ToInt32("tripzone_id");
                            udtTripsZone.AssetID = dbRdr.ToInt32("asset_id");
                            udtTripsZone.AssetName = dbRdr.ToString("AssetName");
                            udtTripsZone.CompanyID = dbRdr.ToInt32("company_id");
                            udtTripsZone.CompanyName = dbRdr.ToString("CompanyName");
                            udtTripsZone.Timestamp = dbRdr.ToDateTime("timestamp");
                            udtTripsZone.TripID = dbRdr.ToInt32("trip_id");
                            udtTripsZone.ZoneID = dbRdr.ToInt32("zone_id");
                            udtTripsZone.ZoneName = dbRdr.ToString("name");

                            arrTripsInfo.Add(udtTripsZone);
                        }
                    }
                        if (dbRdr != null) dbRdr.Close();
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "GetTripsZone");
            }

            // close database
            dbMgr.Close();
            return arrTripsInfo;
        }

        /// <summary>
        /// regenerates trips
        /// [Dan:04Oct2013] For convinience of users in cases previous generated trips are wrong
        /// </summary>
        /// <returns></returns>
        public List<TripInfo> RegenTrips(string assetname, DateTime startdate, DateTime enddate)
        {
            //[Dan:10Jun14] SUpport for Track Archive
            //DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL(ConfigurationManager.AppSettings["ConnectionString2"]);
            DatabaseMgrMySQL dbMgr = GetDatabaseConnection(startdate);

            DbDataReader dbRdr = null;
            List<TripInfo> arrTrips = new List<TripInfo>();
            string strRet = "";
            object objTemp = null;
            try
            {
                //Regenerate Events Zone In/Out
                //Loop positions and get zone in/out
                if (dbMgr.Open())
                {
                    AssetInfo udtAsset = GetPartialAssetInfo(assetname);
                    if (udtAsset == null || udtAsset.Name != assetname)
                    {
                        DatabaseMgrMySQL.LogError(string.Format("Asset {0} not found", assetname), "Regenerate Trips");
                        return arrTrips;
                    }

                    // initialize sql command
                    string strSql = "SELECT * FROM view_positions";
                    strSql += String.Format(" WHERE timestamp BETWEEN '{0:dd-MMM-yyyy HH:mm:ss}' AND '{1:dd-MMM-yyyy HH:mm:ss}'", startdate, enddate);
                    strSql += String.Format(" AND asset_id= {0} ", udtAsset.AssetID);
                    // get positions
                    dbRdr = dbMgr.ExecuteReader(strSql + " ORDER BY timestamp");
                    if ((dbRdr != null) && dbRdr.HasRows)
                    {

                        PosInfo udtPos = null;

                        Int32 iPrevZone = 0;
                        long iPrevPos = 0;
                        
                        // loop through positions
                        while (dbRdr.Read())
                        {
                            udtPos = BuildPosition(dbRdr);
                            if (udtPos != null && udtPos.PosID > 0)
                            {
                                DatabaseMgrMySQL dbMgr4= new DatabaseMgrMySQL();
                                objTemp = dbMgr4.ExecuteScalar("SELECT TOP(1) mileage FROM positions WHERE pos_id = @PosID", new object[] { udtPos.PosID });
                                if (objTemp != null) udtPos.Mileage = Convert.ToDouble(objTemp);
                                dbMgr4.Close();

                                if (udtPos.ZoneID != 0 && iPrevZone == 0)
                                {
                                    EnterZone(udtPos);
                                }
                                else if (udtPos.ZoneID == 0 && iPrevZone > 0) //Zone Exit
                                {
                                    ExitZone(udtAsset, udtPos, iPrevPos);
                                }
                                else if (iPrevZone != udtPos.ZoneID && iPrevZone != 0 && udtPos.ZoneID !=0) //Position Jump from project site to another project site
                                {
                                    DatabaseMgrMySQL dbMgr3 = new DatabaseMgrMySQL();
                                    PosInfo udtLastPos = GetPosition(ref dbMgr3, iPrevPos);
                                    dbMgr3.Close();
                                    objTemp = dbMgr4.ExecuteScalar("SELECT TOP(1) mileage FROM positions WHERE pos_id = @PosID", new object[] { udtLastPos.PosID });
                                    if (objTemp != null) udtLastPos.Mileage = Convert.ToDouble(objTemp);
                                    dbMgr4.Close();

                                    ExitZone(udtAsset, udtLastPos, iPrevPos); //Use the last position from prev project site
                                    EnterZone(udtPos); 
                                }
                                iPrevZone = udtPos.ZoneID;
                                iPrevPos = udtPos.PosID;
                            }
                        }
                    }
                    if (dbRdr != null) dbRdr.Close();
                }
            }
            catch (Exception ex)
            {
                // log error
                strRet = DatabaseMgrMySQL.LogError(ex.Message, "RegenerateTrips");
            }

            // close database
            if (dbRdr != null) dbRdr.Close();
            dbMgr.Close();
            return arrTrips;
        }

        private void EnterZone(PosInfo udtPos)
        {
            try
            {
                EventInfo udtEvent = new EventInfo();
                udtEvent.AssetID = udtPos.AssetID;
                udtEvent.Asset = udtPos.Asset;
                udtEvent.TagID = udtPos.TagID;
                udtEvent.Tag = udtPos.Tag;
                udtEvent.AckUserID = 1;

                // initialize event
                udtEvent.PosID = udtPos.PosID;
                udtEvent.AlertLevel = 0;
                udtEvent.Timestamp = udtPos.Timestamp;
                udtEvent.RxTime = udtPos.RxTime;

                //Save Event:Enter Zone
                udtEvent.EventID = 17;
                udtEvent.Event = "Zone Enter";
                udtEvent.Remarks = udtPos.Zone;
                udtEvent.Flag = 1;
                string ret = RegenEventZoneInOut(udtEvent, true, false);
                if (ret != "") DatabaseMgrMySQL.LogEvent(String.Format("Enter Zone: {0}", ret), 1);
            }
            catch (Exception ex)
            {
                DatabaseMgrMySQL.LogEvent("EnterZone: " + ex.Message, 1);

            }

            
        }

        private void ExitZone(AssetInfo udtAsset, PosInfo udtPos, long iPrevPos)
        {
            try 
            { 
                DatabaseMgrMySQL dbMgr3 = new DatabaseMgrMySQL();
                PosInfo udtLastPos = GetPosition(ref dbMgr3, iPrevPos);
                dbMgr3.Close();

                //Trigger Zone Exit with last pos
                //Save Event:Exit Zone
                EventInfo udtEvent = new EventInfo();
                udtEvent.AssetID = udtPos.AssetID;
                udtEvent.Asset = udtPos.Asset;
                udtEvent.TagID = udtPos.TagID;
                udtEvent.Tag = udtPos.Tag;
                udtEvent.PosID = udtPos.PosID;
                udtEvent.Timestamp = udtPos.Timestamp;
                udtEvent.RxTime = udtPos.RxTime;
                udtEvent.EventID = 18;
                udtEvent.Event = "Zone Exit";
                udtEvent.Remarks = udtLastPos.Zone;
                udtEvent.Flag = 1;
                string ret1 = RegenEventZoneInOut(udtEvent, true, false);
                if (ret1 != "") DatabaseMgrMySQL.LogEvent(String.Format("Exit Zone: {0}", ret1), 1);

                SaveTripInfo(udtAsset, udtPos, udtLastPos.ZoneID, udtEvent);
            }
            catch (Exception ex)
            {
                DatabaseMgrMySQL.LogEvent("EzitZone: " + ex.Message, 1);
            }

            
        }

        private void SaveTripInfo(AssetInfo udtAsset, PosInfo udtPos, Int32 iPrevZone, EventInfo udtEvent)
        {
            //Save Trip
            #region TRIPS REPORT
            try
            {

                // check zone exit event
                // save trips matching destination
                DatabaseMgrMySQL dbMgr2 = new DatabaseMgrMySQL();
                if (dbMgr2.Open())
                {
                    List<PlanInfo> arrPlans = GetPlans(ref dbMgr2, iPrevZone, udtAsset.Company);
                    if (dbMgr2.IsOpen()) dbMgr2.Close();
                    if (arrPlans.Count > 0)
                    {
                        if (dbMgr2.Open())
                            SaveTrips(ref dbMgr2, udtPos, arrPlans);

                        TripZoneInfo newTripZone = new TripZoneInfo();
                        newTripZone.ZoneName = udtEvent.Remarks;
                        newTripZone.ZoneID = iPrevZone;
                        newTripZone.AssetID = udtPos.AssetID;
                        newTripZone.AssetName = udtPos.Asset;
                        newTripZone.CompanyID = udtAsset.CompanyID;
                        newTripZone.CompanyName = udtAsset.Company;
                        newTripZone.Timestamp = udtPos.Timestamp;
                        
                        //save to trips zone report [Dan:23DEC12]
                        SaveTripsZone(newTripZone);
                    }
                }
                if (dbMgr2.IsOpen()) dbMgr2.Close();
            }

            catch (Exception ex) { DatabaseMgrMySQL.LogError(ex.Message, "RegenTrips"); }
            #endregion
        }

        /// <summary>
        /// generates trips
        /// </summary>
        /// <returns></returns>
        public string GenerateTrips(int iCompanyID)
        {
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL(ConfigurationManager.AppSettings["ConnectionString2"]);
            DbDataReader dbRdr = null;
            string strRet = "";
            object objTemp = null;
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // initialize query
                    string strSql = String.Format("SELECT plans.*, zones.name AS origin, companies.name AS company FROM plans " +
                        "INNER JOIN zones ON plans.origin_id = zones.zone_id " +
                        "INNER JOIN companies ON plans.company_id = companies.company_id " +
                        "WHERE plans.last_trip < plans.timestamp AND plans.company_id = {0}", iCompanyID);
                    
                    // get trip plans
                    List<PlanInfo> arrPlans = new List<PlanInfo>();
                    dbRdr = dbMgr.ExecuteReader(strSql);
                    if ((dbRdr != null) && dbRdr.HasRows)
                    {
                        // loop through records
                        while (dbRdr.Read())
                            arrPlans.Add(BuildPlan(dbRdr));
                    }
                    if (dbRdr != null) dbRdr.Close();

                    // check plans
                    if (arrPlans.Count > 0)
                    {
                        // get zone exit event id
                        objTemp = dbMgr.ExecuteScalar("SELECT status_id FROM status WHERE status_desc = 'Zone Exit'");
                        int iStatusID = (objTemp != null ? Convert.ToInt32(objTemp) : 0);

                        // loop through trip plans
                        foreach (PlanInfo udtPlan in arrPlans)
                        {
                            // get destination zone name
                            objTemp = dbMgr.ExecuteScalar(String.Format("SELECT TOP(1) name FROM zones " +
                                "WHERE zone_id = {0}", udtPlan.DestinationID));
                            if (objTemp != null) udtPlan.Destination = objTemp.ToString();

                            // get all destination exit events
                            strSql = String.Format("SELECT pos_id FROM view_events WHERE timestamp BETWEEN '{0:dd-MMM-yyyy HH:mm:ss}' AND '{1:dd-MMM-yyyy HH:mm:ss}' " +
                                "AND status_id = {2} AND remarks = '{3}' AND company_id = {4}", udtPlan.LastTrip,
                                udtPlan.LastTrip.AddDays(1), iStatusID, udtPlan.Destination, iCompanyID);

                            // get positions during destination exits
                            List<long> arrPosIds = new List<long>();
                            dbRdr = dbMgr.ExecuteReader(String.Format("{0} ORDER BY timestamp", strSql));
                            if ((dbRdr != null) && dbRdr.HasRows)
                            {
                                // read events
                                while (dbRdr.Read())
                                    arrPosIds.Add(dbRdr.ToInt64("pos_id"));
                            }
                            if (dbRdr != null) dbRdr.Close();

                            // loop through destination exits
                            foreach (long iPosID in arrPosIds)
                            {
                                // generate trips for each destination exit event
                                PosInfo udtPos = GetPosition(ref dbMgr, iPosID);
                                SaveTrips(ref dbMgr, udtPos, new List<PlanInfo>() { udtPlan });
                            }

                            // update last trip timestamp
                            dbMgr.ExecuteNonQuery("UPDATE plans SET last_trip = @LastTrip WHERE plan_id = @PlanID",
                                new object[] { udtPlan.LastTrip.AddDays(1), udtPlan.PlanID });
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                strRet = DatabaseMgrMySQL.LogError(ex.Message, "GenerateTrips");
            }

            // close database
            if (dbRdr != null) dbRdr.Close();
            dbMgr.Close();
            return strRet;
        }

        /// <summary>
        /// deletes trip record
        /// </summary>
        /// <param name="iTripID"></param>
        /// <returns></returns>
        public string DeleteTrip(long iTripID)
        {
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            DbDataReader dbRdr = null;
            string strRet = "";
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // delete trip from database
                    dbMgr.ExecuteNonQuery(String.Format("DELETE FROM trips WHERE trip_id = {0}", iTripID));
                }
            }
            catch (Exception ex)
            {
                // log error
                strRet = DatabaseMgrMySQL.LogError(ex.Message, "DeleteTrip");
            }

            // close database
            dbMgr.Close();
            if (dbRdr != null) dbRdr.Close();
            return strRet;
        }

        /// <summary>
        /// gets distinct names of database records
        /// </summary>
        /// <returns></returns>
        public List<NameInfo> GetNames(int iType, int iUserID)
        {
            List<NameInfo> arrNames = new List<NameInfo>();
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            DbDataReader dbRdr = null;
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    string strFields = "";
                    string strTable = "";                    
                    string strFilter = "";
                    string strOrder = "";

                    // check filter type
                    switch (iType)
                    {
                    case 0:
                        {
                            // get user names
                            strFields = "user_id, name";
                            strTable = "users";
                            strOrder = " ORDER BY name";

                            // check if non-admin
                            if (GetUserRole(ref dbMgr, iUserID) > 0)
                                strFilter = String.Format(" WHERE company_id = (SELECT company_id FROM users WHERE user_id = {0})", iUserID);
                        }
                        break;
                    case 1:
                        {
                            // get zone names
                            strFields = "zone_id, name";
                            strTable = "zones";
                            strOrder = " ORDER BY name";

                            // check if non-admin
                            if (GetUserRole(ref dbMgr, iUserID) > 0)
                                strFilter = String.Format(" WHERE company_id = (SELECT company_id FROM users WHERE user_id = {0})", iUserID);
                            else strFilter = " WHERE zone_id > 0";
                        }
                        break;
                    case 2:
                        {
                            // get tag names
                            strFields = "tags.tag_id, tags.name";
                            strTable = "tags LEFT JOIN assets ON tags.tag_id = assets.tag_id";
                            strOrder = " ORDER BY name";

                            // check if non admin
                            if (GetUserRole(ref dbMgr, iUserID) > 0)
                            {
                                // get free tags and tags assigned to company assets
                                strFilter = String.Format(" WHERE tags.tag_id NOT IN (SELECT tag_id FROM assets WHERE tag_id <> 0) " +
                                    "OR assets.company_id = (SELECT company_id FROM users WHERE user_id = {0})", iUserID);
                            }
                            else strFilter = " WHERE tags.tag_id > 0";
                        }
                        break;
                    case 3:
                        {
                            // get asset names
                            strFields = "asset_id, name";
                            strTable = "assets";
                            strOrder = " ORDER BY name";

                            // check if non-admin
                            if (GetUserRole(ref dbMgr, iUserID) > 0)
                            {
                                // limit assets to user's company only
                                strFilter = String.Format(" WHERE company_id = (SELECT company_id FROM users WHERE user_id = {0})", iUserID);
                                object objTemp = dbMgr.ExecuteScalar(String.Format("SELECT assets FROM users WHERE user_id = {0}", iUserID));
                                if ((objTemp != null) && (objTemp.ToString() != ""))
                                    strFilter += String.Format(" AND asset_id IN ({0})", objTemp);
                            }
                            else strFilter = " WHERE asset_id > 0";
                        }
                        break;
                    case 4:
                        {
                            // get event types
                            strFields = "status_id, status_desc";
                            strTable = "status";
                            strFilter = " WHERE flag = 1";
                            strOrder = " ORDER BY status_desc";
                        }
                        break;
                    case 5:
                        {
                            // get user roles
                            strFields = "role_id, role_desc";
                            strTable = "roles";
                            strOrder = " ORDER BY role_id";
                        }
                        break;
                    case 6:
                        {
                            // get categories
                            strFields = "category_id, category_desc";
                            strTable = "categories";
                            strOrder = " ORDER BY category_id";

                            // check if non-admin
                            if (GetUserRole(ref dbMgr, iUserID) > 0)
                            {
                                // get categories enabled for company
                                object objTemp = dbMgr.ExecuteScalar(String.Format("SELECT categories FROM companies " +
                                    "WHERE company_id = (SELECT company_id FROM users WHERE user_id = {0})", iUserID));
                                if (objTemp != null) strFilter = String.Format(" WHERE category_id IN ({0})", objTemp);
                            }
                        }
                        break;
                    case 7:
                        {
                            // get companies
                            strFields = "company_id, name";
                            strTable = "companies";
                            strOrder = " ORDER BY name";

                            // check if non-admin
                            if (GetUserRole(ref dbMgr, iUserID) > 0)
                                strFilter = String.Format(" WHERE company_id = (SELECT company_id FROM users WHERE user_id = {0})", iUserID);
                        }
                        break;
                    case 8:
                        {
                            // get zone types
                            strFields = "type_id, name";
                            strTable = "zone_types";
                            strOrder = " ORDER BY name";
                        }
                        break;
                    case 9:
                        {
                            // get report types
                            strFields = "report_id, name";
                            strTable = "reports";
                            strOrder = " ORDER BY name";

                            // check if non-admin
                            if (GetUserRole(ref dbMgr, iUserID) > 0)
                            {
                                // get reports enabled for company
                                object objTemp = dbMgr.ExecuteScalar(String.Format("SELECT reports FROM companies " +
                                    "WHERE company_id = (SELECT company_id FROM users WHERE user_id = {0})", iUserID));
                                if (objTemp != null) strFilter = String.Format(" WHERE report_id IN ({0})", objTemp);
                            }
                        }
                        break;
                    case 10:
                        {
                            // get languages
                            strFields = "language_id, name";
                            strTable = "languages";
                            strOrder = " ORDER BY name";
                        }
                        break;
                    }

                    // check table and field
                    if ((strTable != "") && (strFields != ""))
                    {
                        // get names
                        dbRdr = dbMgr.ExecuteReader(String.Format("SELECT DISTINCT {0} FROM {1}{2}{3}",
                            strFields, strTable, strFilter, strOrder));
                        if ((dbRdr != null) && dbRdr.HasRows)
                        {
                            // loop through records
                            while (dbRdr.Read())
                            {
                                // check info
                                if ((dbRdr[0] != DBNull.Value) && (dbRdr[1] != DBNull.Value))
                                {
                                    // build name info
                                    NameInfo udtName = new NameInfo();
                                    udtName.NameID = Convert.ToInt32(dbRdr[0]);
                                    udtName.Name = dbRdr[1].ToString();
                                    if (udtName.Name.Trim() != "")
                                        arrNames.Add(udtName);
                                }
                            }
                        }
                        if (dbRdr != null) dbRdr.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "GetNames");
            }

            // close database
            if (dbRdr != null) dbRdr.Close();
            dbMgr.Close();
            return arrNames;
        }

        /// <summary>
        /// downloads event records
        /// </summary>
        /// <param name="evtFilter"></param>
        /// <param name="iUserID"></param>
        /// <returns></returns>
        public List<EventInfo> GetEvents(EventInfo evtFilter, int iUserID, string strCompany)
        {
            List<EventInfo> arrEvents = new List<EventInfo>();

            //[Dan:10Jun14] Support for Archive database
            //DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL(ConfigurationManager.AppSettings["ConnectionString2"]);
            DatabaseMgrMySQL dbMgr = GetDatabaseConnection(evtFilter.Timestamp);

            DbDataReader dbRdr = null;
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // initialize sql command
                    string strSql = String.Format("SELECT TOP {0} * FROM view_events", ConfigurationManager.AppSettings["DownloadCount"]);
                    strSql += String.Format(" WHERE timestamp BETWEEN '{0:dd-MMM-yyyy HH:mm:ss}' AND '{1:dd-MMM-yyyy HH:mm:ss}'", evtFilter.Timestamp, evtFilter.RxTime);
                    if (evtFilter.EventID > 0) strSql += String.Format(" AND event_id < {0}", evtFilter.EventID);
                    if (evtFilter.Event != "") strSql += String.Format(" AND status_id IN ({0})", evtFilter.Event);
                    if (evtFilter.Remarks != "") strSql += String.Format(" AND remarks LIKE '%{0}%'", evtFilter.Remarks);
                    if (evtFilter.AssetID > 0) strSql += String.Format(" AND asset_id = {0}", evtFilter.AssetID);
                    else if (GetUserRole(ref dbMgr, iUserID) > 0)
                    {
                        // filter by company
                        object objTemp = dbMgr.ExecuteScalar(String.Format("SELECT company_id FROM users WHERE user_id = {0}", iUserID));
                        if (objTemp != null) strSql += String.Format(" AND company_id = {0}", objTemp);

                        // limit to assigned assets only
                        objTemp = dbMgr.ExecuteScalar(String.Format("SELECT assets FROM users WHERE user_id = {0}", iUserID));
                        if ((objTemp != null) && (objTemp.ToString() != ""))
                            strSql += String.Format(" AND asset_id IN ({0})", objTemp);
                    }
                    else
                    {
                        // filter by company
                        object objTemp = dbMgr.ExecuteScalar(String.Format("SELECT company_id FROM companies WHERE name = '{0}'", strCompany));
                        if (objTemp != null) strSql += String.Format(" AND company_id = {0}", objTemp);
                    }
                                        
                    // get events
                    dbRdr = dbMgr.ExecuteReader(strSql + " ORDER BY timestamp DESC");
                    if ((dbRdr != null) && dbRdr.HasRows)
                    {
                        // read events
                        while (dbRdr.Read())
                        {
                            // set event parameters
                            EventInfo udtEvent = new EventInfo();
                            udtEvent.EventID = dbRdr.ToInt64("event_id");
                            udtEvent.TagID = dbRdr.ToInt32("tag_id");
                            udtEvent.Tag = dbRdr.ToString("tag");
                            udtEvent.AssetID = dbRdr.ToInt32("asset_id");
                            udtEvent.Asset = dbRdr.ToString("asset");
                            udtEvent.StatusID = dbRdr.ToInt32("status_id");
                            udtEvent.Event = dbRdr.ToString("status_desc");
                            udtEvent.Remarks = dbRdr.ToString("remarks");
                            udtEvent.AlertLevel = dbRdr.ToInt32("alert_level_ex");
                            udtEvent.Flag = dbRdr.ToInt32("flag");
                            udtEvent.Timestamp = dbRdr.ToDateTime("timestamp");
                            udtEvent.RxTime = dbRdr.ToDateTime("rx_time");                            
                            udtEvent.AckUser = dbRdr.ToString("user_ack");
                            udtEvent.AckTime = dbRdr.ToDateTime("ack_time");
                            udtEvent.PosID = dbRdr.ToInt64("pos_id");
                            udtEvent.CompanyID = dbRdr.ToInt32("company_id");

                            // add event to list
                            arrEvents.Add(udtEvent);
                        }
                    }
                    if (dbRdr != null) dbRdr.Close();

                    // loop through events
                    foreach (EventInfo udtEvent in arrEvents)
                    {
                        // get event position
                        udtEvent.Position = GetPosition(ref dbMgr, udtEvent.PosID);
                        udtEvent.Driver = (udtEvent.Position != null ? udtEvent.Position.Driver : "");
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "GetEvents");
            }

            // close database
            if (dbRdr != null) dbRdr.Close();
            dbMgr.Close();
            return arrEvents;
        }

        /// <summary>
        /// saves event record
        /// </summary>
        /// <param name="udtEvent"></param>
        /// <returns></returns>
        public string SaveEvent(EventInfo udtEvent)
        {
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            string strRet = "";
            try
            {
                // save event
                strRet = SaveEvent(ref dbMgr, udtEvent, true, true);
            }
            catch (Exception ex)
            {
                // log error
                strRet = DatabaseMgrMySQL.LogError(ex.Message, "SaveEvent");
            }

            // close database
            dbMgr.Close();
            return strRet;
        }

        /// <summary>
        /// saves event record
        /// </summary>
        /// <param name="udtEvent"></param>
        /// <returns></returns>
        public string SaveEvent(ref DatabaseMgrMySQL dbMgr, EventInfo udtEvent, bool bRemarks, bool bNotify)
        {
            DbDataReader dbRdr = null;
            string strRet = "";
            object objTemp = null;
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // check tag
                    if (udtEvent.Tag != "")
                    {
                        // get asset
                        AssetInfo udtAsset = GetAsset(ref dbMgr, udtEvent.Tag);
                        if (udtAsset != null)
                        {
                            // update asset info
                            udtEvent.Asset = udtAsset.Name;
                            udtEvent.AssetID = udtAsset.AssetID;
                            udtEvent.TagID = udtAsset.TagID;
                            udtEvent.CompanyID = udtAsset.CompanyID;
                            udtEvent.PosID = udtAsset.LastFixID;
                        }
                    }

                    // check timestamp if invalid (device issue?)
                    if ((udtEvent.Timestamp.Year != udtEvent.RxTime.Year) && 
                        (udtEvent.Timestamp.Month == udtEvent.RxTime.Month))
                    {
                        // override year
                        udtEvent.Timestamp = new DateTime(udtEvent.RxTime.Year, udtEvent.Timestamp.Month, udtEvent.Timestamp.Day,
                            udtEvent.Timestamp.Hour, udtEvent.Timestamp.Minute, udtEvent.Timestamp.Second);
                    }

                    // check status id
                    if (udtEvent.StatusID == 0)
                    {
                        // get status id
                        objTemp = dbMgr.ExecuteScalar("SELECT status_id FROM status WHERE status_desc = @Event AND flag = 1",
                            new object[] { udtEvent.Event });
                        if (objTemp != null) udtEvent.StatusID = Convert.ToInt32(objTemp);
                        else return String.Format("{0} not supported.", udtEvent.Event);
                    }

                    //[24Oct2014:Chinky]Applied on RFID Event
                    //[Alrey:12Oct2013] Disabled cancelling of event for trips function purpose
                    //// initialize sql command
                    //string strFilter = String.Format("WHERE status_id = {0}", udtEvent.StatusID);
                    //if (udtEvent.AssetID > 0) strFilter += String.Format(" AND asset_id = {0}", udtEvent.AssetID);
                    //if (bRemarks && (udtEvent.Remarks != "")) strFilter += String.Format(" AND remarks = '{0}'", udtEvent.Remarks);
                    // check pending alert
                    /*
                    if (dbMgr.Exists(String.Format("SELECT TOP(1) event_id FROM events {0} AND (alert_level <> 0 OR flag <> 0 " +
                        "OR timestamp = '{1:dd-MMM-yyyy HH:mm:ss}')", strFilter, udtEvent.Timestamp)))
                    */

                    //if (udtEvent.EventID!=17 && udtEvent.EventID!=18 && dbMgr.Exists(String.Format("SELECT TOP(1) event_id FROM events {0} AND (alert_level > 0 OR flag > 0)", strFilter)))
                    //{
                    //    // prompt user to acknowledge pending alert
                    //    dbMgr.Close();
                    //    return String.Format("{0} alert still pending for {1}.", udtEvent.Event, udtEvent.Asset);
                    //}

                    // check if cell id network
                    if ((udtEvent.Event == "Cell ID") && udtEvent.Remarks.Contains("Network Info"))
                    {
                        // clear last cell id network
                        string strTemp = udtEvent.Remarks;
                        udtEvent.Remarks = "%Network Info%";
                        udtEvent.Flag = 0;
                        FlagEvent(udtEvent);

                        // continue saving new cell id network
                        udtEvent.Remarks = strTemp;
                        udtEvent.Flag = 1;
                    }

                    // initialize sql query
                    string strSql = "INSERT INTO events (asset_id, tag_id, timestamp, rx_time, status_id, " +
                        "remarks, alert_level, alert_level_ex, flag, ack_user, ack_time, pos_id) OUTPUT INSERTED.event_id " +
                        "VALUES (@AssetID, @TagID, @Timestamp, @RxTime, @StatusID, @Remarks, @AlertLevel, @AlertLevelEx, " +
                        "@Flag, @AckUserID, GETUTCDATE(), @PosID)";
                    object[] arrParams = new object[] { udtEvent.AssetID, udtEvent.TagID, udtEvent.Timestamp, udtEvent.RxTime, 
                        udtEvent.StatusID, udtEvent.Remarks, udtEvent.AlertLevel, udtEvent.AlertLevel, udtEvent.Flag, udtEvent.AckUserID, 
                        udtEvent.PosID };

                    // save event
                    objTemp = dbMgr.ExecuteScalar(strSql, arrParams);
                    if (objTemp != null) udtEvent.EventID = Convert.ToInt32(objTemp);

                    // check event
                    if (udtEvent.EventID > 0)
                    {
                        // check alert
                        if (udtEvent.AlertLevel != 0)
                        {
                            // update asset status
                            dbMgr.ExecuteNonQuery(String.Format("UPDATE assets SET status_id = {0}, last_event = {1} " +
                                "WHERE asset_id = {2}", udtEvent.StatusID, udtEvent.EventID, udtEvent.AssetID));
                            //dbMgr.ExecuteNonQuery(String.Format("UPDATE assets SET status_id = {0} " +
                            //    "WHERE asset_id = {1}", udtEvent.StatusID, udtEvent.AssetID));
                            SaveAssetInfo(ref dbMgr, PosInfoType.Event,udtEvent.EventID, udtEvent.AssetID,udtEvent.Timestamp);
                        }

                        // check event
                        switch (udtEvent.Event)
                        {
                        case "Mileage Report":
                            {
                                // update asset's mileage
                                string[] arrTemp = udtEvent.Remarks.Split(":".ToCharArray());
                                if (arrTemp.Length > 2)
                                {
                                    dbMgr.ExecuteNonQuery("UPDATE assets SET mileage = @Mileage WHERE asset_id = @AssetID",
                                        new object[] { Convert.ToDouble(arrTemp[2].Trim()), udtEvent.AssetID });

                                    SaveAssetInfo(ref dbMgr, PosInfoType.Mileage, Convert.ToInt64(arrTemp[2].Trim()), udtEvent.AssetID, udtEvent.Timestamp);
                                }
                            }
                            break;
                        case "Zone Enter":
                        case "Zone Exit":
                            {
                                // update asset's last enter/exit
                                dbMgr.ExecuteNonQuery(String.Format("UPDATE assets SET {0} = {1} WHERE asset_id = {2}",
                                    (udtEvent.Event == "Zone Enter" ? "last_enter" : "last_exit"), udtEvent.EventID, udtEvent.AssetID));
                                
                                if (udtEvent.Event == "Zone Enter")
                                {
                                    SaveAssetInfo(ref dbMgr, PosInfoType.Enter, udtEvent.EventID, udtEvent.AssetID, udtEvent.Timestamp);
                                }
                                else
                                {
                                    SaveAssetInfo(ref dbMgr, PosInfoType.Exit, udtEvent.EventID, udtEvent.AssetID, udtEvent.Timestamp);
                                }
                            }
                            break;
                        case "Ignition":
                            {
                                // update asset's ignition
                                dbMgr.ExecuteNonQuery("UPDATE assets SET ignition = @Ignition WHERE asset_id = @AssetID",
                                    new object[] { (udtEvent.Remarks.ToUpper().Contains("OFF") ? 0 : 1), udtEvent.AssetID });
                                SaveAssetInfo(ref dbMgr, PosInfoType.Ignition, (udtEvent.Remarks.ToUpper().Contains("OFF") ? 0 : 1), udtEvent.AssetID, udtEvent.Timestamp);
                            }
                            break;
                       
                        case "RFID":
                            {
                                if (bRemarks)//From Device
                                {
                                    EventInfo udtEventAlert = new EventInfo();
                                    udtEventAlert.StatusID = 47;//RFID Alert
                                    udtEventAlert.AckUserID = udtEvent.AckUserID;
                                    udtEventAlert.AssetID = udtEvent.AssetID;
                                    udtEventAlert.Event = "RFID Alert";
                                    udtEventAlert.Remarks = "";
                                    udtEventAlert.Timestamp = udtEvent.Timestamp;

                                    string strFilter = String.Format("WHERE status_id = {0}", udtEventAlert.StatusID);
                                    if (udtEvent.AssetID > 0) strFilter += String.Format(" AND asset_id = {0}", udtEventAlert.AssetID);
                                    //if (bRemarks && (udtEvent.Remarks != "")) strFilter += String.Format(" AND remarks = '{0}'", udtEventAlert.Remarks);

                                    // check pending alert
                                    string tmpSql = String.Format("SELECT TOP(1) event_id FROM events {0} AND (alert_level <> 0 OR flag <> 0 " +
                                        "OR timestamp = '{1:dd-MMM-yyyy HH:mm:ss}')", strFilter, udtEventAlert.Timestamp);
                                   
                                    if (dbMgr.Exists(tmpSql))
                                    {
                                        CancelEvent(udtEventAlert, true);
                                    }

                                    //[Chinky:20Oct2014] Update Driver on assets table to show current vehicle driver
                                    string drRFID = GetRFIDDriver(udtEvent.Remarks);
                                    try
                                    {
                                        dbMgr.ExecuteNonQuery("UPDATE assets SET driver = @Driver WHERE asset_id = @AssetID",
                                            new object[] { string.IsNullOrEmpty(drRFID) ? udtEvent.Remarks : drRFID, udtEvent.AssetID });
                                        SaveAssetInfo(ref dbMgr, PosInfoType.RFID, udtEvent.EventID, udtEvent.AssetID, udtEvent.Timestamp);
                                    }
                                    catch (Exception ex)
                                    {
                                        DatabaseMgrMySQL.LogError(ex.Message, "RFID-UpdateDriverName");
                                    }

                                }
                                else//Maybe From SavePosition 
                                {
                                    //TODO: Cancel previous alert when previous event already exists
                                    DatabaseMgrMySQL.LogEvent("RFID Event - From Save Position", 0);
                                }
                            }
                            break;
                        }

                        // send event notifications
                        if (bNotify)
                            NotifyEvent(ref dbMgr, udtEvent);
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                strRet = DatabaseMgrMySQL.LogError(ex.Message + "::\r\n" + udtEvent.Event, "SaveEvent");
            }

            // close database
            if (dbRdr != null) dbRdr.Close();
            return strRet;
        }


        /// <summary>
        /// saves event record
        /// </summary>
        /// <param name="udtEvent"></param>
        /// <returns></returns>
        private string RegenEventZoneInOut(EventInfo udtEvent, bool bRemarks, bool bNotify)
        {

            //DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            DatabaseMgrMySQL dbMgr = GetDatabaseConnection(udtEvent.Timestamp);//[Dan:10Jun14]

            DbDataReader dbRdr = null;
            string strRet = "";
            object objTemp = null;
            try
            {
                // open database
                if (dbMgr.Open())
                {

                    // check timestamp if invalid (device issue?)
                    if ((udtEvent.Timestamp.Year != udtEvent.RxTime.Year) &&
                        (udtEvent.Timestamp.Month == udtEvent.RxTime.Month))
                    {
                        // override year
                        udtEvent.Timestamp = new DateTime(udtEvent.RxTime.Year, udtEvent.Timestamp.Month, udtEvent.Timestamp.Day,
                            udtEvent.Timestamp.Hour, udtEvent.Timestamp.Minute, udtEvent.Timestamp.Second);
                    }

                    // check status id
                    if (udtEvent.StatusID == 0)
                    {
                        // get status id
                        objTemp = dbMgr.ExecuteScalar("SELECT status_id FROM status WHERE status_desc = @Event AND flag = 1",
                            new object[] { udtEvent.Event });
                        if (objTemp != null) udtEvent.StatusID = Convert.ToInt32(objTemp);
                        else
                        {
                            // event not enabled
                            dbMgr.Close();
                            return String.Format("{0} not supported.", udtEvent.Event);
                        }
                    }

                    // initialize sql command
                    string strFilter = String.Format("WHERE status_id = {0}", udtEvent.StatusID);
                    if (udtEvent.AssetID > 0) strFilter += String.Format(" AND asset_id = {0}", udtEvent.AssetID);
                    if (bRemarks && (udtEvent.Remarks != "")) strFilter += String.Format(" AND remarks = '{0}'", udtEvent.Remarks);

                    //[Alrey:12Oct2013] Disabled for trips function purpose
                    // check pending alert

                    if (dbMgr.Exists(String.Format("SELECT TOP(1) event_id FROM events {0} AND timestamp = @TimeStamp", strFilter),new object[]{udtEvent.Timestamp}))
                    {
                        dbMgr.Close();
                        return "Event already exist";
                    }

                    // initialize sql query
                    string strSql = "INSERT INTO events (asset_id, tag_id, timestamp, rx_time, status_id, " +
                        "remarks, alert_level, alert_level_ex, flag, ack_user, ack_time, pos_id) OUTPUT INSERTED.event_id " +
                        "VALUES (@AssetID, @TagID, @Timestamp, @RxTime, @StatusID, @Remarks, @AlertLevel, @AlertLevelEx, " +
                        "@Flag, @AckUserID, GETUTCDATE(), @PosID)";
                    object[] arrParams = new object[] { udtEvent.AssetID, udtEvent.TagID, udtEvent.Timestamp, udtEvent.RxTime, 
                        udtEvent.StatusID, udtEvent.Remarks, udtEvent.AlertLevel, udtEvent.AlertLevel, udtEvent.Flag, udtEvent.AckUserID, 
                        udtEvent.PosID };

                    // save event
                    objTemp = dbMgr.ExecuteScalar(strSql, arrParams);
                    if (objTemp != null)
                    {
                        udtEvent.EventID = Convert.ToInt32(objTemp);
                        DatabaseMgrMySQL.LogEvent(string.Format("Event created:{0}", udtEvent.EventID), 1);
                    }
                    else
                    {
                        DatabaseMgrMySQL.LogEvent(string.Format("Event not created:{0}", strSql), 1);
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                strRet = DatabaseMgrMySQL.LogError(ex.Message, "RegenEventZoneInOut");
            }

            // close database
            if (dbRdr != null) dbRdr.Close();
            dbMgr.Close();
            return strRet;
        }

        //private static bool SaveZoneTapInfo(EventInfo udtEvent, DatabaseMgrMySQL dbMgr)
        //{
        //    try
        //    {
        //        //RFID Tap from zone location
        //        object objZoneTap = dbMgr.ExecuteScalar("SELECT zonetap_id FROM zonetap WHERE " +
        //            "tag = @Tag AND tap_out is NULL AND rfid = @RFID AND tap_in >= @Today", new object[] { udtEvent.Tag, udtEvent.RFID, DateTime.Today.ToUniversalTime() });


        //        if (objZoneTap != DBNull.Value && objZoneTap != null)
        //        {
        //            object objTapIn = dbMgr.ExecuteScalar("SELECT tap_in FROM zonetap WHERE zonetap_id=@ID", new object[] { objZoneTap });
        //            DateTime tapin = Convert.ToDateTime(objTapIn);
        //            if ((udtEvent.Timestamp - tapin).Minutes >= 3)
        //            {
        //                //Tap Out
        //                dbMgr.ExecuteNonQuery("UPDATE zonetap SET tap_out = @TapOut, zoneloc_out = @ZoneOut, asset=@Asset, remarks=@REMARKS WHERE zonetap_id = @ZoneTapID",
        //                    new object[] { DateTime.UtcNow, udtEvent.Location, udtEvent.Asset, udtEvent.Remarks, Convert.ToInt32(objZoneTap) });
        //            }
        //            else
        //            {
        //                DatabaseMgrMySQL.LogEvent(string.Format("SaveZoneTapInfo TapIn Disregarded: Timestamp [{0}] LastTapIn: [{1}] Asset: [{2}] RFID:[{3}]", udtEvent.Timestamp, objTapIn, udtEvent.Asset, udtEvent.RFID), 1);
        //                return false;
        //            }
        //        }
        //        else
        //        {
        //            object objTapOut = dbMgr.ExecuteScalar("SELECT Top 1 tap_out FROM zonetap WHERE tag = @Tag and rfid = @RFID AND tap_in >= @Today AND tap_out is not NULL Order by zonetap_id desc ", new object[] { udtEvent.Tag, udtEvent.RFID, DateTime.Today.ToUniversalTime() });
        //            if (objZoneTap == DBNull.Value || objZoneTap == null || (udtEvent.Timestamp - Convert.ToDateTime(objTapOut)).Minutes >= 3)
        //            {
        //                //Tap In
        //                // initialize sql query
        //                string strSql1 = "Insert Into zonetap (rfid,tag,tap_in,tap_out,zoneloc_in,zoneloc_out,asset,remarks) OUTPUT INSERTED.zonetap_id VALUES (@Rfid,@Tag,@TapIn,NULL,@ZoneIn,NULL,@Asset,@Remarks)";
        //                object[] arrParams1 = new object[] { udtEvent.RFID, udtEvent.Tag, DateTime.UtcNow, udtEvent.Location, udtEvent.Asset, udtEvent.Remarks };

        //                // save new zonetapinfo
        //                dbMgr.ExecuteScalar(strSql1, arrParams1);
        //            }
        //            else
        //            {
        //                DatabaseMgrMySQL.LogEvent(string.Format("SaveZoneTapInfo TapOut Disregarded: Timestamp [{0}] LastTapOut: [{1}] Asset: [{2}] RFID:[{3}]", udtEvent.Timestamp, objTapOut, udtEvent.Asset, udtEvent.RFID), 1);
        //                return false;
        //            }

        //        }
        //    }
        //    catch (Exception ex) { DatabaseMgrMySQL.LogEvent(ex.Message, 1); }
        //    return true;
        //}

        //private static void SaveZoneTapOut(EventInfo udtEvent, DatabaseMgrMySQL dbMgr)
        //{
        //    try
        //    {
        //        //RFID Tap from zone location
        //        object objZoneTap = dbMgr.ExecuteScalar("SELECT zonetap_id FROM zonetap WHERE " +
        //            "tag = @Tag AND tap_out is NULL AND rfid = @RFID AND tap_in >= @Today", new object[] { udtEvent.Tag, udtEvent.RFID, DateTime.Today.ToUniversalTime() });

        //        if (objZoneTap != null)
        //        {
        //            DatabaseMgrMySQL.LogEvent(string.Format("SaveZoneTapOut Tag: {0} RFID: {1}", udtEvent.Tag, udtEvent.RFID), 1);
        //            //Tap Out
        //            dbMgr.ExecuteNonQuery("UPDATE zonetap SET tap_out = @TapOut, zoneloc_out = @ZoneOut, asset=@Asset, remarks=@Remarks WHERE zonetap_id = @ZoneTapID",
        //                new object[] { DateTime.UtcNow, udtEvent.Location, udtEvent.Asset, udtEvent.Remarks, Convert.ToInt32(objZoneTap) });
        //        }
        //    }
        //    catch (Exception ex) { DatabaseMgrMySQL.LogEvent(ex.Message, 1); }
        //}


        /// <summary>
        /// sends event notifications
        /// </summary>
        /// <param name="udtEvent"></param>
        private void NotifyEvent(ref DatabaseMgrMySQL dbMgr, EventInfo udtEvent)
        {
            DbDataReader dbRdr = null;
            try
            {
                List<string> arrEmail = new List<string>();
                List<string> arrSms = new List<string>();

                // check alert level
                string strSender = "FIND-Fleet";
                switch (udtEvent.AlertLevel)
                {
                case 1: strSender += " WARNING"; break;
                case 2: strSender += " ALERT"; break;
                }

                // initialize message
                string strMessage = String.Format("{0}\r\n{1}\r\n{2}\r\n{3}\r\n{4:dd-MMM-yyyy HH:mm:ss}", 
                    strSender, udtEvent.Event,
                    udtEvent.Remarks, udtEvent.Asset, udtEvent.Timestamp.ToLocalTime());

                // get user contact info
                //dbRdr = dbMgr.ExecuteReader(String.Format("SELECT email, phone, notifications FROM users " +
                //    "WHERE company_id = {0} AND notifications LIKE '%{1}:%'", 
                //    udtEvent.CompanyID, udtEvent.StatusID));
                dbRdr = dbMgr.ExecuteReader(String.Format("SELECT email, phone, notifications, assets FROM users " +
                   "WHERE company_id = {0} AND notifications LIKE '%{1}:%'",
                   udtEvent.CompanyID, udtEvent.StatusID));

                if ((dbRdr != null) && dbRdr.HasRows)
                {
                    // loop through users
                    while (dbRdr.Read())
                    {
                        // [Dan:12Mar14] get assets limitation
                        bool isToSend = false;
                        string vehList = dbRdr.ToString("assets");
                        string[] arrVehicle = new string[1];
                        if(!string.IsNullOrEmpty(vehList))
                        {
                            arrVehicle = vehList.Split(",".ToCharArray());
                            foreach(string currVeh in arrVehicle)
                            {
                                if(currVeh == udtEvent.AssetID.ToString())
                                {
                                    isToSend = true;
                                    break;//found vehicle to send to
                                }
                                else
                                    isToSend = false;
                            }
                        }
                        else//no restrictions on vehicles
                        {
                            isToSend = true;
                        }

                        if (isToSend)
                        {
                            // get event notification setting
                            string[] arrNotify = dbRdr.ToString("notifications").Split(",".ToCharArray());
                            foreach (string strNotify in arrNotify)
                            {
                                // check event notification
                                string[] arrTemp = strNotify.Split(":".ToCharArray());
                                if ((arrTemp[0] == udtEvent.StatusID.ToString()) && (arrTemp.Length > 1) && (arrTemp[1].Length > 1))
                                {
                                    // get contact info
                                    string strEmail = dbRdr.ToString("email");
                                    string strPhone = dbRdr.ToString("phone");

                                    // include user to recipients
                                    if ((arrTemp[1].Substring(0, 1) == "1") && (strEmail != ""))
                                        ListContactInfo(ref arrEmail, strEmail);
                                    if ((arrTemp[1].Substring(1, 1) == "1") && (strPhone != ""))
                                        ListContactInfo(ref arrSms, strPhone);
                                    break;
                                }
                            }
                        }
                    }
                }
                if (dbRdr != null) dbRdr.Close();

                // get asset contact info
                dbRdr = dbMgr.ExecuteReader(String.Format("SELECT email, phone, notifications FROM assets " +
                    "WHERE asset_id = {0} AND notifications LIKE '%{1}:%'", udtEvent.AssetID, udtEvent.StatusID));
                if ((dbRdr != null) && dbRdr.HasRows && dbRdr.Read())
                {
                    // get event notification setting
                    string[] arrNotify = dbRdr.ToString("notifications").Split(",".ToCharArray());
                    foreach (string strNotify in arrNotify)
                    {
                        // check event notification
                        string[] arrTemp = strNotify.Split(":".ToCharArray());
                        if ((arrTemp[0] == udtEvent.StatusID.ToString()) && (arrTemp.Length > 1) && (arrTemp[1].Length > 1))
                        {
                            // get contact info
                            string strEmail = dbRdr.ToString("email");
                            string strPhone = dbRdr.ToString("phone");

                            // include asset to recipients
                            if ((arrTemp[1].Substring(0, 1) == "1") && (strEmail != ""))
                                ListContactInfo(ref arrEmail, strEmail);
                            if ((arrTemp[1].Substring(1, 1) == "1") && (strPhone != ""))
                                ListContactInfo(ref arrSms, strPhone);
                            break;
                        }
                    }
                }
                if (dbRdr != null) dbRdr.Close();

                // save message
                MessageInfo udtMessage = new MessageInfo();
                udtMessage.Sender = "FIND-Fleet";
                udtMessage.Message = strMessage;
                udtMessage.Timestamp = DateTime.Now.ToUniversalTime();
                udtMessage.StatusID = 1;
                udtMessage.CompanyID = udtEvent.CompanyID;
                udtMessage.AssetID = udtEvent.AssetID;
                                
                // loop through phone numbers
                foreach (string strPhone in arrSms)
                {
                    // send notification
                    udtMessage.Recipients = strPhone;
                    SaveMessage(ref dbMgr, udtMessage);
                }

                // loop through emails
                foreach (string strEmail in arrEmail)
                {
                    // send notification
                    udtMessage.Recipients = strEmail;
                    SaveMessage(ref dbMgr, udtMessage);
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "NotifyEvent");
            }

            // close database
            if (dbRdr != null) dbRdr.Close();
        }

        /// <summary>
        /// adds contact info to list of message recipients
        /// </summary>
        /// <param name="arrRecipients"></param>
        /// <param name="strContact"></param>
        private void ListContactInfo(ref List<string> arrRecipients, string strContact)
        {
            // loop through contact info
            string[] arrContact = strContact.Split(",".ToCharArray(), StringSplitOptions.RemoveEmptyEntries);
            foreach (string strTemp in arrContact)
            {
                // check contact info
                if (strTemp != "")
                {
                    // check contact if already added
                    if (!arrRecipients.Contains(strContact))
                        arrRecipients.Add(strContact);
                }
            }
        }

        /// <summary>
        /// cancels event
        /// </summary>
        /// <param name="udtEvent"></param>
        /// <returns></returns>
        public string CancelEvent(EventInfo udtEvent, bool bResetFlag)
        {
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            string strRet = "";
            try
            {
                // cancel event
                strRet = CancelEvent(ref dbMgr, udtEvent, bResetFlag);
            }
            catch (Exception ex)
            {
                // log error
                strRet = DatabaseMgrMySQL.LogError(ex.Message, "CancelEvent");
            }

            // close database
            dbMgr.Close();
            return strRet;
        }

        /// <summary>
        /// cancels event
        /// </summary>
        /// <param name="udtEvent"></param>
        /// <returns></returns>
        public string CancelEvent(ref DatabaseMgrMySQL dbMgr, EventInfo udtEvent, bool bResetFlag)
        {
            DbDataReader dbRdr = null;
            string strRet = "";
            object objTemp = null;
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // initialize sql query
                    string strSql = String.Format("UPDATE events SET alert_level = 0, ack_user = {0}, " +
                            "ack_time = GETUTCDATE(){1}", udtEvent.AckUserID, (bResetFlag ? ", flag = 0" : ""));

                    // check event
                    if (udtEvent.EventID > 0)
                    {
                        // cancel event
                        strSql += String.Format(" WHERE event_id = {0}", udtEvent.EventID);
                        dbMgr.ExecuteNonQuery(strSql);
                    }
                    else
                    {
                        // cancel event
                        strSql += " OUTPUT INSERTED.event_id WHERE asset_id = @AssetID AND status_id = " +
                            "(SELECT status_id FROM status WHERE status_desc = @Event) AND alert_level <> 0";
                        List<object> arrParams = new List<object>() { udtEvent.AssetID, udtEvent.Event };

                        // check remarks
                        if ((udtEvent.Remarks != null) && (udtEvent.Remarks != ""))
                        {
                            // check wildstring
                            if (udtEvent.Remarks.Contains("%"))
                                strSql += String.Format(" AND remarks LIKE '{0}'", udtEvent.Remarks);
                            else
                            {
                                // filter also by remarks
                                strSql += " AND remarks = @Remarks";
                                arrParams.Add(udtEvent.Remarks);
                            }
                        }

                        // cancel event
                        objTemp = dbMgr.ExecuteScalar(strSql, arrParams.ToArray());
                        if (objTemp != null) udtEvent.EventID = Convert.ToInt32(objTemp);
                    }

                    // check event
                    if (udtEvent.EventID > 0)
                    {
                        // check event type
                        if (udtEvent.Event == "Position Expired")
                        {
                            // get event timestamp
                            objTemp = dbMgr.ExecuteScalar(String.Format("SELECT timestamp FROM events WHERE event_id = {0}", udtEvent.EventID));
                            if (objTemp != null)
                            {
                                // get length of expiration
                                DateTime dtTimestamp = Convert.ToDateTime(objTemp);
                                TimeSpan tsDiff = (TimeSpan)(DateTime.Now.ToUniversalTime().AddMinutes(10.0) - dtTimestamp);
                                dbMgr.ExecuteNonQuery(String.Format("UPDATE events SET remarks = '{0:00}:{1:00}:{2:00}' " +
                                    "WHERE event_id = {3}", Math.Abs(tsDiff.Hours), Math.Abs(tsDiff.Minutes),
                                    Math.Abs(tsDiff.Seconds), udtEvent.EventID));
                            }
                        }
                        
                        // cancel alert
                        int iEventID = 0;
                        int iStatusID = 0;

                        // check other pending alert
                        strSql = String.Format("SELECT TOP(1) event_id, status_id FROM events WHERE " +
                            "asset_id = {0} AND alert_level <> 0 ORDER BY event_id DESC", udtEvent.AssetID);
                        dbRdr = dbMgr.ExecuteReader(strSql);
                        if (((dbRdr != null) && dbRdr.HasRows) && dbRdr.Read())
                        {
                            // get pending alert
                            iEventID = dbRdr.ToInt32("event_id");
                            iStatusID = dbRdr.ToInt32("status_id");
                        }
                        if (dbRdr != null) dbRdr.Close();

                        // update asset's status
                        dbMgr.ExecuteNonQuery(String.Format("UPDATE assets SET status_id = {0}, last_event = {1} " +
                            "WHERE asset_id = {2}", iStatusID, iEventID, udtEvent.AssetID));
                        SaveAssetInfo(ref dbMgr, PosInfoType.Event, udtEvent.EventID, udtEvent.AssetID, udtEvent.Timestamp);
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                strRet = DatabaseMgrMySQL.LogError(ex.Message, "CancelEvent");
            }

            // close database
            if (dbRdr != null) dbRdr.Close();
            return strRet;
        }

        /// <summary>
        /// cancel events
        /// </summary>
        /// <param name="udtEvents"></param>
        /// <returns></returns>
        public string CancelEvents(List<EventInfo> udtEvents)
        {
            string strRet = "";

            foreach (EventInfo udtEvent in udtEvents)
            {
                if ((CancelEvent(udtEvent, false) != "") && (strRet != ""))
                    strRet = "Not all events were cancelled successfully.";
            }

            return strRet;
        }

        /// <summary>
        /// updates event flag
        /// </summary>
        /// <param name="udtEvent"></param>
        /// <returns></returns>
        public string FlagEvent(EventInfo udtEvent)
        {
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            string strRet = "";
            try
            {
                // flag event
                strRet = FlagEvent(ref dbMgr, udtEvent);
            }
            catch (Exception ex)
            {
                // log error
                strRet = DatabaseMgrMySQL.LogError(ex.Message, "FlagEvent");
            }

            // close database
            dbMgr.Close();
            return strRet;
        }

        /// <summary>
        /// updates event flag
        /// </summary>
        /// <param name="udtEvent"></param>
        /// <returns></returns>
        public string FlagEvent(ref DatabaseMgrMySQL dbMgr, EventInfo udtEvent)
        {
            string strRet = "";
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // initialize sql command
                    string strFilter = "WHERE asset_id = @AssetID AND flag <> @Flag AND status_id = " +
                        "(SELECT status_id FROM status WHERE status_desc = @Event)";
                    List<object> arrParams = new List<object>() { udtEvent.AssetID, udtEvent.Flag, udtEvent.Event };

                    // check remarks
                    if ((udtEvent.Remarks != null) && (udtEvent.Remarks != ""))
                    {
                        // check wildstring
                        if (udtEvent.Remarks.Contains("%"))
                            strFilter += String.Format(" AND remarks LIKE '{0}'", udtEvent.Remarks);
                        else
                        {
                            // filter also by remarks
                            strFilter += " AND remarks = @Remarks";
                            arrParams.Add(udtEvent.Remarks);
                        }
                    }

                    // reset event flag
                    if (dbMgr.Exists("SELECT TOP(1) event_id FROM events " + strFilter, arrParams.ToArray()))
                        dbMgr.ExecuteNonQuery(String.Format("UPDATE events SET flag = {0} {1}",
                            udtEvent.Flag, strFilter), arrParams.ToArray());
                }
            }
            catch (Exception ex)
            {
                // log error
                strRet = DatabaseMgrMySQL.LogError(ex.Message, "FlagEvent");
            }
            return strRet;
        }

        /// <summary>
        /// use google maps' direction api
        /// </summary>
        /// <param name="origin"></param>
        /// <param name="destination"></param>
        /// <param name="avoid">tolls / highways</param>
        /// <param name="alternatives"></param>
        /// <param name="apiKeys"></param>
        /// <returns></returns>
        public List<GoogleRoute> GetDirections(string origin, string destination, string avoid,
            bool alternatives)
        {
            List<GoogleRoute> arrRoutes = null;

            try
            {
                WebClient webClient = new WebClient();

                #region URL SIGNING AND REQUEST
                string tempUri =
                    String.Format("http://maps.googleapis.com/maps/api/directions/xml?origin={0}&destination={1}" +
                    "&sensor=false&alternatives=true", origin, destination);
                if (avoid != "") tempUri += String.Format("&avoid={0}", avoid);

                tempUri += String.Format("&client={0}", ConfigurationManager.AppSettings["GoogleClientID"]);
                string strUri = Geocoder.SignGoogleUri(tempUri, ConfigurationManager.AppSettings["GoogleBusinessKey"]);
                string strXml = webClient.DownloadString(strUri);
                #endregion

                // check response
                if (strXml != "")
                {
                    // load xml document
                    XmlDocument xmlDoc = new XmlDocument();
                    xmlDoc.LoadXml(strXml);

                    // check if result is valid
                    var status = xmlDoc.GetElementsByTagName("status");
                    if (status[0].InnerText == "OK")
                    {
                        // check routes
                        var routes = xmlDoc.GetElementsByTagName("route");
                        if (routes != null)
                        {
                            // loop through the routes
                            arrRoutes = new List<GoogleRoute>();
                            foreach (XmlNode routeNode in routes)
                            {
                                // skip if route is invalid
                                if (routeNode == null)
                                    continue;

                                #region ROUTES
                                // build route info
                                GoogleRoute route = new GoogleRoute();
                                route.Steps = new List<GoogleStep>();
                                route.Summary = routeNode["summary"].InnerText;
                                route.TotalDuration = routeNode["leg"]["duration"]["text"].InnerText;
                                route.TotalDistance = routeNode["leg"]["distance"]["text"].InnerText;
                                route.EncodedPath = routeNode["overview_polyline"].InnerText;

                                #region STEPS

                                // get steps
                                var steps = routeNode["leg"].GetElementsByTagName("step");

                                // check for steps
                                if (steps != null)
                                {
                                    // loop through steps
                                    foreach (XmlNode stepNode in steps)
                                    {
                                        // build step
                                        GoogleStep step = new GoogleStep();
                                        step.Duration = stepNode["duration"].InnerText;
                                        step.Instruction = Regex.Replace(stepNode["html_instructions"].InnerText, "<.*?>", String.Empty);
                                        step.StartLoc = new RoutePoint();
                                        step.StartLoc.Latitude = Convert.ToDouble(stepNode["start_location"]["lat"].InnerText);
                                        step.StartLoc.Longitude = Convert.ToDouble(stepNode["start_location"]["lng"].InnerText);
                                        step.EndLoc = new RoutePoint();
                                        step.EndLoc.Latitude = Convert.ToDouble(stepNode["end_location"]["lat"].InnerText);
                                        step.EndLoc.Longitude = Convert.ToDouble(stepNode["end_location"]["lng"].InnerText);
                                        route.Steps.Add(step);
                                    }
                                }

                                #endregion
                                #endregion

                                arrRoutes.Add(route);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                DatabaseMgrMySQL.LogError(ex.Message, "GetDirections");
            }

            return arrRoutes;
        }

        /// <summary>
        /// gets position records
        /// </summary>
        /// <param name="posFilter"></param>
        /// <param name="iUserID"></param>
        /// <returns></returns>
        public List<PosInfo> GetPositions(PosInfo posFilter, int iUserID, string strCompany)
        {
            List<PosInfo> arrPos = new List<PosInfo>();
            DatabaseMgrMySQL dbMgr;
            string strSql = "";
            //[Alrey:11Dec2013] Config to disable position report
            //if (ConfigurationManager.AppSettings["DisablePosReport"] == "1" && iUserID > 1 && ConfigurationManager.AppSettings["DisablePosReport"].Contains("," + iUserID.ToString() + ",")==false) return arrPos;

            //[Chinky: 05Mar2014] Added Datetime checking to enable getting data from archive database
            dbMgr = GetDatabaseConnection(posFilter.Timestamp);

            DbDataReader dbRdr = null;
            try
            {
                // open database 
                if (dbMgr.Open())
                {
                    // initialize sql command
                    //string strSql = String.Format("SELECT TOP {0} * FROM view_positions", ConfigurationManager.AppSettings["DownloadCount"]);
                    
                    if(ConfigurationManager.AppSettings["Instance"] == "BUC")
                    {
                        strSql = String.Format("SELECT TOP {0} * FROM view_positions_fuel", ConfigurationManager.AppSettings["DownloadCount"]);
                    }
                    else
                    {
                        strSql = String.Format("SELECT TOP {0} * FROM view_positions", ConfigurationManager.AppSettings["DownloadCount"]);
                    }

                    strSql += String.Format(" WHERE timestamp BETWEEN '{0:dd-MMM-yyyy HH:mm:ss}' AND '{1:dd-MMM-yyyy HH:mm:ss}'", posFilter.Timestamp, posFilter.RxTime);
                    if (posFilter.PosID > 0) strSql += String.Format(" AND pos_id < {0}", posFilter.PosID);
                    if (posFilter.Speed > 0) strSql += String.Format(" AND speed >= {0} AND fix > 0", posFilter.Speed);
                    else if (posFilter.Fix != "") strSql += String.Format(" AND fix IN ({0})", posFilter.Fix);
                    if (posFilter.AssetID > 0) strSql += String.Format(" AND asset_id = {0}", posFilter.AssetID);
                    else if (GetUserRole(ref dbMgr, iUserID) > 0)
                    {
                        // filter by company
                        object objTemp = dbMgr.ExecuteScalar(String.Format("SELECT company_id FROM users WHERE user_id = {0}", iUserID));
                        if (objTemp != null) strSql += String.Format(" AND company_id = {0}", objTemp);

                        // limit to assigned assets only
                        objTemp = dbMgr.ExecuteScalar(String.Format("SELECT assets FROM users WHERE user_id = {0}", iUserID));
                        if ((objTemp != null) && (objTemp.ToString() != ""))
                            strSql += String.Format(" AND asset_id IN ({0})", objTemp);
                    }
                    else
                    {
                        // filter by company
                        object objTemp = dbMgr.ExecuteScalar(String.Format("SELECT company_id FROM companies WHERE name = '{0}'", strCompany));
                        if (objTemp != null) strSql += String.Format(" AND company_id = {0}", objTemp);
                    }

                    // get positions
                    dbRdr = dbMgr.ExecuteReader(strSql + " ORDER BY timestamp DESC");
                    if ((dbRdr != null) && dbRdr.HasRows)
                    {
                        // loop through positions
                        while (dbRdr.Read())
                            arrPos.Add(BuildPosition(dbRdr));

                    }
                    if (dbRdr != null) dbRdr.Close();
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "GetPositions");
            }

            // close database
            if (dbRdr != null) dbRdr.Close();
            dbMgr.Close();
            return arrPos;
        }

        /// <summary>
        /// Get connection string from specific DB
        /// [Chinky: 05Mar2014]
        /// </summary>
        /// <param name="filterDate"></param>
        /// <param name="dtFil"></param>
        /// <returns>DatabaseMgrMySQL</returns>
        private DatabaseMgrMySQL GetDatabaseConnection(DateTime filterDate)
        {
            DateTime dtFil = new DateTime();
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL(ConfigurationManager.AppSettings["ConnectionString2"]);
            string projInstance = ConfigurationManager.AppSettings["Instance"];
            
            switch (projInstance)
            {
                case "Track":
                    {
                        dtFil = new DateTime(2014, 06, 05, 16, 0, 0);//for Track
                        if (filterDate < dtFil)
                        {
                            dbMgr = new DatabaseMgrMySQL(ConfigurationManager.AppSettings["TrackArchive"]);
                        }
                    }
                    break;
                case "Fleet":
                    {
                        dtFil = new DateTime(2013, 12, 26, 16, 0, 0);//for Fleet
                        if (filterDate < dtFil)
                        {
                            dbMgr = new DatabaseMgrMySQL(ConfigurationManager.AppSettings["FindArchive"]);
                        }
                    }
                    break;
                case "Chuanlim":
                    {
                    }
                    break;
            }
            
            return dbMgr;
        }

        /// <summary>
        /// gets position records
        /// Support for PUB company using our backend to gather data
        /// [Dan:xxXXXxxx]
        /// </summary>
        /// <param name="posFilter"></param>
        /// <param name="iUserID"></param>
        /// <returns></returns>
        public List<PosInfo> GetPositionsApi(PosInfo posFilter, string strKey)
        {
            List<PosInfo> arrPos = new List<PosInfo>();
            UserInfo currUser = GetUserbyPassword(strKey);
            string strSql = "";

            if (currUser != null)
            {
                int iUserID = currUser.UserID;
                string strCompany = currUser.Company;

                //[Dan:10Jun14] Support for Archive database
                //DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL(ConfigurationManager.AppSettings["ConnectionString2"]);
                DatabaseMgrMySQL dbMgr = GetDatabaseConnection(posFilter.Timestamp);

                DbDataReader dbRdr = null;
                try
                {
                    // open database
                    if (dbMgr.Open())
                    {
                        // initialize sql command
                        //string strSql = String.Format("SELECT TOP {0} * FROM view_positions", ConfigurationManager.AppSettings["DownloadCount"]);

                        if (ConfigurationManager.AppSettings["Instance"] == "BUC")
                        {
                            strSql = String.Format("SELECT TOP {0} * FROM view_positions_fuel", ConfigurationManager.AppSettings["DownloadCount"]);
                        }
                        else
                        {
                            strSql = String.Format("SELECT TOP {0} * FROM view_positions", ConfigurationManager.AppSettings["DownloadCount"]);
                        }    
                        
                        
                        strSql += String.Format(" WHERE timestamp BETWEEN '{0:dd-MMM-yyyy HH:mm:ss}' AND '{1:dd-MMM-yyyy HH:mm:ss}'", posFilter.Timestamp, posFilter.RxTime);
                        if (posFilter.PosID > 0) strSql += String.Format(" AND pos_id < {0}", posFilter.PosID);
                        if (posFilter.Speed > 0) strSql += String.Format(" AND speed >= {0} AND fix > 0", posFilter.Speed);
                        else if (posFilter.Fix != "") strSql += String.Format(" AND fix IN ({0})", posFilter.Fix);
                        if (posFilter.AssetID > 0) strSql += String.Format(" AND asset_id = {0}", posFilter.AssetID);
                        else if (GetUserRole(ref dbMgr, iUserID) > 0)
                        {
                            // filter by company
                            object objTemp = dbMgr.ExecuteScalar(String.Format("SELECT company_id FROM users WHERE user_id = {0}", iUserID));
                            if (objTemp != null) strSql += String.Format(" AND company_id = {0}", objTemp);

                            // limit to assigned assets only
                            objTemp = dbMgr.ExecuteScalar(String.Format("SELECT assets FROM users WHERE user_id = {0}", iUserID));
                            if ((objTemp != null) && (objTemp.ToString() != ""))
                                strSql += String.Format(" AND asset_id IN ({0})", objTemp);
                        }
                        else
                        {
                            // filter by company
                            object objTemp = dbMgr.ExecuteScalar(String.Format("SELECT company_id FROM companies WHERE name = '{0}'", strCompany));
                            if (objTemp != null) strSql += String.Format(" AND company_id = {0}", objTemp);
                        }

                        // get positions
                        dbRdr = dbMgr.ExecuteReader(strSql + " ORDER BY timestamp DESC");
                        if ((dbRdr != null) && dbRdr.HasRows)
                        {
                            // loop through positions
                            while (dbRdr.Read())
                                arrPos.Add(BuildPosition(dbRdr));

                        }
                        if (dbRdr != null) dbRdr.Close();
                    }
                }
                catch (Exception ex)
                {
                    // log error
                    DatabaseMgrMySQL.LogError(ex.Message, "GetPositionsApi");
                }

                // close database
                if (dbRdr != null) dbRdr.Close();
                dbMgr.Close();
            }
            return arrPos;
        }

        /// <summary>
        /// gets user info after successful log in
        /// </summary>
        /// <param name="iUserID"></param>
        /// <param name="strPassword"></param>
        /// <returns></returns>
        public UserInfo GetUserbyPassword(string strPassword)
        {
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            DbDataReader dbRdr = null;
            UserInfo udtUser = null;
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // get default image
                    object objTemp = dbMgr.ExecuteScalar("SELECT tag FROM features WHERE name = 'Users'");
                    string strImage = (objTemp != null ? String.Format("{0}/images/resources/{1}.png",
                        ConfigurationManager.AppSettings["ServerPath"], objTemp) : "images/edit.png");

                    // check user credentials
                    dbRdr = dbMgr.ExecuteReader("SELECT users.*, roles.role_desc, companies.name AS company, " +
                        "languages.name AS language, languages.culture " +
                        "FROM users LEFT JOIN roles ON users.role_id = roles.role_id " +
                        "LEFT JOIN companies ON users.company_id = companies.company_id " +
                        "LEFT JOIN languages ON users.language_id = languages.language_id " +
                        "WHERE password = @Password", new object[] { strPassword });
                    if ((dbRdr != null) && dbRdr.HasRows && dbRdr.Read())
                        udtUser = BuildUser(dbRdr, strImage);
                    if (dbRdr != null) dbRdr.Close();
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "GetUserbyPassword");
            }

            // close database
            if (dbRdr != null) dbRdr.Close();
            dbMgr.Close();
            return udtUser;
        }

        /// <summary>
        /// builds position info from database record
        /// </summary>
        /// <param name="dbRdr"></param>
        /// <returns></returns>
        private PosInfo BuildPosition(DbDataReader dbRdr)
        {
            PosInfo udtPos = new PosInfo();
            try
            {
                // initialize fix
                int iFix = dbRdr.ToInt32("fix");
                string strFix = iFix.ToString();

                // check fix
                switch (iFix)
                {
                case -1:
                    {
                        // cell id fix
                        strFix = "Cell ID";
                        if (dbRdr.ToString("remarks") != "")
                        {
                            // format cell id
                            string strCellID = dbRdr.ToString("remarks");
                            if (strCellID.Contains(":")) strCellID = strCellID.Substring(strCellID.IndexOf(":") + 1);
                            strFix += String.Format(" ({0})", strCellID);
                        }
                    }
                    break;
                case 0: strFix = "No Fix"; break;
                case 1:
                case 2: strFix = "GPS Fix"; break;
                case 3:
                case 4: strFix = "Last Known GPS"; break;
                }

                // set position parameters
                udtPos.PosID = dbRdr.ToInt64("pos_id");
                udtPos.RxTime = dbRdr.ToDateTime("rx_time");
                udtPos.Timestamp = dbRdr.ToDateTime("timestamp");
                udtPos.TagID = dbRdr.ToInt32("tag_id");
                udtPos.Tag = dbRdr.ToString("tag");
                udtPos.AssetID = dbRdr.ToInt32("asset_id");
                udtPos.Asset = dbRdr.ToString("asset");
                udtPos.FixID = iFix;
                udtPos.Fix = strFix;
                udtPos.Satellites = dbRdr.ToInt32("satellites");
                udtPos.PosX = dbRdr.ToDouble("pos_x");
                udtPos.PosY = dbRdr.ToDouble("pos_y");
                udtPos.PosZ = dbRdr.ToDouble("pos_z");
                udtPos.Speed = Math.Round(dbRdr.ToDouble("speed"), 1);
                udtPos.Course = Math.Round(dbRdr.ToDouble("course"), 1);
                udtPos.HDOP = Math.Round(dbRdr.ToDouble("hdop"), 1);                               
                udtPos.Mileage = Math.Round(dbRdr.ToDouble("mileage") / 100, 2);
                udtPos.Driver = (dbRdr.ToString("driver") != "" ? dbRdr.ToString("driver") : dbRdr.ToString("driver_default"));

                try
                {
                    // get other position parameters
                    udtPos.Battery = dbRdr.ToDouble("battery");
                    udtPos.Fuel = dbRdr.ToDouble("fuel");
                    udtPos.ZoneID = dbRdr.ToInt32("zone_id");
                    udtPos.Zone = dbRdr.ToString("zone_name");
                    udtPos.Location = dbRdr.ToString("loc");
                    udtPos.Location = FormatLocation(udtPos.Location);

                    if (((udtPos.Location) == "" || (udtPos.Location == "Singapore")) && (udtPos.FixID > 0))
                        udtPos.Location = "No Address from Google Maps";

                    if (((udtPos.Location) == "" || (udtPos.Location == "Singapore")) && (udtPos.FixID == 0))
                        udtPos.Location = "No GPS Signal Detected";

                    // get engine status
                    switch (dbRdr.ToInt32("engine"))
                    {
                        case 0: udtPos.Engine = "STOP";
                            break;
                        case 1: udtPos.Engine = "IDLE"; 
                            break;
                        case 2: udtPos.Engine = "MOVE";                           
                            break;
                    }

                    //[Chinky:27Jan2014] Eliminated Status:Move; Speed < 6kph
                    udtPos.Ignition = dbRdr.ToInt32("ignition");
                    if (udtPos.Ignition == 0)
                    {
                        udtPos.Speed = 0;
                    }
                    else
                    {
                        if (udtPos.Engine == "IDLE" && udtPos.Speed > 0)
                            udtPos.Speed = 0;
                        if (udtPos.Engine == "MOVE" && udtPos.Speed < 6)
                        {
                            udtPos.Speed = 0;
                            udtPos.Engine = "IDLE";
                        }
                    }                   
                                        
                    //[Dan:05Dec2013] Added temperature in PosInfo
                    try
                    {
                        udtPos.Temperature = dbRdr.ToDouble("fridge");
                        udtPos.Temperature2 = dbRdr.ToDouble("product");
                    }
                    catch (Exception ex)
                    {
                        // log error
                        DatabaseMgrMySQL.LogError(ex.Message, "BuildPosition-ReadTemp Error");
                    }

                    if (ConfigurationManager.AppSettings["Instance"] == "BUC")
                    {
                        //[Chinky:08Sept2014] Support for Ultralevel Water Sensor
                        try
                        {
                            udtPos.FuelLevel = dbRdr.ToDouble("liquid_level");
                            udtPos.ActualTemp = dbRdr.ToDouble("actual_temp");
                        }
                        catch (Exception ex)
                        {
                            //log error
                            DatabaseMgrMySQL.LogError(ex.Message, "BuildPosition-ReadFuel Error");
                        }
                    }                    
                }
                catch { }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "BuildPosition");
            }
            return udtPos;
        }

        /// <summary>
        /// formats location address
        /// </summary>
        /// <param name="strLocation"></param>
        /// <returns></returns>
        private string FormatLocation(string strLocation)
        {
            try
            {
                // parse street
                if (strLocation.StartsWith("street"))
                    strLocation = strLocation.Substring(7).Trim().Trim(",".ToCharArray());

                // parse location
                string[] arrTemp = strLocation.Split(",".ToCharArray(), StringSplitOptions.RemoveEmptyEntries);
                if (arrTemp.Length > 1)
                {
                    // trim country
                    if (arrTemp[arrTemp.Length - 1].Contains("Singapore"))
                    {
                        // update location
                        string strLoc = "";
                        for (int i = 0; i < arrTemp.Length - 1; i++)
                            strLoc += String.Format("{0},", arrTemp[i]);
                        strLocation = strLoc.Trim(",".ToCharArray());
                    }
                }

                // check country
                if (strLocation.Contains("Singapore"))
                {
                    // check first line of address if detailed enough
                    arrTemp = strLocation.Split(",".ToCharArray(), StringSplitOptions.RemoveEmptyEntries);
                    if ((arrTemp.Length > 1) && (arrTemp[0].Split().Length > 1))
                    {
                        // update location
                        string strLoc = "";
                        for (int i = 0; i < arrTemp.Length - 1; i++)
                            strLoc += String.Format("{0},", arrTemp[i]);
                        strLocation = strLoc.Trim(",".ToCharArray());
                    }
                }

                // capitalize first letter
                if (strLocation.Length > 1)
                    strLocation = strLocation.Substring(0, 1).ToUpper() + strLocation.Substring(1);
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "FormatLocation");
            }
            return strLocation;
        }

        /// <summary>
        /// gets assets' last positions
        /// </summary>
        /// <param name="dbMgr"></param>
        /// <param name="iPosID"></param>
        private PosInfo GetPosition(ref DatabaseMgrMySQL dbMgr, long iPosID)
        {
            PosInfo udtPos = null;
            DbDataReader dbRdr = null;
            string strSql = "";

            try
            {
                // check position
                if (iPosID != 0)
                {
                    // open database
                    if (dbMgr.Open())
                    {
                        // get asset's  latest position
                        //dbRdr = dbMgr.ExecuteReader("SELECT * FROM view_positions WHERE pos_id = @PosID", new object[] { iPosID });
                        if (ConfigurationManager.AppSettings["Instance"] == "BUC")
                        {
                            strSql = String.Format("SELECT * FROM view_positions_fuel WHERE pos_id = {0}", iPosID);
                        }
                        else
                        {
                            strSql = String.Format("SELECT * FROM view_positions WHERE pos_id = {0}", iPosID);
                        }

                        dbRdr = dbMgr.ExecuteReader(strSql);
                        if (((dbRdr != null) && dbRdr.HasRows) && dbRdr.Read())
                            udtPos = BuildPosition(dbRdr);
                        if (dbRdr != null) dbRdr.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "GetPosition");
            }

            // close database
            if (dbRdr != null) dbRdr.Close();
            return udtPos;
        }

        public int UpdateNotifiedDownAssets(string assetid)
        {
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            int ret = 0;
            if (dbMgr.Open())
            {
                if(assetid!="")
                    ret = dbMgr.ExecuteNonQuery(string.Format("Update assetinfo set notified = notified+1 where asset_id in ({0})", assetid));
                dbMgr.Close();
            }
            return ret;
        }

        public List<DownAssetsInfo> GetDownAssets(int numnotified, int downminutes)
        {
            Dictionary<int,DownAssetsInfo> dicDownAssets = new Dictionary<int,DownAssetsInfo>();
            List<DownAssetsInfo> lstDownAssets = new List<DownAssetsInfo>();
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            DbDataReader dbRdr = null;
            int downtimeminutes = downminutes>0?downminutes * -1:downminutes;

            string sql = "";
            string assets = "";
            try
            {
                if (dbMgr.Open())
                {
                    sql = String.Format("SELECT asset_id,timestamp,notified FROM assetinfo WHERE postype_id = 5 AND timestamp < '{0:dd-MMM-yyyy HH:mm:ss}' AND (notified is NULL OR notified = {1})", DateTime.UtcNow.AddMinutes(downtimeminutes),numnotified);
                    dbRdr = dbMgr.ExecuteReader(sql);
                    if ((dbRdr != null) && dbRdr.HasRows)
                    {
                        // list zones
                        while (dbRdr.Read())
                        {
                            int assetid = dbRdr.ToInt32("asset_id");
                            if (dicDownAssets.ContainsKey(assetid) == false)
                            {
                                DownAssetsInfo dinfo = new DownAssetsInfo();
                                dinfo.asset_id = assetid;
                                dinfo.lastupdate = dbRdr.ToDateTime("timestamp");
                                dicDownAssets.Add(assetid, dinfo);
                            }
                            
                            assets += assetid + ",";
                        }
                        if (assets != "") assets = assets.Substring(0, assets.Length - 1);
                        dbRdr.Close();
                    }
                    if (assets != "")
                    {
                        sql = String.Format("Select asset_id,name,tag,tagphone,company,company_id from view_assets where asset_id in ({0})", assets);
                        dbRdr = dbMgr.ExecuteReader(sql);
                        if ((dbRdr != null) && dbRdr.HasRows)
                        {
                            // list zones
                            while (dbRdr.Read())
                            {
                                int assetid = dbRdr.ToInt32("asset_id");
                                if (dicDownAssets.ContainsKey(assetid))
                                {
                                    BuildDownAssetInfo(dbRdr, dicDownAssets[assetid]);
                                    lstDownAssets.Add(dicDownAssets[assetid]);
                                }
                            }
                            dbRdr.Close();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                DatabaseMgrMySQL.LogError(ex.Message, sql);
            }
            dbMgr.Close();

            return lstDownAssets;

        }

        private static DownAssetsInfo BuildDownAssetInfo(DbDataReader dbRdr, DownAssetsInfo downasset)
        {
            try
            {
                downasset.asset_id = dbRdr.ToInt32("asset_id");
                downasset.asset = dbRdr.ToString("name");
                downasset.tag = dbRdr.ToString("tag");
                downasset.tagphone = dbRdr.ToString("tagphone");
                downasset.company = dbRdr.ToString("company");
                downasset.company_id = dbRdr.ToInt32("company_id");
            }
            catch (Exception ex)
            {
                DatabaseMgrMySQL.LogError(ex.Message, "BuildDownAssetInfo");
            }
            return downasset;
        }
        
        /// <summary>
        /// saves position record
        /// </summary>
        /// <param name="udtPos"></param>
        /// <returns></returns>
        public string SavePosition(PosInfo udtPos)
        {
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            string strRet = "";
            try
            {
                // save position
                strRet = SavePosition(ref dbMgr, udtPos);
            }
            catch (Exception ex)
            {
                // log error
                strRet = DatabaseMgrMySQL.LogError(ex.Message, "SavePosition");
            }

            // close database
            dbMgr.Close();
            return strRet;
        }

        /// <summary>
        /// saves position record
        /// </summary>
        /// <param name="udtPos"></param>
        /// <returns></returns>
        public string SavePosition(ref DatabaseMgrMySQL dbMgr, PosInfo udtPos)
        {
            DbDataReader dbRdr = null;
            string strRet = "";
            string strSql = "";
            object[] arrParams = new object[1];
            
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // check asset and vehicle parameters
                    AssetInfo udtAsset = GetAsset(ref dbMgr, udtPos.Tag);
                    if (udtAsset == null) return "Asset Not Found";
                    if (udtPos.Ignition == -1) udtPos.Ignition = udtAsset.Ignition;
                    if (udtPos.Mileage == 0) udtPos.Mileage = udtAsset.Mileage;

                    // update asset info
                    udtPos.Asset = udtAsset.Name;
                    udtPos.AssetID = udtAsset.AssetID;
                    udtPos.TagID = udtAsset.TagID;
                    udtPos.Driver = udtAsset.Driver;

                    // check valid limits for speed and altitude
                    //[Dan:29Jul14] Removed the Altitude Limit to support other highland countries, applies to ION200/BUC200
                    //if ((udtPos.Speed > 200.0) || (udtPos.PosZ > 1000.0)) 
                    if ((udtPos.Speed > 200.0))
                        udtPos.FixID = 0;

                    // check valid limits for fix type
                    if ((udtPos.FixID < -1) || (udtPos.FixID > 4))
                    {
                        // check satellite count
                        if (udtPos.Satellites > 3) udtPos.FixID = 2;
                        else if (udtPos.Satellites > 2) udtPos.FixID = 1;
                        else udtPos.FixID = 0;
                    }

                    // set to no fix if L2D or L3D fix (0,3,4 - not reliable)
                    if ((udtPos.FixID == 3) || (udtPos.FixID == 4))
                        udtPos.FixID = 0;

                    // check timestamp if invalid (device issue?)
                    if ((udtPos.Timestamp.Year != udtPos.RxTime.Year) && (udtPos.Timestamp.Month == udtPos.RxTime.Month))
                    {
                        // override year
                        udtPos.Timestamp = new DateTime(udtPos.RxTime.Year, udtPos.Timestamp.Month, udtPos.Timestamp.Day,
                            udtPos.Timestamp.Hour, udtPos.Timestamp.Minute, udtPos.Timestamp.Second);
                    }

                    // check timestamp if ahead of server time
                    if (udtPos.Timestamp > udtPos.RxTime)
                    {
                        // check if ahead by more than 10 minutes
                        TimeSpan tsDiff = udtPos.Timestamp - udtPos.RxTime;
                        if (tsDiff.TotalMinutes > 10) udtPos.Timestamp = udtPos.RxTime;
                    }

                    // check position if already in database
                    if (dbMgr.Exists("SELECT TOP(1) pos_id FROM positions WHERE asset_id = @AssetID " +
                        "AND timestamp = @Timestamp", new object[] { udtPos.AssetID, udtPos.Timestamp }))
                    {
                        // position is already existing
                        return String.Format("{0:dd-MMM-yyyy HH:mm:ss}\t{1:dd-MMM-yyyy HH:mm:ss}\t{2}\tDuplicate data.",
                            udtPos.RxTime.ToLocalTime(), udtPos.Timestamp.ToLocalTime(), udtPos.Tag);
                    }

                    // get company zones
                    List<ZoneInfo> arrZones = GetAssetZones(udtPos.AssetID, udtAsset.CompanyID);
                    foreach (ZoneInfo udtZone in arrZones)
                    {
                        // check if position is inside zone
                        if (udtZone.Perimeter == null) continue;
                        if (IsPointInLoc(new PointF((float)udtPos.PosX, (float)udtPos.PosY), udtZone.Perimeter))
                        {
                            // asset is inside zone
                            udtPos.ZoneID = udtZone.ZoneID;
                            udtPos.Zone = udtZone.Name;
                            break;
                        }
                    }

                    // get previous position's timestamp
                    object objTemp = dbMgr.ExecuteScalar("SELECT timestamp FROM positions WHERE pos_id = @PosID",
                        new object[] { udtAsset.LastPosID });
                    DateTime dtLast = (objTemp != null ? Convert.ToDateTime(objTemp) : DateTime.MinValue);

                    // get previous zone
                    PosInfo udtPrev = GetPosition(ref dbMgr, udtAsset.LastFixID);
                    int iPrevZone = (udtPrev != null ? udtPrev.ZoneID : 0);

                    // check last position
                    int iLastEngine = 0;
                    if (udtPrev != null)
                    {
                        // get last engine status
                        switch (udtPrev.Engine)
                        {
                            case "STOP": iLastEngine = 0; break;
                            case "IDLE": iLastEngine = 1; break;
                            case "MOVE": iLastEngine = 2; break;
                        }

                        //Used by BUC-Greenbanks -already deployed
                        //Used by KSB Chicken - not yet deployed
                        //[Dan:15Apr14] Compute Mileage manually by using Haversine Formula
                        //udtPos.Mileage = ComputeMileage(udtPos, udtPrev);
                    }

                    // check current position if invalid (KSB?)
                    if ((udtPos.PosX == 0) && (udtPos.PosY == 0))
                    {
                        // use previous position
                        udtPos.PosX = udtPrev.PosX;
                        udtPos.PosY = udtPrev.PosY;
                    }

                    // check engine status
                    int iSpeed = 5;
                    int iEngine = (udtPos.Ignition == 0 ? 0 : (udtPos.Speed > 0 ? 2 : 1));
                    if ((iEngine == 2) && (udtPos.Speed < iSpeed))
                    {
                        // check if idling
                        TimeSpan tsDiff = udtPos.Timestamp - udtAsset.LastMove;
                        if (tsDiff.TotalMinutes < 3)
                            iEngine = 1;
                    }

                    // [Marlo:20Jan15 - SIONG HONG] 
                    // use previous position if engine is 'idle' or 'stop' and has good fix
                    if ((udtPrev != null) && (udtAsset.CompanyID == 156) && ((udtPrev.Engine == "IDLE") && (iEngine == 1)) || 
                        ((udtPrev.Engine == "STOP") &&  (iEngine == 0) && ((udtPos.Timestamp - udtPrev.Timestamp).Minutes < 11)))
                    {
                        // use previous position
                        udtPos.PosX = udtPrev.PosX;
                        udtPos.PosY = udtPrev.PosY;
                    }                        

                    // reverse geocoding
                    //ApplyReverseGeocode(ref dbMgr, udtAsset, udtPrev, udtPos, (iEngine == 2) || (iLastEngine == 2));
                    ApplyReverseGeocode(ref dbMgr, udtAsset, udtPrev, udtPos, iEngine, iLastEngine);

                    //[Chinky:30Sept2014] Check if MDT. Use manual computation of mileage
                    if (ConfigurationManager.AppSettings["Instance"] == "BUC" ||
                        ConfigurationManager.AppSettings["Instance"] == "Fleet")
                    {
                        //DatabaseMgrMySQL.LogEvent("Length: " + udtAsset.Name.Length + "\n" + udtAsset.Name.Substring(0, 2), 0);
                        if (udtAsset.Tag.Length == 15 && udtAsset.Tag.Substring(0, 2) == "86")
                        {
                            //DatabaseMgrMySQL.LogEvent("Mileage Before: " + udtPos.Mileage + udtPos.Asset, 0);
                            udtPos.Mileage = ComputeMileage(udtPos, udtPrev);
                            //DatabaseMgrMySQL.LogEvent("Mileage After: " + udtPos.Mileage + udtPos.Asset, 0);
                        }
                    }

                    if (!udtPos.IsBuffer)//[Dan:23Sep14] separate buffer and normal data
                    {
                        //orig code without buffer
                        // initialize sql query
                        strSql = "INSERT INTO positions (asset_id, tag_id, timestamp, rx_time, fix, " +
                            "satellites, pos_x, pos_y, pos_z, speed, course, hdop, ignition, mileage, battery, fuel, " +
                            "loc, loc_id, zone_id, remarks, engine, driver) OUTPUT INSERTED.pos_id VALUES " +
                            "(@AssetID, @TagID, @Timestamp, @RxTime, @FixID, @Satellites, @PosX, @PosY, @PosZ, @Speed, " +
                            "@Course, @Hdop, @Ignition, @Mileage, @Battery, @Fuel, @Location, @LocID, @ZoneID, @Remarks, " +
                            "@Engine, @Driver)";
                        arrParams = new object[] { udtPos.AssetID, udtPos.TagID, udtPos.Timestamp, udtPos.RxTime, 
                        udtPos.FixID, udtPos.Satellites, udtPos.PosX, udtPos.PosY, udtPos.PosZ, udtPos.Speed, udtPos.Course, 
                        udtPos.HDOP, udtPos.Ignition, udtPos.Mileage, udtPos.Battery, udtPos.Fuel, udtPos.Location, udtPos.LocID, 
                        udtPos.ZoneID, (udtPos.Remarks == null ? "" : udtPos.Remarks), iEngine, udtPos.Driver };
                    }
                    else
                    {
                        DatabaseMgrMySQL.LogEvent("SavePosition-withBuffer", 0);
                        strSql = "INSERT INTO positions (asset_id, tag_id, timestamp, rx_time, fix, " +
                            "satellites, pos_x, pos_y, pos_z, speed, course, hdop, ignition, mileage, battery, fuel, " +
                            "loc, loc_id, zone_id, remarks, engine, driver, isbuffer) OUTPUT INSERTED.pos_id VALUES " +
                            "(@AssetID, @TagID, @Timestamp, @RxTime, @FixID, @Satellites, @PosX, @PosY, @PosZ, @Speed, " +
                            "@Course, @Hdop, @Ignition, @Mileage, @Battery, @Fuel, @Location, @LocID, @ZoneID, @Remarks, " +
                            "@Engine, @Driver, @IsBuffer)";
                        arrParams = new object[] { udtPos.AssetID, udtPos.TagID, udtPos.Timestamp, udtPos.RxTime, 
                        udtPos.FixID, udtPos.Satellites, udtPos.PosX, udtPos.PosY, udtPos.PosZ, udtPos.Speed, udtPos.Course, 
                        udtPos.HDOP, udtPos.Ignition, udtPos.Mileage, udtPos.Battery, udtPos.Fuel, udtPos.Location, udtPos.LocID, 
                        udtPos.ZoneID, (udtPos.Remarks == null ? "" : udtPos.Remarks), iEngine, udtPos.Driver, 1 };
                    }

                   
                    // save new position
                    objTemp = dbMgr.ExecuteScalar(strSql, arrParams);
                    if (objTemp != null) udtPos.PosID = Convert.ToInt32(objTemp);

                    // check position if new
                    if ((udtPos.PosID > 0) && (udtPos.Timestamp > dtLast))
                    {
                        // update asset's latest position
                        dbMgr.ExecuteNonQuery("UPDATE assets SET last_pos = @LastPosID WHERE asset_id = @AssetID",
                           new object[] { udtPos.PosID, udtPos.AssetID });
                        SaveAssetInfo(ref dbMgr, PosInfoType.Pos, udtPos.PosID, udtPos.AssetID, udtPos.Timestamp);

                        //[Chinky:08Sept2014] update asset fuel. Support for Ultrasonic Liquid Level Sensor 
                        if (ConfigurationManager.AppSettings["Instance"] == "BUC")
                        {
                            string strTemp = "";
                            strTemp = String.Format("INSERT INTO pos_fuel (pos_id, liquid_level, actual_temp, timestamp, asset_id) " +
                                "OUTPUT INSERTED.pos_fuel_id VALUES ({0}, {1}, {2}, '{3}', {4})",
                                udtPos.PosID, udtPos.FuelLevel, udtPos.ActualTemp, udtPos.Timestamp, udtPos.AssetID);

                            objTemp = dbMgr.ExecuteScalar(strTemp);
                            if (objTemp != null) 
                                SaveAssetInfo(ref dbMgr, PosInfoType.FuelLevel, Convert.ToInt64(objTemp), udtPos.AssetID, udtPos.Timestamp);
                        }
                        else
                        {
                            // update asset temperature
                            objTemp = dbMgr.ExecuteScalar("INSERT INTO pos_temp (pos_id, temperature, temperature2, timestamp, asset_id) " +
                                "OUTPUT INSERTED.pos_temp_id VALUES (@PosID, @Temp, @Temp2, @Timestamp, @AssetID)",
                                new object[] { udtPos.PosID, udtPos.Temperature, udtPos.Temperature2, udtPos.Timestamp, udtPos.AssetID });

                            if (objTemp != null) SaveAssetInfo(ref dbMgr, PosInfoType.Temperature, Convert.ToInt64(objTemp), udtPos.AssetID, udtPos.Timestamp);
                        }
                        // check if good fix
                        if (udtPos.FixID != 0)
                        {
                            // update asset's last fix
                            List<object> arrValues = new List<object>();
                            string strParams = "last_fix = @PosID";
                            arrValues.Add(udtPos.PosID);

                            // check speed
                            if (udtPos.Speed >= iSpeed)
                            {
                                // update last move
                                strParams += ", last_move = @LastMove";
                                arrValues.Add(udtPos.Timestamp);
                            }

                            // check engine if idling
                            if ((iLastEngine != 1) && (iEngine == 1))
                            {
                                // update last idle
                                strParams += ", last_idle = @LastIdle";
                                arrValues.Add(udtPos.Timestamp);
                            }

                            // update asset's last status
                            arrValues.Add(udtPos.AssetID);
                            dbMgr.ExecuteNonQuery(String.Format("UPDATE assets SET {0} WHERE asset_id = @AssetID",
                                strParams), arrValues.ToArray());

                            SaveAssetInfo(ref dbMgr, PosInfoType.Fix, udtPos.PosID, udtPos.AssetID, udtPos.Timestamp);

                            // update mileage
                            if (udtPos.Mileage != udtAsset.Mileage)
                                SaveAssetInfo(ref dbMgr, PosInfoType.Mileage, (long)udtPos.Mileage, udtPos.AssetID, udtPos.Timestamp);

                            // update last move
                            if (udtPos.Speed >= iSpeed)
                                SaveAssetInfo(ref dbMgr, PosInfoType.Move, udtPos.PosID, udtPos.AssetID, udtPos.Timestamp);

                            // update last idle
                            if ((iLastEngine != 1) && (iEngine == 1))
                                SaveAssetInfo(ref dbMgr, PosInfoType.Idle, udtPos.PosID, udtPos.AssetID, udtPos.Timestamp);

                            // cancel pending cell id not found alert
                            EventInfo udtEvent = new EventInfo();
                            udtEvent.AssetID = udtPos.AssetID;
                            udtEvent.Asset = udtPos.Asset;
                            udtEvent.TagID = udtPos.TagID;
                            udtEvent.Tag = udtPos.Tag;
                            udtEvent.AckUserID = 1;
                            /*
                            udtEvent.Event = "Cell ID";
                            CancelEvent(udtEvent, true);
                            */
                            // initialize event
                            udtEvent.PosID = udtPos.PosID;
                            udtEvent.AlertLevel = 0;
                            udtEvent.Timestamp = udtPos.Timestamp;
                            udtEvent.RxTime = udtPos.RxTime;

                            #region ZONE ENTER/EXIT

                            // check if zone changed
                            int iExitZone = 0;
                            if (iPrevZone != udtPos.ZoneID)
                            {
                                udtEvent.Remarks = "";//initialize remarks

                                // check previous zone
                                string[] arrAlertZones = udtAsset.AlertZones.Split(",".ToCharArray());
                                if (iPrevZone != 0)
                                {
                                    //// check previous zone enter
                                    //if (udtAsset.LastEnterID > 0)
                                    //{
                                    //    try
                                    //    {
                                    //        // cancel previous zone enter
                                    //        dbMgr.ExecuteNonQuery(String.Format("UPDATE events SET flag = 0 WHERE event_id = {0}",
                                    //            udtAsset.LastEnterID));
                                    //    }
                                    //    catch (Exception ex)
                                    //    {
                                    //        LogAssetActivity(udtAsset.Name, "", ex.Message);

                                    //    }
                                    //    LogAssetActivity(udtAsset.Name, "", string.Format("cancel previous zone enter"));
                                    //}
                                    //else
                                    //{
                                    // cancel previous zone enter
                                    //udtEvent.Event = "Zone Enter";
                                    //udtEvent.Remarks = "";
                                    //udtEvent.Flag = 0;
                                    //string ret = FlagEvent(udtEvent);
                                    //if (ret != "") DatabaseMgrMySQL.LogEvent(ret, 1);

                                    //bool found = false;
                                    // loop through zones
                                    foreach (ZoneInfo udtZone in arrZones)
                                    {
                                        // check zone id
                                        if (udtZone.ZoneID == iPrevZone)
                                        {
                                            //found = true;
                                            // asset has left the zone
                                            iExitZone = iPrevZone;
                                            udtEvent.Event = "Zone Exit";
                                            udtEvent.Remarks = udtZone.Name;
                                            udtEvent.Flag = 1;
                                            string ret = SaveEvent(ref dbMgr, udtEvent, true, arrAlertZones.Contains(iPrevZone.ToString()));
                                            if (ret != "") DatabaseMgrMySQL.LogEvent(String.Format("SavePos - ZoneExit Event: {0}", ret), 1);
                                            break;
                                        }
                                    }
                                }

                                // check current zone
                                if (udtPos.ZoneID != 0)
                                {
                                    string ret = "";
                                    try
                                    {
                                        //// check previous zone exit
                                        //if (udtAsset.LastExitID > 0)
                                        //{
                                        //    // cancel previous zone exit
                                        //    dbMgr.ExecuteNonQuery(String.Format("UPDATE events SET flag = 0 WHERE event_id = {0}",
                                        //        udtAsset.LastExitID));
                                        //}
                                        //else
                                        //{
                                        //// cancel previous zone exit
                                        //udtEvent.Event = "Zone Exit";
                                        //udtEvent.Remarks = "";
                                        //udtEvent.Flag = 0;
                                        //ret = FlagEvent(udtEvent);
                                        //if (ret != "") DatabaseMgrMySQL.LogEvent(ret, 1);
                                        //}

                                        // asset has entered the zone
                                        udtEvent.Event = "Zone Enter";
                                        udtEvent.Remarks = udtPos.Zone;
                                        udtEvent.Flag = 1;
                                        ret = SaveEvent(ref dbMgr, udtEvent, true, arrAlertZones.Contains(udtPos.ZoneID.ToString()));
                                        if (ret != "") DatabaseMgrMySQL.LogEvent(String.Format("Save Position - Zone Enter Event: {0}", ret), 1);
                                    }
                                    catch (Exception ex)
                                    {
                                        DatabaseMgrMySQL.LogError(ex.Message, "Saveposition");
                                    }
                                }
                            }
                            #endregion

                            #region TRIPS REPORT

                            // check zone exit event
                            if (iExitZone > 0)
                            {
                                // save trips matching destination
                                List<PlanInfo> arrPlans = GetPlans(ref dbMgr, iExitZone, udtAsset.Company);
                                if (arrPlans.Count > 0)
                                {
                                    SaveTrips(ref dbMgr, udtPos, arrPlans);

                                    TripZoneInfo newTripZone = new TripZoneInfo();
                                    newTripZone.ZoneName = udtEvent.Remarks;
                                    newTripZone.ZoneID = iExitZone;
                                    newTripZone.AssetID = udtPos.AssetID;
                                    newTripZone.AssetName = udtPos.Asset;
                                    newTripZone.CompanyID = udtAsset.CompanyID;
                                    newTripZone.CompanyName = udtAsset.Company;
                                    newTripZone.Timestamp = udtPos.Timestamp;

                                    //save to trips zone report [Dan:23DEC12]
                                    SaveTripsZone(newTripZone);
                                }
                            }
                            #endregion

                            udtEvent.Remarks = "";//initialize remarks

                            #region IDLING CHECK --NOT USED
                            /*
                            // check idling limit
                            if (udtAsset.IdleLimit > 0)
                            {
                                // check if idling
                                udtEvent.Event = "Excessive Idling";
                                if (iEngine == 1)
                                {
                                    // check idling limit
                                    if (!dbMgr.Exists(String.Format("SELECT TOP(1) pos_id FROM positions WHERE asset_id = {0} " +
                                        "AND engine <> 1 AND timestamp BETWEEN '{1:dd-MMM-yy HH:mm:ss}' AND '{2:dd-MMM-yy HH:mm:ss}'",
                                        udtPos.AssetID, udtPos.Timestamp.AddMinutes(udtAsset.IdleLimit * -1), udtPos.Timestamp)))
                                    {
                                        // raise idling alert
                                        udtEvent.Remarks = String.Format("Idling > {0} min", udtAsset.IdleLimit);
                                        udtEvent.AlertLevel = 1;
                                        udtEvent.Flag = 1;
                                        SaveEvent(udtEvent);
                                    }
                                }
                                else
                                {
                                    // cancel pending idling alert
                                    udtEvent.Remarks = "";
                                    udtEvent.AckUserID = 1;
                                    CancelEvent(udtEvent, true);
                                }
                            }
                            */
                            #endregion

                            #region MILEAGE REMINDER

                            // initialize mileage alert
                            double lMileage = udtPos.Mileage;//udtAsset.Mileage + (udtPos.Mileage / 100);
                            udtEvent.Event = "Mileage Report";
                            udtEvent.Remarks = String.Format("{0} km", lMileage);
                            udtEvent.AlertLevel = 0;
                            udtEvent.Flag = 1;

                            // check mileage distance
                            if ((udtAsset.MileageDist > 0) && (lMileage >= udtAsset.MileageDist))
                            {
                                // raise mileage alert then reset settings
                                SaveEvent(ref dbMgr, udtEvent, false, true);
                                
                                dbMgr.ExecuteNonQuery(String.Format("UPDATE assets SET mileage_dist = {0} WHERE asset_id = {1}",
                                    udtAsset.MileageDist * -1, udtAsset.AssetID));
                                
                                SaveAssetInfo(ref dbMgr, PosInfoType.MileageDist, (Int32)udtAsset.MileageDist * -1, udtPos.AssetID, udtPos.Timestamp);
                            }

                            // check mileage date
                            else if (udtAsset.MileageDate > DateTime.MinValue)
                            {
                                // check if date for mileage reminder has passed
                                TimeSpan tsDiff = udtPos.Timestamp - udtAsset.MileageDate;
                                if ((tsDiff.TotalMinutes > 1) && (tsDiff.TotalDays < 1))
                                {
                                    // raise mileage alert
                                    SaveEvent(ref dbMgr, udtEvent, false, true);
                                }
                            }
                            #endregion

                            #region UTILIZATION REPORT

                            // get engine status
                            switch (iEngine)
                            {
                                case 0: udtPos.Engine = "STOP"; break;
                                case 1: udtPos.Engine = "IDLE"; break;
                                case 2: udtPos.Engine = "MOVE"; break;
                            }

                            // check previous position
                            if (udtPrev != null)
                                SaveUtilization(ref dbMgr, udtPrev, udtPos);
                            #endregion
                        
                            #region NO RFID TAP ALERT
                            //[Chinky/Dan:20-24Oct14]
                            if (udtAsset.Company.ToLower().Contains("hua kun"))//[09Jan2014:Chinky] Temp Solution: Applies to HuaKun vehicles only
                            {
                                udtEvent.Event = "RFID Alert";
                                if (udtEvent.Event == "RFID Alert")//temp sol. for Zone Enter/Exit remarks that shows No Tap Remark
                                    udtEvent.Remarks = "No Tap w/n 3 mins.";

                                if (udtPos.Ignition == 1 && (udtPrev != null && udtPrev.Ignition == 0))
                                {

                                    //Get last Ignition On on AssetInfo table  
                                    PosInfo posAssetInfo = GetLastestAssetInfo(udtPos.AssetID, (int)PosInfoType.Ignition, 1);
                                    TimeSpan ts = DateTime.UtcNow - posAssetInfo.Timestamp;

                                    //check if driver did not tap RFID for > 3 mins since ignition was turned ON
                                    if (ts > TimeSpan.Parse("00:03:00"))
                                    {
                                        try
                                        {
                                            //initialize event info                                       
                                            udtEvent.AlertLevel = 2;
                                            udtEvent.Flag = 1;

                                            if (!dbMgr.Exists("SELECT TOP(1) * FROM assetinfo WHERE asset_id = @AssetID AND postype_id = @PosTypeID AND timestamp > @IgnitionTimestamp",
                                                        new object[] { udtPos.AssetID, (int)PosInfoType.RFID, udtPos.Timestamp }))
                                            {
                                                // raise mileage alert then reset settings
                                                SaveEvent(ref dbMgr, udtEvent, false, true);
                                            }
                                        }
                                        catch (Exception ex)
                                        {
                                            DatabaseMgrMySQL.LogError(ex.Message, "CheckRFIDTap");
                                        }
                                    }
                                }

                                if (udtPos.Ignition == 0 && (udtPrev != null && udtPrev.Ignition == 1))
                                {
                                    //Cancel RFID alert when engine off
                                    CancelEvent(udtEvent, true);

                                    //// [Chinky:14Dec2014] Remove driver name from assets on ignition off
                                    //dbMgr.ExecuteNonQuery("UPDATE assets SET driver = '' WHERE asset_id = @AssetID",
                                    //    new object[] { udtPos.AssetID });
                                }

                                DatabaseMgrMySQL.LogEvent("SavePosition >> SaveRFIDAlert >> Company: " + udtAsset.Company, 0);//[Chinky:11Jan2015] Testing
                            }

                            #endregion

                            #region EXCESSIVE IDLING
                            //[Chinky:03Nov2014] Cancel Excessive Idling Alert when engine is turned off
                            udtEvent.Event = "Excessive Idling";
                            udtEvent.Remarks = "";

                            if (udtPos.Ignition == 0 && (udtPrev != null && udtPrev.Ignition == 1))
                            {
                                //Cancel Excessive Idling alert when engine off
                                CancelEvent(udtEvent, true);
                                //DatabaseMgrMySQL.LogEvent(udtAsset.Name + " : Ignition Off>>Cancel Excessive Idling alert", 1);
                            }
                            #endregion

                            #region SPEED LIMIT CHECK

                            //[Chinky:04Nov2014] Speeding based on Driving Limit
                            // check speed limit
                            if (udtAsset.SpeedLimit > 0)
                            {
                                udtEvent.Event = "Speeding";
                                if (iEngine == 2 && udtPos.Speed > udtAsset.SpeedLimit)
                                {
                                    // raise speeding alert                                       
                                    udtEvent.Remarks = String.Format("Speed: {0} kph > Driving Limit", Math.Round(udtPos.Speed, 2));
                                    udtEvent.AlertLevel = 2;
                                    udtEvent.Flag = 1;
                                    SaveEvent(udtEvent);
                                }
                                else
                                {
                                    // cancel pending speed alert
                                    udtEvent.Remarks = "";
                                    udtEvent.AckUserID = 1;
                                    CancelEvent(udtEvent, true);
                                }
                            }

                            #endregion
                        }

                        // update asset's last gps fix
                        if ((udtPos.FixID == 2) || (udtPos.FixID == 1))
                        {
                            dbMgr.ExecuteNonQuery("UPDATE assets SET last_gps = @LastPosID WHERE asset_id = @AssetID",
                            new object[] { udtPos.PosID, udtPos.AssetID });
                            SaveAssetInfo(ref dbMgr, PosInfoType.GPS, udtPos.PosID, udtPos.AssetID, udtPos.Timestamp);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                strRet = DatabaseMgrMySQL.LogError(ex.Message, "SavePosition*");
            }

            // close database
            if (dbRdr != null) dbRdr.Close();
            return strRet;
        }

        /// <summary>
        /// updates asset's latest settings
        /// </summary>
        /// <param name="dbMgr"></param>
        /// <param name="posTypeID"></param>
        /// <param name="iValue"></param>
        /// <param name="iAssetID"></param>
        /// <param name="dtTimestamp"></param>
        private void SaveAssetInfo(ref DatabaseMgrMySQL dbMgr, PosInfoType posTypeID, long iPosID, int iAssetID, DateTime dtTimestamp)
        {
            try
            {
                // update asset's settings
                dbMgr.ExecuteNonQuery("DELETE FROM assetinfo WHERE postype_id = @PosTypeID AND " +
                    "asset_id = @AssetId", new object[] { (int)posTypeID, iAssetID });
                dbMgr.ExecuteNonQuery("INSERT INTO assetinfo (asset_id, postype_id, pos_id, timestamp, notified) " +
                    "VALUES (@AssetID, @PosTypeID, @PosID, @Timestamp, 0)", new object[] { iAssetID, (int)posTypeID, 
                    iPosID, dtTimestamp });

                if ((int)posTypeID == 15)
                    DatabaseMgrMySQL.LogEvent("Save RFID", 0);//testing [Dan:23Oct14]
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "SaveAssetInfo");
            }
        }

        /// <summary>
        /// Compute Mileage for vehicles without mileage using Haversine Formula
        /// [Dan:15Apr14]
        /// </summary>
        /// <param name="udtPos"></param>
        /// <param name="udtPrev"></param>
        /// <returns></returns>
        private double ComputeMileage(PosInfo udtPos, PosInfo udtPrev)
        {
            double mileage = 0;
            const double FIXEDSPEED = 100;
            try
            {
                //[Dan:03Feb15] Check engine status; compute only on MOVE
                int iEngine = (udtPos.Ignition == 0 ? 0 : (udtPos.Speed > 0 ? 2 : 1));
                if ((iEngine < 2) && (udtPos.Speed < 5))
                {
                    mileage = udtPrev.Mileage;
                    //DatabaseMgrMySQL.LogEvent(string.Format("Asset: {0}-Engine:{1}, Speed:{2}", udtPos.Asset, iEngine, udtPos.Speed), 0);//testing
                    return mileage;
                }
                //

                //[Dan:03Feb15] Check type of FIX, if not good then return
                if ((udtPos.FixID != 1) && (udtPos.FixID != 2))
                {
                    mileage = udtPrev.Mileage;
                    //DatabaseMgrMySQL.LogEvent(string.Format("Asset: {0}-Fix:{1}", udtPos.Asset, udtPos.FixID), 0);//testing
                    return mileage;
                }
                //

                if (udtPos != null && udtPrev != null)
                {
                    if (udtPos.Mileage <= 0)//no mileage
                    {
                        //[Dan:03Feb15] Suspend implementation of Mileage Threshold
                        //double timeDiff = udtPos.Timestamp.Subtract(udtPrev.Timestamp).TotalHours;
                        //if (timeDiff > 1)//use distance formula with timestamp diff of more than 1 hr
                        //{
                        //    //[Dan:03Feb15] Max threshold for mileage
                        //    // distance (km) = speed (km/hr) * time (hr)
                        //    // 1 hr = 1 min/60min = 0.017 hr
                        //    // e.g. = 21.8 * 0.017 =  0.3706 km
                        //    mileage = udtPos.Speed * timeDiff;
                        //}
                        //else
                        //{
                        //    //use haversine algorithm
                        //    //c2 = (xA - xB)2 + (yA - yB)2
                        //    //Math.Pow ( n, 2 )
                        //    //mileage = Math.Sqrt(Math.Pow((udtPos.PosX - udtPrev.PosX), 2) + Math.Pow((udtPos.PosY - udtPrev.PosY), 2));
                        //    mileage = GetDistanceKM(udtPrev.PosY, udtPos.PosY, udtPrev.PosX, udtPos.PosX);
                        //}
                        
                        //// [Dan:03Feb15] Compute mileage cap
                        //// Use this if computed mileage is greater than
                        ////This will prevent adding of mileage that is so ridiculous (more than 1km)
                        //double mileageThreshold = Math.Round(FIXEDSPEED * timeDiff, 2);
                        //if (mileage > mileageThreshold)
                        //{
                        //    DatabaseMgrMySQL.LogEvent(string.Format("MileageTHreashold was used: Orig Mileage: {0}km\r Threshold:{1}km", mileage, mileageThreshold), 0);//testing
                        //    mileage = mileageThreshold;
                        //}//

                        mileage = GetDistanceKM(udtPrev.PosY, udtPos.PosY, udtPrev.PosX, udtPos.PosX);
                        mileage = (udtPrev.Mileage + Math.Round(mileage, 2)) * 100;// convert from km to units of 10 meters //like ts109 box
                        //DatabaseMgrMySQL.LogEvent(string.Format("ComputedMileage: {0}-{1}km, prevmileage:{2}km", udtPos.Asset, mileage, udtPrev.Mileage), 0);//testing
                    }
                    else//mileage already exist
                    {
                        //[Dan:09Jan15] Added manual inputed base mileage
                        mileage = GetDistanceKM(udtPrev.PosY, udtPos.PosY, udtPrev.PosX, udtPos.PosX);
                        mileage = (udtPrev.Mileage + Math.Round(mileage, 2)) * 100;// convert from km to units of 10 meters //like ts109 box
                    }
                }
            }
            catch (Exception ex)
            {
                DatabaseMgrMySQL.LogError(ex.Message, string.Format("ComputeMileage: {0}-{1}", udtPos.Asset, udtPos.Tag));
            }


            return mileage;
        }

        /// <summary>
        /// Calculates the distance between two geo-points in kilometers using the Haversine algorithm.
        /// [Dan:15Apr14] Source: http://damien.dennehy.me/blog/2011/01/15/haversine-algorithm-in-csharp/
        /// </summary>
        /// <param name="point1">The first point.</param>
        /// <param name="point2">The second point.</param>
        /// <returns>A double indicating the distance between the points in KM.</returns>
        private double GetDistanceKM(double lat1, double lat2, double lon1, double lon2)
        {
            const double EARTH_RADIUS_KM = 6371;//Radius of the Earth in Kilometers.

            double dLat = (lat2 - lat1) * (Math.PI / 180);
            double dLon = (lon2 - lon1) * (Math.PI / 180);

            double a = Math.Pow(Math.Sin(dLat / 2), 2) +
                       Math.Cos(lat1 * (Math.PI / 180)) * Math.Cos(lat2 * (Math.PI / 180)) *
                       Math.Pow(Math.Sin(dLon / 2), 2);

            double c = 2 * Math.Atan2(Math.Sqrt(a), Math.Sqrt(1 - a));

            double distance = EARTH_RADIUS_KM * c;
            return distance;
        }

        /* TODO: [03Feb15] Use of Vincenty formula, more accurate than Haversine 
         * Source: http://jsperf.com/vincenty-vs-haversine-distance-calculations
         function distVincenty(lat1, lon1, lat2, lon2) {
      var a = 6378137,
          b = 6356752.314245,
          f = 1 / 298.257223563; // WGS-84 ellipsoid params
      var L = (lon2 - lon1).toRad();
      var U1 = Math.atan((1 - f) * Math.tan(lat1.toRad()));
      var U2 = Math.atan((1 - f) * Math.tan(lat2.toRad()));
      var sinU1 = Math.sin(U1),
          cosU1 = Math.cos(U1);
      var sinU2 = Math.sin(U2),
          cosU2 = Math.cos(U2);
    
      var lambda = L,
          lambdaP, iterLimit = 100;
      do {
        var sinLambda = Math.sin(lambda),
            cosLambda = Math.cos(lambda);
        var sinSigma = Math.sqrt((cosU2 * sinLambda) * (cosU2 * sinLambda) + (cosU1 * sinU2 - sinU1 * cosU2 * cosLambda) * (cosU1 * sinU2 - sinU1 * cosU2 * cosLambda));
        if (sinSigma == 0) return 0; // co-incident points
        var cosSigma = sinU1 * sinU2 + cosU1 * cosU2 * cosLambda;
        var sigma = Math.atan2(sinSigma, cosSigma);
        var sinAlpha = cosU1 * cosU2 * sinLambda / sinSigma;
        var cosSqAlpha = 1 - sinAlpha * sinAlpha;
        var cos2SigmaM = cosSigma - 2 * sinU1 * sinU2 / cosSqAlpha;
        if (isNaN(cos2SigmaM)) cos2SigmaM = 0; // equatorial line: cosSqAlpha=0 (§6)
        var C = f / 16 * cosSqAlpha * (4 + f * (4 - 3 * cosSqAlpha));
        lambdaP = lambda;
        lambda = L + (1 - C) * f * sinAlpha * (sigma + C * sinSigma * (cos2SigmaM + C * cosSigma * (-1 + 2 * cos2SigmaM * cos2SigmaM)));
      } while (Math.abs(lambda - lambdaP) > 1e-12 && --iterLimit > 0);
    
      if (iterLimit == 0) return NaN // formula failed to converge
      var uSq = cosSqAlpha * (a * a - b * b) / (b * b);
      var A = 1 + uSq / 16384 * (4096 + uSq * (-768 + uSq * (320 - 175 * uSq)));
      var B = uSq / 1024 * (256 + uSq * (-128 + uSq * (74 - 47 * uSq)));
      var deltaSigma = B * sinSigma * (cos2SigmaM + B / 4 * (cosSigma * (-1 + 2 * cos2SigmaM * cos2SigmaM) - B / 6 * cos2SigmaM * (-3 + 4 * sinSigma * sinSigma) * (-3 + 4 * cos2SigmaM * cos2SigmaM)));
      var s = b * A * (sigma - deltaSigma);
    
      s = s.toFixed(3); // round to 1mm precision
      return s;
    }
         */


        /// <summary>
        /// retrieves position's reverse geocode
        /// </summary>
        /// <param name="dbMgr"></param>
        /// <param name="udtAsset"></param>
        /// <param name="udtPrev"></param>
        /// <param name="udtPos"></param>
        /// <param name="iEngine"></param>
        /// <param name="iLastEngine"></param>
        
        // [Chinky:20Aug2014] Changed parameters. Applied checking of engine status inside the function
        private void ApplyReverseGeocode(ref DatabaseMgrMySQL dbMgr, AssetInfo udtAsset, PosInfo udtPrev, PosInfo udtPos, int iEngine, int iLastEngine)    
        {
            bool bMoving = false;
           
            if (udtAsset.CategoryID == 16) //[Chinky:21Aug2014] Check if vehicle is a Trailer truck 
            {
                //[Dan:09Jul14] Apply Reverse geocode every 4 hours for IDLE and STOP vehicles (Support for Trailer)
                bool isRevGeoInterval = IsRevGeoInterval(ref dbMgr, udtPos);
                if (isRevGeoInterval)
                    bMoving = true;
            }
            else
            {                              
                if (iLastEngine == 2 || iEngine == 2)
                    bMoving = true;
            }
         
            if (bMoving) 
            {
                try
                {
                    // update location
                    udtPos.LocID = 0;
                    udtPos.Location = "Singapore";

                    // check fix
                    if (udtPos.FixID != 0)
                    {
                        // check last position
                        if ((udtAsset.LastFixID > 0) && (udtPrev != null))
                        {
                            // initialize location
                            udtPos.LocID = udtPrev.LocID;
                            udtPos.Location = udtPrev.Location;                       
                        }

                        //[Dan:09Jul14] Apply Reverse geocode every 12 hours for IDLE and STOP vehicles (Support for Trailer)
                        //bool isRevGeoInterval = IsRevGeoInterval(ref dbMgr, udtPos);

                        // check if vehicle is moving or no previous position
                        //bool bLookUp = (bMoving || (udtPrev == null) || isRevGeoInterval);//[Dan:09Jul14] Added isRevGeoInterval

                        bool bLookUp = (bMoving || udtPrev == null); //[Chinky:21Aug2014]
                        if (!bLookUp) bLookUp = ((udtPrev != null) && udtPrev.Location.ToUpper().Contains("NO ADDRESS"));

                        // check if reverse geocode is needed
                        if (bLookUp)
                        {
                            // round off coordinates
                            double lLatitude = Math.Round(udtPos.PosY, 4);
                            double lLongitude = Math.Round(udtPos.PosX, 4);

                            // get reverse geocode
                            string[] arrTemp = ReverseGeocode(ref dbMgr, lLatitude, lLongitude, 0).Split("\r".ToCharArray());
                            if (arrTemp.Length <= 1) arrTemp = ReverseGeocode(ref dbMgr, lLatitude, lLongitude, 1).Split("\r".ToCharArray());

                            //[Dan:09Jul14] save event for using reverse geocode                                                               
                             SaveAssetInfo(ref dbMgr, PosInfoType.ReverseGeocode, udtPos.PosID, udtPos.AssetID, udtPos.Timestamp);                                                         

                            // parse reverse geocode
                            udtPos.Location = arrTemp[0];
                            udtPos.LocID = (arrTemp.Length > 1 ? Convert.ToInt32(arrTemp[1]) : -1);
                        }

                        // limit location string length
                        if (udtPos.Location.Length > 100)
                            udtPos.Location = udtPos.Location.Substring(0, 100);
                    }
                }
                catch (Exception ex)
                {
                    // log error
                    DatabaseMgrMySQL.LogError(ex.Message, "ApplyReverseGeocode");
                }
            }
            else
            {
                //[Chinky:14Nov2014] Fix save position error when setting up newly configured device with no previous position yet
                if (udtPrev != null)
                    //[Chinky:20Aug2014] Get previous location if idle
                    udtPos.Location = udtPrev.Location;
                else
                    udtPos.Location = "Singapore";//TODO: Must be dynamic to support Malaysia
            }
        }

        /// <summary>
        /// [Dan:09Jul14] Check if latest info is greater than xx hours
        /// </summary>
        /// <param name="dbMgr"></param>
        /// <param name="udtPos"></param>
        /// <returns></returns>
        private bool IsRevGeoInterval(ref DatabaseMgrMySQL dbMgr, PosInfo udtPos)
        {
            bool retResult = false;

            try
            {
                DateTime dtLatest = CheckLatestAssetInfo(ref dbMgr, PosInfoType.ReverseGeocode, udtPos.AssetID);
                if (dtLatest != DateTime.MinValue)
                {
                    TimeSpan dtDiff = udtPos.Timestamp - dtLatest;
                    int interval = 0;
                    int.TryParse(ConfigurationManager.AppSettings["RevGeoInterval"], out interval);

                    if (dtDiff.TotalMinutes > interval)
                    {
                        retResult = true;
                        if (udtPos.Asset == "TRB4781D")
                            DatabaseMgrMySQL.LogEvent(String.Format("Latest Asset Info Timestamp: {0} Time elapsed: {1}", dtLatest, dtDiff), 0);
                    
                    }                                       
                }
                else//no previous data
                {
                    retResult = true;
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "IsRevGeoInterval");
            }

            if (udtPos.Asset == "TRB4781D")
                DatabaseMgrMySQL.LogEvent("IsRevGeoInterval: retResult " + retResult, 0);//testing [Dan:09Jul14]

            return retResult;
        }

        /// <summary>
        /// [Dan:09Jul14] Retrieve the latest Asset Info
        /// </summary>
        /// <param name="dbMgr"></param>
        /// <param name="posInfoType"></param>
        /// <param name="assetID"></param>
        private DateTime CheckLatestAssetInfo(ref DatabaseMgrMySQL dbMgr, PosInfoType posInfoType, int assetID)
        {
            DateTime dtResult = DateTime.MinValue;
            try
            {
                string sql = "SELECT timestamp FROM assetinfo WHERE postype_id = @PosType AND asset_id = @AssetID";
                object objTemp = dbMgr.ExecuteScalar(sql, new object[] { (int)posInfoType, assetID });
                if (objTemp != null)
                    dtResult = Convert.ToDateTime(objTemp);
            }
            catch(Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "CheckLatestAssetInfo");
            }
            return dtResult;
        }

        /// <summary>
        /// saves position record for UDP Winservice
        /// </summary>
        /// <param name="udtPos"></param>
        /// <returns></returns>
        public string SavePositionUDP(PosInfo udtPos)
        {
            return SavePosition(udtPos);
        }

        /// <summary>
        /// Check engine if stop/idle then reuse previous lat/long
        /// [Dan:02Sep12]
        /// </summary>
        /// <param name="udtPos"></param>
        /// <param name="udtPrev"></param>
        private static void CheckGPSJumping(PosInfo udtPos, PosInfo udtPrev)
        {
            try
            {
                //bug fix for GPS Jumping [Dan:02Sep12]
                //check engine if stop/idle
                //reuse previous lat/long
                if (udtPos.Engine == "STOP" || udtPos.Engine == "IDLE")
                {
                    if (udtPos.PosX != udtPrev.PosX || udtPos.PosY != udtPrev.PosY)
                    {
                        udtPos.PosX = udtPrev.PosX;
                        udtPos.PosY = udtPrev.PosY;

                        udtPos.LocID = udtPrev.LocID;
                        udtPos.Location = udtPrev.Location;

                        udtPos.Zone = udtPrev.Zone;
                        udtPos.ZoneID = udtPrev.ZoneID;

                        udtPos.Mileage = udtPrev.Mileage;
                        udtPos.Course = udtPrev.Course;
                    }
                }
            }
            catch { }
        }

        /// <summary>
        /// Force the engine status to Move or Idle
        /// workaround for W-locator Box no Ignition On [Dan:05Sep12]
        /// </summary>
        /// <param name="udtPos"></param>
        /// <param name="udtPrev"></param>
        /// <param name="iEngine"></param>
        /// <returns></returns>
        private static int CheckWlocatorBox(PosInfo udtPos, PosInfo udtPrev, int iEngine)
        {
            try
            {
                if (udtPos.Tag.Contains("WB"))
                {
                    //DatabaseMgrMySQL.LogEvent(String.Format("W-locator Box Found: {0}\r\nEngine:{1}\r\nIgition:{2}",
                    //    udtPos.Asset, iEngine, udtPos.Ignition), 0);

                    if (udtPos.Timestamp.Subtract(udtPrev.Timestamp).TotalMinutes < 10
                        && iEngine == 0)//10min interval 
                    {
                        iEngine = 1;

                        if (udtPos.Speed > 0)
                            iEngine = 2;
                    }
                }
            }
            catch (Exception ex)
            {
                DatabaseMgrMySQL.LogEvent(string.Format("CheckWlocatorBox>>{0}", ex.Message), 2);
            }
            return iEngine;
        }

        /// <summary>
        /// save idling report
        /// </summary>
        /// <param name="dbMgr"></param>
        /// <param name="udtPos"></param>
        /// <returns></returns>
        private string SaveIdlingReport(ref DatabaseMgrMySQL dbMgr, PosInfo udtPos)
        {
            string strRet = "";
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    int idleReportID = 0;

                    // get existing record
                    object objTemp = dbMgr.ExecuteScalar("SELECT TOP(1) idlereport_id FROM idlereport WHERE idle_start = @Timestamp " + 
                        "AND asset_id = @AssetID AND idle_end IS NULL", new object[]{ udtPos.Timestamp, udtPos.AssetID });
                    
                    if (objTemp != null)
                        idleReportID = Convert.ToInt32(objTemp);

                    // check if record already exists
                    if (idleReportID > 0)
                    {
                        // check engine status
                        if (udtPos.Engine != "IDLE")
                        {
                            // update latest data of asset
                            dbMgr.ExecuteNonQuery("UPDATE idlereport SET idle_end = @IdleEnd WHERE idlereport_id = @IdleReportID",
                                new object[] { udtPos.Timestamp, idleReportID });
                        }
                    }
                    else
                    {
                        // check engine status
                        if (udtPos.Engine == "IDLE")
                        {
                            // save new data
                            dbMgr.ExecuteNonQuery("INSERT INTO idlereport (driver, asset_id, idle_start, location) " +
                                "VALUES (@Driver, @AssetID, @IdleStart, @Location)",
                                new object[] { udtPos.Driver, udtPos.AssetID, udtPos.Timestamp, udtPos.Location });
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                strRet = DatabaseMgrMySQL.LogError(ex.Message, "SaveIdlingReport");
            }
            return strRet;
        }

        /*public List<IdlingReportInfo> GetIdlingReport(IdlingReportInfo udtIdlingInfo, int iUserID, string strCompany)
        {
            List<IdlingReportInfo> arrIdlingInfo = new List<IdlingReportInfo>();
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL(ConfigurationManager.AppSettings["ConnectionString2"]);
            DbDataReader dbRdr = null;

            try
            {
                // open database
                if (dbMgr.Open())
                {
                    string strSql = "SELECT TOP (@DownloadCount) * FROM idlingreport " + 
                        "INNER JOIN dbo.assets ON dbo.assets.asset_id = dbo.idlingreport.asset_id " + 
                        "WHERE idle_start = @IdleStart AND idle_end = @IdleEnd";
                }
            }
            catch (Exception ex)
            {
                DatabaseMgrMySQL.LogError(ex.Message, "GetIdlingReport");
            }
        }*/

        /// <summary>
        /// saves utilization record
        /// </summary>
        /// <param name="dbMgr"></param>
        /// <param name="udtPrev"></param>
        /// <param name="udtPos"></param>
        /// <returns></returns>
        private string SaveUtilization(ref DatabaseMgrMySQL dbMgr, PosInfo udtPrev, PosInfo udtPos)
        {
            DbDataReader dbRdr = null;
            string strRet = "";
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // initialize utilization report
                    UtilizeReport udtUtilize = new UtilizeReport();
                    udtUtilize.UtilID = 0;
                    udtUtilize.Date = udtPos.Timestamp.ToLocalTime().Date;
                    udtUtilize.Mileage = 0;
                    udtUtilize.StartTime = DateTime.MinValue;
                    udtUtilize.EndTime = DateTime.MinValue;
                    udtUtilize.LastIgnition = udtUtilize.Date;
                    
                    // check if record is already existing
                    dbRdr = dbMgr.ExecuteReader("SELECT * FROM utilization WHERE date = @Date AND asset_id = @AssetID",
                        new object[] { udtUtilize.Date, udtPos.AssetID });
                    if ((dbRdr != null) && dbRdr.HasRows && dbRdr.Read())
                    {
                        // get existing record
                        udtUtilize.UtilID = dbRdr.ToInt64("util_id");
                        udtUtilize.StartTime = dbRdr.ToDateTimeMin("start_time");
                        udtUtilize.EndTime = dbRdr.ToDateTimeMin("end_time");
                        udtUtilize.Stop1 = dbRdr.ToDouble("stop");
                        udtUtilize.Stop2 = dbRdr.ToDouble("stop_ex");
                        udtUtilize.Idle = dbRdr.ToDouble("idle");
                        udtUtilize.Move = dbRdr.ToDouble("move");
                        udtUtilize.StopCount = dbRdr.ToInt32("stop_count");
                        udtUtilize.Mileage = dbRdr.ToDouble("mileage");
                        udtUtilize.LastIgnition = dbRdr.ToDateTime("last_ignition");
                    }
                    if (dbRdr != null) dbRdr.Close();

                    // check engine status
                    TimeSpan tsDiff = udtPos.Timestamp - udtPrev.Timestamp;
                    switch (udtPrev.Engine)
                    {
                    case "STOP":
                        {
                            // update engine stop duration
                            udtUtilize.Stop1 += tsDiff.TotalMinutes;
                            if (udtUtilize.StartTime != DateTime.MinValue)
                                udtUtilize.Stop2 += tsDiff.TotalMinutes;
                        }
                        break;
                    case "IDLE": udtUtilize.Idle += tsDiff.TotalMinutes; break;
                    case "MOVE": udtUtilize.Move += tsDiff.TotalMinutes; break;
                    }

                    // check if vehicle stopped
                    if ((udtPrev.Engine != "STOP") && (udtPos.Engine == "STOP"))
                        udtUtilize.StopCount++;

                    // check ignition
                    if (udtPrev.Ignition == 1)
                    {
                        // check if no recorded time yet
                        if (udtUtilize.StartTime == DateTime.MinValue)
                        {
                            // set first ignition of the day
                            udtUtilize.StartTime = udtPrev.Timestamp;
                            udtUtilize.EndTime = udtPrev.Timestamp;
                        }

                        // update last ignition of the day
                        udtUtilize.LastIgnition = udtPos.Timestamp;
                        if (udtUtilize.EndTime < udtPrev.Timestamp)
                            udtUtilize.EndTime = udtPrev.Timestamp;
                    }

                    // update mileage
                    udtPos.Mileage /= 100;
                    if (udtPos.Mileage > udtPrev.Mileage)
                        udtUtilize.Mileage += (udtPos.Mileage - udtPrev.Mileage);

                    // format start and end times
                    string strStart = (udtUtilize.StartTime != DateTime.MinValue ? String.Format("'{0:dd-MMM-yyyy HH:mm:ss}'", udtUtilize.StartTime) : "NULL");
                    string strEnd = (udtUtilize.EndTime != DateTime.MinValue ? String.Format("'{0:dd-MMM-yyyy HH:mm:ss}'", udtUtilize.EndTime) : "NULL");

                    // save utilization record
                    if (udtUtilize.UtilID == 0)
                    {
                        // save new utilization record
                        object objTemp = dbMgr.ExecuteScalar(String.Format("INSERT INTO utilization (asset_id, driver, date, start_time, " +
                            "end_time, stop, stop_ex, idle, move, stop_count, mileage, last_ignition) OUTPUT INSERTED.util_id VALUES " +
                            "(@AssetID, @Driver, @Date, {0}, {1}, @Stop, @StopEx, @Idle, @Move, @StopCount, @Mileage, @LastIgnition)", 
                            strStart, strEnd), new object[] { udtPos.AssetID, udtPos.Driver, udtUtilize.Date, udtUtilize.Stop1, udtUtilize.Stop2, 
                            udtUtilize.Idle, udtUtilize.Move, udtUtilize.StopCount, udtUtilize.Mileage, udtUtilize.LastIgnition });
                        if (objTemp != null) udtUtilize.UtilID = Convert.ToInt64(objTemp);
                    }
                    else
                    {
                        // update utilization record
                        dbMgr.ExecuteScalar(String.Format("UPDATE utilization SET start_time = {0}, end_time = {1}, stop = @Stop, " + 
                            "stop_ex = @StopEx, idle = @Idle, move = @Move, stop_count = @StopCount, mileage = @Mileage, " +
                            "last_ignition = @LastIgnition WHERE util_id = @UtilID", strStart, strEnd), new object[] { udtUtilize.Stop1, 
                            udtUtilize.Stop2, udtUtilize.Idle, udtUtilize.Move, udtUtilize.StopCount, udtUtilize.Mileage, 
                            udtUtilize.LastIgnition, udtUtilize.UtilID });
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                strRet = DatabaseMgrMySQL.LogError(ex.Message, "SaveUtilization");
            }

            // close database
            if (dbRdr != null) dbRdr.Close();
            return strRet;
        }

        /// <summary>
        /// generates trips from zone exit event
        /// </summary>
        /// <param name="dbMgr"></param>
        /// <param name="udtPos"></param>
        /// <param name="arrPlans"></param>
        /// <returns></returns>
        private List<TripInfo> SaveTrips(ref DatabaseMgrMySQL dbMgr, PosInfo udtPos, List<PlanInfo> arrPlans)
        {
            List<TripInfo> arrTrips = new List<TripInfo>();
            DbDataReader dbRdr = null;
            try
            {
                // get zone enter id
                object objTemp = dbMgr.ExecuteScalar("SELECT status_id FROM status WHERE status_desc = 'Zone Enter'");
                int iZoneEnter = (objTemp != null ? Convert.ToInt32(objTemp) : 0);

                // get zone exit id
                objTemp = dbMgr.ExecuteScalar("SELECT status_id FROM status WHERE status_desc = 'Zone Exit'");
                int iZoneExit = (objTemp != null ? Convert.ToInt32(objTemp) : 0);

                // loop trough plans
                foreach (PlanInfo udtPlan in arrPlans)
                {
                    try
                    {
                        // check presence in origin zone
                        objTemp = dbMgr.ExecuteScalar("SELECT MAX(timestamp) FROM events WHERE asset_id = @AssetID AND " +
                            "status_id = @ZoneExit AND remarks = @Origin AND timestamp BETWEEN @StartTime AND @EndTime",
                            new object[] { udtPos.AssetID, iZoneExit, udtPlan.Origin, udtPos.Timestamp.AddHours(-12), udtPos.Timestamp });
                        if ((objTemp != null) && (objTemp.ToString() != ""))
                        {
                            // initialize trip
                            TripInfo udtTrip = new TripInfo();
                            udtTrip.PlanID = udtPlan.PlanID;
                            udtTrip.AssetID = udtPos.AssetID;
                            udtTrip.OriginEnter = DateTime.MinValue;
                            udtTrip.OriginExit = Convert.ToDateTime(objTemp);
                            udtTrip.DestinationEnter = DateTime.MinValue;
                            udtTrip.DestinationExit = udtPos.Timestamp;
                            udtTrip.Mileage = udtPos.Mileage;

                            // check if trip has already been saved
                            if (dbMgr.Exists("SELECT TOP(1) trip_id FROM view_trips WHERE asset_id = @AssetID " +
                                "AND origin_id = @OriginID AND origin_exit = @OriginExit",
                                new object[] { udtTrip.AssetID, udtPlan.OriginID, udtTrip.OriginExit }))
                                continue;

                            // get entry time to origin zone
                            long lStartPos = 0;
                            dbRdr = dbMgr.ExecuteReader("SELECT timestamp, pos_id FROM events WHERE asset_id = @AssetID " +
                                "AND status_id = @ZoneEnter AND remarks = @Origin AND timestamp BETWEEN @EntryTime AND @OriginExit",
                                new object[] { udtTrip.AssetID, iZoneEnter, udtPlan.Origin, udtTrip.OriginExit.AddHours(-12), 
                                udtTrip.OriginExit });
                            if ((dbRdr != null) && dbRdr.HasRows)
                            {
                                // loop through events
                                while (dbRdr.Read())
                                {
                                    // check timestamp
                                    DateTime dtOriginEnter = dbRdr.ToDateTime("timestamp");
                                    if (udtTrip.OriginEnter < dtOriginEnter && (udtTrip.OriginExit - dtOriginEnter).TotalMinutes > 2) //Alrey: Added checking if duration from origin is > 2 mins
                                    {
                                        // get entry time to origin zone
                                        udtTrip.OriginEnter = dtOriginEnter;
                                        lStartPos = dbRdr.ToInt64("pos_id");
                                    }
                                }
                            }
                            if (dbRdr != null) dbRdr.Close();

                            // check start position
                            if (lStartPos > 0)
                            {
                                // get starting mileage
                                objTemp = dbMgr.ExecuteScalar("SELECT TOP(1) mileage FROM positions WHERE pos_id = @PosID",
                                    new object[] { lStartPos });
                                if (objTemp != null) udtTrip.Mileage = (udtPos.Mileage - Convert.ToDouble(objTemp)) / 100;

                                // get entry time to destination zone
                                objTemp = dbMgr.ExecuteScalar("SELECT MAX(timestamp) FROM events WHERE asset_id = @AssetID AND " +
                                    "status_id = @ZoneEnter AND remarks = @Destination AND timestamp BETWEEN @OriginExit AND @DestinationExit",
                                    new object[] { udtTrip.AssetID, iZoneEnter, udtPlan.Destination, udtTrip.OriginExit, udtTrip.DestinationExit });
                                if ((objTemp != null) && (objTemp.ToString() != ""))
                                {
                                    // save trip event
                                    udtTrip.DestinationEnter = Convert.ToDateTime(objTemp);
                                    //Create trip if vehicle stayed for more than 2 hrs.
                                    DatabaseMgrMySQL.LogEvent("Save Trips [S]", 1);
                                    DatabaseMgrMySQL.LogEvent(string.Format("{0} {1} {2} - {3} {4} {5}",udtTrip.DestinationExit,udtTrip.DestinationEnter,(udtTrip.DestinationExit - udtTrip.DestinationEnter).TotalMinutes,udtTrip.OriginExit,udtTrip.OriginEnter,(udtTrip.OriginExit - udtTrip.OriginEnter).TotalMinutes), 1);
                                    DatabaseMgrMySQL.LogEvent("Save Trips [E]", 1);
                                    if ((udtTrip.DestinationExit - udtTrip.DestinationEnter).TotalMinutes >= 1 && (udtTrip.OriginExit - udtTrip.OriginEnter).TotalMinutes > 2)
                                    {
                                        objTemp = dbMgr.ExecuteScalar("INSERT INTO trips (plan_id, asset_id, origin_enter, origin_exit, " +
                                            "destination_enter, destination_exit, mileage) OUTPUT INSERTED.trip_id VALUES (@PlanID, @AssetID, " +
                                            "@OriginEnter, @OriginExit, @DestinationEnter, @DestinationExit, @Mileage)", new object[] { udtTrip.PlanID, 
                                        udtTrip.AssetID, udtTrip.OriginEnter, udtTrip.OriginExit, udtTrip.DestinationEnter, 
                                        udtTrip.DestinationExit, udtTrip.Mileage});
                                        if (objTemp != null)
                                        {
                                            // add trip to list
                                            udtTrip.TripID = Convert.ToInt32(objTemp);
                                            arrTrips.Add(udtTrip);
                                        }
                                    }
                                }
                            }
                        }
                    }
                    catch (Exception ex)
		            {
		                // log error
		                DatabaseMgrMySQL.LogError(ex.Message, "SaveTrips");
		            }
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "SaveTrips");
            }
            if (dbRdr != null) dbRdr.Close();
            return arrTrips;
        }

        /// <summary>
        /// Get the datetime during presence in zone
        /// [Dan:13Oct2013] 
        /// </summary>
        /// <param name="udtPos"></param>
        /// <param name="statusId"></param>
        /// <param name="origin"></param>
        /// <returns></returns>
        public DateTime GetPresenceInZone(PosInfo udtPos, int statusId, string zone)
        {
            DateTime retVal = DateTime.MinValue;
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            object objTemp = new object();
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // check presence in origin zone
                    objTemp = dbMgr.ExecuteScalar("SELECT MAX(timestamp) FROM events WHERE asset_id = @AssetID AND " +
                        "status_id = @ZoneExit AND remarks = @Origin AND timestamp BETWEEN @StartTime AND @EndTime",
                        new object[] { udtPos.AssetID, statusId, zone, udtPos.Timestamp.AddHours(-12), udtPos.Timestamp });

                    retVal = Convert.ToDateTime(objTemp);
                    // close database
                    dbMgr.Close();
                }
            }
            catch (Exception ex)
            {
                DatabaseMgrMySQL.LogEvent(ex.Message, 1);
                // close database
                dbMgr.Close();
            }
            return retVal;
        }

        /// <summary>
        /// Get Entry Time in zone
        /// [Dan:13Oct2013]
        /// </summary>
        /// <param name="udtTrip"></param>
        /// <param name="statusId"></param>
        /// <param name="zone"></param>
        /// <returns></returns>
        public long GetEntryTimeOriginZone(TripInfo udtTrip, int statusId, string zone, DateTime dtStart, DateTime dtEnd)
        {
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            DbDataReader dbRdr = null;
            long lStartPos = 0;

            try
            {
                // open database
                if (dbMgr.Open())
                {
                    dbRdr = dbMgr.ExecuteReader("SELECT timestamp, pos_id FROM events WHERE asset_id = @AssetID " +
                                        "AND status_id = @ZoneEnter AND remarks = @Origin AND timestamp BETWEEN @EntryTime AND @OriginExit",
                                        new object[] { udtTrip.AssetID, statusId, zone, dtStart, dtEnd });
                    if ((dbRdr != null) && dbRdr.HasRows)
                    {
                        // loop through events
                        while (dbRdr.Read())
                        {
                            // check timestamp
                            DateTime dtOriginEnter = dbRdr.ToDateTime("timestamp");
                            if (udtTrip.OriginEnter < dtOriginEnter)
                            {
                                // get entry time to origin zone
                                udtTrip.OriginEnter = dtOriginEnter;
                                lStartPos = dbRdr.ToInt64("pos_id");
                            }
                        }
                    }
                }
                if (dbRdr != null) dbRdr.Close();
                dbMgr.Close();// close database
            }
            catch (Exception ex)
            {
                DatabaseMgrMySQL.LogEvent(ex.Message, 1);
                dbMgr.Close(); // close database
            }

            return lStartPos;
        }

        public DateTime GetEntryTimeDestinationZone(TripInfo udtTrip, int statusId, string zone, DateTime dtStart, DateTime dtEnd)
        {
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            DbDataReader dbRdr = null;

            try
            {
                // open database
                if (dbMgr.Open())
                {
                    object objTemp = dbMgr.ExecuteScalar("SELECT MAX(timestamp) FROM events WHERE asset_id = @AssetID AND " +
                                    "status_id = @ZoneEnter AND remarks = @Destination AND timestamp BETWEEN @OriginExit AND @DestinationExit",
                                    new object[] { udtTrip.AssetID, statusId, zone, udtTrip.OriginExit, udtTrip.DestinationExit });
                    if ((objTemp != null) && (objTemp.ToString() != ""))
                    {
                        // save trip event
                        udtTrip.DestinationEnter = Convert.ToDateTime(objTemp);
                    }
                }
                if (dbRdr != null) dbRdr.Close();
            }
            catch (Exception ex)
            {
                DatabaseMgrMySQL.LogEvent(ex.Message, 1);
            }

            dbMgr.Close(); // close database
            return udtTrip.DestinationEnter;
        }

        public PosInfo GetAssetLastPos(string iAssetName)
        {
            PosInfo assetPosInfo = new PosInfo();
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            DbDataReader dbRdr = null;

            try
            {
                // open database
                if (dbMgr.Open())
                {
                    dbRdr = dbMgr.ExecuteReader("SELECT TOP (1) * FROM view_positions WHERE asset = @AssetName", new object[] { iAssetName });
                }
                if ((dbRdr != null) && dbRdr.HasRows)
                {
                    while (dbRdr.Read())
                    {
                        assetPosInfo = BuildPosition(dbRdr);
                    }
                }

            }
            catch (Exception ex)
            {
                DatabaseMgrMySQL.LogError(ex.Message, "GetAssetLastPos");
            }
            // close database
            if (dbRdr != null) dbRdr.Close();
            dbMgr.Close();
            return assetPosInfo;
        }

        public double GetPosInfo(long posID)
        {
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            double retVal = 0;

            try
            {
                // open database
                if (dbMgr.Open())
                {// get starting mileage
                    object objTemp = dbMgr.ExecuteScalar("SELECT TOP(1) mileage FROM positions WHERE pos_id = @PosID",
                        new object[] { posID });
                    if (objTemp != null)
                    {
                        retVal = Convert.ToDouble(objTemp);
                    }
                }

            }
            catch (Exception ex)
            {
                DatabaseMgrMySQL.LogEvent(ex.Message, 1);
                // close database
            }
            dbMgr.Close();

            return retVal;
        }

        /// <summary>
        /// generates trips from zone exit event
        /// </summary>
        /// <param name="dbMgr"></param>
        /// <param name="udtPos"></param>
        /// <param name="arrPlans"></param>
        /// <returns></returns>
        private bool SaveTripsZone(TripZoneInfo udtTripZoneInfo)
        {
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            DbDataReader dbRdr = null;
            bool result = false;
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    string strSql = "INSERT INTO tripszone (timestamp, rx_time, zone_id, zone_name, " +
                                        "company_id, asset_id) " +
                                        "VALUES (@TIMESTAMP, @RXTIME, " +
                                        "@ZONEID, @ZONENAME, @COMPANYID, " +
                                        "@ASSETID)";
                    object objTemp = dbMgr.ExecuteScalar(strSql, 
                        new object[] 
                        { 
                            udtTripZoneInfo.Timestamp,
                            DateTime.Today,
                            udtTripZoneInfo.ZoneID,
                            udtTripZoneInfo.ZoneName,
                            udtTripZoneInfo.CompanyID,
                            udtTripZoneInfo.AssetID
                        });
                    // close database
                    dbMgr.Close();
                }

                result = true;
            }
            catch (Exception ex)
            {
                DatabaseMgrMySQL.LogEvent(ex.Message, 1);
                // close database
                dbMgr.Close();
                result = false;
            }

                                    
            if (dbRdr != null) dbRdr.Close();
            return result;
        }

        /// <summary>
        /// checks point in location
        /// </summary>
        /// <param name="ptPos"></param>
        /// <param name="strPts"></param>
        /// <returns></returns>
        private bool IsPointInLoc(PointF ptPos, string strPts)
        {
            try
            {
                List<PointF> arrPts = new List<PointF>();
                string[] arrTemp = strPts.Split();

                // loop through points
                foreach (string strTemp in arrTemp)
                {
                    // add point to list
                    string[] arrCoord = strTemp.Split(",".ToCharArray());
                    arrPts.Add(new PointF((float)Convert.ToDouble(arrCoord[1]), (float)Convert.ToDouble(arrCoord[0])));
                }

                // check if circle
                if (arrPts.Count < 3)
                {
                    // check if circler
                    if (arrPts.Count == 2)
                    {
                        // get map rectangle
                        double lRadius = Math.Sqrt(Math.Pow(arrPts[0].X - arrPts[1].X, 2) + Math.Pow(arrPts[0].Y - arrPts[1].Y, 2));
                        return ((Math.Abs(arrPts[0].X - ptPos.X) < lRadius) && (Math.Abs(arrPts[0].Y - ptPos.Y) < lRadius));
                    }
                    return true;
                }

                // get first point
                PointF ptOld = new PointF(arrPts[arrPts.Count - 1].X, arrPts[arrPts.Count - 1].Y);
                PointF ptTemp1, ptTemp2;
                bool bInside = false;

                // loop through zone points
                for (int i = 0; i < arrPts.Count; i++)
                {
                    // get pair of points
                    PointF ptNew = new PointF(arrPts[i].X, arrPts[i].Y);
                    if (ptNew.X > ptOld.X)
                    {
                        ptTemp1 = ptOld;
                        ptTemp2 = ptNew;
                    }
                    else
                    {
                        ptTemp1 = ptNew;
                        ptTemp2 = ptOld;
                    }

                    // check point if inbetween
                    if ((ptNew.X < ptPos.X) == (ptPos.X <= ptOld.X) &&
                        ((double)ptPos.Y - (double)ptTemp1.Y) * (double)(ptTemp2.X - ptTemp1.X) <
                        ((double)ptTemp2.Y - (double)ptTemp1.Y) * (double)(ptPos.X - ptTemp1.X))
                        bInside = !bInside;

                    // move to next point
                    ptOld = ptNew;
                }
                return bInside;
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "IsPointInLoc");
            }
            return false;
        }

        /// <summary>
        /// downloads zone report
        /// </summary>
        /// <param name="evtFilter"></param>
        /// <param name="iUserID"></param>
        /// <returns></returns>
        public List<ZoneReport> GetZoneReport(EventInfo evtFilter, int iUserID, string strCompany)
        {
            List<ZoneReport> arrReport = new List<ZoneReport>();

            //[Dan:10Jun14]
            //DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL(ConfigurationManager.AppSettings["ConnectionString2"]);
            DatabaseMgrMySQL dbMgr = GetDatabaseConnection(evtFilter.Timestamp);

            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // get zone events
                    arrReport = GetZoneReport(ref dbMgr, evtFilter, iUserID, strCompany);
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "GetZoneReport");
            }

            // close database
            dbMgr.Close();
            return arrReport;   
        }

        /// <summary>
        /// downloads zone report
        /// </summary>
        /// <param name="evtFilter"></param>
        /// <param name="iUserID"></param>
        /// <returns></returns>
        public List<ZoneReport> GetZoneReport(ref DatabaseMgrMySQL dbMgr, EventInfo evtFilter, int iUserID, string strCompany)
        {
            List<ZoneReport> arrReport = new List<ZoneReport>();
            DbDataReader dbRdr = null;
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // check event filter
                    if ((evtFilter.Event == null) || (evtFilter.Event == ""))
                    {
                        // get zone events
                        string strEvents = "";
                        dbRdr = dbMgr.ExecuteReader("SELECT status_id FROM status WHERE status_desc = 'Zone Enter' OR status_desc = 'Zone Exit'");
                        if ((dbRdr != null) && dbRdr.HasRows)
                        {
                            // loop through records
                            while (dbRdr.Read())
                                strEvents += String.Format("{0},", dbRdr.ToInt32("status_id"));
                        }
                        if (dbRdr != null) dbRdr.Close();

                        // update event filter
                        evtFilter.Event = strEvents.Trim(",".ToCharArray());
                    }

                    // get zone events
                    List<EventInfo> arrEvents = GetEvents(evtFilter, iUserID, strCompany);
                    foreach (EventInfo udtEnter in arrEvents)
                    {
                        // check if enter event
                        if (udtEnter.Event == "Zone Enter")
                        {
                            // check timestamp filter
                            if (udtEnter.Timestamp >= evtFilter.RxTime)
                                break;

                            // build zone report record
                            ZoneReport udtReport = new ZoneReport();
                            udtReport.EnterID = udtEnter.EventID;
                            udtReport.ExitID = 0;
                            udtReport.Zone = udtEnter.Remarks;
                            udtReport.Asset = udtEnter.Asset;
                            udtReport.Tag = udtEnter.Tag;
                            udtReport.Driver = (udtEnter.Position != null ? udtEnter.Position.Driver : "");
                            udtReport.EntryTime = udtEnter.Timestamp;
                            udtReport.ExitTime = udtReport.EntryTime;
                            udtReport.ExitTimeEx = "Indefinite";
                            udtReport.Duration = "Indefinite";

                            // get corresponding exit
                            List<EventInfo> arrTemp = (from evt in arrEvents
                                          where (evt.Event == "Zone Exit")
                                          && (evt.Remarks == udtEnter.Remarks)
                                          && (evt.AssetID == udtEnter.AssetID)
                                          && (evt.EventID > udtEnter.EventID)
                                          orderby evt.Timestamp ascending
                                          select evt).ToList();

                            EventInfo udtExit = (arrTemp.Count() == 0 ? null : arrTemp.First());
                            if (udtExit != null)
                            {
                                // update departure time
                                udtReport.ExitID = udtExit.EventID;
                                udtReport.ExitTime = udtExit.Timestamp;
                            }
                            else
                            {
                                // get exit time
                                dbRdr = dbMgr.ExecuteReader("SELECT event_id, timestamp FROM view_events WHERE status_desc = 'Zone Exit' " +
                                    "AND remarks = @Remarks AND asset_id = @AssetID AND event_id > @EventID", new object[] { udtEnter.Remarks, 
                                    udtEnter.AssetID, udtEnter.EventID });
                                if ((dbRdr != null) && dbRdr.HasRows && dbRdr.Read())
                                {
                                    // update departure time
                                    udtReport.ExitID = dbRdr.ToInt32("event_id");
                                    udtReport.ExitTime = dbRdr.ToDateTime("timestamp");
                                }
                                if (dbRdr != null) dbRdr.Close();
                            }

                            // check exit
                            if (udtReport.ExitID != 0)
                            {
                                // update duration
                                TimeSpan tsDiff = udtReport.ExitTime - udtReport.EntryTime;
                                udtReport.Duration = String.Format("{0:00}:{1:00}:{2:00}",
                                    tsDiff.Hours, tsDiff.Minutes, tsDiff.Seconds);
                                udtReport.ExitTimeEx = String.Format("{0:dd-MMM-yyyy HH:mm:ss}", udtReport.ExitTime);
                            }

                            // add record to report
                            arrReport.Add(udtReport);
                        }
                    }

                    // check for zone filter
                    if (evtFilter.Zone != "")
                        arrReport = arrReport.Where(x => x.Zone == evtFilter.Zone).ToList();
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "GetZoneReport");
            }

            // close database
            if (dbRdr != null) dbRdr.Close();
            return arrReport;
        }

        /// <summary>
        /// gets speed report
        /// </summary>
        /// <param name="posFilter"></param>
        /// <param name="iUserID"></param>
        /// <returns></returns>
        public List<SpeedReport> GetSpeedReport(PosInfo posFilter, int iUserID, string strCompany)
        {
            List<SpeedReport> arrSpeed = new List<SpeedReport>();

            //[Dan:10Jun14] Support for Archive database
            //DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL(ConfigurationManager.AppSettings["ConnectionString2"]);
            DatabaseMgrMySQL dbMgr = GetDatabaseConnection(posFilter.Timestamp);

            DbDataReader dbRdr = null;
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // initialize sql command
                    string strSql = String.Format("SELECT TOP {0} pos_id, tag, asset, driver, loc, speed, timestamp FROM view_positions " +
                        "WHERE timestamp BETWEEN '{1:dd-MMM-yyyy HH:mm:ss}' AND '{2:dd-MMM-yyyy HH:mm:ss}'", ConfigurationManager.AppSettings["DownloadCount"], 
                        posFilter.Timestamp, posFilter.RxTime);
                    if (posFilter.Speed > 0) strSql += String.Format(" AND speed >= {0} AND fix > 0", posFilter.Speed);
                    if (posFilter.PosID > 0) strSql += String.Format(" AND pos_id < {0}", posFilter.PosID);
                    if (posFilter.AssetID > 0) strSql += String.Format(" AND asset_id = {0}", posFilter.AssetID);
                    else if (GetUserRole(ref dbMgr, iUserID) > 0)
                    {
                        // filter by company
                        object objTemp = dbMgr.ExecuteScalar(String.Format("SELECT company_id FROM users WHERE user_id = {0}", iUserID));
                        if (objTemp != null) strSql += String.Format(" AND company_id = {0}", objTemp);

                        // limit to assigned assets only
                        objTemp = dbMgr.ExecuteScalar(String.Format("SELECT assets FROM users WHERE user_id = {0}", iUserID));
                        if ((objTemp != null) && (objTemp.ToString() != ""))
                            strSql += String.Format(" AND asset_id IN ({0})", objTemp);
                    }
                    else
                    {
                        // filter by company
                        object objTemp = dbMgr.ExecuteScalar(String.Format("SELECT company_id FROM companies WHERE name = '{0}'", strCompany));
                        if (objTemp != null) strSql += String.Format(" AND company_id = {0}", objTemp);
                    }

                    // get positions
                    dbRdr = dbMgr.ExecuteReader(strSql + " ORDER BY timestamp DESC");
                    if ((dbRdr != null) && dbRdr.HasRows)
                    {
                        // loop through positions
                        while (dbRdr.Read())
                        {
                            // add speed report
                            SpeedReport udtSpeed = new SpeedReport();
                            udtSpeed.PosID = dbRdr.ToInt64("pos_id");
                            udtSpeed.Tag = dbRdr.ToString("tag");
                            udtSpeed.Asset = dbRdr.ToString("asset");
                            udtSpeed.Driver = dbRdr.ToString("driver");
                            udtSpeed.Location = FormatLocation(dbRdr.ToString("loc"));
                            udtSpeed.Speed = dbRdr.ToDouble("speed");
                            udtSpeed.Timestamp = dbRdr.ToDateTime("timestamp");
                            arrSpeed.Add(udtSpeed);
                        }
                    }
                    if (dbRdr != null) dbRdr.Close();
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "GetSpeedReport");
            }

            // close database
            if (dbRdr != null) dbRdr.Close();
            dbMgr.Close();
            return arrSpeed;
        }

        /// <summary>
        /// gets utilization report
        /// </summary>
        /// <param name="posFilter"></param>
        /// <param name="iUserID"></param>
        /// <returns></returns>
        public List<UtilizeReport> GetUtilizeReport(UtilizeReport utilFilter, int iUserID, string strCompany)
        {
            List<UtilizeReport> arrUtilize = new List<UtilizeReport>();
            
            //[Chinky: 05Mar2014] Added Datetime checking to enable getting data from archive database
            //DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL(ConfigurationManager.AppSettings["ConnectionString2"]);
            DatabaseMgrMySQL dbMgr = GetDatabaseConnection(utilFilter.StartTime);

            DbDataReader dbRdr = null;


            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // initialize sql command
                    string strSql = String.Format("SELECT TOP {0} * FROM view_utilization WHERE date BETWEEN " +
                        "'{1:dd-MMM-yyyy HH:mm:ss}' AND '{2:dd-MMM-yyyy HH:mm:ss}'",
                        ConfigurationManager.AppSettings["DownloadCount"], utilFilter.StartTime, utilFilter.EndTime);
                    if (utilFilter.UtilID > 0) strSql += String.Format(" AND util_id < {0}", utilFilter.UtilID);
                    if (utilFilter.AssetID > 0) strSql += String.Format(" AND asset_id = {0}", utilFilter.AssetID);
                    if (utilFilter.CategoryID > 0) strSql += String.Format(" AND category_id = {0}", utilFilter.CategoryID);
                    if (utilFilter.Driver != "") strSql += String.Format(" AND driver LIKE '%{0}%'", utilFilter.Driver);
                    else if (GetUserRole(ref dbMgr, iUserID) > 0)
                    {
                        // filter by company
                        object objTemp = dbMgr.ExecuteScalar(String.Format("SELECT company_id FROM users WHERE user_id = {0}", iUserID));
                        if (objTemp != null) strSql += String.Format(" AND company_id = {0}", objTemp);

                        // limit to assigned assets only
                        objTemp = dbMgr.ExecuteScalar(String.Format("SELECT assets FROM users WHERE user_id = {0}", iUserID));
                        if ((objTemp != null) && (objTemp.ToString() != ""))
                            strSql += String.Format(" AND asset_id IN ({0})", objTemp);
                    }
                    else
                    {
                        // filter by company
                        object objTemp = dbMgr.ExecuteScalar(String.Format("SELECT company_id FROM companies WHERE name = '{0}'", strCompany));
                        if (objTemp != null) strSql += String.Format(" AND company_id = {0}", objTemp);
                    }

                    // get utilization report
                    dbRdr = dbMgr.ExecuteReader(strSql + " ORDER BY date DESC");
                    if ((dbRdr != null) && dbRdr.HasRows)
                    {
                        // loop through positions
                        while (dbRdr.Read())
                        {
                            // initialize utilization report
                            UtilizeReport udtUtilize = new UtilizeReport();
                            udtUtilize.UtilID = dbRdr.ToInt64("util_id");
                            udtUtilize.Asset = dbRdr.ToString("asset");
                            udtUtilize.Driver = dbRdr.ToString("driver");
                            udtUtilize.Category = dbRdr.ToString("category");
                            udtUtilize.Tag = dbRdr.ToString("tag");
                            udtUtilize.Date = dbRdr.ToDateTime("date");
                            udtUtilize.StartTime = dbRdr.ToDateTimeMin("start_time");
                            udtUtilize.EndTime = dbRdr.ToDateTimeMin("end_time");
                            udtUtilize.Stop1 = dbRdr.ToDouble("stop");
                            udtUtilize.Stop2 = dbRdr.ToDouble("stop_ex");
                            udtUtilize.Idle = dbRdr.ToDouble("idle");
                            udtUtilize.Move = dbRdr.ToDouble("move");
                            udtUtilize.StopCount = dbRdr.ToInt32("stop_count");
                            udtUtilize.Mileage = Math.Round(dbRdr.ToDouble("mileage"), 2);
                            arrUtilize.Add(udtUtilize);
                        }
                    }
                    if (dbRdr != null) dbRdr.Close();
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "GetUtilizeReport");
            }

            // close database
            if (dbRdr != null) dbRdr.Close();
            dbMgr.Close();
            return arrUtilize;
        }

        /// <summary>
        /// gets mileage report
        /// </summary>
        /// <param name="mileFilter"></param>
        /// <param name="iUserID"></param>
        /// <returns></returns>
        public List<MileageReport> GetMileageReport(MileageReport mileFilter, int iUserID, string strCompany)
        {
            List<MileageReport> arrMileage = new List<MileageReport>();

            //[Dan:25Jun14] 
            //DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL(ConfigurationManager.AppSettings["ConnectionString2"]);
            DatabaseMgrMySQL dbMgr = GetDatabaseConnection(mileFilter.StartTime);
            //

            DbDataReader dbRdr = null;
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // initialize sql command
                    string strSql = String.Format("SELECT TOP {0} * FROM view_utilization WHERE date BETWEEN " +
                        "'{1:dd-MMM-yyyy HH:mm:ss}' AND '{2:dd-MMM-yyyy HH:mm:ss}'",
                        ConfigurationManager.AppSettings["DownloadCount"], mileFilter.StartTime, mileFilter.EndTime);
                    if (mileFilter.MileageID > 0) strSql += String.Format(" AND util_id < {0}", mileFilter.MileageID);
                    if (mileFilter.AssetID > 0) strSql += String.Format(" AND asset_id = {0}", mileFilter.AssetID);
                    if (mileFilter.CategoryID > 0) strSql += String.Format(" AND category_id = {0}", mileFilter.CategoryID);
                    if (mileFilter.Driver != "") strSql += String.Format(" AND driver LIKE '%{0}%'", mileFilter.Driver);
                    else if (GetUserRole(ref dbMgr, iUserID) > 0)
                    {
                        // filter by company
                        object objTemp = dbMgr.ExecuteScalar(String.Format("SELECT company_id FROM users WHERE user_id = {0}", iUserID));
                        if (objTemp != null) strSql += String.Format(" AND company_id = {0}", objTemp);

                        // limit to assigned assets only
                        objTemp = dbMgr.ExecuteScalar(String.Format("SELECT assets FROM users WHERE user_id = {0}", iUserID));
                        if ((objTemp != null) && (objTemp.ToString() != ""))
                            strSql += String.Format(" AND asset_id IN ({0})", objTemp);
                    }
                    else
                    {
                        // filter by company
                        object objTemp = dbMgr.ExecuteScalar(String.Format("SELECT company_id FROM companies WHERE name = '{0}'", strCompany));
                        if (objTemp != null) strSql += String.Format(" AND company_id = {0}", objTemp);
                    }

                    // get utilization report
                    dbRdr = dbMgr.ExecuteReader(strSql + " ORDER BY date DESC");
                    if ((dbRdr != null) && dbRdr.HasRows)
                    {
                        // loop through positions
                        while (dbRdr.Read())
                        {
                            // initialize utilization report
                            MileageReport udtMile = new MileageReport();
                            udtMile.MileageID = dbRdr.ToInt64("util_id");
                            udtMile.Asset = dbRdr.ToString("asset");
                            udtMile.Driver = dbRdr.ToString("driver");
                            udtMile.Category = dbRdr.ToString("category");
                            udtMile.Tag = dbRdr.ToString("tag");
                            udtMile.Date = dbRdr.ToDateTime("date");
                            udtMile.StartTime = dbRdr.ToDateTimeMin("start_time");
                            udtMile.EndTime = dbRdr.ToDateTimeMin("end_time");
                            udtMile.Mileage = Math.Round(dbRdr.ToDouble("mileage"), 2);
                            arrMileage.Add(udtMile);
                        }
                    }
                    if (dbRdr != null) dbRdr.Close();
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "GetMileageReport");
            }

            // close database
            if (dbRdr != null) dbRdr.Close();
            dbMgr.Close();
            return arrMileage;    
        }

        /// <summary>
        /// downloads mixer report
        /// </summary>
        /// <param name="evtFilter"></param>
        /// <param name="iUserID"></param>
        /// <returns></returns>
        public List<MixerReport> GetMixerReport(EventInfo evtFilter, int iUserID, string strCompany)
        {
            List<MixerReport> arrMixer = new List<MixerReport>();

            //[Dan:25Jun14] 
            //DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL(ConfigurationManager.AppSettings["ConnectionString2"]);
            DatabaseMgrMySQL dbMgr = GetDatabaseConnection(evtFilter.Timestamp);
            //

            DbDataReader dbRdr = null;
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // get mixer events
                    List<EventInfo> arrEvents = GetEvents(evtFilter, iUserID, strCompany);
                    foreach (EventInfo udtEvent in arrEvents)
                    {
                        // initialize mixer event
                        MixerReport udtMixer = new MixerReport();
                        udtMixer.EventID = udtEvent.EventID;
                        udtMixer.Asset = udtEvent.Asset;
                        udtMixer.Tag = udtEvent.Tag;
                        udtMixer.Driver = (udtEvent.Position != null ? udtEvent.Position.Driver : "");
                        udtMixer.Timestamp = udtEvent.Timestamp;

                        // check event type
                        switch (udtEvent.Event)
                        {
                        case "Drum Status":
                        case "Off-site Alert":
                            {
                                // get drum event info
                                udtMixer.Event = udtEvent.Event;
                                udtMixer.Remarks = udtEvent.Remarks;
                                udtMixer.Zone = (udtEvent.Position != null ? udtEvent.Position.Zone : "");
                            }
                            break;
                        case "Zone Enter":
                        case "Zone Exit":
                            {
                                // get zone event info
                                udtMixer.Event = udtEvent.Event;
                                udtMixer.Zone = udtEvent.Remarks;
                            }
                            break;
                        }
                        
                        // add mixer event to report
                        arrMixer.Add(udtMixer);
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "GetMixerReport");
            }

            // close database
            if (dbRdr != null) dbRdr.Close();
            dbMgr.Close();
            return arrMixer;
        }

        /// <summary>
        /// gets incoming raw data logs
        /// </summary>
        /// <param name="Key"></param>
        /// <param name="Filter"></param>
        /// <param name="Start"></param>
        /// <param name="End"></param>
        /// <returns></returns>
        public List<RawData> GetRawData(string Key, RawData Filter, DateTime Start, DateTime End)
        {
            List<RawData> arrData = new List<RawData>();
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            DbDataReader dbRdr = null;
            try
            {
                // check api key if valid
                UserInfo udtUser = GetUser(ref dbMgr, Key);
                if ((udtUser != null) && (udtUser.RoleID == 0))
                {
                    // initialize sql command
                    List<object> arrParams = new List<object>();
                    string strSql = String.Format("SELECT TOP {0} * FROM view_data", ConfigurationManager.AppSettings["DownloadCount"]);
                    strSql += " WHERE rx_time BETWEEN @Start AND @End";
                    arrParams.Add(Start);
                    arrParams.Add(End);

                    // check data id
                    if (Filter.DataID > 0)
                    {
                        // filter by data id
                        strSql += " AND data_id < @DataID";
                        arrParams.Add(Filter.DataID);
                    }

                    // override company if insufficient access level
                    int iCompanyID = (udtUser.RoleID > 1 ? udtUser.CompanyID : Filter.CompanyID);
                    
                    // check asset
                    if (Filter.AssetID > 0)
                    {
                        // filter by asset id
                        strSql += " AND asset_id = @Asset";
                        arrParams.Add(Filter.AssetID);
                    }
                    else
                    {
                        // limit to assigned assets only
                        if ((udtUser.Assets != "") && (udtUser.CompanyID == iCompanyID))
                            strSql += String.Format(" AND asset_id IN ({0})", udtUser.Assets);
                        else
                        {
                            // filter by company
                            strSql += " AND company_id = @CompanyID";
                            arrParams.Add(iCompanyID);
                        }
                    }

                    // get raw data
                    dbRdr = dbMgr.ExecuteReader(strSql + " ORDER BY rx_time DESC", arrParams.ToArray());
                    if ((dbRdr != null) && dbRdr.HasRows)
                    {
                        // loop through data
                        while (dbRdr.Read())
                        {
                            // add data to list
                            RawData udtData = new RawData();
                            udtData.DataID = dbRdr.ToInt64("data_id");
                            udtData.Data = dbRdr.ToString("data");
                            udtData.CompanyID = dbRdr.ToInt32("company_id");
                            udtData.AssetID = dbRdr.ToInt32("asset_id");
                            udtData.Asset = dbRdr.ToString("asset");
                            udtData.TagID = dbRdr.ToInt32("tag_id");
                            udtData.Tag = dbRdr.ToString("tag");
                            udtData.Timestamp = dbRdr.ToDateTime("timestamp");
                            udtData.RxTime = dbRdr.ToDateTime("rx_time");
                            arrData.Add(udtData);
                        }
                    }
                    if (dbRdr != null) dbRdr.Close();
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError("GetRawData", ex.Message);
            }

            // close database
            if (dbRdr != null) dbRdr.Close();
            dbMgr.Close();
            return arrData;
        }

        /// <summary>
        /// processes received data
        /// </summary>
        /// <returns></returns>
        public Response ProcessRawData(string Key, List<RawData> arrData)
        {
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            ErrorCode retCode = ErrorCode.OK;
            List<string> arrDevices = new List<string>();
            try
            {
                // check api key if valid
                UserInfo udtUser = GetUser(ref dbMgr, Key);
                if ((udtUser != null) && (udtUser.RoleID == 0))
                {
                    // loop through data
                    DeviceProtocol devParser = new DeviceProtocol(this, ref dbMgr, udtUser);
                    for (int i = 0; i < arrData.Count; i++)
                    {
                        // parse raw data
                        RawData udtData = arrData[i];
                        string strID = udtData.Tag;
                        udtData.Tag = "";
                        udtData.Tag = devParser.ProcessData(udtData);

                        // check gps device
                        if (!String.IsNullOrEmpty(udtData.Tag) && (udtData.Tag != strID))
                        {
                            // add device to list
                            string strDevice = String.Format("{0}={1}", strID, udtData.Tag);
                            if (!arrDevices.Contains(strDevice)) arrDevices.Add(strDevice);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "ProcessRawData");
            }

            // close database
            dbMgr.Close();

            // format response
            Response udtRet = retCode.FormatResponse();
            udtRet.ErrMessage = String.Join(",", arrDevices);
            return udtRet;
        }

        /// <summary>
        /// saves incoming data record
        /// </summary>
        /// <param name="Key"></param>
        /// <param name="Data"></param>
        /// <returns></returns>
        public long SaveRawData(ref DatabaseMgrMySQL dbMgr, RawData Data)
        {
            DbDataReader dbRdr = null;
            long iRet = (long)ErrorCode.OK;
            object objTemp = null;
            try
            {
                // check device id
                if (Data.TagID == 0)
                {
                    // get tag id
                    objTemp = dbMgr.ExecuteScalar("SELECT tag_id FROM tags WHERE name = @Tag", new object[] { Data.Tag });
                    if (objTemp != null) Data.TagID = Convert.ToInt32(objTemp);
                }

                // check server
                if ((Data.TagID != 0) && !String.IsNullOrEmpty(Data.ServerIP) && (Data.ServerPort != 0))
                {
                    // initialize server settings
                    string strServerIP = Data.ServerIP;
                    int iServerPort = Data.ServerPort;

                    // check current server settings
                    dbRdr = dbMgr.ExecuteReader("SELECT APN, port FROM tags WHERE tag_id = @TagID", new object[] { Data.TagID });
                    if ((dbRdr != null) && dbRdr.HasRows && dbRdr.Read())
                    {
                        // get server settings
                        strServerIP = dbRdr.ToString("APN");
                        iServerPort = dbRdr.ToInt32("port");
                    }
                    if (dbRdr != null) dbRdr.Close();

                    // check if server settings have changed
                    if ((strServerIP != Data.ServerIP) || (iServerPort != Data.ServerPort))
                    {
                        // update server settings
                        dbMgr.ExecuteNonQuery("UPDATE tags SET APN = @ServerIP, port = @ServerPort WHERE tag_id = @TagID",
                            new object[] { Data.ServerIP, Data.ServerPort, Data.TagID });
                    }
                }

                // save raw data
                objTemp = dbMgr.ExecuteScalar("INSERT INTO data (data, tag_id, timestamp, rx_time) OUTPUT INSERTED.data_id " +
                    "VALUES (@Data, @TagID, @Timestamp, @RxTime)", new object[] { Data.Data, Data.TagID, 
                    Data.Timestamp, Data.RxTime });
                if (objTemp != null) iRet = Convert.ToInt64(objTemp);
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "SaveRawData*");
                iRet = (long)ErrorCode.OPERATION_FAILED;
            }

            // close database
            if (dbRdr != null) dbRdr.Close();
            return iRet;
        }

        /// <summary>
        /// gets all users' and assets' phone numbers
        /// </summary>
        /// <param name="iUserID"></param>
        /// <returns></returns>
        public List<PhoneInfo> GetPhones(int iUserID)
        {
            List<PhoneInfo> arrPhones = new List<PhoneInfo>();
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            try
            {
                /*
                // loop through users
                List<UserInfo> arrUsers = GetUsers(iUserID);
                foreach (UserInfo udtUser in arrUsers)
                {
                    // check phone number
                    if (udtUser.Phone != "")
                    {
                        // add user phone number
                        PhoneInfo udtPhone = new PhoneInfo();
                        udtPhone.Name = udtUser.Name;
                        udtPhone.Phone = udtUser.Phone;
                        udtPhone.Role = "User";
                        udtPhone.Company = udtUser.Company;
                        udtPhone.Image = udtUser.Image;
                        udtPhone.ImageFill = udtUser.ImageFill;
                        arrPhones.Add(udtPhone);
                    }
                }
                */
                // loop through assets
                List<AssetInfo> arrAssets = GetAssets(iUserID);
                foreach (AssetInfo udtAsset in arrAssets)
                {
                    // check phone number
                    if (udtAsset.Phone != "")
                    {
                        // add phone number to list
                        PhoneInfo udtPhone = new PhoneInfo();
                        udtPhone.Name = udtAsset.Name;
                        udtPhone.Phone = udtAsset.Phone;
                        udtPhone.Company = udtAsset.Company;
                        udtPhone.Role = "Asset";
                        udtPhone.Image = udtAsset.Image;
                        udtPhone.ImageFill = udtAsset.ImageFill;
                        arrPhones.Add(udtPhone);
                    }
                }

                // check if superuser
                if (GetUserRole(ref dbMgr, iUserID) == 0)
                {
                    // loop through tags
                    List<TagInfo> arrTags = GetTags(iUserID);
                    foreach (TagInfo udtTag in arrTags)
                    {
                        // check phone number
                        if (udtTag.Phone != "")
                        {
                            // add phone number to list
                            PhoneInfo udtPhone = new PhoneInfo();
                            udtPhone.Name = udtTag.Name;
                            udtPhone.Phone = udtTag.Phone;
                            udtPhone.Company = udtTag.Company;
                            udtPhone.Role = "Device";
                            udtPhone.Image = udtTag.Image;
                            udtPhone.ImageFill = udtTag.ImageFill;
                            arrPhones.Add(udtPhone);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "GetPhones");
            }

            // close database
            dbMgr.Close();
            return arrPhones;
        }

        /// <summary>
        /// gets all messages
        /// </summary>
        /// <param name="msgFilter"></param>
        /// <param name="dtStart"></param>
        /// <param name="dtEnd"></param>
        /// <returns></returns>
        public List<MessageInfo> GetMessages(MessageInfo msgFilter, DateTime dtStart, DateTime dtEnd, int iUserID)
        {
            List<MessageInfo> arrMessages = new List<MessageInfo>();
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            DbDataReader dbRdr = null;
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // initialize sql command
                    string strSql = String.Format("SELECT TOP {0} messages.*, companies.name AS company, assets.name AS asset FROM messages " +
                        "LEFT JOIN companies ON messages.company_id = companies.company_id " +
                        "LEFT JOIN assets ON messages.asset_id = assets.asset_id", ConfigurationManager.AppSettings["DownloadCount"]);
                    strSql += String.Format(" WHERE timestamp BETWEEN '{0:dd-MMM-yyyy HH:mm:ss}' AND '{1:dd-MMM-yyyy HH:mm:ss}'", dtStart, dtEnd);
                    if (msgFilter.MessageID > 0) strSql += String.Format(" AND message_id > {0}", msgFilter.MessageID);
                    if (msgFilter.Sender != "") strSql += String.Format(" AND sender LIKE '%{0}%'", msgFilter.Sender);
                    if (msgFilter.Recipients != "") strSql += String.Format(" AND recipients LIKE '%{0}%'", msgFilter.Recipients);
                    if (msgFilter.Status != "ALL") strSql += String.Format(" AND flag = {0}", msgFilter.StatusID);
                    if (msgFilter.Message != "") strSql += String.Format(" AND message LIKE '%{0}%'", msgFilter.Message);
                    if (msgFilter.AssetID > 0) strSql += String.Format(" AND messages.asset_id = {0}", msgFilter.AssetID);
                    else if (GetUserRole(ref dbMgr, iUserID) > 0)
                    {
                        // limit to assigned assets only
                        strSql += String.Format(" AND messages.company_id = (SELECT company_id FROM users WHERE user_id = {0})", iUserID);
                        object objTemp = dbMgr.ExecuteScalar(String.Format("SELECT assets FROM users WHERE user_id = {0}", iUserID));
                        if ((objTemp != null) && (objTemp.ToString() != ""))
                            strSql += String.Format(" AND messages.asset_id IN ({0})", objTemp);
                    }
                    else
                    {
                        // filter by company
                        object objTemp = dbMgr.ExecuteScalar(String.Format("SELECT company_id FROM companies WHERE name = '{0}'", msgFilter.Company));
                        if (objTemp != null) strSql += String.Format(" AND messages.company_id = {0}", objTemp);
                    }
                    
                    // get messages
                    dbRdr = dbMgr.ExecuteReader(String.Format("{0} ORDER BY timestamp", strSql));
                    if ((dbRdr != null) && dbRdr.HasRows)
                    {
                        // read messages
                        while (dbRdr.Read())
                            arrMessages.Add(BuildMessage(dbRdr));
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "GetMessages");
            }

            // close database
            if (dbRdr != null) dbRdr.Close();
            dbMgr.Close();
            return arrMessages;
        }

        /// <summary>
        /// gets pending messages
        /// </summary>
        /// <param name="iMessageID"></param>
        /// <returns></returns>
        public List<MessageInfo> GetMessagesEx(int iMessageID)
        {
            List<MessageInfo> arrMessages = new List<MessageInfo>();
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            DbDataReader dbRdr = null;
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // check message filter
                    string strSql = "SELECT messages.*, companies.name AS company, assets.name AS asset FROM messages " +
                        "LEFT JOIN companies ON messages.company_id = companies.company_id " +
                        "LEFT JOIN assets ON messages.asset_id = assets.asset_id WHERE messages.flag = 1";
                    if (iMessageID > 0) strSql += String.Format(" AND message_id > {0}", iMessageID);

                    // get pending messages
                    dbRdr = dbMgr.ExecuteReader(strSql);
                    if ((dbRdr != null) && dbRdr.HasRows)
                    {
                        // list messages
                        while (dbRdr.Read())
                            arrMessages.Add(BuildMessage(dbRdr));
                    }
                    if (dbRdr != null) dbRdr.Close();
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "GetMessagesEx");
            }

            // close database
            if (dbRdr != null) dbRdr.Close();
            dbMgr.Close();
            return arrMessages;
        }

        /// <summary>
        /// get user activity list
        /// </summary>
        /// <param name="userActivity"></param>
        /// <returns></returns>
        public List<GenUserActivityInfo> GetUserActivity(GenUserActivityInfo userActivity)
        {
            List<GenUserActivityInfo> arrUserActivities = new List<GenUserActivityInfo>();
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            DbDataReader dbRdr = null;

            try
            {
                // open database connection
                if (dbMgr.Open())
                {
                    // get company id
                    object objCompanyID = dbMgr.ExecuteScalar("SELECT company_id FROM companies WHERE name = @CompanyName",
                        new object[] { userActivity.Company });

                    // check company id
                    if (objCompanyID != null)
                    {
                        // save company id
                        userActivity.CompanyID = Convert.ToInt32(objCompanyID);

                        // build sql query
                        string strSql = String.Format("SELECT TOP {0} * FROM view_user_activity_ WHERE company_id = {1}",
                            ConfigurationManager.AppSettings["DownloadCount"], userActivity.CompanyID);

                        // set filters
                        if (userActivity.UserActivityID > 0)
                            strSql += String.Format(" AND user_activity_id < {0}", userActivity.UserActivityID);
                        if (userActivity.Year > 0)
                            strSql += String.Format(" AND year = {0}", userActivity.Year);
                        if (userActivity.MonthNum > 0)
                            strSql += String.Format(" AND month = {0}", userActivity.MonthNum);

                        // get user activities
                        dbRdr = dbMgr.ExecuteReader(strSql);

                        // check results
                        if ((dbRdr != null) && (dbRdr.HasRows))
                        {
                            // loop through results
                            while (dbRdr.Read())
                            {
                                // build user activity
                                string monthName = "";
                                GenUserActivityInfo tempUserActivity = new GenUserActivityInfo();
                                tempUserActivity.UserActivityID = dbRdr.ToInt32("user_activity_id");
                                tempUserActivity.CompanyID = dbRdr.ToInt32("company_id");
                                tempUserActivity.Company = dbRdr.ToString("company_name");
                                tempUserActivity.Year = dbRdr.ToInt32("year");
                                tempUserActivity.TotalHours = dbRdr.ToDouble("totalhours");
                                tempUserActivity.LoginFreq = dbRdr.ToInt32("loginfreq");
                                tempUserActivity.MonthNum = dbRdr.ToInt32("month");

                                #region month name
                                switch (tempUserActivity.MonthNum)
                                {
                                    case 1:
                                        monthName = "JAN";
                                        break;
                                    case 2:
                                        monthName = "FEB";
                                        break;
                                    case 3:
                                        monthName = "MAR";
                                        break;
                                    case 4:
                                        monthName = "APR";
                                        break;
                                    case 5:
                                        monthName = "MAY";
                                        break;
                                    case 6:
                                        monthName = "JUN";
                                        break;
                                    case 7:
                                        monthName = "JUL";
                                        break;
                                    case 8:
                                        monthName = "AUG";
                                        break;
                                    case 9:
                                        monthName = "SEP";
                                        break;
                                    case 10:
                                        monthName = "OCT";
                                        break;
                                    case 11:
                                        monthName = "NOV";
                                        break;
                                    case 12:
                                        monthName = "DEC";
                                        break;
                                }
                                #endregion

                                tempUserActivity.Month = monthName;

                                // add to user activity list
                                arrUserActivities.Add(tempUserActivity);
                            }
                        }

                        // close reader
                        if (dbRdr != null)
                            dbRdr.Close();
                    }
                }

                // close database connection
                dbMgr.Close();
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "GetUserActivity");
            }

            return arrUserActivities;
        }

        /// <summary>
        /// saves/updates the user activity
        /// </summary>
        /// <param name="strCompany"></param>
        /// <param name="dtStart"></param>
        /// <param name="dtEnd"></param>
        /// <param name="isLoginFreqUpdated">false for the first call</param>
        /// <returns></returns>
        public string SaveUserActivity(int iUserID, DateTime dtStart, DateTime dtEnd, bool isLoginFreqUpdated)
        {
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            int iCompanyID = 0;
            string strRet = "";

            try
            {
                // open database connection
                if (dbMgr.Open())
                {
                    // get company id
                    object companyIDTemp = dbMgr.ExecuteScalar("SELECT company_id FROM users WHERE user_id = @UserID",
                        new object[] { iUserID });

                    // check company id if valid
                    if (companyIDTemp != null)
                        iCompanyID = Convert.ToInt32(companyIDTemp);

                    if (iCompanyID > 0)
                    {
                        // check existing record
                        object objUserActivity = dbMgr.ExecuteScalar("SELECT user_activity_id FROM user_activity_ WHERE " +
                            "company_id = @CompanyID AND year = @Year AND month = @Month",
                            new object[] { iCompanyID, dtStart.Year, dtStart.Month });

                        // check if record exist
                        if (objUserActivity != null)
                        {
                            // update record
                            string strSql = "UPDATE user_activity_ SET totalhours = totalhours + @AddedHours";

                            if (!isLoginFreqUpdated)
                            {
                                strSql += ", loginfreq = loginfreq + 1";
                            }

                            dbMgr.ExecuteNonQuery(strSql + " WHERE user_activity_id = @UserActivityID",
                                new object[] { (dtEnd - dtStart).TotalHours, Convert.ToInt32(objUserActivity) });
                        }
                        else
                        {
                            // create new record
                            dbMgr.ExecuteNonQuery("INSERT INTO user_activity_ (company_id, year, month, totalhours, loginfreq) " +
                                "VALUES (@CompanyID, @Year, @Month, @TotalHours, @LoginFreq)",
                                new object[] { iCompanyID, dtStart.Year, dtStart.Month, (dtEnd - dtStart).TotalHours, 1 });
                        }
                    }
                }

                dbMgr.Close();
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "SaveUserActivity");
            }

            return strRet;
        }

        /// <summary>
        /// builds messages info from database record
        /// </summary>
        /// <param name="dbRdr"></param>
        /// <returns></returns>
        private MessageInfo BuildMessage(DbDataReader dbRdr)
        {
            MessageInfo udtMessage = new MessageInfo();
            try
            {
                // set message parameters
                udtMessage.MessageID = dbRdr.ToInt32("message_id");
                udtMessage.Sender = dbRdr.ToString("sender");
                udtMessage.Recipients = dbRdr.ToString("recipients");
                udtMessage.Message = dbRdr.ToString("message");
                udtMessage.Timestamp = dbRdr.ToDateTime("timestamp");
                udtMessage.CompanyID = dbRdr.ToInt32("company_id");
                udtMessage.Company = dbRdr.ToString("company");
                udtMessage.AssetID = dbRdr.ToInt32("asset_id");
                udtMessage.Asset = dbRdr.ToString("asset");
                udtMessage.StatusID = dbRdr.ToInt32("flag");

                // check status
                switch (udtMessage.StatusID)
                {
                case -1: udtMessage.Status = "Received"; break;
                case 0: udtMessage.Status = "Sent"; break;
                case 1: udtMessage.Status = "Pending"; break;
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "BuildMessage");
            }
            return udtMessage;
        }

        /// <summary>
        /// flags messages
        /// </summary>
        /// <param name="strMessageIds"></param>
        /// <returns></returns>
        public string FlagMessages(string strMessageIds)
        {
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            string strRet = "";
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // reset message flag
                    dbMgr.ExecuteNonQuery(String.Format("UPDATE messages SET flag = 0 " +
                        "WHERE message_id IN ({0}) AND flag = 1", strMessageIds));
                }
            }
            catch (Exception ex)
            {
                // log error
                strRet = ex.Message;
                DatabaseMgrMySQL.LogError(ex.Message, "FlagMessages");
            }

            // close database
            dbMgr.Close();
            return strRet;
        }

        /// <summary>
        /// saves message for sending
        /// </summary>
        /// <param name="udtMessage"></param>
        /// <returns></returns>
        public string SaveMessage(MessageInfo udtMessage)
        {
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            string strRet = "";
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // loop through recipients
                    string[] arrRecipient = udtMessage.Recipients.Split(",".ToCharArray());
                    foreach (string strRecipient in arrRecipient)
                    {
                        // save message
                        udtMessage.Recipients = strRecipient;
                        strRet = SaveMessage(ref dbMgr, udtMessage);
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                strRet = DatabaseMgrMySQL.LogError(ex.Message, "SaveMessage");
            }

            // close database
            dbMgr.Close();
            return strRet;
        }

        /// <summary>
        /// saves message for sending
        /// </summary>
        /// <param name="udtMessage"></param>
        /// <returns></returns>
        private string SaveMessage(ref DatabaseMgrMySQL dbMgr, MessageInfo udtMessage)
        {
            string strRet = "";
            object objTemp = null;

            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // check sender
                    if (Char.IsDigit(udtMessage.Sender, 0))
                    {
                        try
                        {
                            // get user name if user id is supplied
                            int iUserID = Convert.ToInt32(udtMessage.Sender.Trim());
                            objTemp = dbMgr.ExecuteScalar("SELECT name FROM users WHERE user_id = @UserID", new object[] { iUserID });
                            if (objTemp != null) udtMessage.Sender = objTemp.ToString();
                        }
                        catch(Exception ex)
                        {
                            // log error
                            DatabaseMgrMySQL.LogError(ex.Message, "SaveMessage");
                        }
                    }

                    // check company
                    if ((udtMessage.CompanyID == 0) && (udtMessage.Company != ""))
                        udtMessage.CompanyID = GetCompanyID(ref dbMgr, udtMessage.Company);

                    // check asset
                    if (udtMessage.AssetID == 0)
                    {
                        // check name
                        if ((udtMessage.Asset != null) && (udtMessage.Asset != ""))
                        {
                            // get asset id
                            objTemp = dbMgr.ExecuteScalar("SELECT asset_id FROM assets WHERE name = @Asset", new object[] { udtMessage.Asset });
                            if (objTemp != null) udtMessage.AssetID = Convert.ToInt32(objTemp);
                        }
                        else
                        {
                            // get asset id using contact info
                            objTemp = dbMgr.ExecuteScalar("SELECT asset_id FROM assets WHERE phone = @Phone OR email = @Email",
                                new object[] { udtMessage.Recipients, udtMessage.Recipients });
                            if (objTemp != null) udtMessage.AssetID = Convert.ToInt32(objTemp);
                        }
                    }

                    // check recipients
                    if ((udtMessage.Recipients != "") && (udtMessage.Message.Trim() != ""))
                    {
                        // add message to sms queue
                        dbMgr.ExecuteNonQuery("INSERT INTO messages (sender, recipients, message, timestamp, flag, " +
                            "company_id, asset_id) VALUES (@Sender, @Recipients, @Message, @Timestamp, @Flag, @CompanyID, @AssetID)", 
                            new object[] { udtMessage.Sender, udtMessage.Recipients, udtMessage.Message, udtMessage.Timestamp, 
                            udtMessage.StatusID, udtMessage.CompanyID, udtMessage.AssetID });
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                strRet = DatabaseMgrMySQL.LogError(ex.Message, "SaveMessage");
            }
            return strRet;
        }
        
        /// <summary>
        /// deletes message record
        /// </summary>
        /// <param name="iMessageID"></param>
        /// <returns></returns>
        public string DeleteMessage(int iMessageID)
        {
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            string strRet = "";
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // delete message
                    dbMgr.ExecuteNonQuery(String.Format("DELETE FROM messages WHERE message_id = {0}", iMessageID));
                }
            }
            catch (Exception ex)
            {
                // log error
                strRet = DatabaseMgrMySQL.LogError(ex.Message, "DeleteMessage");
            }

            // close database
            dbMgr.Close();
            return strRet;
        }

        /// <summary>
        /// uploads file from client to server
        /// </summary>
        /// <param name="udtFile"></param>
        /// <returns></returns>
        public string UploadFile(FileUpload udtFile)
        {
            string strRet = "";
            try
            {
                // overwrite file if existing
                string strFile = String.Format("{0}{1}", HostingEnvironment.ApplicationPhysicalPath, udtFile.FileName);
                if (File.Exists(strFile))
                    File.Delete(strFile);

                // save file
                FileStream FileStream = new FileStream(strFile, FileMode.Create);
                FileStream.Write(udtFile.FileData, 0, udtFile.FileData.Length);
                FileStream.Close();
                FileStream.Dispose();

                // check if zip file
                if (Path.GetExtension(strFile) == ".zip")
                {
                    // extract silverlight
                    FastZip zipFast = new FastZip();
                    zipFast.ExtractZip(strFile, Path.GetDirectoryName(strFile), "");
                    File.Delete(strFile);
                }
            }
            catch (Exception ex)
            {
                // log error
                strRet = DatabaseMgrMySQL.LogError(ex.Message, "UploadFile");
            }
            return strRet;
        }

        /// <summary>
        /// retrieves uri of file
        /// </summary>
        /// <param name="strName"></param>
        /// <returns></returns>
        public string GetFile(string strName)
        {
            string strRet = "";
            try
            {
                // get file uri
                string strFile = String.Format("{0}{1}", HostingEnvironment.ApplicationPhysicalPath, strName);
                if (File.Exists(strFile))
                    strRet = String.Format("{0}/{1}", ConfigurationManager.AppSettings["ServerPath"], strName.Replace("\\", "/"));
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "GetFile");
            }
            return strRet;
        }

        /// <summary>
        /// locates cell id position
        /// </summary>
        /// <param name="arrCellIds"></param>
        /// <returns></returns>
        public string LocateCellID(EventInfo udtEvent, CellID udtCellID)
        {
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            DbDataReader dbRdr = null;
            string strRet = "";
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    /*
                    // check network
                    if ((udtCellID.mcc == "") || (udtCellID.mnc == ""))
                    {
                        // get last network
                        object objTemp = dbMgr.ExecuteScalar("SELECT TOP(1) remarks FROM view_events " +
                            "WHERE status_desc = 'Cell ID' AND tag = @Tag AND remarks LIKE '%Network Info%' " +
                            "ORDER BY timestamp DESC", new object[] { udtEvent.Tag });
                        if (objTemp != null)
                        {
                            // get network info
                            string[] arrTemp = objTemp.ToString().Split(",".ToCharArray());
                            arrTemp = arrTemp[0].Split("/".ToCharArray());
                            if (arrTemp.Length > 1)
                            {
                                // update network info
                                udtCellID.mcc = arrTemp[0];
                                udtCellID.mnc = arrTemp[1];
                            }
                        }
                    }
                    */
                    // check network
                    if ((udtCellID.mcc == "") || (udtCellID.mnc == ""))
                    {
                        // close database
                        dbMgr.Close();
                        return "Failed to retrieve network information";
                    }

                    // initialize cell id event
                    udtEvent.Event = "Cell ID";
                    udtEvent.Remarks = String.Format("{0}/{1}/{2:X4}/{3:X4}",
                        Convert.ToInt32(udtCellID.mcc), Convert.ToInt32(udtCellID.mnc),
                        Convert.ToInt32(udtCellID.lac), Convert.ToInt32(udtCellID.cid));
                    udtEvent.AlertLevel = 0;

                    // encrypt lac and cid
                    string strLac = Encryption.Encrypt(udtCellID.lac);
                    string strCid = Encryption.Encrypt(udtCellID.cid);

                    // initialize position parameters
                    PosInfo udtPos = new PosInfo();
                    udtPos.Tag = udtEvent.Tag;
                    udtPos.RxTime = udtEvent.RxTime;
                    udtPos.Timestamp = udtEvent.Timestamp;
                    udtPos.FixID = -1;
                    udtPos.Fix = udtEvent.Remarks;
                    udtPos.PosY = 0.0;
                    udtPos.PosX = 0.0;
                    udtPos.PosZ = 0.0;
                    udtPos.Speed = 0.0;
                    udtPos.Course = 0.0;
                    udtPos.HDOP = 0.0;

                    // open database
                    if (dbMgr.Open())
                    {
                        // check cell id if already in database
                        //bool bFound = false;
                        string strSql = String.Format("SELECT control_no, lat, lon FROM cell_ids WHERE " +
                            "mcc = {0} AND mnc = {1} AND lac = '{2}' AND cid = '{3}'", udtCellID.mcc,
                            udtCellID.mnc, strLac, strCid);
                        dbRdr = dbMgr.ExecuteReader(strSql);
                        if (((dbRdr != null) && dbRdr.HasRows) && dbRdr.Read())
                        {
                            // get cell id location
                            udtPos.PosY = dbRdr.ToDouble("lat");
                            udtPos.PosX = dbRdr.ToDouble("lon");
                            udtPos.Remarks = String.Format("{0}:{1}", dbRdr.ToInt32("control_no"), udtEvent.Remarks);
                            //bFound = true;
                        }
                        if (dbRdr != null) dbRdr.Close();

                        // check cell id location
                        if ((udtPos.PosX != 0) && (udtPos.PosY != 0))
                            SavePosition(udtPos);
                        /*
                        // check cell id if located
                        if (!bFound)
                        {
                            // failed to locate cell id
                            udtEvent.Remarks = udtEvent.Remarks + ", Not Found";
                            SaveEvent(udtEvent);
                        }
                        */
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                strRet = DatabaseMgrMySQL.LogError(ex.Message, "LocateCellID");
            }

            // close database
            if (dbRdr != null) dbRdr.Close();
            dbMgr.Close();
            return strRet;
        }

        /// <summary>
        /// downloads cell id records
        /// </summary>
        /// <param name="udtFilter"></param>
        /// <returns></returns>
        public List<CellID> GetCellIds(CellID udtFilter)
        {
            List<CellID> arrCellIds = new List<CellID>();
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            DbDataReader dbRdr = null;
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // initialize sql command
                    string strSql = String.Format("SELECT TOP {0} * FROM cell_ids", ConfigurationManager.AppSettings["DownloadCount"]);
                    string strFilter = "";
                    if (udtFilter.ControlNo > 0) strFilter += String.Format(" AND control_no < {0}", udtFilter.ControlNo);
                    if (udtFilter.mcc != "ALL") strFilter += String.Format(" AND mcc = {0}", Convert.ToInt32(udtFilter.mcc));
                    if (udtFilter.mnc != "ALL") strFilter += String.Format(" AND mnc = {0}", Convert.ToInt32(udtFilter.mnc));
                    if (udtFilter.lac != "ALL") strFilter += String.Format(" AND lac = '{0}'", Encryption.Encrypt(udtFilter.lac));
                    if (udtFilter.cid != "ALL") strFilter += String.Format(" AND cid = '{0}'", Encryption.Encrypt(udtFilter.cid));
                    if (strFilter != "") strSql += " WHERE " + strFilter.TrimStart(" AND ".ToCharArray());

                    // get cell ids
                    dbRdr = dbMgr.ExecuteReader(strSql + " ORDER BY control_no DESC");
                    if ((dbRdr != null) && dbRdr.HasRows)
                    {
                        // read record
                        while (dbRdr.Read())
                            arrCellIds.Add(BuildCellID(dbRdr));
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "GetCellIds");
            }

            // close database
            if (dbRdr != null) dbRdr.Close();
            dbMgr.Close();
            return arrCellIds;
        }

        /// <summary>
        /// downloads cell ids associated to zone
        /// </summary>
        /// <param name="iZoneID"></param>
        /// <returns></returns>
        public List<CellID> GetZoneCellIds(int iZoneID)
        {
            List<CellID> arrCellIds = new List<CellID>();
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            DbDataReader dbRdr = null;
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // initialize query
                    object objTemp = dbMgr.ExecuteScalar(String.Format("SELECT cell_ids FROM zones WHERE zone_id = {0}", iZoneID));
                    if ((objTemp != null) && (objTemp.ToString().Trim() != ""))
                    {
                        // get cell ids
                        dbRdr = dbMgr.ExecuteReader(String.Format("SELECT * FROM cell_ids WHERE control_no IN ({0}) ORDER BY control_no DESC", objTemp));
                        if ((dbRdr != null) && dbRdr.HasRows)
                        {
                            // read record
                            while (dbRdr.Read())
                                arrCellIds.Add(BuildCellID(dbRdr));
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "GetZoneCellIds");
            }

            // close database
            if (dbRdr != null) dbRdr.Close();
            dbMgr.Close();
            return arrCellIds;
        }

        /// <summary>
        /// builds cell id info from database record
        /// </summary>
        /// <param name="dbRdr"></param>
        /// <returns></returns>
        private CellID BuildCellID(DbDataReader dbRdr)
        {
            CellID udtCellID = new CellID();
            try
            {
                // set cell id parameters
                udtCellID.ControlNo = dbRdr.ToInt64("control_no");
                udtCellID.mcc = dbRdr.ToString("mcc");
                udtCellID.mnc = dbRdr.ToString("mnc");
                udtCellID.lac = String.Format("{0:X4}", Convert.ToInt32(Encryption.Decrypt(dbRdr.ToString("lac"))));
                udtCellID.cid = String.Format("{0:X4}", Convert.ToInt32(Encryption.Decrypt(dbRdr.ToString("cid"))));
                udtCellID.lat = dbRdr.ToDouble("lat");
                udtCellID.lon = dbRdr.ToDouble("lon");
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "BuildCellID");
            }
            return udtCellID;
        }

        /// <summary>
        /// gets list of cell id paramaters
        /// </summary>
        /// <param name="strParam"></param>
        /// <param name="udtFilter"></param>
        /// <returns></returns>
        public List<string> GetCidParams(string strParam, CellID udtFilter)
        {
            List<string> arrParams = new List<string>();
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            DbDataReader dbRdr = null;
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // initialize sql command
                    string strSql = String.Format("SELECT DISTINCT {0} FROM cell_ids", strParam);
                    string strFilter = "";
                    if (udtFilter.mcc != "ALL") strFilter += String.Format(" AND mcc = {0}", Convert.ToInt32(udtFilter.mcc));
                    if (udtFilter.mnc != "ALL") strFilter += String.Format(" AND mnc = {0}", Convert.ToInt32(udtFilter.mnc));
                    if (udtFilter.lac != "ALL") strFilter += String.Format(" AND lac = '{0}'", Encryption.Encrypt(udtFilter.lac));
                    if (udtFilter.cid != "ALL") strFilter += String.Format(" AND cid = '{0}'", Encryption.Encrypt(udtFilter.cid));
                    if (strFilter != "") strSql += " WHERE " + strFilter.TrimStart(" AND ".ToCharArray());

                    // get distinct country codes
                    dbRdr = dbMgr.ExecuteReader(strSql);
                    if ((dbRdr != null) && dbRdr.HasRows)
                    {
                        // read record
                        while (dbRdr.Read())
                            arrParams.Add(dbRdr[strParam].ToString());
                    }

                    // check parameter
                    switch (strParam)
                    {
                    case "lac":
                    case "cid":
                        {
                            // loop through parameters
                            for (int i = 0; i < arrParams.Count; i++)
                                arrParams[i] = String.Format("{0:X4}", Convert.ToInt32(Encryption.Decrypt(arrParams[i])));
                        }
                        break;
                    }

                    // sort array
                    arrParams.Sort();
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "GetCidParams");
            }

            // close database
            if (dbRdr != null) dbRdr.Close();
            dbMgr.Close();
            return arrParams;
        }

        /// <summary>
        /// saves cell id records to database
        /// </summary>
        /// <param name="arrCellIds"></param>
        /// <returns></returns>
        public string SaveCellIds(List<CellID> arrCellIds)
        {
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            string strRet = "";
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // loop through cell ids
                    foreach (CellID udtCellID in arrCellIds)
                    {
                        string strLac = Encryption.Encrypt(udtCellID.lac);
                        string strCid = Encryption.Encrypt(udtCellID.cid);

                        // check if new record
                        if (!dbMgr.Exists(String.Format("SELECT TOP(1) control_no FROM cell_ids WHERE mcc = {0} AND mnc = {1} " +
                            "AND lac = '{2}' AND cid = '{3}'", udtCellID.mcc, udtCellID.mnc, strLac, strCid)))
                        {
                            // add new cell id
                            dbMgr.ExecuteNonQuery(String.Format("INSERT INTO cell_ids (mcc, mnc, lac, cid, lat, lon) " +
                                "VALUES ({0}, {1}, '{2}', '{3}', {4}, {5})", udtCellID.mcc, udtCellID.mnc,
                                strLac, strCid, udtCellID.lat, udtCellID.lon));
                        }
                        else
                        {
                            // update cell id
                            dbMgr.ExecuteNonQuery(String.Format("UPDATE cell_ids SET lat = {0}, lon = {1} WHERE mcc = {2} " +
                                "AND mnc = {3} AND lac = '{4}' AND cid = '{5}'", udtCellID.lat, udtCellID.lon,
                                udtCellID.mcc, udtCellID.mnc, strLac, strCid));
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                strRet = DatabaseMgrMySQL.LogError(ex.Message, "SaveCellIds");
            }

            // close database
            dbMgr.Close();
            return strRet;
        }

        /// <summary>
        /// gets all strings for localization
        /// </summary>
        /// <returns></returns>
        public Dictionary<string, string> GetStrings(int iLanguageID)
        {
            Dictionary<string, string> arrStrings = new Dictionary<string, string>();
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            DbDataReader dbRdr = null;
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // get strings
                    string strLanguage = String.Format("language_{0}", iLanguageID);
                    dbRdr = dbMgr.ExecuteReader(String.Format("SELECT DISTINCT language_1, {0} FROM strings", strLanguage));
                    if ((dbRdr != null) && dbRdr.HasRows)
                    {
                        // list strings
                        while (dbRdr.Read())
                            arrStrings.Add(dbRdr.ToString("language_1").ToUpper(), dbRdr.ToString(strLanguage));
                    }
                    if (dbRdr != null) dbRdr.Close();
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "GetStrings");
            }

            // close database
            dbMgr.Close();
            return arrStrings;
        }

        // get server notice message
        public string GetServerNoticeMessage()
        {
            return ConfigurationManager.AppSettings["ServerNotice"].ToString();
        }

        /// <summary>
        /// [Dan:13Feb14] Update all vehicles having "No Address"
        /// </summary>
        /// <returns></returns>
        public string UpdateNoAddress(int iUserID, int companyID)
        {
            //select * from positions where loc like '%No Address%'
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            DbDataReader dbRdr = null;
            Dictionary<int, string> updatedInfo = new Dictionary<int, string>();
            List<PosInfo> updatedPosInfo = new List<PosInfo>();
            string strSql = "";
            string retVal = "false";
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // get strings
                    strSql = "SELECT pos_id, loc, pos_x, pos_y FROM positions JOIN assets ON assets.asset_id = positions.asset_id WHERE loc LIKE '%No Address%'";
                    if (companyID > 0)
                        strSql += string.Format(" AND company_id = {0}", companyID);

                    //(udtAsset.ImageFill == "None" ? 20 : 50);
                    dbRdr = dbMgr.ExecuteReader(String.Format(strSql));
                    if ((dbRdr != null) && dbRdr.HasRows)
                    {
                        // list strings
                        while (dbRdr.Read())
                        {
                            updatedPosInfo.Add(new PosInfo()
                            {
                                PosID = dbRdr.ToInt32("pos_id"),
                                Location = dbRdr.ToString("loc"),
                                PosX = dbRdr.ToDouble("pos_x"),
                                PosY = dbRdr.ToDouble("pos_y")
                            });
                        }
                    }
                    if (dbRdr != null) dbRdr.Close();

                    int ctrPos = 0;
                    foreach (PosInfo currPos in updatedPosInfo)
                    {
                        //get the address from google
                        currPos.Location = ReverseGeocode(currPos.PosX, currPos.PosY);

                        //check if still empty
                        if (string.IsNullOrEmpty(currPos.Location) || currPos.Location.Contains("No Address"))
                        {
                            currPos.Location = "Singapore";
                        }

                        // update company info
                        dbMgr.ExecuteNonQuery("UPDATE positions SET loc = @Location WHERE pos_id = @PosID",
                            new object[] { currPos.Location, currPos.PosID });

                        ctrPos++;
                    }
                    retVal = ctrPos.ToString();
                }
                else
                {
                    retVal = "false";
                }
                
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "UpdateNoAddress");
                retVal = "false";
            }

            // close database
            dbMgr.Close();
            return retVal;
        }

        /// <summary>
        /// Manually Updates the address of vehicles with wrong address due to no valid FIX but moving 
        /// [Dan:26Mar14]
        /// </summary>
        /// <param name="udtAsset"></param>
        /// <returns></returns>
        public AssetInfo UpdateAddress(AssetInfo udtAsset)
        {
            if (udtAsset == null) return udtAsset;
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            SqlDataReader dbRdr = null;
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    //check if still empty
                    udtAsset.LastPos.Location = ReverseGeocode(udtAsset.LastPos.PosY, udtAsset.LastPos.PosX);
                    if (string.IsNullOrEmpty(udtAsset.LastPos.Location) || udtAsset.LastPos.Location.ToUpper().Contains("NO ADDRESS"))
                        udtAsset.LastPos.Location = "Singapore";

                    // update company info
                    dbMgr.ExecuteNonQuery("UPDATE positions SET loc = @Location WHERE pos_id = @PosID",
                        new object[] { udtAsset.LastPos.Location, udtAsset.LastPos.PosID });
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "UpdateAddress");
            }

            // close database
            if (dbRdr != null) dbRdr.Close();
            dbMgr.Close();
            return udtAsset;
        }

        /// <summary>
        /// gets all activities
        /// </summary>
        /// <param name="actFilter"></param>
        /// <param name="iUserID"></param>
        /// <returns></returns>
        public string UpdateMileageReport(int iCompanyID, DateTime dtStart, DateTime dtEnd)
        {
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            DbDataReader dbRdr = null;
            string strRet = "";
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // get all assets of company
                    List<int> arrAssetIds = new List<int>();
                    dbRdr = dbMgr.ExecuteReader("SELECT asset_id FROM assets WHERE company_id = @CompanyID", new object[] { iCompanyID });
                    if ((dbRdr != null) && dbRdr.HasRows)
                    {
                        // list asset ids
                        while (dbRdr.Read()) { arrAssetIds.Add(dbRdr.ToInt32("asset_id")); }
                    }
                    if (dbRdr != null) dbRdr.Close();

                    // loop through assets
                    int iDiff = (int)(((TimeSpan)(dtEnd - dtStart)).TotalDays);
                    foreach (int iAssetID in arrAssetIds)
                    {
                        // loop through dates
                        for (int i = 0; i < iDiff; i++)
                        {
                            // get asset's first position
                            DateTime dtDate = dtStart.AddDays(i);
                            object objTemp = dbMgr.ExecuteScalar("SELECT TOP 1 mileage FROM positions WHERE timestamp " +
                                "BETWEEN @Start AND @End AND asset_id = @AssetID ORDER BY timestamp", new object[] { dtDate, 
                                dtDate.AddDays(1), iAssetID });
                            if (objTemp != null)
                            {
                                // get asset's last position
                                double lFirst = Convert.ToDouble(objTemp);
                                objTemp = dbMgr.ExecuteScalar("SELECT TOP 1 mileage FROM positions WHERE timestamp " +
                                    "BETWEEN @Start AND @End AND asset_id = @AssetID ORDER BY timestamp DESC",
                                    new object[] { dtDate, dtDate.AddDays(1), iAssetID });
                                if (objTemp != null)
                                {
                                    // update mileage report
                                    double lMileage = (Convert.ToDouble(objTemp) - lFirst) / 100;
                                    dbMgr.ExecuteNonQuery("UPDATE utilization SET mileage = @Mileage WHERE " +
                                        "asset_id = @AssetID AND date = @Date", new object[] { lMileage, iAssetID, 
                                        dtDate.ToLocalTime().Date });
                                }
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "UpdateMileageReport");
            }

            // close database
            if (dbRdr != null) dbRdr.Close();
            dbMgr.Close();
            return strRet;
        }

        #region RFID Features

        /// <summary>
        /// Get RFID List
        /// </summary>
        /// <param name="iUserID"></param>
        /// <returns></returns>
        public List<RFIDInfo> GetRFID(int iUserID)
        {
            List<RFIDInfo> arrRFID = new List<RFIDInfo>();
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            DbDataReader dbRdr = null;

            try
            {
                if (dbMgr.Open())
                {
                    // get drivers
                    string strSql = "SELECT * from RFID ";

                    if (iUserID > 1) strSql += String.Format(" WHERE company_id = (SELECT company_id FROM users WHERE user_id = {0})", iUserID);

                    DatabaseMgrMySQL.LogEvent(strSql, 0);
                    dbRdr = dbMgr.ExecuteReader(strSql + " ORDER BY rfid_id desc");
                    // check if there are rows
                    if ((dbRdr != null) && dbRdr.HasRows)
                    {
                        while (dbRdr.Read())
                        {
                            RFIDInfo rfid = new RFIDInfo();
                            rfid.RfidID = dbRdr.ToInt32("rfid_id");
                            rfid.RFID = dbRdr.ToString("rfid_code");
                            rfid.Driver = dbRdr.ToString("driver");
                            rfid.DateAdded = dbRdr.ToDateTime("date_added");
                            rfid.DateModified = dbRdr.ToDateTime("date_modified");
                            rfid.Created_UserID = dbRdr.ToInt32("created_by");
                            rfid.Modified_UserID = dbRdr.ToInt32("modified_by");
                            rfid.Created_User = dbRdr.ToString("created_byName");
                            rfid.Modified_User = dbRdr.ToString("modified_byName");
                            rfid.Remarks = dbRdr.ToString("remarks");
                            rfid.CompanyID = dbRdr.ToInt32("company_id");
                            rfid.Company = dbRdr.ToString("company");
                            arrRFID.Add(rfid);
                        }
                    }

                    //if (GetUserRole(ref dbMgr, iUserID) > 0)
                    //{
                    //    strSql += String.Format(" WHERE company_id = (SELECT company_id FROM users WHERE user_id = {0})", iUserID);
                    //    dbRdr = dbMgr.ExecuteReader(strSql + " ORDER BY rfid_id desc");
                    //    // check if there are rows
                    //    if ((dbRdr != null) && dbRdr.HasRows)
                    //    {
                    //        while (dbRdr.Read())
                    //        {
                    //            RFIDInfo rfid = new RFIDInfo();
                    //            rfid.RfidID = dbRdr.ToInt32("rfid_id");
                    //            rfid.RFID = dbRdr.ToString("rfid_code");
                    //            rfid.Driver = dbRdr.ToString("driver");
                    //            rfid.DateAdded = dbRdr.ToDateTime("date_added");
                    //            rfid.DateModified = dbRdr.ToDateTime("date_modified");
                    //            rfid.Created_UserID = dbRdr.ToInt32("created_by");
                    //            rfid.Modified_UserID = dbRdr.ToInt32("modified_by");
                    //            rfid.Created_User = dbRdr.ToInt32("created_byName");
                    //            rfid.Modified_User = dbRdr.ToInt32("modified_byName");
                    //            rfid.Remarks = dbRdr.ToString("remarks");
                    //            rfid.CompanyID = dbRdr.ToInt32("company_id");
                    //            arrRFID.Add(rfid);
                    //        }
                    //    }

                    //}
                    //else
                    //{
                    //    //dbMgr.Close();
                    //    List<CompanyInfo> arrCompany = GetCompanies(iUserID);
                    //    foreach (CompanyInfo c in arrCompany)
                    //    {
                    //        dbMgr = new DatabaseMgrMySQL(c.CompanyID);

                    //        strSql = "SELECT * from RFID ";
                    //        strSql += String.Format(" WHERE company_id = {0}", c.CompanyID);
                    //        dbRdr = dbMgr.ExecuteReader(strSql + " ORDER BY rfid_id desc");
                    //        // check if there are rows
                    //        if ((dbRdr != null) && dbRdr.HasRows)
                    //        {
                    //            while (dbRdr.Read())
                    //            {
                    //                RFID_Info rfid = new RFID_Info();
                    //                rfid.ID = dbRdr.ToInt32("rfid_id");
                    //                rfid.RFID = dbRdr.ToString("rfid_code");
                    //                rfid.Driver = dbRdr.ToString("driver");
                    //                rfid.DateAdded = dbRdr.ToDateTime("date_added");
                    //                rfid.DateModified = dbRdr.ToDateTime("date_modified");
                    //                rfid.Remarks = dbRdr.ToString("remarks");
                    //                rfid.CompanyID = dbRdr.ToInt32("company_id");
                    //                arrRFID.Add(rfid);
                    //            }
                    //        }
                    //        if (dbRdr != null) dbRdr.Close();
                    //        dbMgr.Close();
                    //    }
                    //}

                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "GetRFID");
            }

            if (dbRdr != null) dbRdr.Close();
            dbMgr.Close();

            return arrRFID;
        }

        /// <summary>
        /// [Chinky:20Oct2014] Get RFID Driver
        /// </summary>
        /// <param name="rfidCode"></param>
        /// <returns></returns>
        public string GetRFIDDriver(string rfidCode)
        {
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            DbDataReader dbRdr = null;
            string driver = "";

            try
            {
                if (dbMgr.Open())
                {
                    // get drivers
                    string strSql = String.Format("SELECT top 1 driver_name from view_rfid WHERE rfid_code  = '{0}'", rfidCode);               
                    dbRdr = dbMgr.ExecuteReader(strSql);

                    // check if there are rows
                    if ((dbRdr != null) && dbRdr.HasRows)
                    {
                        while (dbRdr.Read())
                        {
                            driver = dbRdr.ToString("driver_name");
                        }
                    }
                    if (dbRdr != null) dbRdr.Close();
                }
            }
            catch (Exception ex)
            {
                DatabaseMgrMySQL.LogError(ex.Message, "GetRFIDDriver");
            }

            if (dbRdr != null) dbRdr.Close();
            dbMgr.Close();
            return driver;
        }    

        /// <summary>
        /// updates RFID information
        /// </summary>
        /// <param name="udtTag"></param>
        /// <returns></returns>
        public string SaveRFID(RFIDInfo rfid)
        {
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            string strRet = "";
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    int iCompanyID = GetCompanyID(ref dbMgr, rfid.Company);

                    // check if new tag
                    if (rfid.RfidID == 0)
                    {
                        // check tag name
                        if (dbMgr.Exists("SELECT rfid_code FROM rfid WHERE rfid_code = @RFID",
                            new object[] { rfid.RFID }))
                        {
                            // prompt user to select different tag name
                            dbMgr.Close();
                            return "RFID is already in database. Please input a different RFID.";
                        }


                        //object objTemp = dbMgr.ExecuteScalar("SELECT company_id FROM users WHERE user_id = @UserID", new object[] { rfid.Modified_UserID });
                        //int companyID = (objTemp != null ? (int)objTemp : -1);

                        // add new tag
                        dbMgr.ExecuteNonQuery("INSERT INTO RFID (rfid_code, driver, date_added, date_modified, remarks, company, company_id, created_by, modified_by, created_byName,modified_byName) " +
                            "VALUES (@RFID, @Driver, @Dateadded, @Datemodified, @Remarks, @Company, @CompanyID, @CreatedBy, @ModifiedBy, @CreatedByName, @ModifiedByName)",
                            new object[] { rfid.RFID, rfid.Driver, DateTime.UtcNow, DateTime.UtcNow, rfid.Remarks, rfid.Company, iCompanyID, 
                                rfid.Created_UserID, rfid.Modified_UserID, rfid.Created_User, rfid.Modified_User });
                    }
                    else
                    {
                        // update tag info
                        dbMgr.ExecuteNonQuery("UPDATE rfid SET rfid_code = @RFID, date_modified = @DateModified, remarks = @Remarks, company = @Company, company_id = @CompanyID, " +
                            "modified_by = @ModifiedBy, modified_byName = @ModifiedByName  WHERE rfid_id = @ID",
                            new object[] { rfid.RFID, DateTime.UtcNow, rfid.Remarks, rfid.Company, iCompanyID, 
                                rfid.Modified_UserID, rfid.Modified_User, rfid.RfidID });
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                strRet = DatabaseMgrMySQL.LogError(ex.Message, "SaveRFID");
            }

            // close database
            dbMgr.Close();
            return strRet;
        }

        /// <summary>
        /// Delete RFID
        /// </summary>
        /// <param name="rfid"></param>
        /// <returns></returns>
        public string DeleteRFID(RFIDInfo rfid)
        {
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            string strRet = "";
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // delete tag from database
                    dbMgr.ExecuteNonQuery("UPDATE drivers SET rfid = '' WHERE rfid = @RFID", new object[] { rfid.RFID });
                    dbMgr.ExecuteNonQuery("DELETE FROM RFID WHERE rfid_code = @RFID", new object[] { rfid.RFID });
                }
            }
            catch (Exception ex)
            {
                // log error
                strRet = DatabaseMgrMySQL.LogError(ex.Message, "Delete RFID");
            }

            // close database
            dbMgr.Close();
            return strRet;
        }

        #endregion

        #region Driver Features

        /// <summary>
        /// get driver list
        /// </summary>
        /// <returns></returns>
        public List<DriverInfo> GetDrivers(int iUserID)
        {
            List<DriverInfo> arrDrivers = new List<DriverInfo>();
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            DbDataReader dbRdr = null;

            try
            {
                if (dbMgr.Open())
                {
                    // get default image
                    object objTemp = dbMgr.ExecuteScalar("SELECT tag FROM features WHERE name = 'Drivers'");
                    string strImage = (objTemp != null ? String.Format("{0}/images/resources/{1}.png",
                        ConfigurationManager.AppSettings["ServerPath"], objTemp) : "images/edit.png");

                    //// get drivers
                    //string strSql = "SELECT drivers.*, " +
                    //    "companies.name AS company, companies.company_id FROM drivers LEFT JOIN assets ON " +
                    //    "assets.driver_id = drivers.driver_id LEFT JOIN companies ON companies.company_id = drivers.company_id ";

                    // get drivers
                    string strSql = "SELECT drivers.*, " +
                        "companies.name AS company, companies.company_id FROM drivers LEFT JOIN companies ON " +
                        "companies.company_id = drivers.company_id ";

                    //if (GetUserRole(ref dbMgr, iUserID) > 0)
                    //{
                    //    strSql += String.Format(" WHERE drivers.driver_id NOT IN (SELECT driver_id FROM assets WHERE driver_id <> 0) " +
                    //        "OR assets.company_id = (SELECT company_id FROM users WHERE user_id = {0})", iUserID);
                    //}
                    //else strSql += " WHERE drivers.driver_id > 0";
                    strSql += "WHERE drivers.driver_id > 0";

                    dbRdr = dbMgr.ExecuteReader(strSql + " ORDER BY driver_name");

                    // check if there are rows
                    if ((dbRdr != null) && dbRdr.HasRows)
                    {
                        while (dbRdr.Read())
                        {
                            // build driver info
                            DriverInfo udtDriver = BuildDriver(dbRdr);

                            string strFill = "";
                            udtDriver.Image = GetImage(String.Format("drivers/{0}", dbRdr.ToInt32("driver_id")), strImage, ref strFill);
                            udtDriver.ImageFill = strFill;

                            // add driver to list
                            arrDrivers.Add(udtDriver);
                        }
                    }
                }
                if (dbRdr != null) dbRdr.Close();
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "GetDrivers");
            }

            dbMgr.Close();
            return arrDrivers;
        }

        /// <summary>
        /// save driver
        /// </summary>
        /// <param name="udtDriver"></param>
        /// <returns></returns>
        public string SaveDriver(DriverInfo udtDriver, int iUserID)
        {
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            string strRet = "";

            try
            {
                if (dbMgr.Open())
                {
                    strRet = SaveDriver(ref dbMgr, udtDriver, iUserID);
                }
            }
            catch (Exception ex)
            {
                strRet = DatabaseMgrMySQL.LogError(ex.Message, "SaveDriver");
            }

            dbMgr.Close();
            return strRet;
        }

        private string SaveDriver(ref DatabaseMgrMySQL dbMgr, DriverInfo udtDriver, int iUserID)
        {
            string strRet = "";
            object objTemp = null;
            try
            {
                // open database
                if (dbMgr.Open())
                {
                    // check asset
                    if (udtDriver.DriverID == 0)
                    {
                        // get asset id
                        objTemp = dbMgr.ExecuteScalar("SELECT TOP(1) driver_id FROM drivers WHERE driver_name = @DriverName",
                            new object[] { udtDriver.Name });
                        if (objTemp != null) udtDriver.DriverID = Convert.ToInt32(objTemp);
                    }

                    // check asset
                    if (udtDriver.DriverID == 0)
                    {
                        string strParamNames = "driver_name, address, phone, relative_phone, relative_name, rfid, company_id, bloodtype, remarks";
                        string strParamValues = "@Name, @Address, @Phone, @RelativePhone, @RelativeName, @RFID, @CompanyID, @BloodType, @Remarks";
                        List<object> objParams = new List<object>(){ udtDriver.Name, udtDriver.Address, udtDriver.Phone,
                            udtDriver.RelativePhone, udtDriver.RelativeName, udtDriver.RFID, udtDriver.CompanyID,udtDriver.BloodType,udtDriver.Remarks };

                        // check if birthdate is not null
                        if (udtDriver.DateOfBirth != null)
                        {
                            // initialize birthdate
                            strParamNames += ", birthdate";
                            strParamValues += ", @Birthdate";
                            objParams.Add(udtDriver.DateOfBirth);
                        }

                        // save new driver to database
                        dbMgr.ExecuteNonQuery(String.Format("INSERT INTO drivers ({0}) VALUES ({1})",
                            strParamNames, strParamValues), objParams.ToArray());
                    }
                    else
                    {
                        // update the existing driver
                        string strDOB = "";

                        List<object> objParams = new List<object>(){ udtDriver.Name, udtDriver.Address, udtDriver.Phone, 
                            udtDriver.RelativePhone, udtDriver.RelativeName, udtDriver.RFID, udtDriver.CompanyID, udtDriver.BloodType,udtDriver.Remarks, udtDriver.DriverID};

                        // check DOB
                        if (udtDriver.DateOfBirth != null)
                        {
                            strDOB = "birthdate = @DateOfBirth,";
                            objParams.Insert(2, udtDriver.DateOfBirth);
                        }

                        dbMgr.ExecuteNonQuery(String.Format("UPDATE drivers SET driver_name = @Name, address = @Address, {0}" +
                            "phone = @Phone, relative_phone = @RelativePhone, relative_name = @RelativeName, rfid = @RFID, " +
                            "company_id = @CompanyID, bloodtype = @BloodType, remarks = @Remarks WHERE driver_id = @DriverID", strDOB), objParams.ToArray());
                    }
                }
            }
            catch (Exception ex)
            {
                strRet = ex.Message;
            }

            return strRet;
        }

        /// <summary>
        /// save drivers
        /// </summary>
        /// <param name="arrDrivers"></param>
        /// <param name="iUserID"></param>
        /// <returns></returns>
        public string SaveDrivers(List<DriverInfo> arrDrivers, int iUserID)
        {
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            int iCount = 0;
            try
            {
                if (dbMgr.Open())
                {
                    foreach (DriverInfo udtDriver in arrDrivers)
                    {
                        if (SaveDriver(ref dbMgr, udtDriver, iUserID) == "")
                            iCount++;
                    }
                }
            }
            catch (Exception ex)
            {
                DatabaseMgrMySQL.LogError(ex.Message, "SaveDrivers");
            }


            // close database
            dbMgr.Close();
            return String.Format("{0} {1} successfully saved.", iCount, iCount > 1 ? "drivers" : "driver");
        }

        /// <summary>
        /// delete driver
        /// </summary>
        /// <param name="iDriverID"></param>
        /// <returns></returns>
        public string DeleteDriver(int iDriverID)
        {
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();
            string strRet = "";
            try
            {
                if (dbMgr.Open())
                {
                    // update assets table
                    dbMgr.ExecuteNonQuery("UPDATE assets SET driver_id = 0 WHERE driver_id = @DriverID", new object[] { iDriverID });

                    // delete driver from drivers table
                    dbMgr.ExecuteNonQuery("DELETE FROM drivers WHERE driver_id = @DriverID", new object[] { iDriverID });
                }
            }
            catch (Exception ex)
            {
                strRet = DatabaseMgrMySQL.LogError(ex.Message, "DeleteDriver");
            }
            dbMgr.Close();
            return strRet;
        }

        /// <summary>
        /// build driver info
        /// </summary>
        /// <param name="dbRdr"></param>
        /// <returns></returns>
        private DriverInfo BuildDriver(DbDataReader dbRdr)
        {
            DriverInfo udtDriver = new DriverInfo();

            try
            {
                // save data
                udtDriver.DriverID = dbRdr.ToInt32("driver_id");
                udtDriver.Name = dbRdr.ToString("driver_name");
                udtDriver.Address = dbRdr.ToString("address");
                if (dbRdr["birthdate"] != DBNull.Value)
                    udtDriver.DateOfBirth = dbRdr.ToDateTime("birthdate");

                udtDriver.Phone = dbRdr.ToString("phone");
                udtDriver.RelativePhone = dbRdr.ToString("relative_phone");
                udtDriver.RelativeName = dbRdr.ToString("relative_name");
                udtDriver.Company = dbRdr.ToString("company");
                udtDriver.RFID = dbRdr.ToString("rfid");
                udtDriver.CompanyID = dbRdr.ToInt32("company_id");
                udtDriver.LoginLocal = DateTime.MinValue; // not automatically set
                udtDriver.Remarks = dbRdr.ToString("remarks");
                udtDriver.BloodType = dbRdr.ToInt32("bloodtype");
                udtDriver.LastTap = dbRdr.ToDateTime("last_tap");
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, "BuildDriver");
            }

            return udtDriver;
        }

        /// <summary>
        /// get driver's earliest login
        /// </summary>
        /// <param name="dtDateLocal">filter date. required.</param>
        /// <param name="iDriverID">driver id. required if asset id is not given.</param>
        /// <param name="iAssetID">asset id. required if driver id is not given.</param>
        /// <param name="iUserID">user id. set negative value if unused.</param>
        /// <param name="iCompanyID">company id. set negative value if unused.</param>
        /// <returns>driver's earliest login</returns>
        public DateTime GetDriverLogin(DateTime dtDateLocal, int iDriverID, int iAssetID, int iUserID, int iCompanyID)
        {
            DateTime dtLoginLocal = DateTime.MinValue;

            if (iDriverID < 0 && iAssetID < 0)
                return dtLoginLocal;

            List<DriverInfo> arrDrivers = GetDriverLogins(
                dtDateLocal, dtDateLocal.Date.AddDays(1).Subtract(new TimeSpan(hours: 0, minutes: 0, seconds: 1)),
                iDriverID, iAssetID, iUserID, iCompanyID);
            if (arrDrivers.Count > 0)
                dtLoginLocal = arrDrivers.First().LoginLocal;

            return dtLoginLocal;
        }

        /// <summary>
        /// get list of drivers with earliest login
        /// </summary>
        /// <param name="dtStartLocal">start date. required.</param>
        /// <param name="dtEndLocal">end date. required.</param>
        /// <param name="iDriverID">driver id. set negative value if unused.</param>
        /// <param name="iAssetID">asset id. set negative value if unused.</param>
        /// <param name="iUserID">user id. set negative value if unused.</param>
        /// <param name="iCompanyID">company id. set negative value if unused.</param>
        /// <returns>list of drivers with earliest login</returns>
        public List<DriverInfo> GetDriverLogins(DateTime dtStartLocal, DateTime dtEndLocal, int iDriverID, int iAssetID, int iUserID, int iCompanyID)
        {
            List<DriverInfo> arrDrivers = new List<DriverInfo>();
            DatabaseMgrMySQL dbMgr = new DatabaseMgrMySQL();

            // get user role
            int iUserRole = 0;
            if (iUserID > 0)
            {
                try
                {
                    if (!dbMgr.Open()) return arrDrivers;
                    iUserRole = GetUserRole(ref dbMgr, iUserID);
                }
                catch (Exception ex)
                {
                    DatabaseMgrMySQL.LogError(ex.Message, String.Format("GetDriverLogin:GetUserRole\n") + ex.InnerException.ToString());
                }
            }

            // build query
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT ");
            strSql.Append("dbo.fun_GetDriverLogin.company_id, dbo.companies.name AS company, ");
            strSql.Append("dbo.fun_GetDriverLogin.asset_id, dbo.assets.name AS name, ");
            strSql.Append("dbo.fun_GetDriverLogin.driver_id, dbo.drivers.driver_name AS driver, ");
            strSql.Append("dbo.drivers.address, dbo.drivers.birthdate, ");
            strSql.Append("dbo.drivers.phone, dbo.drivers.relative_phone, ");
            strSql.Append("dbo.drivers.relative_name, dbo.drivers.rfid, dbo.drivers.last_tap, ");
            strSql.Append("dbo.fun_GetDriverLogin.login_local ");
            strSql.Append("FROM dbo.fun_GetDriverLogin ( ");
            int iTimeZoneOffset = 8;
            strSql.AppendFormat("'{0:yyyy-MM-dd HH:mm:ss}', '{1:yyyy-MM-dd HH:mm:ss}', {2}, {3}, {4}, {5}, {6}",
                dtStartLocal, dtEndLocal, iTimeZoneOffset,
                (iDriverID > 0 ? iDriverID : -1),
                (iAssetID > 0 ? iAssetID : -1),
                (iUserID > 0 && iUserRole > 0 ? iUserID : -1),
                (iCompanyID > 0 ? iCompanyID : -1));
            strSql.Append(") ");
            strSql.Append("LEFT OUTER JOIN dbo.companies ON dbo.companies.company_id = dbo.fun_GetDriverLogin.company_id ");
            strSql.Append("LEFT OUTER JOIN dbo.assets ON dbo.assets.asset_id = dbo.fun_GetDriverLogin.asset_id ");
            strSql.Append("LEFT OUTER JOIN dbo.drivers ON dbo.drivers.driver_id = dbo.fun_GetDriverLogin.driver_id ");

            // execute query
            try
            {
                if (!dbMgr.Open()) return arrDrivers;
                DbDataReader dbRdr = dbMgr.ExecuteReader(strSql.ToString());

                // build driver info records
                if (dbRdr != null && dbRdr.HasRows)
                {
                    while (dbRdr.Read())
                    {
                        DriverInfo udtDriver = BuildDriver(dbRdr);
                        udtDriver.LoginLocal = DateTime.Parse(dbRdr["login_local"].ToString());
                        arrDrivers.Add(udtDriver);
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgrMySQL.LogError(ex.Message, String.Format("GetDriverLogins:\n") + strSql + String.Format("\n") + ex.InnerException.ToString());
            }

            return arrDrivers;
        }

        #endregion
    }

    /// <summary>
    /// helper function class
    /// </summary>
    internal static class HelperFunctions
    {
        /// <summary>
        /// converts database value to string
        /// </summary>
        /// <param name="dbRdr"></param>
        /// <param name="strParam"></param>
        public static string ToString(this DbDataReader dbRdr, string strParam)
        {
            // get parameter value
            return (dbRdr[strParam] != DBNull.Value ? dbRdr[strParam].ToString() : "");
        }

        /// <summary>
        /// converts database value to integer
        /// </summary>
        /// <param name="dbRdr"></param>
        /// <param name="strParam"></param>
        public static int ToInt32(this DbDataReader dbRdr, string strParam)
        {
            // get parameter value
            return (dbRdr[strParam] != DBNull.Value ? Convert.ToInt32(dbRdr[strParam]) : 0);
        }

        /// <summary>
        /// converts database value to integer
        /// </summary>
        /// <param name="dbRdr"></param>
        /// <param name="strParam"></param>
        public static long ToInt64(this DbDataReader dbRdr, string strParam)
        {
            // get parameter value
            return (dbRdr[strParam] != DBNull.Value ? Convert.ToInt64(dbRdr[strParam]) : 0);
        }

        /// <summary>
        /// converts database value to double
        /// </summary>
        /// <param name="dbRdr"></param>
        /// <param name="strParam"></param>
        public static double ToDouble(this DbDataReader dbRdr, string strParam)
        {
            // get parameter value
            return (dbRdr[strParam] != DBNull.Value ? Convert.ToDouble(dbRdr[strParam]) : 0);
        }

        /// <summary>
        /// converts database value to datetime
        /// </summary>
        /// <param name="dbRdr"></param>
        /// <param name="strParam"></param>
        public static DateTime ToDateTime(this DbDataReader dbRdr, string strParam)
        {
            // get parameter value
            return (dbRdr[strParam] != DBNull.Value ? Convert.ToDateTime(dbRdr[strParam]) : Convert.ToDateTime("1/1/2000 00:00:00"));
        }

        /// <summary>
        /// converts database value to datetime
        /// </summary>
        /// <param name="dbRdr"></param>
        /// <param name="strParam"></param>
        public static DateTime ToDateTimeMin(this DbDataReader dbRdr, string strParam)
        {
            // get parameter value
            return (dbRdr[strParam] != DBNull.Value ? Convert.ToDateTime(dbRdr[strParam]) : DateTime.MinValue);
        }

        /// <summary>
        /// encloses string with xml tags
        /// </summary>
        /// <param name="strTag"></param>
        /// <returns></returns>
        public static string ToXml(this string strValue, string strTag)
        {
            // format in xml
            return String.Format("<{0}>{1}</{0}>", strTag, strValue);
        }

        /// <summary>
        /// gets value of xml node
        /// </summary>
        /// <param name="valEnum"></param>
        /// <returns></returns>
        public static string NodeValue(this XmlDocument xmlRequest, string strXPath)
        {
            // get xml value
            XmlNode xmlValue = xmlRequest.SelectSingleNode(strXPath);
            return (xmlValue != null ? xmlValue.InnerText : "");
        }

        /// <summary>
        /// formats string into title case
        /// </summary>
        /// <param name="valEnum"></param>
        /// <returns></returns>
        public static string ToTitleCase(this string strText)
        {
            // parse string
            string[] arrTemp = strText.Split();
            for (int i = 0; i < arrTemp.Length; i++)
            {
                // capitalize first letter
                if (arrTemp[i].Length > 1)
                    arrTemp[i] = String.Format("{0}{1}", arrTemp[i].Substring(0, 1).ToUpper(), arrTemp[i].Substring(1).ToLower());
                else arrTemp[i] = arrTemp[i].ToUpper();
            }
            return String.Join(" ", arrTemp);
        }

        /// <summary>
        /// formats error code to response structure
        /// </summary>
        /// <param name="retCode"></param>
        /// <param name="strRefID"></param>
        /// <returns></returns>
        public static Response FormatResponse(this ErrorCode retCode)
        {
            // format response from error code
            return ((long)retCode).FormatResponse("");
        }

        /// <summary>
        /// formats error code to response structure
        /// </summary>
        /// <param name="iErrorCode"></param>
        /// <param name="strParam"></param>
        /// <returns></returns>
        public static Response FormatResponse(this long iErrorCode, string strParam)
        {
            // initialize response
            Response udtRet = new Response();
            udtRet.ErrorCode = iErrorCode;
            udtRet.Status = (iErrorCode >= 0 ? "Success" : "Error");

            // check error code
            if (iErrorCode > 0) iErrorCode = 0;
            switch (iErrorCode)
            {
            case 0: udtRet.ErrMessage = "WL000-Success"; break;
            case -1: udtRet.ErrMessage = "WL001-Record Already Exists"; break;
            case -2: udtRet.ErrMessage = "WL002-Missing Mandatory Parameter"; break;
            case -3: udtRet.ErrMessage = "WL003-Invalid Parameter"; break;
            case -4: udtRet.ErrMessage = "WL004-Request Failed"; break;
            case -5: udtRet.ErrMessage = "WL005-Failed to Update Database"; break;
            case -6: udtRet.ErrMessage = "WL006-Duplicate Transaction"; break;
            case -7: udtRet.ErrMessage = "WL007-Invalid State"; break;
            case -8: udtRet.ErrMessage = "WL008-Add Failed"; break;
            case -9: udtRet.ErrMessage = "WL009-Remove Failed"; break;
            case -10: udtRet.ErrMessage = "WL010-Update Failed"; break;
            case -11: udtRet.ErrMessage = "WL011-Maximum Limit Reached"; break;
            case -12: udtRet.ErrMessage = "WL012-Access Denied"; break;
            case -13: udtRet.ErrMessage = "WL013-Status Pending"; break;
            case -14: udtRet.ErrMessage = "WL014-Operation Timed Out"; break;
            }

            // check parameter
            if (!String.IsNullOrEmpty(strParam))
                udtRet.ErrMessage += String.Format(" ({0})", strParam);
            return udtRet;
        }
    }
}

