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
    public class AppRepository : IAppRepository
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
            DriverInfo newInfo = item as DriverInfo;
            try
            {
                using (MySqlConnection conn = new MySqlConnection(Settings.Default.DB))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "SELECT * FROM view_drivers WHERE driver_name = @UserName AND password = @Password";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@UserName", newInfo.Name);
                        cmd.Parameters.AddWithValue("@Password", newInfo.Password);
                        MySqlDataReader reader = cmd.ExecuteReader();

                        if ((reader != null) && (reader.HasRows))
                        {
                            while (reader.Read())
                            {
                                newInfo = DataMgrTools.BuildDriver(reader);
                                string strFill = "";
                                newInfo.Image = GetImage(String.Format("drivers/{0}", newInfo.DriverID), ref strFill);
                                newInfo.ImageFill = strFill;
                            }             
                        }
                        else
                        {
                            newInfo.ErrorMessage = Consts.ERR_LOGINDRIVER;
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

        public object CountDriver(object item)
        {
            DriverInfo newInfo = item as DriverInfo;
            try
            {
                using (MySqlConnection conn = new MySqlConnection(Settings.Default.DB))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "SELECT COUNT(*) FROM view_drivers WHERE driver_name = @UserName AND password = @Password";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@UserName", newInfo.Name);
                        cmd.Parameters.AddWithValue("@Password", newInfo.Password);
                        int rows = Convert.ToInt32(cmd.ExecuteScalar());
                        //Logger.LogEvent("Check Rows: " + rows, System.Diagnostics.EventLogEntryType.Warning);

                        if (rows > 1)
                        {
                            newInfo.ErrorMessage = Consts.ERR_LOGINDRIVERDUPLICATE;
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

        public object CheckDriver(object item)
        {
            DriverInfo newInfo = item as DriverInfo;
            try
            {
                using (MySqlConnection conn = new MySqlConnection(Settings.Default.DB))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "SELECT * FROM view_drivers WHERE driver_name = @UserName LIMIT 1";                      
                        cmd.Parameters.AddWithValue("@UserName", newInfo.Name);
                        cmd.Prepare();
                        MySqlDataReader reader = cmd.ExecuteReader();

                        if ((reader != null) && (reader.HasRows))
                        {
                            while (reader.Read())
                            {
                                newInfo = DataMgrTools.BuildDriver(reader);
                                string strFill = "";
                                newInfo.Image = GetImage(String.Format("drivers/{0}", newInfo.DriverID), ref strFill);
                                newInfo.ImageFill = strFill;
                            }
                        }
                        else
                        {
                            newInfo.ErrorMessage = Consts.ERR_LOGINDRIVER;
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