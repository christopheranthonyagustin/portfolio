using FMSWebApi.Models;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using FMSWebApi.Properties;
using System.Threading.Tasks;

namespace FMSWebApi.Repository
{
    public class AssetFeatureRepository : IAssetFeatureRepository
    {
        private string mConnStr = Settings.Default.DB;
        private string mProjName = "FMS-Singapore";
        public IEnumerable<AssetFeatureInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<AssetFeatureInfo> arrFeatures = new List<AssetFeatureInfo>();

            try
            {
                conn.ConnectionString = mConnStr;
                conn.Open();

                cmd.CommandText = "asset_feature order by feature_id asc";
                cmd.Connection = conn;
                cmd.CommandType = CommandType.TableDirect;
                MySqlDataReader reader = cmd.ExecuteReader();

                if ((reader != null) && (reader.HasRows))
                {
                    while (reader.Read())
                    {
                        AssetFeatureInfo currFeature = DataMgrTools.BuildAssetFeature(reader);
                        currFeature.ErrorMessage = "Success";
                        arrFeatures.Add(currFeature);
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

            return arrFeatures.ToArray();
        }
        public IEnumerable<AssetFeatureInfo> GetFeature(AssetFeatureInfo param)
        {
            List<AssetFeatureInfo> arrFeatures = new List<AssetFeatureInfo>();
            AssetFeatureInfo currFeature = new AssetFeatureInfo();
            string query = string.Format("SELECT * FROM asset_feature WHERE description = @FeatureDesc");
            var resultCount = 0;

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = query;
                        
                        cmd.Parameters.AddWithValue("@FeatureDesc", param.FeatureDesc);
                        MySqlDataReader reader = cmd.ExecuteReader();

                        if (reader.FieldCount > 0)
                            resultCount++;

                        if ((reader != null) && (reader.HasRows))
                        {
                            while (reader.Read())
                            {
                                currFeature = DataMgrTools.BuildAssetFeature(reader);
                                currFeature.ErrorMessage = "Success";                       
                                arrFeatures.Add(currFeature);
                            }
                        }
                        else
                        {
                            currFeature.FeatureID = 0;
                            currFeature.FeatureDesc = param.FeatureDesc;
                            currFeature.ErrorMessage = "Not Found";
                            arrFeatures.Add(currFeature);
                        }
                     
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-GetFeature", System.Diagnostics.EventLogEntryType.Error);
                }
            }
            return arrFeatures;
        }
        public AssetFeatureInfo Get(int id)
        {
            AssetFeatureInfo currFeature = new AssetFeatureInfo();
            string query = string.Format("SELECT * FROM asset_feature WHERE feature_id = {0}", id);

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
                            currFeature = DataMgrTools.BuildAssetFeature(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(AssetFeatureRepository)", System.Diagnostics.EventLogEntryType.Error);
                }
            }
            return currFeature;
        }
        public AssetFeatureInfo GetByName(string description)
        {
            AssetFeatureInfo currFeature = new AssetFeatureInfo();
            string query = string.Format("SELECT * FROM asset_feature WHERE description = @Description");

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = query;
                        
                        cmd.Parameters.AddWithValue("@Description", description.Trim());
                        MySqlDataReader reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            currFeature = DataMgrTools.BuildAssetFeature(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-GetByName(AssetFeatureRepository)", System.Diagnostics.EventLogEntryType.Error);
                }
            }
            return currFeature;
        }
        public async Task<AssetFeatureInfo> GetByNameAsync(string description)
        {
            AssetFeatureInfo currFeature = new AssetFeatureInfo();
            string query = string.Format("SELECT * FROM asset_feature WHERE description = @Description");

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = query;
                        
                        cmd.Parameters.AddWithValue("@Description", description.Trim());
                        MySqlDataReader reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            currFeature = DataMgrTools.BuildAssetFeature(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-GetByName(AssetFeatureRepository)", System.Diagnostics.EventLogEntryType.Error);
                }
            }
            // return currFeature;
            return await Task<AssetFeatureInfo>.Factory.StartNew(() =>
            {
                return currFeature;
            });
        }
        public AssetFeatureInfo Add(AssetFeatureInfo currFeature)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO asset_feature (feature_id, description) " +
                                                             "VALUES (@FeatureID, @FeatureDesc)";
                        
                        cmd.Parameters.AddWithValue("@FeatureID", currFeature.FeatureID);
                        cmd.Parameters.AddWithValue("@FeatureDesc", currFeature.FeatureDesc);
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(AssetFeatureRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return currFeature;
        }
        public bool Remove(int id)
        {
            bool retVal = false;
            string query = string.Format("DELETE FROM asset_feature WHERE feature_id = {0}", id);

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
                    Logger.LogEvent(ex.Message + "-Delete(AssetFeatureRepository)", System.Diagnostics.EventLogEntryType.Error);
                }
            }

            return retVal;
        }
        public bool Update(AssetFeatureInfo currFeature)
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
                        cmd.CommandText = "UPDATE asset_feature SET description = @FeatureDesc " +
                                                "WHERE feature_id = @FeatureID";
                        
                        cmd.Parameters.AddWithValue("@FeatureID", currFeature.FeatureID);
                        cmd.Parameters.AddWithValue("@FeatureDesc", currFeature.FeatureDesc);

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
                Logger.LogEvent(ex.Message + "-Update(AssetFeatureRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }
    }
}