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
    public class SubSupplierRepository : ISubSupplierRepository
    {
        private string mConnStr = Settings.Default.DB;
        private string mProjName = "FMS-Singapore";
        public IEnumerable<SubSupplierInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<SubSupplierInfo> arrSuppliers = new List<SubSupplierInfo>();

            try
            {
                conn.ConnectionString = mConnStr;
                conn.Open();

                cmd.CommandText = "view_subsuppliers WHERE supplier_id > 0";
                cmd.Connection = conn;
                cmd.CommandType = CommandType.TableDirect;
                MySqlDataReader reader = cmd.ExecuteReader();


                if ((reader != null) && (reader.HasRows))
                {
                    while (reader.Read())
                    {
                        SubSupplierInfo currSupplier = DataMgrTools.BuildSubSupplier(reader);
                        string strFill = "";
                        currSupplier.Image = GetImage(String.Format("sub_suppliers/{0}", currSupplier.SupplierID), ref strFill);
                        currSupplier.ImageFill = strFill;
                        arrSuppliers.Add(currSupplier);
                    }
                }
                conn.Close();
            }
            catch (MySqlException ex)
            {
                Logger.LogEvent(ex.Message + "-GetAll(SubSupplierRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            if (conn != null)
                conn.Close();

            return arrSuppliers.ToArray();
        }

        public IEnumerable<SubSupplierInfo> GetByCompanyID(SubSupplierInfo param)
        {

            List<SubSupplierInfo> arrSuppliers = new List<SubSupplierInfo>();
            SubSupplierInfo currSupplier = new SubSupplierInfo();

            string query = "SELECT * FROM view_subsuppliers WHERE company_id = @CompanyID";


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
                                    currSupplier = DataMgrTools.BuildSubSupplier(reader);
                                    string strFill = "";
                                    currSupplier.Image = GetImage(String.Format("sub_suppliers/{0}", currSupplier.SupplierID), ref strFill);
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

        public SubSupplierInfo GetByName(string suppName)
        {
            SubSupplierInfo currCoy = new SubSupplierInfo();

            if (string.IsNullOrEmpty(suppName))
            {
                currCoy.ErrorMessage = Consts.ERR_SUPPLIERERROR;
                return currCoy;
            }

            string query = string.Format("SELECT * FROM view_subsuppliers WHERE name = @Supplier");

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
                            currCoy = DataMgrTools.BuildSubSupplier(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-GetByName(SubSupplierRepository)", System.Diagnostics.EventLogEntryType.Error);
                }
            }
            return currCoy;
        }

        public SubSupplierInfo Get(int id)
        {
            SubSupplierInfo currSupplier = new SubSupplierInfo();
            string query = string.Format("SELECT * FROM view_subsuppliers WHERE supplier_id = {0}", id);
            
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
                            currSupplier = DataMgrTools.BuildSubSupplier(reader);
                            string strFill = "";
                            currSupplier.Image = GetImage(String.Format("sub_suppliers/{0}", currSupplier.SupplierID), ref strFill);
                            currSupplier.ImageFill = strFill;
                        }
                        
                    }
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Get(SubSupplierRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }
            
            return currSupplier;
        }


        public SubSupplierInfo Add(SubSupplierInfo currSupplier)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO subsuppliers (name, address, email, phone, company_id) " +
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
                Logger.LogEvent(ex.Message + "-Add(SubSupplierRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return currSupplier;
        }

        public bool Remove(int SupplierID)
        {
            bool retVal = false;
            string query = string.Format("DELETE FROM subsuppliers WHERE supplier_id = {0}", SupplierID);
            
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
                Logger.LogEvent(ex.Message + "-Remove(SubSupplierRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return retVal;
        }

        public bool Update(SubSupplierInfo currSupplier)
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
                        cmd.CommandText = "UPDATE subsuppliers SET name = @Name, address = @Address, email = @Email, phone = @Phone, company_id = @CompanyID WHERE supplier_id = @SupplierID";
                        
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
                Logger.LogEvent(ex.Message + "-Update(SubSupplierRepository)", System.Diagnostics.EventLogEntryType.Error);
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