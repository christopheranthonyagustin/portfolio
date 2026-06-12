using FMSWebApi.Models;
using FMSWebApi.Properties;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.DirectoryServices;
using System.DirectoryServices.AccountManagement;
using System.DirectoryServices.Protocols;
using System.IO;
using System.Linq;
using System.Net;
using System.Security.Principal;
using System.Web;
using System.Web.Hosting;

namespace FMSWebApi.Repository
{
    public class InfoRepository : IObjectRepository
    {
        private string mProjName = Settings.Default.ProjectName;

        //private string mConnStr = "server=localhost;uid=root;pwd=$B$Transit888;database=adas;charset=utf8;max pool size=500;default command timeout=999;";
        private string mConnStr = "server=localhost;uid=root;pwd=$B$Transit888;database=adas;charset=utf8;max pool size=500;default command timeout=99999;";
        public object GetAll()
        {
            throw new NotImplementedException();
        }

        public object Get(int id)
        {
            throw new NotImplementedException();
        }

        public object Add(object item)
        {
            UserInfo newInfo = item as UserInfo;
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "SELECT * FROM view_users WHERE user_name = @UserName AND password = @Password";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@UserName", newInfo.User);
                        cmd.Parameters.AddWithValue("@Password", newInfo.Password);
                        MySqlDataReader reader = cmd.ExecuteReader();

                        //Console.WriteLine(String.Format("Total Data: {0}", dbRdr.FieldCount));

                        if ((reader != null) && (reader.HasRows))
                        {
                            while (reader.Read())
                            {
                                newInfo = DataMgrTools.BuildUser(reader);
                                //string strFill = "";
                                //newInfo.Image = GetImage(String.Format("users/{0}", newInfo.UserID), ref strFill);
                                //newInfo.ImageFill = strFill;
                            }
                        }
                        else
                        {
                            newInfo.ErrorMessage = Consts.ERR_LOGIN;
                        }

                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(mProjName, ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }

            return newInfo;
        }

        public object AD(object item)
        {
            UserInfo newInfo = item as UserInfo;
            Logger.LogEvent(string.Format("Username: {0} Password: {1}", newInfo.User, newInfo.Password), System.Diagnostics.EventLogEntryType.Information);


            //try
            //{
            //    //LdapConnection connection = new LdapConnection("LDAP://ldap.forumsys.com:389/cn=admin,dc=example,dc=com");
            //    LdapConnection connection = new LdapConnection("LDAP://w2kdc.com:389/cn=w2kdc,dc=com");
            //    NetworkCredential credential = new NetworkCredential(newInfo.User, newInfo.Password);
            //    connection.Credential = credential;
            //    connection.Bind();
            //    Logger.LogEvent(newInfo.ErrorMessage + "-(AD Success)", System.Diagnostics.EventLogEntryType.Information);
            //}
            //catch (LdapException lexc)
            //{
            //    String error = lexc.ServerErrorMessage;
            //    newInfo.ErrorMessage = lexc.ToString();
            //    Logger.LogEvent(newInfo.ErrorMessage + "-(LDAP Exception)", System.Diagnostics.EventLogEntryType.Error);
            //}
            //catch (Exception exc)
            //{
            //    newInfo.ErrorMessage = exc.ToString();
            //    Logger.LogEvent(newInfo.ErrorMessage + "-(AD Exception)", System.Diagnostics.EventLogEntryType.Error);
            //}
            //try
            //{
            //    using (PrincipalContext pc = new PrincipalContext(ContextType.Domain, "LDAP://172.16.52.70:389", "cn=w2kdc, cn=com"))
            //    {
            //        // validate the credentials
            //        bool isValid = pc.ValidateCredentials(newInfo.User, newInfo.Password);
            //    }
            //}
            //catch(Exception ex)
            //{
            //   newInfo.ErrorMessage = ex.ToString();
            //   Logger.LogEvent(newInfo.ErrorMessage + "-(Principal Context)", System.Diagnostics.EventLogEntryType.Error);
            //}


            try
            {
          
                DirectoryEntry entry = new DirectoryEntry("LDAP://172.16.52.70:389/CN=w2kdc,CN=com", newInfo.User, newInfo.Password);
                string objectSid = (new SecurityIdentifier((byte[])entry.Properties["objectSid"].Value, 0).Value);
                Logger.LogEvent(objectSid + "-(objectSid)", System.Diagnostics.EventLogEntryType.Information);

                DirectorySearcher deSearch = new DirectorySearcher();
                deSearch.SearchRoot = entry;
                deSearch.Filter = "(&(objectClass=user) (cn=" + newInfo.User + "))";
                SearchResultCollection results = deSearch.FindAll();
                if (results.Count > 0)
                {
                    DirectoryEntry objLDS = new DirectoryEntry(results[0].Path, newInfo.User, newInfo.Password);
                    if (objLDS.Guid != null)
                    {
                        Logger.LogEvent(objLDS.Guid + "-(objLDS.Guid)", System.Diagnostics.EventLogEntryType.Information);
                    }
                    else
                    {
                        
                    }
                }

                object nativeObject = entry.NativeObject;



            }
            catch (DirectoryServicesCOMException cex)
            {
                int code = cex.HResult;

                //not authenticated; reason why is in cex
                newInfo.ErrorMessage = code.ToString();
                Logger.LogEvent(newInfo.ErrorMessage + "-(DirectoryServicesCOMException not authenticated)", System.Diagnostics.EventLogEntryType.Error);
            }
            catch (Exception ex)
            {
                //not authenticated due to some other exception [this is optional]
                newInfo.ErrorMessage = ex.ToString();
                Logger.LogEvent(newInfo.ErrorMessage + "-(DirectoryServicesCOMException)", System.Diagnostics.EventLogEntryType.Error);
            }

