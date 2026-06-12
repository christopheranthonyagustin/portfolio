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
using FMSWebApi.Properties;

namespace FMSWebApi.Repository
{
    public class InventoryRepository : IInventoryRepository
    {
        private string mConnStr = "server=localhost;uid=root;pwd=@c3c0M;database=sp;Charset=utf8;max pool size=500;";
        private string mProjName = "SP";
        public IEnumerable<InventoryInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<InventoryInfo> arrInventory = new List<InventoryInfo>();

            try
            {
                conn.ConnectionString = mConnStr;
                conn.Open();

                cmd.CommandText = "inventory";
                cmd.Connection = conn;
                cmd.CommandType = CommandType.TableDirect;
                MySqlDataReader reader = cmd.ExecuteReader();

                //Console.WriteLine(String.Format("Total Data: {0}", dbRdr.FieldCount));

                if ((reader != null) && (reader.HasRows))
                {
                    while (reader.Read())
                    {
                        InventoryInfo currInventory = DataMgrTools.BuildInventory(reader);
                        string strFill = "";
                        currInventory.Image = GetImage(String.Format("inventory/{0}", currInventory.InventoryID), ref strFill);
                        currInventory.ImageFill = strFill;
                        arrInventory.Add(currInventory);
                    }
                }
                conn.Close();
            }
            catch (MySqlException ex)
            {
                Logger.LogEvent(mProjName, "GetAll Inventory: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }


            if (conn != null)
                conn.Close();

            return arrInventory.ToArray();
        }
        public IEnumerable<InventoryInfo> ClearInventory()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<InventoryInfo> arrInventory = new List<InventoryInfo>();

            return arrInventory.ToArray();
        }
        public IEnumerable<InventoryInfo> GetByCompany(InventoryInfo param)
        {
            List<InventoryInfo> arrInventory = new List<InventoryInfo>();
            InventoryInfo currInventory = new InventoryInfo();
            object objTemp = new object();

            string query = "SELECT * FROM inventory WHERE company_id = @CompanyID";
            if (!string.IsNullOrEmpty(param.Reference)) query += " and reference = @Reference";
  
            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@CompanyID", param.CompanyID);
                        if (!string.IsNullOrEmpty(param.Reference)) cmd.Parameters.AddWithValue("@Reference", param.Reference);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currInventory = DataMgrTools.BuildInventory(reader);
                                    string strFill = "";
                                    currInventory.Image = GetImage(String.Format("inventory/{0}", currInventory.InventoryID), ref strFill);
                                    currInventory.ImageFill = strFill;
                                    arrInventory.Add(currInventory);
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(ByCompany)", System.Diagnostics.EventLogEntryType.Error);

                }
            }

            return arrInventory;
        }
        public InventoryInfo Get(int inventoryID)
        {
            InventoryInfo currInventory = new InventoryInfo();
            string query = string.Format("SELECT * FROM inventory WHERE inventory_id = {0}", inventoryID);

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
                            currInventory = DataMgrTools.BuildInventory(reader);
                            string strFill = "";
                            currInventory.Image = GetImage(String.Format("inventory/{0}", currInventory.InventoryID), ref strFill);
                            currInventory.ImageFill = strFill;
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(mProjName, "Get: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                    conn.Close();
                }
            }
            return currInventory;
        }
        public IEnumerable<InventoryInfo> GetByInventory(InventoryInfo param)
        {

            List<InventoryInfo> arrInventory = new List<InventoryInfo>();
            InventoryInfo currInventory = new InventoryInfo();
            object objTemp = new object();

            string query = "SELECT * FROM inventory WHERE name = @Name and company_id = @CompanyID";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@Name", param.Name);
                        cmd.Parameters.AddWithValue("@CompanyID", param.CompanyID);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currInventory = DataMgrTools.BuildInventory(reader);
                                    string strFill = "";
                                    currInventory.Image = GetImage(String.Format("inventory/{0}", currInventory.InventoryID), ref strFill);
                                    currInventory.ImageFill = strFill;
                                    arrInventory.Add(currInventory);
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(GetByInventory)", System.Diagnostics.EventLogEntryType.Error);

                }


            }

            return arrInventory;
        }
        public InventoryInfo Add(InventoryInfo currInventory)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO inventory (name, reference, quantity, unit, price, company_id, remarks) " +
                                                    "VALUES (@Name, @Reference, @Quantity, @Unit, @Price, @CompanyID, Remarks)";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@Name", currInventory.Name);
                        cmd.Parameters.AddWithValue("@Reference", currInventory.Reference);
                        cmd.Parameters.AddWithValue("@Quantity", currInventory.Quantity);
                        cmd.Parameters.AddWithValue("@Unit", currInventory.Unit);
                        cmd.Parameters.AddWithValue("@Price", currInventory.Price);
                        cmd.Parameters.AddWithValue("@CompanyID", currInventory.CompanyID);
                        cmd.Parameters.AddWithValue("@Remarks", currInventory.Remarks);
                        cmd.ExecuteNonQuery();

                        long id = cmd.LastInsertedId;
                        currInventory.InventoryID = id;

                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(InventoryRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return currInventory;
        }
        public bool Remove(int inventoryID)
        {
            bool retVal = false;
            string query = string.Format("DELETE FROM inventory WHERE inventory_id = {0}", inventoryID);

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
                Logger.LogEvent(ex.Message + "-Remove(InventoryRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            DeleteImage(String.Format("inventory/{0}", inventoryID));

            return retVal;
        }
        public bool Update(InventoryInfo currInventory)
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
                        cmd.CommandText = "UPDATE inventory SET name = @Name, reference = @Reference, quantity = @Quantity, unit = @Unit, price = @Price, company_id = @CompanyID, remarks = @Remarks " +
                                          "WHERE inventory_id = @InventoryID";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@Name", currInventory.Name);
                        cmd.Parameters.AddWithValue("@Reference", currInventory.Reference);
                        cmd.Parameters.AddWithValue("@Quantity", currInventory.Quantity);
                        cmd.Parameters.AddWithValue("@Unit", currInventory.Unit);
                        cmd.Parameters.AddWithValue("@Price", currInventory.Price);
                        cmd.Parameters.AddWithValue("@CompanyID", currInventory.CompanyID);
                        cmd.Parameters.AddWithValue("@Remarks", currInventory.Remarks);
                        cmd.Parameters.AddWithValue("@InventoryID", currInventory.InventoryID);

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
                Logger.LogEvent(ex.Message + "-Update(InventoryRepository)", System.Diagnostics.EventLogEntryType.Error);
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
                Logger.LogEvent("Get Image: ", ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }

            // image file not found
            strFill = "None";
            return strName;
        }

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


    }
}