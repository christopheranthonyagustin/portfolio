using FMSWebApi.Models;
using FMSWebApi.Properties;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace FMSWebApi.Repository
{
    public class CategoryRepository : ICategoryRepository
    {
        //private string mConnStr = "server=localhost;uid=root;pwd=$B$Transit888;database=adas;charset=utf8;max pool size=500;default command timeout=999;";
        private string mConnStr = "server=localhost;uid=root;pwd=$B$Transit888;database=adas;charset=utf8;max pool size=500;default command timeout=99999;";
        private string mProjName = "SBS";
        public IEnumerable<CategoryInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<CategoryInfo> arrAssets = new List<CategoryInfo>();

            try
            {
                conn.ConnectionString = mConnStr;
                conn.Open();

                cmd.CommandText = "categories";
                cmd.Connection = conn;
                cmd.CommandType = CommandType.TableDirect;
                MySqlDataReader reader = cmd.ExecuteReader();

                //Console.WriteLine(String.Format("Total Data: {0}", dbRdr.FieldCount));

                if ((reader != null) && (reader.HasRows))
                {
                    while (reader.Read())
                    {
                        CategoryInfo currAsset = DataMgrTools.BuildCategory(reader);
                        arrAssets.Add(currAsset);
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

            return arrAssets.ToArray();
        }

        public CategoryInfo Get(int categoryID)
        {
            CategoryInfo currAsset = new CategoryInfo();
            string query = string.Format("SELECT * FROM categories WHERE category_id = {0}", categoryID);

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
                            currAsset = DataMgrTools.BuildCategory(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(CategoryRepository)", System.Diagnostics.EventLogEntryType.Error);
                    conn.Close();
                }
            }
            return currAsset;
        }

        public CategoryInfo GetByName(string catName)
        {
            CategoryInfo currCategory = new CategoryInfo();
            string query = string.Format("SELECT * FROM categories WHERE category_desc = @Cat");

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
                        cmd.Parameters.AddWithValue("@Cat", catName.Trim());
                        MySqlDataReader reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            currCategory = DataMgrTools.BuildCategory(reader);
                        }
                        //conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-GetByName(CategoryRepository)", System.Diagnostics.EventLogEntryType.Error);
                    //conn.Close();
                }
            }
            return currCategory;
        }

        public CategoryInfo Add(CategoryInfo currCategory)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO categories (category_id, category_desc) " +
                            "VALUES (@CategoryID, @CategoryDesc)";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@CategoryID", currCategory.CategoryID);
                        cmd.Parameters.AddWithValue("@CategoryDesc", currCategory.CategoryDesc);
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {

            }

            return currCategory;
        }

        public bool Remove(int categoryID)
        {
            bool retVal = false;
            string query = string.Format("DELETE FROM categories WHERE category_id = {0}", categoryID);

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
                    conn.Close();
                }
            }

            return retVal;
        }

        public bool Update(CategoryInfo currCategory)
        {
            bool retVal = false;
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    try
                    {
                        using (MySqlCommand cmd = new MySqlCommand())
                        {
                            conn.Open();
                            cmd.Connection = conn;
                            cmd.CommandText = "UPDATE categories SET category_id = @CategoryID, category_desc = @CategoryDesc"  +
                                                    "WHERE category_id = @CategoryID";
                            cmd.Prepare();
                            cmd.Parameters.AddWithValue("@CategoryID", currCategory.CategoryID);
                            cmd.Parameters.AddWithValue("@CategoryDesc", currCategory.CategoryDesc);

                            if (cmd.ExecuteNonQuery() == 1)
                                retVal = true;
                            else
                                retVal = false;
                            conn.Close();
                        }
                    }
                    catch (Exception ex)
                    {
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {

            }

            return retVal;
        }
    }
}