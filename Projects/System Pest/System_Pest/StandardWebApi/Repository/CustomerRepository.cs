using FMSWebApi.Models;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.IO;
using System.Web.Hosting;
using System.Configuration;
using System.Web.UI.WebControls;

namespace FMSWebApi.Repository
{
    public class CustomerRepository : ICustomerRepository
    {
        private string mConnStr = "server=localhost;uid=root;pwd=@c3c0M;database=sp;max pool size=500;default command timeout=999999;";
        private string mProjName = "SP";
        public IEnumerable<CustomerInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<CustomerInfo> arrCustomers = new List<CustomerInfo>();

            try
            {
                conn.ConnectionString = mConnStr;
                conn.Open();

                cmd.CommandText = "view_customers";
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
                Logger.LogEvent(ex.Message + "-GetAll(CustomersRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            if (conn != null)
                conn.Close();

            return arrCustomers.ToArray();
        }
        public IEnumerable<CustomerInfo> ClearCustomers()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<CustomerInfo> arrCustomers = new List<CustomerInfo>();

            return arrCustomers.ToArray();
        }
        public IEnumerable<CustomerInfo> GetByCompany(CustomerInfo param)
        {

            List<CustomerInfo> arrCustomers = new List<CustomerInfo>();
            CustomerInfo currCustomer = new CustomerInfo();
            object objTemp = new object();

            //string query = "";

            string query = "SELECT * FROM view_customers WHERE company_id = @CompanyID";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@CompanyID", param.CompanyID);

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
                                    arrCustomers.Add(currCustomer);
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(GetByCusCustomerID)", System.Diagnostics.EventLogEntryType.Error);

                }


            }

            return arrCustomers;
        }
        public IEnumerable<CustomerInfo> GetByCompanyEx(CustomerInfo param)
        {

            List<CustomerInfo> arrCustomers = new List<CustomerInfo>();
            CustomerInfo currCustomer = new CustomerInfo();
            object objTemp = new object();

            string query = "SELECT * FROM view_customers WHERE company_id = @CompanyID";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@CompanyID", param.CompanyID);

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
                                    arrCustomers.Add(currCustomer);
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(GetByCusCompanyIDEx)", System.Diagnostics.EventLogEntryType.Error);

                }


            }

            return arrCustomers;
        }
        public CustomerInfo GetByName(string memberName)
        {
            CustomerInfo currCustomer = new CustomerInfo();

            if (string.IsNullOrEmpty(memberName))
            {
                currCustomer.ErrorMessage = Consts.ERR_CUSTOMERERROR;
                return currCustomer;
            }

            string query = string.Format("SELECT * FROM view_customers WHERE member_name = @Name");

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
                        cmd.Parameters.AddWithValue("@Name", memberName.Trim());
                        MySqlDataReader reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            currCustomer = DataMgrTools.BuildCustomer(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-GetByName(MemberRepository)", System.Diagnostics.EventLogEntryType.Error);
                    conn.Close();
                }
            }
            return currCustomer;
        }
        public CustomerInfo Get(int id)
        {
            CustomerInfo currCustomer = new CustomerInfo();
            string query = string.Format("SELECT * FROM view_customers WHERE member_id = {0}", id);
            
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
                        }
                        
                    }
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Get(MemberRepository)", System.Diagnostics.EventLogEntryType.Error);                
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
                        cmd.CommandText = "INSERT INTO customers (cus_name, email, address, postal, unit, " +
                                             ", phone, remarks, cus_company, company_id) " +
                                            "VALUES (@Name, @Email, @Address, @Postal, @Unit, " +
                                            "@Phone, @Remarks, @CusCompany, @CompanyID)";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@Name", currCustomer.Name);
                        cmd.Parameters.AddWithValue("@Email", currCustomer.Email);
                        cmd.Parameters.AddWithValue("@Address", currCustomer.Address);
                        cmd.Parameters.AddWithValue("@Postal", currCustomer.Postal);
                        cmd.Parameters.AddWithValue("@Unit", currCustomer.Unit);
                        cmd.Parameters.AddWithValue("@Phone", currCustomer.Phone);
                        cmd.Parameters.AddWithValue("@Remarks", currCustomer.Remarks);
                        cmd.Parameters.AddWithValue("@CusCompany", currCustomer.CusCompany);
                        cmd.Parameters.AddWithValue("@CompanyID", currCustomer.CompanyID);
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(CustomersRepository)", System.Diagnostics.EventLogEntryType.Error);                
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
                Logger.LogEvent(ex.Message + "-Remove(CustomersRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            DeleteImage(String.Format("customers/{0}", cusID));


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
                        cmd.CommandText = "UPDATE customers SET cus_name = @Name, email = @Email, address = @Address, postal = @Postal, unit = @Unit, " +
                                            "phone = @Phone, remarks = @Remarks, cus_company = @CusCompany, company_id = @CompanyID WHERE cus_id = @CustomerID";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@Name", currCustomer.Name);
                        cmd.Parameters.AddWithValue("@Email", currCustomer.Email);
                        cmd.Parameters.AddWithValue("@Address", currCustomer.Address);
                        cmd.Parameters.AddWithValue("@Postal", currCustomer.Postal);
                        cmd.Parameters.AddWithValue("@Unit", currCustomer.Unit);
                        cmd.Parameters.AddWithValue("@Phone", currCustomer.Phone);
                        cmd.Parameters.AddWithValue("@Remarks", currCustomer.Remarks);
                        cmd.Parameters.AddWithValue("@CusCompany", currCustomer.CusCompany);
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
                Logger.LogEvent(ex.Message + "-Update(MemberRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
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

        /// <summary>
        /// deletes image file
        /// </summary>
        /// <param name="strName"></param>
        public void DeleteImage(string strName)
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
                Logger.LogEvent(ex.Message + "-(Delete Image)", System.Diagnostics.EventLogEntryType.Error);      
            }
        }

        public IEnumerable<CustomerInfo> GetByMember(CustomerInfo param)
        {

            List<CustomerInfo> arrCustomers = new List<CustomerInfo>();
            CustomerInfo currCustomer = new CustomerInfo();
            object objTemp = new object();

            string query = "SELECT * FROM view_customers WHERE member_name = @Name";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@Name", param.Name);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currCustomer = DataMgrTools.BuildCustomer(reader);
                                    arrCustomers.Add(currCustomer);
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(GetByMember)", System.Diagnostics.EventLogEntryType.Error);

                }


            }

            return arrCustomers;
        }
    }
}