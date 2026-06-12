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
    public class SubInventoryItemRepository : ISubInventoryItemRepository
    {
        private string mConnStr = Settings.Default.DB;
        private string mProjName = "FMS-Singapore";
        public IEnumerable<SubInventoryItemInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<SubInventoryItemInfo> arrSubInventory = new List<SubInventoryItemInfo>();

            if (conn != null)
                conn.Close();

            return arrSubInventory.ToArray();
        }
        public IEnumerable<SubInventoryItemInfo> GetByCompanyID(SubInventoryItemInfo param)
        {

            List<SubInventoryItemInfo> arrSubInventory = new List<SubInventoryItemInfo>();
            SubInventoryItemInfo currSubInventory = new SubInventoryItemInfo();
            object objTemp = new object();

            string query = "SELECT * FROM sub_inventory_item WHERE company_id = @CompanyID";
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
                                    currSubInventory = DataMgrTools.BuildSubInventoryItem(reader);
                                    string strFill = "";
                                    currSubInventory.Image = GetImage(String.Format("sub_items/{0}", currSubInventory.SubInventoryItemID), ref strFill);
                                    currSubInventory.ImageFill = strFill;
                                    arrSubInventory.Add(currSubInventory);
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

            return arrSubInventory;
        }

        public SubInventoryItemInfo GetByReferenceNo(string reference_no, long company_id)
        {
            SubInventoryItemInfo currSubItem = new SubInventoryItemInfo();

            string query = string.Format("SELECT * FROM sub_inventory_item WHERE reference_no = @ReferenceNo and company_id = @CompanyID order by timestamp desc");

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
                            currSubItem = DataMgrTools.BuildSubInventoryItem(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-GetByReferenceNo(SubInventoryItemRepository)", System.Diagnostics.EventLogEntryType.Error);
                    conn.Close();
                }
            }
            return currSubItem;
        }


        public SubInventoryItemInfo Get(long id)
        {
            SubInventoryItemInfo currSubInventory = new SubInventoryItemInfo();
            string query = string.Format("SELECT * FROM sub_inventory_item WHERE sub_inventory_item_id = {0}", id);
            
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
                            currSubInventory = DataMgrTools.BuildSubInventoryItem(reader);
                            string strFill = "";
                            currSubInventory.Image = GetImage(String.Format("sub_items/{0}", currSubInventory.SubInventoryItemID), ref strFill);
                            currSubInventory.ImageFill = strFill;
                        }
                        
                    }
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Get(SubInventoryItemRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return currSubInventory;
        }


        public SubInventoryItemInfo Add(SubInventoryItemInfo currSubInventory)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO sub_inventory_item (company_id, supplier_id, branch_id, timestamp, rx_time, " +
                                                          "reference_no, item_name, description, price, weight, " +
                                                          "width, height, length, volume, unit, quantity, remarks, feature_id, item_category, flag) " +
                                                                  "VALUES (@CompanyID, @SupplierID, @BranchID, @Timestamp, @RxTime, " +
                                                          "@ReferenceNo, @ItemName, @Description, @Price, @Weight, " +
                                                          "@Width, @Height, @Length, @Volume, @Unit, @Quantity, @Remarks, @FeatureID, @ItemCategory, @Flag)";
                        
                        cmd.Parameters.AddWithValue("@CompanyID", currSubInventory.CompanyID);
                        cmd.Parameters.AddWithValue("@SupplierID", currSubInventory.SupplierID);
                        cmd.Parameters.AddWithValue("@BranchID", currSubInventory.BranchID);
                        cmd.Parameters.AddWithValue("@Timestamp", currSubInventory.Timestamp);
                        cmd.Parameters.AddWithValue("@RxTime", currSubInventory.RxTime);
                        cmd.Parameters.AddWithValue("@ReferenceNo", currSubInventory.ReferenceNo);
                        cmd.Parameters.AddWithValue("@ItemName", currSubInventory.ItemName);
                        cmd.Parameters.AddWithValue("@Description", currSubInventory.Description);
                        cmd.Parameters.AddWithValue("@Price", currSubInventory.Price);
                        cmd.Parameters.AddWithValue("@Weight", currSubInventory.Weight);
                        cmd.Parameters.AddWithValue("@Width", currSubInventory.Width);
                        cmd.Parameters.AddWithValue("@Height", currSubInventory.Height);
                        cmd.Parameters.AddWithValue("@Length", currSubInventory.Length);
                        cmd.Parameters.AddWithValue("@Volume", currSubInventory.Volume);
                        cmd.Parameters.AddWithValue("@Unit", currSubInventory.Unit);
                        cmd.Parameters.AddWithValue("@Quantity", currSubInventory.Quantity);
                        cmd.Parameters.AddWithValue("@Remarks", currSubInventory.Remarks);
                        cmd.Parameters.AddWithValue("@FeatureID", currSubInventory.FeatureID);
                        cmd.Parameters.AddWithValue("@ItemCategory", currSubInventory.ItemCategory);
                        cmd.Parameters.AddWithValue("@Flag", currSubInventory.Flag);

                        cmd.ExecuteNonQuery();
                        long id = cmd.LastInsertedId;
                        currSubInventory.SubInventoryItemID = id;

                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(SubInventoryItemRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return currSubInventory;
        }

        public bool Remove(int id)
        {
            bool retVal = false;
            string query = string.Format("DELETE FROM sub_inventory_item WHERE sub_inventory_item_id = {0}", id);
            
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
     

                    DeleteImage(String.Format("sub_items/{0}", id));
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Remove(SubInventoryItemRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return retVal;
        }

        public bool Update(SubInventoryItemInfo currSubInventory)
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
                        cmd.CommandText = "UPDATE sub_inventory_item SET company_id = @CompanyID, supplier_id = @SupplierID, branch_id = @BranchID, timestamp = @Timestamp, rx_time = @RxTime, " +
                                                                "reference_no = @ReferenceNo, item_name = @ItemName, description = @Description, price = @Price, weight = @Weight, " +
                                                                "width = @Width, height = @Height, length = @Length, volume = @Volume, unit = @Unit, quantity = @Quantity, remarks = @Remarks, feature_id = @FeatureID, item_category = @ItemCategory, flag = @Flag " +
                                                                "WHERE sub_inventory_item_id = @SubInventoryItemID";
                        
                        cmd.Parameters.AddWithValue("@CompanyID", currSubInventory.CompanyID);
                        cmd.Parameters.AddWithValue("@SupplierID", currSubInventory.SupplierID);
                        cmd.Parameters.AddWithValue("@BranchID", currSubInventory.BranchID);
                        cmd.Parameters.AddWithValue("@Timestamp", currSubInventory.Timestamp);
                        cmd.Parameters.AddWithValue("@RxTime", currSubInventory.RxTime);
                        cmd.Parameters.AddWithValue("@ReferenceNo", currSubInventory.ReferenceNo);
                        cmd.Parameters.AddWithValue("@ItemName", currSubInventory.ItemName);
                        cmd.Parameters.AddWithValue("@Description", currSubInventory.Description);
                        cmd.Parameters.AddWithValue("@Price", currSubInventory.Price);
                        cmd.Parameters.AddWithValue("@Weight", currSubInventory.Weight);
                        cmd.Parameters.AddWithValue("@Width", currSubInventory.Width);
                        cmd.Parameters.AddWithValue("@Height", currSubInventory.Height);
                        cmd.Parameters.AddWithValue("@Length", currSubInventory.Length);
                        cmd.Parameters.AddWithValue("@Volume", currSubInventory.Volume);
                        cmd.Parameters.AddWithValue("@Unit", currSubInventory.Unit);
                        cmd.Parameters.AddWithValue("@Quantity", currSubInventory.Quantity);
                        cmd.Parameters.AddWithValue("@Remarks", currSubInventory.Remarks);
                        cmd.Parameters.AddWithValue("@FeatureID", currSubInventory.FeatureID);
                        cmd.Parameters.AddWithValue("@ItemCategory", currSubInventory.ItemCategory);
                        cmd.Parameters.AddWithValue("@Flag", currSubInventory.Flag);
                        cmd.Parameters.AddWithValue("@SubInventoryItemID", currSubInventory.SubInventoryItemID);  

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
                Logger.LogEvent(ex.Message + "-Update(SubInventoryItemRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }

        public bool UpdateItem(SubInventoryItemInfo currSubInventory)
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
                        cmd.CommandText = "UPDATE sub_inventory_item SET quantity = @Quantity WHERE sub_inventory_item_id = @SubInventoryItemID";
                        
                        cmd.Parameters.AddWithValue("@Quantity", currSubInventory.Quantity);
                        cmd.Parameters.AddWithValue("@SubInventoryItemID", currSubInventory.SubInventoryItemID);

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
                Logger.LogEvent(ex.Message + "-Update(SubInventoryItemRepository)", System.Diagnostics.EventLogEntryType.Error);
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

    }
}