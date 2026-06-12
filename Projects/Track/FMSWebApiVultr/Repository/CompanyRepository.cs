using FMSWebApi.Models;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Web.Hosting;
using FMSWebApi.Properties;

namespace FMSWebApi.Repository
{
    public class CompanyRepository : ICompanyRepository
    {
        //private string mConnStr = "server=127.0.0.1;uid=root;pwd=12345;database=test;";
        private string mConnStr = Settings.Default.DB;
        private string mProjName = "FMS-Singapore";
        public IEnumerable<CompanyInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<CompanyInfo> arrCompanies = new List<CompanyInfo>();

            try
            {
                conn.ConnectionString = mConnStr;
                conn.Open();

                cmd.CommandText = "view_companies WHERE company_id != 0";
                cmd.Connection = conn;
                cmd.CommandType = CommandType.TableDirect;
                MySqlDataReader reader = cmd.ExecuteReader();

                //Console.WriteLine(String.Format("Total Data: {0}", dbRdr.FieldCount));

                if ((reader != null) && (reader.HasRows))
                {
                    while (reader.Read())
                    {
                        CompanyInfo currCompany = DataMgrTools.BuildCompany(reader);
                        string strFill = "";
                        currCompany.Image = GetImage(String.Format("companies/{0}", currCompany.CompanyID), ref strFill);
                        currCompany.ImageFill = strFill;
                        arrCompanies.Add(currCompany);
                    }
                }
                conn.Close();
            }
            catch (MySqlException ex)
            {
                Logger.LogEvent(ex.Message + "-GetAll(CompanyRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            if (conn != null)
                conn.Close();

            return arrCompanies.ToArray();
        }

        public IEnumerable<CompanyInfo> GetByCompany(CompanyInfo param)
        {

            List<CompanyInfo> arrCompany = new List<CompanyInfo>();
            CompanyInfo currCompany = new CompanyInfo();

            string query = "SELECT * FROM view_companies WHERE reseller_id = @ResellerID AND company_id > 0";

            if (param.CompanyID > 0) query += " and company_id = @CompanyID";



            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        

                        cmd.Parameters.AddWithValue("@CompanyID", param.CompanyID);
                        cmd.Parameters.AddWithValue("@ResellerID", param.ResellerID);


                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currCompany = DataMgrTools.BuildCompany(reader);
                                    string strFill = "";
                                    currCompany.Image = GetImage(String.Format("companies/{0}", currCompany.CompanyID), ref strFill);
                                    currCompany.ImageFill = strFill;
                                    arrCompany.Add(currCompany);
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent("GetCompanyByID: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                }
            }

            return arrCompany;
        }

        public CompanyInfo GetByName(string coyName)
        {
            CompanyInfo currCoy = new CompanyInfo();

            if (string.IsNullOrEmpty(coyName))
            {
                currCoy.ErrorMessage = Consts.ERR_COMPANYERROR;
                return currCoy;
            }

            string query = string.Format("SELECT * FROM view_companies WHERE name = @Coy");

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = query;
                        
                        cmd.Parameters.AddWithValue("@Coy", coyName.Trim());
                        MySqlDataReader reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            currCoy = DataMgrTools.BuildCompany(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-GetByName(CompanyRepository)", System.Diagnostics.EventLogEntryType.Error);
                }
            }
            return currCoy;
        }

        public CompanyInfo Get(int id)
        {
            CompanyInfo currCompany = new CompanyInfo();
            string query = string.Format("SELECT * FROM view_companies WHERE company_id = {0}", id);
            
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
                            currCompany = DataMgrTools.BuildCompany(reader);
                            string strFill = "";
                            currCompany.Image = GetImage(String.Format("companies/{0}", currCompany.CompanyID), ref strFill);
                            currCompany.ImageFill = strFill;
                        }
                        
                    }
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Get(CompanyRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }
            