            //using (DirectoryEntry adsEntry = new DirectoryEntry("LDAP://172.16.52.70:389/cn=w2kdc,cn=com", newInfo.User, newInfo.Password))
            //{
            //    using (DirectorySearcher adsSearcher = new DirectorySearcher(adsEntry))
            //    {
            //        //adsSearcher.Filter = "(&(objectClass=user)(objectCategory=person))";
            //        adsSearcher.Filter = "(sAMAccountName=" + newInfo.User + ")";

            //        try
            //        {
            //            SearchResult adsSearchResult = adsSearcher.FindOne();
            //            newInfo.ErrorMessage = null;
            //        }
            //        catch (Exception ex)
            //        {
            //            // Failed to authenticate. Most likely it is caused by unknown user
            //            // id or bad strPassword.
            //            newInfo.ErrorMessage = ex.ToString();
            //            Logger.LogEvent(newInfo.ErrorMessage + "-(DirectoryServicesCOMException)", System.Diagnostics.EventLogEntryType.Error);
            //        }
            //        finally
            //        {
            //            adsEntry.Close();
            //        }
            //    }
            //}


            //try
            //{
            //    // Create the LDAP server (directory) object using FQDN name
            //    LdapDirectoryIdentifier directory = new LdapDirectoryIdentifier("LDAP://172.16.52.70:389/cn=w2kdc,cn=com");


            //    // Create the LDAP connection object
            //    LdapConnection connection = new LdapConnection(directory);
            //    connection.Timeout = new TimeSpan(0, 0, 10);

            //    // LDAP server requires basic authentiction, by default LdapConnection was using NTLM (negotiate)
            //    connection.Credential = new System.Net.NetworkCredential(newInfo.User, newInfo.Password);
            //    connection.AuthType = AuthType.Basic;
            //    connection.AutoBind = false;

            //    // Set the LDAP protocol version that the LDAP server is expecting
            //    // Reference: http://msdn.microsoft.com/en-us/library/bb332056.aspx
            //    connection.SessionOptions.ProtocolVersion = 3;  // Set protocol to LDAPv3

            //    // Bind to the LDAP server
            //    connection.Bind();

            //    newInfo.ErrorMessage = true.ToString();
            //    Logger.LogEvent(newInfo.ErrorMessage + "-(AD Success)", System.Diagnostics.EventLogEntryType.Information);
            //}
            //catch (LdapException lexc)
            //{
            //    String error = lexc.ServerErrorMessage;
            //    newInfo.ErrorMessage = lexc.ToString();
            //    Logger.LogEvent(newInfo.ErrorMessage + "-(LDAP Exception)", System.Diagnostics.EventLogEntryType.Error);
            //}
            //catch (Exception exc)
            //{
            //    newInfo.ErrorMessage = exc.ToString();
            //    Logger.LogEvent(newInfo.ErrorMessage + "-(AD Exception)", System.Diagnostics.EventLogEntryType.Error);
            //}

            return newInfo;
        }

        public static string ValidateUser(string ComputerName, string UserName, string Password)
        {
            if (ComputerName.IndexOf('.') != -1)
            {
                DirectoryEntry entry = new DirectoryEntry("LDAP://192.168.1.1/CN=sync,CN=users,DC=test,DC=com", UserName, Password);
                try
                {
                    string objectSid =  (new SecurityIdentifier((byte[])entry.Properties["objectSid"].Value, 0).Value);
                    return objectSid;
                }
                catch
                {
                    return null;
                }
                finally
                {
                    entry.Dispose();
                }
            }
            else
            {
                DirectoryEntry entry = new DirectoryEntry("LDAP://" + ComputerName, UserName, Password);
                try
                {
                    string objectSid =  (new SecurityIdentifier((byte[])entry.Properties["objectSid"].Value, 0).Value);
                    return objectSid;
                }
                catch
                {
                    return null;
                }
                finally
                {
                    entry.Dispose();
                }
            }
        }

        public bool Remove(int id)
        {
            throw new NotImplementedException();
        }

        public bool Update(object item)
        {
            throw new NotImplementedException();
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
                    string strUri = String.Format("{0}/images/{1}", "http://localhost/trackdemowebapi", strTemp);

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
    }
}