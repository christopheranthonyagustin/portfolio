using FMSWebApi.Models;
using FMSWebApi.Properties;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Hosting;

namespace FMSWebApi.Repository
{
    public class InfoRepository : IObjectRepository
    {
        private string mProjName = Settings.Default.ProjectName;

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
                using (MySqlConnection conn = new MySqlConnection(Settings.Default.DB))
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
                                string strFill = "";
                                newInfo.Image = GetImage(String.Format("users/{0}", newInfo.UserID), ref strFill);
                                newInfo.ImageFill = strFill;
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
    }
}