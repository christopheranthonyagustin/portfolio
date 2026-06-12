using FMSWebApi.Models;
using FMSWebApi.Properties;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Hosting;

namespace FMSWebApi.Repository
{
    public class MainInventoryItemRepository : IMainInventoryItemRepository
    {
        private string mConnStr = Settings.Default.DB;
        private string mProjName = "FMS-Singapore";
        public IEnumerable<MainInventoryItemInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<MainInventoryItemInfo> arrMainInventory = new List<MainInventoryItemInfo>();

            if (conn != null)
                conn.Close();

            return arrMainInventory.ToArray();
        }
        public IEnumerable<MainInventoryItemInfo> GetByCompanyID(MainInventoryItemInfo param)
        {

            List<MainInventoryItemInfo> arrMainInventory = new List<MainInventoryItemInfo>();
            MainInventoryItemInfo currMainInventory = new MainInventoryItemInfo();
            object objTemp = new object();

            string query = "SELECT * FROM main_inventory_item WHERE company_id = @CompanyID";
            if (param.ItemCategory > 0) query += " and item_category = @ItemCategory";
            if (!string.IsNullOrEmpty(param.ItemName)) query += " and item_name = @ItemName";
            if (!string.IsNullOrEmpty(param.ReferenceNo)) query += " and reference_no = @ReferenceNo";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        
                        cmd.Parameters.AddWithValue("@CompanyID", param.CompanyID);
                        cmd.Parameters.AddWithValue("@ItemCategory", param.ItemCategory);
                        cmd.Parameters.AddWithValue("@ItemName", param.ItemName);
                        cmd.Parameters.AddWithValue("@ReferenceNo", param.ReferenceNo);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currMainInventory = DataMgrTools.BuildMainInventoryItem(reader);
                                    currMainInventory.ErrorMessage = "Success";
                                    string strFill = "";
                                    currMainInventory.Image = GetImage(String.Format("main_items/{0}", currMainInventory.MainInventoryItemID), ref strFill);
                                    currMainInventory.ImageFill = strFill;
                                    arrMainInventory.Add(currMainInventory);
                                }
                            }
                            else
                            {
                                currMainInventory.MainInventoryItemID = 0;
                                currMainInventory.ItemName = param.ItemName;
                                currMainInventory.ErrorMessage = "Not Found";
                                arrMainInventory.Add(currMainInventory);
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

            return arrMainInventory;
        }
        public MainInventoryItemInfo GetByName(string itemName, int companyID)
        {
            MainInventoryItemInfo currMainInventory = new MainInventoryItemInfo();

            if (string.IsNullOrEmpty(itemName))
            {
                currMainInventory.ErrorMessage = Consts.ERR_REGIONERROR;
                return currMainInventory;
            }

            string query = string.Format("SELECT * FROM main_inventory_item WHERE item_name = @ItemName and company_id = @CompanyID");

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = query;
                        
                        cmd.Parameters.AddWithValue("@ItemName", itemName.Trim());
                        cmd.Parameters.AddWithValue("@CompanyID", companyID);
                        MySqlDataReader reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            currMainInventory = DataMgrTools.BuildMainInventoryItem(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-GetByName(MainInventoryItemRepository)", System.Diagnostics.EventLogEntryType.Error);
                }
            }
            return currMainInventory;
        }
        public MainInventoryItemInfo Get(long id)
        {
            MainInventoryItemInfo currMainInventory = new MainInventoryItemInfo();
            string query = string.Format("SELECT * FROM main_inventory_item WHERE main_inventory_item_id = {0}", id);
            
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
                            currMainInventory = DataMgrTools.BuildMainInventoryItem(reader);
                            string strFill = "";
                            currMainInventory.Image = GetImage(String.Format("main_items/{0}", currMainInventory.MainInventoryItemID), ref strFill);
                            currMainInventory.ImageFill = strFill;
                        }
                        
                    }
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Get(MainInventoryItemRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return currMainInventory;
        }
        public MainInventoryItemInfo Add(MainInventoryItemInfo currMainInventory)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO main_inventory_item (company_id, supplier_id, branch_id, timestamp, rx_time, " +
                                                          "reference_no, item_name, description, price, weight, " +
                                                          "width, height, length, volume, unit, quantity, remarks, feature_id, item_category, flag) " +
                                                                  "VALUES (@CompanyID, @SupplierID, @BranchID, @Timestamp, @RxTime, " +
                                                          "@ReferenceNo, @ItemName, @Description, @Price, @Weight, " +
                                                          "@Width, @Height, @Length, @Volume, @Unit, @Quantity, @Remarks, @FeatureID, @ItemCategory, @Flag)";
                        
                        cmd.Parameters.AddWithValue("@CompanyID", currMainInventory.CompanyID);
                        cmd.Parameters.AddWithValue("@SupplierID", currMainInventory.SupplierID);
                        cmd.Parameters.AddWithValue("@BranchID", currMainInventory.BranchID);
                        cmd.Parameters.AddWithValue("@Timestamp", currMainInventory.Timestamp);
                        cmd.Parameters.AddWithValue("@RxTime", currMainInventory.RxTime);
                        cmd.Parameters.AddWithValue("@ReferenceNo", currMainInventory.ReferenceNo);
                        cmd.Parameters.AddWithValue("@ItemName", currMainInventory.ItemName);
                        cmd.Parameters.AddWithValue("@Description", currMainInventory.Description);
                        cmd.Parameters.AddWithValue("@Price", currMainInventory.Price);
                        cmd.Parameters.AddWithValue("@Weight", currMainInventory.Weight);
                        cmd.Parameters.AddWithValue("@Width", currMainInventory.Width);
                        cmd.Parameters.AddWithValue("@Height", currMainInventory.Height);
                        cmd.Parameters.AddWithValue("@Length", currMainInventory.Length);
                        cmd.Parameters.AddWithValue("@Volume", currMainInventory.Volume);
                        cmd.Parameters.AddWithValue("@Unit", currMainInventory.Unit);
                        cmd.Parameters.AddWithValue("@Quantity", currMainInventory.Quantity);
                        cmd.Parameters.AddWithValue("@Remarks", currMainInventory.Remarks);
                        cmd.Parameters.AddWithValue("@FeatureID", currMainInventory.FeatureID);
                        cmd.Parameters.AddWithValue("@ItemCategory", currMainInventory.ItemCategory);
                        cmd.Parameters.AddWithValue("@Flag", currMainInventory.Flag);

                        cmd.ExecuteNonQuery();
                        long id = cmd.LastInsertedId;
                        currMainInventory.MainInventoryItemID = id;

                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(MainInventoryItemRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return currMainInventory;
        }
        public bool Remove(int id)
        {
            bool retVal = false;
            string query = string.Format("DELETE FROM main_inventory_item WHERE main_inventory_item_id = {0}", id);
            
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
                        conn.Close();
                    }
     

                    DeleteImage(String.Format("main_items/{0}", id));
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Remove(MainInventoryItemRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return retVal;
        }
        public bool Update(MainInventoryItemInfo currMainInventory)
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
                        cmd.CommandText = "UPDATE main_inventory_item SET company_id = @CompanyID, supplier_id = @SupplierID, branch_id = @BranchID, timestamp = @Timestamp, rx_time = @RxTime, " +
                                                                "reference_no = @ReferenceNo, item_name = @ItemName, description = @Description, price = @Price, weight = @Weight, " +
                                                                "width = @Width, height = @Height, length = @Length, volume = @Volume, unit = @Unit, quantity = @Quantity, remarks = @Remarks, feature_id = @FeatureID, item_category = @ItemCategory, flag = @Flag " +
                                                                "WHERE main_inventory_item_id = @MainInventoryItemID";
                        
                        cmd.Parameters.AddWithValue("@CompanyID", currMainInventory.CompanyID);
                        cmd.Parameters.AddWithValue("@SupplierID", currMainInventory.SupplierID);
                        cmd.Parameters.AddWithValue("@BranchID", currMainInventory.BranchID);
                        cmd.Parameters.AddWithValue("@Timestamp", currMainInventory.Timestamp);
                        cmd.Parameters.AddWithValue("@RxTime", currMainInventory.RxTime);
                        cmd.Parameters.AddWithValue("@ReferenceNo", currMainInventory.ReferenceNo);
                        cmd.Parameters.AddWithValue("@ItemName", currMainInventory.ItemName);
                        cmd.Parameters.AddWithValue("@Description", currMainInventory.Description);
                        cmd.Parameters.AddWithValue("@Price", currMainInventory.Price);
                        cmd.Parameters.AddWithValue("@Weight", currMainInventory.Weight);
                        cmd.Parameters.AddWithValue("@Width", currMainInventory.Width);
                        cmd.Parameters.AddWithValue("@Height", currMainInventory.Height);
                        cmd.Parameters.AddWithValue("@Length", currMainInventory.Length);
                        cmd.Parameters.AddWithValue("@Volume", currMainInventory.Volume);
                        cmd.Parameters.AddWithValue("@Unit", currMainInventory.Unit);
                        cmd.Parameters.AddWithValue("@Quantity", currMainInventory.Quantity);
                        cmd.Parameters.AddWithValue("@Remarks", currMainInventory.Remarks);
                        cmd.Parameters.AddWithValue("@FeatureID", currMainInventory.FeatureID);
                        cmd.Parameters.AddWithValue("@ItemCategory", currMainInventory.ItemCategory);
                        cmd.Parameters.AddWithValue("@Flag", currMainInventory.Flag);
                        cmd.Parameters.AddWithValue("@MainInventoryItemID", currMainInventory.MainInventoryItemID);  

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
                Logger.LogEvent(ex.Message + "-Update(MainInventoryItemRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }
        public bool UpdateItem(MainInventoryItemInfo currMainInventory)
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
                        cmd.CommandText = "UPDATE main_inventory_item SET quantity = @Quantity WHERE main_inventory_item_id = @MainInventoryItemID";
                        
                        cmd.Parameters.AddWithValue("@Quantity", currMainInventory.Quantity);
                        cmd.Parameters.AddWithValue("@MainInventoryItemID", currMainInventory.MainInventoryItemID);

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
                Logger.LogEvent(ex.Message + "-Update(MainInventoryItemRepository)", System.Diagnostics.EventLogEntryType.Error);
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

        public MainInventoryItemInfo GetByReferenceNo(string reference_no, long company_id)
        {
            MainInventoryItemInfo currSubItem = new MainInventoryItemInfo();

            string query = string.Format("SELECT * FROM main_inventory_item WHERE reference_no = @ReferenceNo and company_id = @CompanyID order by timestamp desc");

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = query;
                        
                        cmd.Parameters.AddWithValue("@ReferenceNo", reference_no);
                        cmd.Parameters.AddWithValue("@CompanyID", company_id);

                        MySqlDataReader reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            currSubItem = DataMgrTools.BuildMainInventoryItem(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-GetByReferenceNo(MainInventoryItemRepository)", System.Diagnostics.EventLogEntryType.Error);
                    conn.Close();
                }
            }
            return currSubItem;
        }



    }
}