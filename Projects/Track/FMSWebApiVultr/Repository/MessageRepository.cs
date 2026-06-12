using FMSWebApi.Models;
using FMSWebApi.Properties;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Http;

namespace FMSWebApi.Repository
{
    public class MessageRepository : IMessageRepository
    {
        private string mConnStr = Settings.Default.DB;
        private string mProjName = "FMS-Singapore";
        public IEnumerable<MessageInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<MessageInfo> arrMessages = new List<MessageInfo>();

            if (conn != null)
                conn.Close();

            return arrMessages.ToArray();
        }

        public IEnumerable<MessageInfo> Get([FromUri]MessageInfo value)
        {
            List<MessageInfo> arrMessages = new List<MessageInfo>();
            MessageInfo currMessage = new MessageInfo();
            string query = "SELECT * FROM view_messages WHERE (timestamp between @StartTS and @EndTS)";

            if (value.CompanyID > 0) query += " and company_id = @CompanyID";
            if (value.Flag > 0) query += " and flag = @Flag";
 
            if (value.AssetID > 0) query += " and asset_id = @AssetID";
            else if (!string.IsNullOrEmpty(value.Asset)) query += " and asset_id = (SELECT asset_id FROM view_assets WHERE name = @AssetName)";

            query += " order by timestamp asc";


            Logger.LogEvent(mProjName, "Get: " + query, System.Diagnostics.EventLogEntryType.Information);//TESTING
            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        
                        cmd.Parameters.AddWithValue("@StartTS", value.Timestamp);
                        cmd.Parameters.AddWithValue("@EndTS", value.RxTime);
                        cmd.Parameters.AddWithValue("@CompanyID", value.CompanyID);
                        if (value.Flag > 0) cmd.Parameters.AddWithValue("@Flag", value.Flag);

                        if (value.AssetID > 0) cmd.Parameters.AddWithValue("@AssetID", value.AssetID);
                        else if (!string.IsNullOrEmpty(value.Asset)) cmd.Parameters.AddWithValue("@AssetName", value.Asset);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currMessage = DataMgrTools.BuildMessage(reader);
                                    arrMessages.Add(currMessage);
                                }
                            }
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(mProjName, "Get Messages: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);

                }



            }

            return arrMessages.ToArray();
        }


        public MessageInfo Get(int id)
        {
            MessageInfo currMessage = new MessageInfo();
            string query = string.Format("SELECT * FROM messages WHERE message_id = {0}", id);

            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        MySqlDataReader reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            currMessage = DataMgrTools.BuildMessage(reader);
                        }

                    }
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Get(MessageRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return currMessage;
        }

        public MessageInfo Add(MessageInfo currMessage)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO messages (`sender`, `recipients`, `message`, `timestamp`, `rx_time`, `flag`, `company_id`, " +
                                                                "`asset_id`) VALUES (@Sender, @Recipients, @Message, @Timestamp, @RxTime, @Flag, @CompanyID, @AssetID)";
                        
                        cmd.Parameters.AddWithValue("@Sender", currMessage.Sender);
                        cmd.Parameters.AddWithValue("@Recipients", currMessage.Recipients);
                        cmd.Parameters.AddWithValue("@Message", currMessage.Message);
                        cmd.Parameters.AddWithValue("@Timestamp", currMessage.Timestamp);
                        cmd.Parameters.AddWithValue("@RxTime", currMessage.RxTime);
                        cmd.Parameters.AddWithValue("@Flag", currMessage.Flag);
                        cmd.Parameters.AddWithValue("@CompanyID", currMessage.CompanyID);
                        cmd.Parameters.AddWithValue("@AssetID", currMessage.AssetID);
                        cmd.ExecuteNonQuery();

                        //Logger.LogEvent(" [Save Message]COMMAND Text " + cmd.CommandText, System.Diagnostics.EventLogEntryType.Warning);
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(MessageRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return currMessage;
        }

        public bool Remove(int messageID)
        {
            bool retVal = false;
            string query = string.Format("DELETE FROM messages WHERE message_id = {0}", messageID);

            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        if (cmd.ExecuteNonQuery() == 1)
                            retVal = true;
                        else
                            retVal = false;
                    }
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Remove(MessageRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }

        public bool Update(MessageInfo currMessage)
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
                        cmd.CommandText = "UPDATE messages SET sender = @Sender, recipients = @Recipients, message = @Message, timestamp = @Timestamp, rx_time = @RxTime, flag = @Flag, " +
                                            "company_id = @CompanyID, asset_id = @AssetID WHERE message_id = @MessageID";
                        
                        cmd.Parameters.AddWithValue("@Sender", currMessage.Sender);
                        cmd.Parameters.AddWithValue("@Recipients", currMessage.Recipients);
                        cmd.Parameters.AddWithValue("@Message", currMessage.Message);
                        cmd.Parameters.AddWithValue("@Timestamp", currMessage.Timestamp);
                        cmd.Parameters.AddWithValue("@RxTime", currMessage.RxTime);
                        cmd.Parameters.AddWithValue("@Flag", currMessage.Flag);
                        cmd.Parameters.AddWithValue("@CompanyID", currMessage.CompanyID);
                        cmd.Parameters.AddWithValue("@AssetID", currMessage.AssetID);
                        cmd.Parameters.AddWithValue("@MessageID", currMessage.MessageID);

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
                Logger.LogEvent(ex.Message + "-Update(MessageRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }


        /// <summary>
        /// saves message for sending
        /// </summary>
        /// <param name="udtMessage"></param>
        /// <returns></returns>
        public string SaveMessage(MessageInfo udtMessage)
        {

            string strRet = "";
            object objTemp = null;
            string query = "";

            CompanyRepository companyRepo = new CompanyRepository();

            try
            {
               using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();

                            // check sender
                            if (Char.IsDigit(udtMessage.Sender, 0))
                            {
                                try
                                {
                                    // get user name if user id is supplied
                                    int iUserID = Convert.ToInt32(udtMessage.Sender.Trim());
                                    query = String.Format("SELECT name FROM users WHERE user_id = @UserID");
                                    cmd.CommandText = query;
                                    
                                    cmd.Parameters.AddWithValue("@UserID", iUserID);
                                    objTemp = cmd.ExecuteScalar();

                                    if (objTemp != null) udtMessage.Sender = objTemp.ToString();
                                }
                                catch (Exception ex)
                                {
                                    // log error
                                    Logger.LogEvent("check sender: ", ex.Message, System.Diagnostics.EventLogEntryType.Error);
                                }                

                            }


                            try
                            {
                                // check company
                                if ((udtMessage.CompanyID == 0) && (udtMessage.Company != ""))
                                {
                                    udtMessage.CompanyID = companyRepo.GetCompanyID(udtMessage.Company);
                                    Logger.LogEvent(" check company: " + udtMessage.CompanyID, System.Diagnostics.EventLogEntryType.Information);
                            }
                            }
                            catch (Exception ex)
                            {
                                Logger.LogEvent(" check company: ", ex.Message, System.Diagnostics.EventLogEntryType.Error);

                            }

                            try
                            {
                                // check asset
                                if (udtMessage.AssetID == 0)
                                {
                                    // check name
                                    if ((udtMessage.Asset != null) && (udtMessage.Asset != ""))
                                    {
                                        // get asset id                              
                                        query = String.Format("SELECT asset_id FROM assets WHERE name = @Asset", udtMessage.Asset);
                                        Logger.LogEvent(" get asset id: " + udtMessage.Asset, System.Diagnostics.EventLogEntryType.Error);
                                        cmd.CommandText = query;
                                        
                                        cmd.Parameters.AddWithValue("@Asset", udtMessage.Asset);
                                        objTemp = cmd.ExecuteScalar();

                                        if (objTemp != null) udtMessage.AssetID = Convert.ToInt32(objTemp);
                                    }
                                    else
                                    {
                                        // get asset id using contact info
                                        query = String.Format("SELECT asset_id FROM assets WHERE phone = @Phone OR email = @Email", udtMessage.Recipients, udtMessage.Recipients);
                                        Logger.LogEvent(" get asset id using contact info: " + udtMessage.Recipients, System.Diagnostics.EventLogEntryType.Error);
                                        cmd.CommandText = query;
                                        
                                        cmd.Parameters.AddWithValue("@Recipients", udtMessage.Recipients);
                                        objTemp = cmd.ExecuteScalar();

                                        if (objTemp != null) udtMessage.AssetID = Convert.ToInt32(objTemp);
                                    }
                                }
                            }
                            catch (Exception ex)
                            {
                                Logger.LogEvent("Error>> check asset: ", ex.Message, System.Diagnostics.EventLogEntryType.Error);
                            }

                            try 
                            {
                                // check recipients
                                if ((udtMessage.Recipients != "") && (udtMessage.Message.Trim() != ""))
                                {                           
                                SendMessage(udtMessage);
                                //Logger.LogEvent("Send Messages>>: ", udtMessage.Recipients, System.Diagnostics.EventLogEntryType.Information);
                                }
                            }
                            catch (Exception ex)
                            {
                                Logger.LogEvent("Error>> check recipients exception: ", ex.Message, System.Diagnostics.EventLogEntryType.Error);
                            }

                            conn.Close();
                        
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(" Save Message Exception: ", ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return strRet;
        }

        public string SendMessage(MessageInfo udtMessage)
        {

            string strRet = "";
            string query = "";

            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {

                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();

                        try
                        {
                            // check recipients
                            if ((udtMessage.Recipients != "") && (udtMessage.Message.Trim() != ""))
                            {
                                // add message to sms queue
                                cmd.CommandText = "INSERT INTO messages (`sender`, `recipients`, `message`, `timestamp`, `rx_time`, `flag`, `company_id`, " +
                                                                        "`asset_id`, `job_number`, `notified`) VALUES (@Sender, @Recipients, @Message, @Timestamp, @RxTime, @Flag, @CompanyID, @AssetID, @JobNumber, @Notified)";
                                
                                cmd.Parameters.AddWithValue("@Sender", udtMessage.Sender);
                                cmd.Parameters.AddWithValue("@Recipients", udtMessage.Recipients);
                                cmd.Parameters.AddWithValue("@Message", udtMessage.Message);
                                cmd.Parameters.AddWithValue("@Timestamp", udtMessage.Timestamp);
                                cmd.Parameters.AddWithValue("@RxTime", udtMessage.RxTime);
                                cmd.Parameters.AddWithValue("@Flag", udtMessage.StatusID);
                                cmd.Parameters.AddWithValue("@CompanyID", udtMessage.CompanyID);
                                cmd.Parameters.AddWithValue("@AssetID", udtMessage.AssetID);
                                cmd.Parameters.AddWithValue("@JobNumber", udtMessage.JobNumber);
                                cmd.Parameters.AddWithValue("@Notified", udtMessage.Notified);
                                cmd.ExecuteNonQuery();
                                //Logger.LogEvent(" [Save Message]successful " + udtMessage.Message, System.Diagnostics.EventLogEntryType.Warning);

                            }
                        }
                        catch (Exception ex)
                        {
                            Logger.LogEvent("Error>> SendMessage exception: ", ex.Message, System.Diagnostics.EventLogEntryType.Error);
                        }

                        conn.Close();

                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(" Save Message Exception: ", ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return strRet;
        }

        public string AddMessage(MessageInfo udtMessage)
        {

            string strRet = "";

            //Logger.LogEvent(string.Format(" AddMessage: {0} Recipient: {1} Timestamp: {2} CompanyID: {3}", udtMessage.Message, udtMessage.Recipients, DateTime.UtcNow.ToString(), udtMessage.CompanyID), System.Diagnostics.EventLogEntryType.Warning);
            if ((udtMessage.Recipients != "") && (udtMessage.Message.Trim() != ""))
            {
                //Logger.LogEvent(string.Format(" AssetID: {0} JobNumber: {1} Notified: {2} Flag: {3}", udtMessage.AssetID, udtMessage.JobNumber, udtMessage.Notified, udtMessage.StatusID), System.Diagnostics.EventLogEntryType.Warning);

                try
                {
                    using (MySqlConnection conn = new MySqlConnection(mConnStr))
                    {

                        using (MySqlCommand cmd = new MySqlCommand())
                        {
                            conn.Open();
                            cmd.Connection = conn;
                            cmd.CommandText = "INSERT INTO messages (`sender`, `recipients`, `message`, `timestamp`, `rx_time`, `flag`, `company_id`, " +
                                             "`asset_id`) VALUES (@Sender, @Recipients, @Message, @Timestamp, @RxTime, @Flag, @CompanyID, @AssetID)";
                            
                            cmd.Parameters.AddWithValue("@Sender", udtMessage.Sender);
                            cmd.Parameters.AddWithValue("@Recipients", udtMessage.Recipients);
                            cmd.Parameters.AddWithValue("@Message", udtMessage.Message);
                            cmd.Parameters.AddWithValue("@Timestamp", DateTime.UtcNow);
                            cmd.Parameters.AddWithValue("@RxTime", DateTime.UtcNow);
                            cmd.Parameters.AddWithValue("@Flag", udtMessage.StatusID);
                            cmd.Parameters.AddWithValue("@CompanyID", udtMessage.CompanyID);
                            cmd.Parameters.AddWithValue("@AssetID", udtMessage.AssetID);
                            cmd.ExecuteNonQuery();
                            //Logger.LogEvent(" [Save Message]successful " + udtMessage.Message, System.Diagnostics.EventLogEntryType.Warning);
                            conn.Close();

                        }
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(" Save Message Exception: ", ex.Message, System.Diagnostics.EventLogEntryType.Error);
                }
            }



            return strRet;
        }
    }
}