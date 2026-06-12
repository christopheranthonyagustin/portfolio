using FMSWebApi.Models;
using FMSWebApi.Properties;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace FMSWebApi.Repository
{
    public class CompanyRepository : ICompanyRepository
    {
        private string mConnStr = Settings.Default.DB;
        private string mProjName = "SBS";
        public IEnumerable<CompanyInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<CompanyInfo> arrAssets = new List<CompanyInfo>();

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
                        CompanyInfo currAsset = DataMgrTools.BuildCompany(reader);
                        arrAssets.Add(currAsset);
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

            return arrAssets.ToArray();
        }

        public IEnumerable<CompanyInfo> GetByCompany(CompanyInfo param)
        {

            List<CompanyInfo> arrCompany = new List<CompanyInfo>();
            CompanyInfo currCompany = new CompanyInfo();

            string query = "SELECT * FROM view_companies WHERE reseller_id = @ResellerID AND company_id != 0";

            if (param.CompanyID > 0) query += " and company_id = @CompanyID";

           // Logger.LogEvent("GetCompanyByID: " + query, System.Diagnostics.EventLogEntryType.Error);//TESTING

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        cmd.Prepare();

                        cmd.Parameters.AddWithValue("@CompanyID", param.CompanyID);
                        cmd.Parameters.AddWithValue("@ResellerID", param.ResellerID);


                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currCompany = DataMgrTools.BuildCompany(reader);
                                    arrCompany.Add(currCompany);
                                }
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent("GetCompanyByID: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                    conn.Close();
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

            string query = string.Format("SELECT * FROM companies WHERE name = @Coy");

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = query;
                        cmd.Prepare();
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
                    conn.Close();
                }
            }
            return currCoy;
        }

        public CompanyInfo Get(int id)
        {
            CompanyInfo currAsset = new CompanyInfo();
            string query = string.Format("SELECT * FROM companies WHERE company_id = {0}", id);
            
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
                            currAsset = DataMgrTools.BuildCompany(reader);
                        }
                        
                    }
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Get(CompanyRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }
            
            return currAsset;
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
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@Company", strCompany);

                        object objTemp = cmd.ExecuteScalar();
                        if (objTemp != null) iCompanyID = Convert.ToInt32(objTemp);
                        else
                        {
                            // save new company                        
                            query = string.Format("INSERT INTO companies (name, user_limit, zone_limit, asset_limit, sms_limit, reports) " +
                                "VALUES (@Company, 0, 0, 0, 0, '')", strCompany);
                            cmd.CommandText = query;
                            cmd.Prepare();
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
                        cmd.CommandText = "INSERT INTO companies (name, user_limit, zone_limit, asset_limit, sms_limit, reports, categories, flag," +
                            "address, email, phone, reseller_id) " +
                            "VALUES (@Name,  @UserLimit, @ZoneLimit, @AssetLimit, @SmsLimit, @Reports, @Categories,  @Flag, @Address, @Email, @Phone, @ResellerID)";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@Name", currCompany.Name);
                        cmd.Parameters.AddWithValue("@UserLimit", currCompany.UserLimit);
                        cmd.Parameters.AddWithValue("@ZoneLimit", currCompany.ZoneLimit);
                        cmd.Parameters.AddWithValue("@AssetLimit", currCompany.AssetLimit);
                        cmd.Parameters.AddWithValue("@SmsLimit", currCompany.SmsLimit);
                        cmd.Parameters.AddWithValue("@Reports", currCompany.Reports);
                        cmd.Parameters.AddWithValue("@Categories", currCompany.Categories);
                        cmd.Parameters.AddWithValue("@Flag", (int)currCompany.Flag);
                        cmd.Parameters.AddWithValue("@Address", currCompany.Address);
                        cmd.Parameters.AddWithValue("@Email", currCompany.Email);
                        cmd.Parameters.AddWithValue("@Phone", currCompany.Phone);
                        cmd.Parameters.AddWithValue("@ResellerID", currCompany.ResellerID);
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
                        cmd.CommandText = "UPDATE companies SET name = @Name, address = @Address, email = @Email, phone = @Phone, user_limit = @UserLimit, zone_limit = @ZoneLimit, " +
                                            "asset_limit = @AssetLimit, sms_limit = @SmsLimit, reports = @Reports, flag = @Flag, categories = @Categories, reseller_id = @ResellerID WHERE company_id = @CompanyID";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@Name", currCompany.Name);
                        cmd.Parameters.AddWithValue("@Address", currCompany.Address);
                        cmd.Parameters.AddWithValue("@Email", currCompany.Email);
                        cmd.Parameters.AddWithValue("@Phone", currCompany.Phone);
                        cmd.Parameters.AddWithValue("@UserLimit", currCompany.UserLimit);
                        cmd.Parameters.AddWithValue("@ZoneLimit", currCompany.ZoneLimit);
                        cmd.Parameters.AddWithValue("@AssetLimit", currCompany.AssetLimit);
                        cmd.Parameters.AddWithValue("@SmsLimit", currCompany.SmsLimit);
                        cmd.Parameters.AddWithValue("@Reports", currCompany.Reports);
                        cmd.Parameters.AddWithValue("@Flag", currCompany.Flag);
                        cmd.Parameters.AddWithValue("@Categories", currCompany.Categories);
                        cmd.Parameters.AddWithValue("@ResellerID", currCompany.ResellerID);
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

        
    }
}