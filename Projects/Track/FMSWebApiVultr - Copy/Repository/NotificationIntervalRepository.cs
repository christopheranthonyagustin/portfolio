using MySql.Data.MySqlClient;
using FMSWebApi.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Hosting;
using System.Configuration;
using System.IO;
using FMSWebApi.Properties;

namespace FMSWebApi.Repository
{
    public class NotificationIntervalRepository : INotifRepository
    {
        private string mConnStr = Settings.Default.DB;

        public IEnumerable<NotificationIntervalInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<NotificationIntervalInfo> arrNotif = new List<NotificationIntervalInfo>();


            return arrNotif.ToArray();
        }
        public IEnumerable<NotificationIntervalInfo> GetNotifInterval(NotificationIntervalInfo param)
        {

            List<NotificationIntervalInfo> arrNotif = new List<NotificationIntervalInfo>();

            string query = "";
            object objTemp = new object();

                  
            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    query = string.Format("SELECT * FROM notification_interval");
                    if (!string.IsNullOrEmpty(param.Description)) query += " where description = @Description";
                    query += " order by unit asc";

                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        cmd.Prepare();
                        if (!string.IsNullOrEmpty(param.Description)) cmd.Parameters.AddWithValue("@Description", param.Description);

                        MySqlDataReader reader = cmd.ExecuteReader();
                        if ((reader != null) && (reader.HasRows))
                        { 
                            while (reader.Read())
                            {
                                NotificationIntervalInfo currAsset = DataMgrTools.BuildNotificationInterval(reader);
                                arrNotif.Add(currAsset);
                            }
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent("GetNotifInterval: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                }
      
            
            }
       
            return arrNotif.ToArray();
           
         }

    }
}

     