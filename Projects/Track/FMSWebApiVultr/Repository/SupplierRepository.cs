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
    public class SupplierRepository : ISupplierRepository
    {
        private string mConnStr = Settings.Default.DB;
        private string mProjName = "FMS-Singapore";
        public IEnumerable<SupplierInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<SupplierInfo> arrSuppliers = new List<SupplierInfo>();

            try
            {
                conn.ConnectionString = mConnStr;
                conn.Open();

                cmd.CommandText = "view_suppliers WHERE supplier_id > 0";
                cmd.Connection = conn;
                cmd.CommandType = CommandType.TableDirect;
                MySqlDataReader reader = cmd.ExecuteReader();


                if ((reader != null) && (reader.HasRows))
                {
                    while (reader.Read())
                    {
                        SupplierInfo currSupplier = DataMgrTools.BuildSupplier(reader);
                        string strFill = "";
                        currSupplier.Image = GetImage(String.Format("suppliers/{0}", currSupplier.SupplierID), ref strFill);
                        currSupplier.ImageFill = strFill;
                        arrSuppliers.Add(currSupplier);
                    }
                }
                conn.Close();
            }
            catch (MySqlException ex)
            {
                Logger.LogEvent(ex.Message + "-GetAll(SupplierRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            if (conn != null)
                conn.Close();

            return arrSuppliers.ToArray();
        }

        public IEnumerable<SupplierInfo> GetByCompanyID(SupplierInfo param)
        {

            List<SupplierInfo> arrSuppliers = new List<SupplierInfo>();
            SupplierInfo currSupplier = new SupplierInfo();

            string query = "SELECT * FROM view_suppliers WHERE company_id = @CompanyID";


            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        

                        cmd.Parameters.AddWithValue("@CompanyID", param.CompanyID);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currSupplier = DataMgrTools.BuildSupplier(reader);
                                    string strFill = "";
                                    currSupplier.Image = GetImage(String.Format("suppliers/{0}", currSupplier.SupplierID), ref strFill);
                                    currSupplier.ImageFill = strFill;
                                    arrSuppliers.Add(currSupplier);
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

            return arrSuppliers;
        }

        public SupplierInfo GetByName(string suppName)
        {
            SupplierInfo currCoy = new SupplierInfo();

            if (string.IsNullOrEmpty(suppName))
            {
                currCoy.ErrorMessage = Consts.ERR_SUPPLIERERROR;
                return currCoy;
            }

            string query = string.Format("SELECT * FROM view_suppliers WHERE name = @Supplier");

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = query;
                        
                        cmd.Parameters.AddWithValue("@Supplier", suppName.Trim());
                        MySqlDataReader reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            currCoy = DataMgrTools.BuildSupplier(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-GetByName(SupplierRepository)", System.Diagnostics.EventLogEntryType.Error);
                }
            }
            return currCoy;
        }

        public SupplierInfo Get(int id)
        {
            SupplierInfo currSupplier = new SupplierInfo();
            string query = string.Format("SELECT * FROM view_suppliers WHERE supplier_id = {0}", id);
            
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
                            currSupplier = DataMgrTools.BuildSupplier(reader);
                            string strFill = "";
                            currSupplier.Image = GetImage(String.Format("suppliers/{0}", currSupplier.SupplierID), ref strFill);
                            currSupplier.ImageFill = strFill;
                        }
                        
                    }
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Get(SupplierRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }
            
            return currSupplier;
        }


        public SupplierInfo Add(SupplierInfo currSupplier)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO suppliers (name, address, email, phone, company_id) " +
                                                        "VALUES (@Name, @Address, @Email, @Phone, @CompanyID)";
                        
                        cmd.Parameters.AddWithValue("@Name", currSupplier.Name);
                        cmd.Parameters.AddWithValue("@Address", currSupplier.Address);
                        cmd.Parameters.AddWithValue("@Email", currSupplier.Email);
                        cmd.Parameters.AddWithValue("@Phone", currSupplier.Phone);
                        cmd.Parameters.AddWithValue("@CompanyID", currSupplier.CompanyID);
                        cmd.ExecuteNonQuery();
                        long id = cmd.LastInsertedId;
                        currSupplier.SupplierID = id;

                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(SupplierRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return currSupplier;
        }

        public bool Remove(int SupplierID)
        {
            bool retVal = false;
            string query = string.Format("DELETE FROM suppliers WHERE supplier_id = {0}", SupplierID);
            
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
                Logger.LogEvent(ex.Message + "-Remove(SupplierRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return retVal;
        }

        public bool Update(SupplierInfo currSupplier)
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
                        cmd.CommandText = "UPDATE suppliers SET name = @Name, address = @Address, email = @Email, phone = @Phone, company_id = @CompanyID WHERE supplier_id = @SupplierID";
                        
                        cmd.Parameters.AddWithValue("@Name", currSupplier.Name);
                        cmd.Parameters.AddWithValue("@Address", currSupplier.Address);
                        cmd.Parameters.AddWithValue("@Email", currSupplier.Email);
                        cmd.Parameters.AddWithValue("@Phone", currSupplier.Phone);
                        cmd.Parameters.AddWithValue("@CompanyID", currSupplier.CompanyID);
                        cmd.Parameters.AddWithValue("@SupplierID", currSupplier.SupplierID);
                        
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
                Logger.LogEvent(ex.Message + "-Update(SupplierRepository)", System.Diagnostics.EventLogEntryType.Error);
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