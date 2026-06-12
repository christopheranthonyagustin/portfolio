using FMSWebApi.Models;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using FMSWebApi.Properties;
using System.Web.Hosting;
using System.Configuration;
using System.IO;

namespace FMSWebApi.Repository
{
    public class MainInventoryBranchRepository : IMainInventoryBranchRepository
    {
        private string mConnStr = Settings.Default.DB;
        private string mProjName = "FMS-Singapore";
        public IEnumerable<MainInventoryBranchInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<MainInventoryBranchInfo> arrBranches = new List<MainInventoryBranchInfo>();


            if (conn != null)
                conn.Close();

            return arrBranches.ToArray();
        }

        public IEnumerable<MainInventoryBranchInfo> GetByCompanyID(MainInventoryBranchInfo param)
        {

            List<MainInventoryBranchInfo> arrBranches = new List<MainInventoryBranchInfo>();
            MainInventoryBranchInfo currBranch = new MainInventoryBranchInfo();
            object objTemp = new object();

            string query = "SELECT * FROM main_inventory_branch WHERE company_id = @CompanyID";

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
                                    currBranch = DataMgrTools.BuildInventoryBranch(reader);
                                    string strFill = "";
                                    currBranch.Image = GetImage(String.Format("main_branches/{0}", currBranch.BranchID), ref strFill);
                                    currBranch.ImageFill = strFill;
                                    arrBranches.Add(currBranch);
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(GetByID)", System.Diagnostics.EventLogEntryType.Error);

                }


            }

            return arrBranches;
        }

        public MainInventoryBranchInfo Get(int id)
        {
            MainInventoryBranchInfo currBranch = new MainInventoryBranchInfo();
            string query = string.Format("SELECT * FROM main_inventory_branch WHERE main_inventory_branch_id = {0}", id);

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        MySqlDataReader reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            currBranch = DataMgrTools.BuildInventoryBranch(reader);
                            string strFill = "";
                            currBranch.Image = GetImage(String.Format("main_branches/{0}", currBranch.BranchID), ref strFill);
                            currBranch.ImageFill = strFill;
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(MainInventoryBranchRepository)", System.Diagnostics.EventLogEntryType.Error);
                }
            }
            return currBranch;
        }

        public MainInventoryBranchInfo Add(MainInventoryBranchInfo currBranch)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO main_inventory_branch (name, address, email, phone, company_id) " +
                                                                    "VALUES (@Name,  @Address, @Email, @Phone, @CompanyID)";
                        
                        cmd.Parameters.AddWithValue("@Name", currBranch.Name);
                        cmd.Parameters.AddWithValue("@Address", currBranch.Address);
                        cmd.Parameters.AddWithValue("@Email", currBranch.Email);
                        cmd.Parameters.AddWithValue("@Phone", currBranch.Phone);
                        cmd.Parameters.AddWithValue("@CompanyID", currBranch.CompanyID);
                        cmd.ExecuteNonQuery();

                        long id = cmd.LastInsertedId;
                        currBranch.BranchID = id;
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(MainInventoryBranchRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return currBranch;
        }

        public bool Remove(int id)
        {
            bool retVal = false;
            string query = string.Format("DELETE FROM main_inventory_branch WHERE main_inventory_branch_id = {0}", id);

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        if (cmd.ExecuteNonQuery() == 1)
                            retVal = true;
                        else
                            retVal = false;
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Delete(MainInventoryBranchRepository)", System.Diagnostics.EventLogEntryType.Error);
                }
            }

            return retVal;
        }

        public bool Update(MainInventoryBranchInfo currBranch)
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
                        cmd.CommandText = "UPDATE main_inventory_branch SET name = @Name, address = @Address, email = @Email, phone = @Phone, company_id = @CompanyID " +
                                                 "WHERE main_inventory_branch_id = @BranchID";
                        
                        cmd.Parameters.AddWithValue("@Name", currBranch.Name);
                        cmd.Parameters.AddWithValue("@Address", currBranch.Address);
                        cmd.Parameters.AddWithValue("@Email", currBranch.Email);
                        cmd.Parameters.AddWithValue("@Phone", currBranch.Phone);
                        cmd.Parameters.AddWithValue("@CompanyID", currBranch.CompanyID);
                        cmd.Parameters.AddWithValue("@BranchID", currBranch.BranchID);

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
                Logger.LogEvent(ex.Message + "-Update(MainInventoryBranchRepository)", System.Diagnostics.EventLogEntryType.Error);
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