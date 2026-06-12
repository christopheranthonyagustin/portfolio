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
    public class SubInventoryPurchaseRepository : ISubInventoryPurchaseRepository
    {
        private string mConnStr = Settings.Default.DB;
        private string mProjName = "FMS-Singapore";
        public IEnumerable<SubInventoryPurchaseInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<SubInventoryPurchaseInfo> arrInventory = new List<SubInventoryPurchaseInfo>();

            try
            {
                conn.ConnectionString = mConnStr;
                conn.Open();

                cmd.CommandText = "sub_inventory_purchase";
                cmd.Connection = conn;
                cmd.CommandType = CommandType.TableDirect;
                MySqlDataReader reader = cmd.ExecuteReader();

                //Console.WriteLine(String.Format("Total Data: {0}", dbRdr.FieldCount));

                if ((reader != null) && (reader.HasRows))
                {
                    while (reader.Read())
                    {
                        SubInventoryPurchaseInfo currInventory = DataMgrTools.BuildInventorySubPurchase(reader);
                        arrInventory.Add(currInventory);
                    }
                }
                conn.Close();
            }
            catch (MySqlException ex)
            {
                Logger.LogEvent(mProjName, "GetAll Sub Inventory Purchase: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }


            if (conn != null)
                conn.Close();

            return arrInventory.ToArray();
        }

        public IEnumerable<SubInventoryPurchaseInfo> ClearPurchase()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<SubInventoryPurchaseInfo> arrInventory = new List<SubInventoryPurchaseInfo>();

            return arrInventory.ToArray();
        }

        public IEnumerable<SubInventoryPurchaseInfo> GetByCompany(SubInventoryPurchaseInfo param)
        {
            List<SubInventoryPurchaseInfo> arrInventory = new List<SubInventoryPurchaseInfo>();
            SubInventoryPurchaseInfo currInventory = new SubInventoryPurchaseInfo();
            object objTemp = new object();

            string query = "SELECT * FROM sub_inventory_purchase WHERE (timestamp between @StartTS and @EndTS)";
            if (param.CompanyID > 0) query += " and company_id = @CompanyID";
         
  
            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        
                        cmd.Parameters.AddWithValue("@StartTS", param.Timestamp);
                        cmd.Parameters.AddWithValue("@EndTS", param.RxTime);
                        cmd.Parameters.AddWithValue("@CompanyID", param.CompanyID);


                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currInventory = DataMgrTools.BuildInventorySubPurchase(reader);
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


        public SubInventoryPurchaseInfo Get(int id)
        {
            SubInventoryPurchaseInfo currInventory = new SubInventoryPurchaseInfo();
            string query = string.Format("SELECT * FROM sub_inventory_purchase WHERE sub_inventory_purchase_id = {0}", id);

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
                            currInventory = DataMgrTools.BuildInventorySubPurchase(reader);
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

        public SubInventoryPurchaseInfo Add(SubInventoryPurchaseInfo currInventory)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO sub_inventory_purchase (sub_inventory_item_id, supplier_id, timestamp, rx_time, company_id, quantity) " +
                                                                        "VALUES (@SubInventoryItemID, @SupplierID, @Timestamp, @RxTime, @CompanyID, @Quantity)";
                        
                        cmd.Parameters.AddWithValue("@SubInventoryItemID", currInventory.SubInventoryItemID);
                        cmd.Parameters.AddWithValue("@SupplierID", currInventory.SupplierID);
                        cmd.Parameters.AddWithValue("@Timestamp", currInventory.Timestamp);
                        cmd.Parameters.AddWithValue("@RxTime", currInventory.RxTime);
                        cmd.Parameters.AddWithValue("@CompanyID", currInventory.CompanyID);
                        cmd.Parameters.AddWithValue("@Quantity", currInventory.Quantity);

                        cmd.ExecuteNonQuery();

                        long id = cmd.LastInsertedId;
                        currInventory.SubInventoryPurchaseID = id;

                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(InventorySubPurchaseRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return currInventory;
        }

        public bool Remove(int id)
        {
            bool retVal = false;
            string query = string.Format("DELETE FROM sub_inventory_purchase WHERE sub_inventory_purchase_id = {0}", id);

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
                Logger.LogEvent(ex.Message + "-Remove(InventorySubPurchaseRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }

        public bool Update(SubInventoryPurchaseInfo currInventory)
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
                        cmd.CommandText = "UPDATE sub_inventory_purchase SET sub_inventory_item_id = @SubInventoryItemID, supplier_id = @SupplierID, timestamp = @Timestamp, rx_time = @RxTime, company_id = @CompanyID, quantity = @Quantity " +
                                                                       "WHERE sub_inventory_purchase_id = @SubInventoryPurchaseID";
                        
                        cmd.Parameters.AddWithValue("@SubInventoryItemID", currInventory.SubInventoryItemID);
                        cmd.Parameters.AddWithValue("@SupplierID", currInventory.SupplierID);
                        cmd.Parameters.AddWithValue("@Timestamp", currInventory.Timestamp);
                        cmd.Parameters.AddWithValue("@RxTime", currInventory.RxTime);
                        cmd.Parameters.AddWithValue("@CompanyID", currInventory.CompanyID);
                        cmd.Parameters.AddWithValue("@Quantity", currInventory.Quantity);
                        cmd.Parameters.AddWithValue("@SubInventoryPurchaseID", currInventory.SubInventoryPurchaseID);

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
                Logger.LogEvent(ex.Message + "-Update(InventorySubPurchaseRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }

    }
}