            return currCompany;
        }

        /// <summary>
        /// gets company id
        /// </summary>
        /// <param name="strCompany"></param>
        /// <returns></returns>
        public int GetCompanyID(string strCompany)
        {
            int iCompanyID = 0;
            string query = "";
            try
            {
                // check company name
                if ((strCompany == null) || (strCompany == ""))
                    return 0;

                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {

                        conn.Open();
                        MySqlDataReader reader = cmd.ExecuteReader();   
                        // get company id                    
                        query = string.Format("SELECT company_id FROM companies WHERE name = @Company");
                        cmd.CommandText = query;
                        
                        cmd.Parameters.AddWithValue("@Company", strCompany);

                        object objTemp = cmd.ExecuteScalar();
                        if (objTemp != null) iCompanyID = Convert.ToInt32(objTemp);
                        else
                        {
                            // save new company                        
                            query = string.Format("INSERT INTO companies (name, user_limit, zone_limit, asset_limit, sms_limit, reports) " +
                                "VALUES (@Company, 0, 0, 0, 0, '')", strCompany);
                            cmd.CommandText = query;
                            
                            cmd.Parameters.AddWithValue("@Company", strCompany);
                            objTemp = cmd.ExecuteScalar();

                            if (objTemp != null) iCompanyID = Convert.ToInt32(objTemp);
                        }

                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogError(ex.Message, "GetCompanyID");
            }
            return iCompanyID;
        }

        public CompanyInfo Add(CompanyInfo currCompany)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO companies (name, user_limit, zone_limit, asset_limit, sms_limit, credit_limit, reports, categories, flag, " +
                            "address, unit, building, postal_code, email, phone, reseller_id, isSHN, isDirections, isTSP, isVRP, isLocation, isTraffic, isCarpark, isErp, isWeather, isStreetview, isHeatmap, isGPS, session_timeout, report_duration, report_range, notification_interval, notify_customer, notify_final_invoice, " +
                            "om_username, om_password, token, smtp_username, smtp_password, smtp_port, smtp_host, isSecured, subscription_id) " +
                            "VALUES (@Name,  @UserLimit, @ZoneLimit, @AssetLimit, @SmsLimit, @CreditLimit, @Reports, @Categories, @Flag, " +
                            "@Address, @Unit, @Building, @Postal, @Email, @Phone, @ResellerID, @isSHN, @isDirections, @isTSP, @isVRP, @isLocation, @isTraffic, @isCarpark, @isErp, @isWeather, @isStreetview, @isHeatmap, @isGPS, @SessionTimeout, @ReportDuration, @ReportRange, @NotificationInterval, @NotifyCustomer, @NotifyFinalInvoice, " +
                            "@OMUsername, @OMPassword, @Token, @SMTPUsername, @SMTPPassword, @SMTPPort, @SMTPHost, @isSecured, @SubscriptionID)";
                        
                        cmd.Parameters.AddWithValue("@Name", currCompany.Name);
                        cmd.Parameters.AddWithValue("@UserLimit", currCompany.UserLimit);
                        cmd.Parameters.AddWithValue("@ZoneLimit", currCompany.ZoneLimit);
                        cmd.Parameters.AddWithValue("@AssetLimit", currCompany.AssetLimit);
                        cmd.Parameters.AddWithValue("@SmsLimit", currCompany.SmsLimit);
                        cmd.Parameters.AddWithValue("@CreditLimit", currCompany.CreditLimit);
                        cmd.Parameters.AddWithValue("@Reports", currCompany.Reports);
                        cmd.Parameters.AddWithValue("@Categories", currCompany.Categories);
                        cmd.Parameters.AddWithValue("@Flag", (int)currCompany.Flag);
                        cmd.Parameters.AddWithValue("@Address", currCompany.Address);
                        cmd.Parameters.AddWithValue("@Unit", currCompany.Unit);
                        cmd.Parameters.AddWithValue("@Building", currCompany.Building);
                        cmd.Parameters.AddWithValue("@Postal", currCompany.Postal);
                        cmd.Parameters.AddWithValue("@Email", currCompany.Email);
                        cmd.Parameters.AddWithValue("@Phone", currCompany.Phone);
                        cmd.Parameters.AddWithValue("@ResellerID", currCompany.ResellerID);
                        cmd.Parameters.AddWithValue("@isSHN", currCompany.isSHN);
                        cmd.Parameters.AddWithValue("@isDirections", currCompany.isDirections);
                        cmd.Parameters.AddWithValue("@isTSP", currCompany.isTSP);
                        cmd.Parameters.AddWithValue("@isVRP", currCompany.isVRP);
                        cmd.Parameters.AddWithValue("@isLocation", currCompany.isLocation);
                        cmd.Parameters.AddWithValue("@isTraffic", currCompany.isTraffic);
                        cmd.Parameters.AddWithValue("@isCarpark", currCompany.isCarpark);
                        cmd.Parameters.AddWithValue("@isErp", currCompany.isErp);
                        cmd.Parameters.AddWithValue("@isWeather", currCompany.isWeather);
                        cmd.Parameters.AddWithValue("@isStreetview", currCompany.isStreetview);
                        cmd.Parameters.AddWithValue("@isHeatmap", currCompany.isHeatmap);
                        cmd.Parameters.AddWithValue("@isGPS", currCompany.isGPS);
                        cmd.Parameters.AddWithValue("@SessionTimeout", currCompany.SessionTimeout);
                        cmd.Parameters.AddWithValue("@ReportDuration", currCompany.ReportDuration);
                        cmd.Parameters.AddWithValue("@ReportRange", currCompany.ReportRange);
                        cmd.Parameters.AddWithValue("@NotificationInterval", currCompany.NotificationInterval);
                        cmd.Parameters.AddWithValue("@NotifyCustomer", currCompany.NotifyCustomer);
                        cmd.Parameters.AddWithValue("@NotifyFinalInvoice", currCompany.NotifyFinalInvoice);
                        cmd.Parameters.AddWithValue("@OMUsername", currCompany.OMUsername);
                        cmd.Parameters.AddWithValue("@OMPassword", currCompany.OMPassword);
                        cmd.Parameters.AddWithValue("@Token", currCompany.Token);
                        cmd.Parameters.AddWithValue("@SMTPUsername", currCompany.SMTPUsername);
                        cmd.Parameters.AddWithValue("@SMTPPassword", currCompany.SMTPPassword);
                        cmd.Parameters.AddWithValue("@SMTPPort", currCompany.SMTPPort);
                        cmd.Parameters.AddWithValue("@SMTPHost", currCompany.SMTPHost);
                        cmd.Parameters.AddWithValue("@isSecured", currCompany.isSecured);
                        cmd.Parameters.AddWithValue("@SubscriptionID", currCompany.SubscriptionID);
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(CompanyRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return currCompany;
        }

        public bool Remove(int companyID)
        {
            bool retVal = false;
            string query = string.Format("DELETE FROM companies WHERE company_id = {0}", companyID);
            
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
                Logger.LogEvent(ex.Message + "-Remove(CompanyRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return retVal;
        }

        public bool Update(CompanyInfo currCompany)
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
                        cmd.CommandText = "UPDATE companies SET name = @Name, address = @Address, unit = @Unit, building = @Building, postal_code = @Postal, email = @Email, phone = @Phone, user_limit = @UserLimit, zone_limit = @ZoneLimit, " +
                                            "asset_limit = @AssetLimit, sms_limit = @SmsLimit, credit_limit = @CreditLimit, reports = @Reports, flag = @Flag, categories = @Categories, reseller_id = @ResellerID, isSHN = @isSHN, isDirections = @isDirections, isTSP = @isTSP, isVRP = @isVRP, " +
                                            "isLocation = @isLocation, isTraffic = @isTraffic, isCarpark = @isCarpark, isErp = @isErp, isWeather = @isWeather, isStreetview = @isStreetview, isHeatmap = @isHeatmap, isGPS = @isGPS, session_timeout = @SessionTimeout, report_duration = @ReportDuration, report_range = @ReportRange, notification_interval = @NotificationInterval, notify_customer = @NotifyCustomer, notify_final_invoice = @NotifyFinalInvoice, " +
                                            "om_username = @OMUsername, om_password = @OMPassword, token = @Token, smtp_username = @SMTPUsername, smtp_password = @SMTPPassword, smtp_port = @SMTPPort, smtp_host = @SMTPHost, isSecured = @isSecured, subscription_id = @SubscriptionID WHERE company_id = @CompanyID";
                        
                        cmd.Parameters.AddWithValue("@Name", currCompany.Name);
                        cmd.Parameters.AddWithValue("@Address", currCompany.Address);
                        cmd.Parameters.AddWithValue("@Unit", currCompany.Unit);
                        cmd.Parameters.AddWithValue("@Building", currCompany.Building);
                        cmd.Parameters.AddWithValue("@Postal", currCompany.Postal);
                        cmd.Parameters.AddWithValue("@Email", currCompany.Email);
                        cmd.Parameters.AddWithValue("@Phone", currCompany.Phone);
                        cmd.Parameters.AddWithValue("@UserLimit", currCompany.UserLimit);
                        cmd.Parameters.AddWithValue("@ZoneLimit", currCompany.ZoneLimit);
                        cmd.Parameters.AddWithValue("@AssetLimit", currCompany.AssetLimit);
                        cmd.Parameters.AddWithValue("@SmsLimit", currCompany.SmsLimit);
                        cmd.Parameters.AddWithValue("@CreditLimit", currCompany.CreditLimit);
                        cmd.Parameters.AddWithValue("@Reports", currCompany.Reports);
                        cmd.Parameters.AddWithValue("@Flag", currCompany.Flag);
                        cmd.Parameters.AddWithValue("@Categories", currCompany.Categories);
                        cmd.Parameters.AddWithValue("@ResellerID", currCompany.ResellerID);
                        cmd.Parameters.AddWithValue("@isSHN", currCompany.isSHN);
                        cmd.Parameters.AddWithValue("@isDirections", currCompany.isDirections);
                        cmd.Parameters.AddWithValue("@isTSP", currCompany.isTSP);
                        cmd.Parameters.AddWithValue("@isVRP", currCompany.isVRP);
                        cmd.Parameters.AddWithValue("@isLocation", currCompany.isLocation);
                        cmd.Parameters.AddWithValue("@isTraffic", currCompany.isTraffic);
                        cmd.Parameters.AddWithValue("@isCarpark", currCompany.isCarpark);
                        cmd.Parameters.AddWithValue("@isErp", currCompany.isErp);
                        cmd.Parameters.AddWithValue("@isWeather", currCompany.isWeather);
                        cmd.Parameters.AddWithValue("@isStreetview", currCompany.isStreetview);
                        cmd.Parameters.AddWithValue("@isHeatmap", currCompany.isHeatmap);
                        cmd.Parameters.AddWithValue("@isGPS", currCompany.isGPS);
                        cmd.Parameters.AddWithValue("@SessionTimeout", currCompany.SessionTimeout);
                        cmd.Parameters.AddWithValue("@ReportDuration", currCompany.ReportDuration);
                        cmd.Parameters.AddWithValue("@ReportRange", currCompany.ReportRange);
                        cmd.Parameters.AddWithValue("@NotificationInterval", currCompany.NotificationInterval);
                        cmd.Parameters.AddWithValue("@NotifyCustomer", currCompany.NotifyCustomer);
                        cmd.Parameters.AddWithValue("@NotifyFinalInvoice", currCompany.NotifyFinalInvoice);
                        cmd.Parameters.AddWithValue("@OMUsername", currCompany.OMUsername);
                        cmd.Parameters.AddWithValue("@OMPassword", currCompany.OMPassword);
                        cmd.Parameters.AddWithValue("@Token", currCompany.Token);
                        cmd.Parameters.AddWithValue("@SMTPUsername", currCompany.SMTPUsername);
                        cmd.Parameters.AddWithValue("@SMTPPassword", currCompany.SMTPPassword);
                        cmd.Parameters.AddWithValue("@SMTPPort", currCompany.SMTPPort);
                        cmd.Parameters.AddWithValue("@SMTPHost", currCompany.SMTPHost);
                        cmd.Parameters.AddWithValue("@isSecured", currCompany.isSecured);
                        cmd.Parameters.AddWithValue("@SubscriptionID", currCompany.SubscriptionID);
                        cmd.Parameters.AddWithValue("@CompanyID", currCompany.CompanyID);
                        
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
                Logger.LogEvent(ex.Message + "-Update(CompanyRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
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


    }
}