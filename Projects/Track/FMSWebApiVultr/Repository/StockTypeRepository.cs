using FMSWebApi.Models;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using FMSWebApi.Properties;

namespace FMSWebApi.Repository
{
    public class StockTypeRepository : IStockTypeRepository
    {
        private string mConnStr = Settings.Default.DB;
        private string mProjName = "FMS-Singapore";
        public IEnumerable<StockTypeInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<StockTypeInfo> arrStockType = new List<StockTypeInfo>();

            try
            {
                conn.ConnectionString = mConnStr;
                conn.Open();

                cmd.CommandText = "stock_type order by stock_type_id asc";
                cmd.Connection = conn;
                cmd.CommandType = CommandType.TableDirect;
                MySqlDataReader reader = cmd.ExecuteReader();

                if ((reader != null) && (reader.HasRows))
                {
                    while (reader.Read())
                    {
                        StockTypeInfo currStockType = DataMgrTools.BuildStockType(reader);
                        arrStockType.Add(currStockType);
                    }
                }
                conn.Close();
            }
            catch (MySqlException ex)
            {
                Logger.LogEvent(mProjName, ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }

            if (conn != null)
                conn.Close();

            return arrStockType.ToArray();
        }

        public StockTypeInfo Get(int id)
        {
            StockTypeInfo currStockType = new StockTypeInfo();
            string query = string.Format("SELECT * FROM stock_type WHERE stock_type_id = {0}", id);

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
                            currStockType = DataMgrTools.BuildStockType(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(StockTypeRepository)", System.Diagnostics.EventLogEntryType.Error);
                }
            }
            return currStockType;
        }

        public StockTypeInfo GetByName(string name)
        {
            StockTypeInfo currStockType = new StockTypeInfo();
            string query = string.Format("SELECT * FROM stock_type WHERE name = @Name");

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = query;
                        
                        cmd.Parameters.AddWithValue("@Name", name.Trim());
                        MySqlDataReader reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            currStockType = DataMgrTools.BuildStockType(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-GetByName(StockTypeRepository)", System.Diagnostics.EventLogEntryType.Error);
                }
            }
            return currStockType;
        }

        public StockTypeInfo Add(StockTypeInfo currStockType)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO stock_type (name) " +
                                                          "VALUES (@Name)";
                        
                        cmd.Parameters.AddWithValue("@Name", currStockType.Name);
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(StockTypeRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return currStockType;
        }

        public bool Remove(int id)
        {
            bool retVal = false;
            string query = string.Format("DELETE FROM stock_type WHERE stock_type_id = {0}", id);

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
                    Logger.LogEvent(ex.Message + "-Delete(StockTypeRepository)", System.Diagnostics.EventLogEntryType.Error);
                }
            }

            return retVal;
        }

        public bool Update(StockTypeInfo currStockType)
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
                        cmd.CommandText = "UPDATE stock_type SET name = @Name " +
                                                "WHERE stock_type_id = @StockTypeID";
                        
                        cmd.Parameters.AddWithValue("@Name", currStockType.Name);
                        cmd.Parameters.AddWithValue("@StockTypeID", currStockType.StockTypeID);

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
                Logger.LogEvent(ex.Message + "-Update(StockTypeRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }
    }
}