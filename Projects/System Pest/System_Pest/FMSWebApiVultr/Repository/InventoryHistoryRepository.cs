using FMSWebApi.Models;
using MySqlConnector;
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
    public class InventoryHistoryRepository : IInventoryHistoryRepository
    {
        private string mConnStr = "server=127.0.0.1;uid=root;pwd=@c3c0M;database=sp;Charset=utf8;max pool size=500;SSL Mode=None;";
        private string mProjName = "SP";
        public IEnumerable<InventoryHistoryInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<InventoryHistoryInfo> arrInventory = new List<InventoryHistoryInfo>();

            try
            {
                conn.ConnectionString = mConnStr;
                conn.Open();

                cmd.CommandText = "SELECT * FROM inventory_history";
                cmd.Connection = conn;
                cmd.CommandType = CommandType.Text;
                MySqlDataReader reader = cmd.ExecuteReader();

                //Console.WriteLine(String.Format("Total Data: {0}", dbRdr.FieldCount));

                if ((reader != null) && (reader.HasRows))
                {
                    while (reader.Read())
                    {
                        InventoryHistoryInfo currInventory = DataMgrTools.BuildInventoryHistory(reader);
                        string strFill = "";
                        currInventory.Image = GetImage(String.Format("inventoryhistory/signature/{0}", currInventory.InventoryHistoryID), ref strFill);
                        currInventory.ImageFill = strFill;
                        arrInventory.Add(currInventory);
                    }
                }
                conn.Close();
            }
            catch (MySqlException ex)
            {
                Logger.LogEvent(mProjName, "GetAll Inventory History: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }


            if (conn != null)
                conn.Close();

            return arrInventory.ToArray();
        }

        public IEnumerable<InventoryHistoryInfo> ClearHistory()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<InventoryHistoryInfo> arrInventory = new List<InventoryHistoryInfo>();

            return arrInventory.ToArray();
        }

        public IEnumerable<InventoryHistoryInfo> GetByCompany(InventoryHistoryInfo param)
        {
            List<InventoryHistoryInfo> arrInventory = new List<InventoryHistoryInfo>();
            InventoryHistoryInfo currInventory = new InventoryHistoryInfo();
            object objTemp = new object();

            string query = "SELECT * FROM view_inventory_history WHERE (timestamp between @StartTS and @EndTS)";
            if (param.CompanyID > 0) query += " and company_id = @CompanyID";
            if (!string.IsNullOrEmpty(param.Reference)) query += " and reference = @Reference";
  
            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        //cmd.Prepare();
                        cmd.Parameters.AddWithValue("@StartTS", param.Timestamp);
                        cmd.Parameters.AddWithValue("@EndTS", param.RxTime);
                        cmd.Parameters.AddWithValue("@CompanyID", param.CompanyID);
                        if (!string.IsNullOrEmpty(param.Reference)) cmd.Parameters.AddWithValue("@Reference", param.Reference);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currInventory = DataMgrTools.BuildInventoryHistory(reader);
                                    string strFill = "";
                                    currInventory.Image = GetImage(String.Format("supervisorsignatures/{0}", currInventory.InventoryHistoryID), ref strFill);
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


        public InventoryHistoryInfo Get(int inventoryID)
        {
            InventoryHistoryInfo currInventory = new InventoryHistoryInfo();
            string query = string.Format("SELECT * FROM inventory_history WHERE inventory_history_id = {0}", inventoryID);

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
                            currInventory = DataMgrTools.BuildInventoryHistory(reader);
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

        public InventoryHistoryInfo Add(InventoryHistoryInfo currInventory)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO inventory_history (inventory_id, timestamp, rx_time, stock_type, name, reference, " +
                                                                 "previous_quantity, quantity, total_quantity, " + 
                                                                 "driver_id, asset_id, company_id, user_id, platform) " +
                                                         "VALUES (@InventoryID, @Timestamp, @RxTime, @StockType, @Name, @Reference, " +
                                                                 "@PreviousQuantity, @Quantity, @TotalQuantity, " +
                                                                 "@DriverID, @AssetID, @CompanyID, @UserID, @Platform)";
                        //cmd.Prepare();
                        cmd.Parameters.AddWithValue("@InventoryID", currInventory.InventoryID);
                        cmd.Parameters.AddWithValue("@Timestamp", currInventory.Timestamp);
                        cmd.Parameters.AddWithValue("@RxTime", currInventory.RxTime);
                        cmd.Parameters.AddWithValue("@StockType", currInventory.StockType);
                        cmd.Parameters.AddWithValue("@Name", currInventory.Name);
                        cmd.Parameters.AddWithValue("@Reference", currInventory.Reference);
                        cmd.Parameters.AddWithValue("@PreviousQuantity", currInventory.PreviousQuantity);
                        cmd.Parameters.AddWithValue("@Quantity", currInventory.Quantity);
                        cmd.Parameters.AddWithValue("@TotalQuantity", currInventory.TotalQuantity);
                        cmd.Parameters.AddWithValue("@DriverID", currInventory.DriverID);
                        cmd.Parameters.AddWithValue("@AssetID", currInventory.AssetID);
                        cmd.Parameters.AddWithValue("@CompanyID", currInventory.CompanyID);
                        cmd.Parameters.AddWithValue("@UserID", currInventory.UserID);
                        cmd.Parameters.AddWithValue("@Platform", currInventory.Platform);
                        cmd.ExecuteNonQuery();

                        long id = cmd.LastInsertedId;
                        currInventory.InventoryHistoryID = id;

                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(InventoryHistoryRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return currInventory;
        }

        public bool Remove(int inventoryID)
        {
            bool retVal = false;
            string query = string.Format("DELETE FROM inventory_history WHERE inventory_history_id = {0}", inventoryID);

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
                Logger.LogEvent(ex.Message + "-Remove(InventoryHistoryRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }

        public bool Update(InventoryHistoryInfo currInventory)
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
                        cmd.CommandText = "UPDATE inventory_history SET inventory_id = @InventoryID, timestamp = @Timestamp, rx_time = @RxTime, stock_type = @StockType, name = @Name, reference = @Reference, " +
                                                                       "previous_quantity = @PreviousQuantity, quantity = @Quantity, total_quantity = @TotalQuantity, " +
                                                                       "driver_id = @DriverID, asset_id = @AssetID, company_id = @CompanyID" +
                                                                       "WHERE inventory_history_id = @InventoryHistoryID";
                        //cmd.Prepare();
                        cmd.Parameters.AddWithValue("@InventoryID", currInventory.InventoryID);
                        cmd.Parameters.AddWithValue("@Timestamp", currInventory.Timestamp);
                        cmd.Parameters.AddWithValue("@RxTime", currInventory.RxTime);
                        cmd.Parameters.AddWithValue("@StockType", currInventory.StockType);
                        cmd.Parameters.AddWithValue("@Name", currInventory.Name);
                        cmd.Parameters.AddWithValue("@Reference", currInventory.Reference);
                        cmd.Parameters.AddWithValue("@PreviousQuantity", currInventory.PreviousQuantity);
                        cmd.Parameters.AddWithValue("@Quantity", currInventory.Quantity);
                        cmd.Parameters.AddWithValue("@TotalQuantity", currInventory.TotalQuantity);
                        cmd.Parameters.AddWithValue("@DriverID", currInventory.DriverID);
                        cmd.Parameters.AddWithValue("@AssetID", currInventory.AssetID);
                        cmd.Parameters.AddWithValue("@CompanyID", currInventory.CompanyID);
                        cmd.Parameters.AddWithValue("@UserID", currInventory.UserID);
                        cmd.Parameters.AddWithValue("@Platform", currInventory.Platform);
                        cmd.Parameters.AddWithValue("@InventoryHistoryID", currInventory.InventoryHistoryID);

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
                Logger.LogEvent(ex.Message + "-Update(InventoryHistoryRepository)", System.Diagnostics.EventLogEntryType.Error);
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
                Logger.LogEvent("Get Image: ", ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }

            // image file not found
            strFill = "None";
            return strName;
        }

    }
}