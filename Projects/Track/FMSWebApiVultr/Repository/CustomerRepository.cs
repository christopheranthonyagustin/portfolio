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
    public class CustomerRepository : ICustomerRepository
    {
        private string mConnStr = Settings.Default.DB;
        private string mProjName = "FMS-Singapore";
        public IEnumerable<CustomerInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<CustomerInfo> arrCustomers = new List<CustomerInfo>();

            try
            {
                conn.ConnectionString = mConnStr;
                conn.Open();

                cmd.CommandText = "customers WHERE cus_id != 0";
                cmd.Connection = conn;
                cmd.CommandType = CommandType.TableDirect;
                MySqlDataReader reader = cmd.ExecuteReader();

                //Console.WriteLine(String.Format("Total Data: {0}", dbRdr.FieldCount));

                if ((reader != null) && (reader.HasRows))
                {
                    while (reader.Read())
                    {
                        CustomerInfo currCustomer = DataMgrTools.BuildCustomer(reader);
                        string strFill = "";
                        currCustomer.Image = GetImage(String.Format("customers/{0}", currCustomer.CustomerID), ref strFill);
                        currCustomer.ImageFill = strFill;
                        arrCustomers.Add(currCustomer);
                    }
                }
                conn.Close();
            }
            catch (MySqlException ex)
            {
                Logger.LogEvent(ex.Message + "-GetAll(CustomerRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            if (conn != null)
                conn.Close();

            return arrCustomers.ToArray();
        }

        public IEnumerable<CustomerInfo> GetByCompany(CustomerInfo param)
        {

            List<CustomerInfo> arrCustomer = new List<CustomerInfo>();
            CustomerInfo currCustomer = new CustomerInfo();

            string query = "SELECT * FROM customers WHERE company_id = @CompanyID";

            if (!string.IsNullOrEmpty(param.Name)) query += " and name = @Name";


            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        

                        cmd.Parameters.AddWithValue("@CompanyID", param.CompanyID);
                        cmd.Parameters.AddWithValue("@Name", param.Name);
                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currCustomer = DataMgrTools.BuildCustomer(reader);
                                    string strFill = "";
                                    currCustomer.Image = GetImage(String.Format("customers/{0}", currCustomer.CustomerID), ref strFill);
                                    currCustomer.ImageFill = strFill;
                                    arrCustomer.Add(currCustomer);
                                }
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent("Customers GetCompanyByID: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                    conn.Close();
                }
            }

            return arrCustomer;
        }

        public CustomerInfo GetByName(string cusName, int companyID)
        {
            CustomerInfo currCus = new CustomerInfo();


            string query = string.Format("SELECT * FROM customers WHERE name = @Cus and company_id = @CompanyID");

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = query;
                        
                        cmd.Parameters.AddWithValue("@Cus", cusName.Trim());
                        cmd.Parameters.AddWithValue("@CompanyID", companyID);
                        MySqlDataReader reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            currCus = DataMgrTools.BuildCustomer(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-GetByName(CustomerRepository)", System.Diagnostics.EventLogEntryType.Error);
                    conn.Close();
                }
            }
            return currCus;
        }

        public CustomerInfo Get(int id)
        {
            CustomerInfo currCustomer = new CustomerInfo();
            string query = string.Format("SELECT * FROM customers WHERE cus_id = {0}", id);
            
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
                            currCustomer = DataMgrTools.BuildCustomer(reader);
                            string strFill = "";
                            currCustomer.Image = GetImage(String.Format("customers/{0}", currCustomer.CustomerID), ref strFill);
                            currCustomer.ImageFill = strFill;
                        }
                        
                    }
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Get(CustomerRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }
            
            return currCustomer;
        }


        public CustomerInfo Add(CustomerInfo currCustomer)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO customers (name, billing_address, billing_unit, billing_building, billing_postal, billing_phone, billing_mobile, billing_email, shipping_address, shipping_unit, shipping_building, shipping_postal, shipping_phone, shipping_mobile, shipping_email, website, category, company_id) " +
                                                        "VALUES (@Name, @BillingAddress, @BillingUnit, @BillingBuilding, @BillingPostal, @BillingPhone, @BillingMobile, @BillingEmail, @ShippingAddress, @ShippingUnit, @ShippingBuilding, @ShippingPostal, @ShippingPhone, @ShippingMobile, @ShippingEmail, @Website, @Category, @CompanyID)";
                        
                        cmd.Parameters.AddWithValue("@Name", currCustomer.Name);
                        cmd.Parameters.AddWithValue("@BillingAddress", currCustomer.BillingAddress);
                        cmd.Parameters.AddWithValue("@BillingUnit", currCustomer.BillingUnit);
                        cmd.Parameters.AddWithValue("@BillingBuilding", currCustomer.BillingBuilding);
                        cmd.Parameters.AddWithValue("@BillingPostal", currCustomer.BillingPostal);
                        cmd.Parameters.AddWithValue("@BillingPhone", currCustomer.BillingPhone);
                        cmd.Parameters.AddWithValue("@BillingMobile", currCustomer.BillingMobile);
                        cmd.Parameters.AddWithValue("@BillingEmail", currCustomer.BillingEmail);
                        cmd.Parameters.AddWithValue("@ShippingAddress", currCustomer.ShippingAddress);
                        cmd.Parameters.AddWithValue("@ShippingUnit", currCustomer.ShippingUnit);
                        cmd.Parameters.AddWithValue("@ShippingBuilding", currCustomer.ShippingBuilding);
                        cmd.Parameters.AddWithValue("@ShippingPostal", currCustomer.ShippingPostal);
                        cmd.Parameters.AddWithValue("@ShippingPhone", currCustomer.ShippingPhone);
                        cmd.Parameters.AddWithValue("@ShippingMobile", currCustomer.ShippingMobile);
                        cmd.Parameters.AddWithValue("@ShippingEmail", currCustomer.ShippingEmail);
                        cmd.Parameters.AddWithValue("@Website", currCustomer.Website);
                        cmd.Parameters.AddWithValue("@Category", currCustomer.Category);
                        cmd.Parameters.AddWithValue("@CompanyID", currCustomer.CompanyID);

                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(CustomerRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return currCustomer;
        }

        public bool Remove(int cusID)
        {
            bool retVal = false;
            string query = string.Format("DELETE FROM customers WHERE cus_id = {0}", cusID);
            
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
                Logger.LogEvent(ex.Message + "-Remove(CustomerRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return retVal;
        }

        public bool Update(CustomerInfo currCustomer)
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
                        cmd.CommandText = "UPDATE customers SET name = @Name, billing_address = @BillingAddress, billing_unit = @BillingUnit, billing_building = @BillingBuilding, billing_postal = @BillingPostal, billing_phone = @BillingPhone, billing_mobile = @BillingMobile, billing_email = @BillingEmail, " +
                                                                            "shipping_address = @ShippingAddress, shipping_unit = @ShippingUnit, shipping_building = @ShippingBuilding, shipping_postal = @ShippingPostal, shipping_phone = @ShippingPhone, shipping_mobile = @ShippingMobile, shipping_email = @ShippingEmail, " + 
                                                                            "website = @Website, category = @Category, company_id = @CompanyID WHERE cus_id = @CustomerID";
                        
                        cmd.Parameters.AddWithValue("@Name", currCustomer.Name);
                        cmd.Parameters.AddWithValue("@BillingAddress", currCustomer.BillingAddress);
                        cmd.Parameters.AddWithValue("@BillingUnit", currCustomer.BillingUnit);
                        cmd.Parameters.AddWithValue("@BillingBuilding", currCustomer.BillingBuilding);
                        cmd.Parameters.AddWithValue("@BillingPostal", currCustomer.BillingPostal);
                        cmd.Parameters.AddWithValue("@BillingPhone", currCustomer.BillingPhone);
                        cmd.Parameters.AddWithValue("@BillingMobile", currCustomer.BillingMobile);
                        cmd.Parameters.AddWithValue("@BillingEmail", currCustomer.BillingEmail);
                        cmd.Parameters.AddWithValue("@ShippingAddress", currCustomer.ShippingAddress);
                        cmd.Parameters.AddWithValue("@ShippingUnit", currCustomer.ShippingUnit);
                        cmd.Parameters.AddWithValue("@ShippingBuilding", currCustomer.ShippingBuilding);
                        cmd.Parameters.AddWithValue("@ShippingPostal", currCustomer.ShippingPostal);
                        cmd.Parameters.AddWithValue("@ShippingPhone", currCustomer.ShippingPhone);
                        cmd.Parameters.AddWithValue("@ShippingMobile", currCustomer.ShippingMobile);
                        cmd.Parameters.AddWithValue("@ShippingEmail", currCustomer.ShippingEmail);
                        cmd.Parameters.AddWithValue("@Website", currCustomer.Website);
                        cmd.Parameters.AddWithValue("@Category", currCustomer.Category);
                        cmd.Parameters.AddWithValue("@CompanyID", currCustomer.CompanyID);
                        cmd.Parameters.AddWithValue("@CustomerID", currCustomer.CustomerID);
                        
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
                Logger.LogEvent(ex.Message + "-Update(CustomerRepository)", System.Diagnostics.EventLogEntryType.Error);
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