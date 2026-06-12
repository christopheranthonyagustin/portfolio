using FMSWebApi.Models;
using FMSWebApi.Properties;
using MySql.Data.MySqlClient;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.Hosting;
using System.Web.Script.Serialization;

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

        //public object Add(object item)
        public UserInfo Add(UserInfo item)
        {
            UserInfo currUser = new UserInfo();

            try
            {
                using (MySqlConnection conn = new MySqlConnection(Settings.Default.DB))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "SELECT * FROM view_users WHERE user_name = @UserName AND password = @Password";
                        
                        cmd.Parameters.AddWithValue("@UserName", item.User);
                        cmd.Parameters.AddWithValue("@Password", item.Password);
                        MySqlDataReader reader = cmd.ExecuteReader();

                        //Console.WriteLine(String.Format("Total Data: {0}", dbRdr.FieldCount));

                        if ((reader != null) && (reader.HasRows))
                        {
                            while (reader.Read())
                            {
                                currUser = DataMgrTools.BuildUser(reader);
                                string strFill = "";
                                currUser.Image = GetImage(String.Format("users/{0}", currUser.UserID), ref strFill);
                                currUser.ImageFill = strFill;
                                if (strFill == "None") currUser.Image = String.Format("{0}", "https://uploader.acecomsystem.com/images/users/default-avatar.png");
                            }
                        }
                        else
                        {
                            currUser.ErrorMessage = Consts.ERR_LOGIN;
                        }

                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(mProjName, ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }


            if (!string.IsNullOrEmpty(item.reCaptcha))
            {
                try
                {
                    const string secretKey = "6Ld9Q_wUAAAAAGLXEqmWUhG_HEHL5zgMfaQ4wy_O";
                    var urlRequest = String.Format("https://www.google.com/recaptcha/api/siteverify?secret={0}&response={1}", secretKey, item.reCaptcha);
                    currUser.reCaptcha = item.reCaptcha;

                    var client = new System.Net.WebClient();
                    var googleReply = client.DownloadString(urlRequest);

                    currUser.Success =  JsonConvert.DeserializeObject<RecaptchaResponse>(googleReply).Success;
                    currUser.Hostname = JsonConvert.DeserializeObject<RecaptchaResponse>(googleReply).Hostname;
                    currUser.Score = JsonConvert.DeserializeObject<RecaptchaResponse>(googleReply).Score;
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(string.Format("reCaptcha Exception {0}", ex.Message), System.Diagnostics.EventLogEntryType.Error);
                }
            }


            return currUser;
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
    }
}