using MySql.Data.MySqlClient;
using FMSWebApi.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Hosting;
using System.Configuration;
using System.IO;
using System.Web.Http;

namespace FMSWebApi.Repository
{
    public class UtilizationInfoRepository : IUtilizationRepository
    {
        private string mConnStr = "server=localhost;uid=root;pwd=@c3c0M;database=tracksg;charset=utf8;";
        private string mProjName = "FMS-Thailand";

        public IEnumerable<UtilizationInfo> GetAll()
        {
            List<UtilizationInfo> arrUtil = new List<UtilizationInfo>();
            string query = "";

            return arrUtil.ToArray();
        }

        public IEnumerable<UtilizationInfo> GetUtilizationInfo([FromUri]UtilizationInfo value)
        {   
            List<UtilizationInfo> arrUtil = new List<UtilizationInfo>();
            string query = "SELECT * FROM view_utilization WHERE start_time between @StartTS and @EndTS";
            if (value.AssetID > 0) query += " and asset_id = @AssetID";
            else if (!string.IsNullOrEmpty(value.Asset)) query += " and asset_id = (SELECT asset_id FROM view_assets WHERE name = @AssetName)";
            query += " ORDER BY start_time ASC";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {

                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@StartTS", value.StartTime);
                        cmd.Parameters.AddWithValue("@EndTS", value.EndTime);
                        if (value.AssetID > 0) cmd.Parameters.AddWithValue("@AssetID", value.AssetID);
                        else if (!string.IsNullOrEmpty(value.Asset)) cmd.Parameters.AddWithValue("@AssetName", value.Asset);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    UtilizationInfo currUtil = DataMgrTools.BuildUtilizationView(reader);
                                    arrUtil.Add(currUtil);
                                }
                            }
                        }

                        conn.Close();
                    }
                }

                catch (Exception ex)
                {
                    Logger.LogEvent(mProjName, "Get Filter Utilization Exception: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);

                }
            }

            return arrUtil.ToArray();
        }

        public UtilizationInfo Get(int utilID)
        {
            UtilizationInfo currUtil = new UtilizationInfo();
            string query = string.Format("SELECT * FROM view_utlization WHERE util_id = {0}", utilID);

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
                            currUtil = DataMgrTools.BuildUtilizationView(reader);
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
            return currUtil;
        }

        public UtilizationInfo Add(UtilizationInfo item)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {

                //    currAsset.UtilId, currAsset.AssetId, currAsset.Driver, currAsset.Date, currAsset.StartTime, currAsset.EndTime, currAsset.Stop, 
                //currAsset.Stop, currAsset.Idle, currAsset.Move, currAsset.StopCount, currAsset.Mileage, currAsset.LastIgnition, currAsset.Location, 
                //currAsset.Asset, currAsset.CategoryId, currAsset.CompanyId, currAsset.Tag, currAsset.Category

                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        UtilizationInfo currUtil = new UtilizationInfo();
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO utilization (util_id, asset_id, date, start_time, end_time, " +
                            "stop, stop_ex, idle, move, stop_count, mileage, last_ignition, location, asset, category_id, company_id, category) VALUES " +
                            "(@UtilId, @AssetId, @Date, @StartTime, @EndTime, @Stop, @StopEx, @Idle, @Move, @StopCount, " +
                            "@Mileage, @LastIgnition, @Location, @Asset, @CategoryId, @CompanyId, @Category)";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@UtilId", currUtil.UtilId);
                        cmd.Parameters.AddWithValue("@AssetID", currUtil.AssetID);
                        cmd.Parameters.AddWithValue("@Date", item.Date);
                        cmd.Parameters.AddWithValue("@StartTime", item.StartTime);
                        cmd.Parameters.AddWithValue("@EndTime", item.EndTime);
                        cmd.Parameters.AddWithValue("@Stop", item.Stop);
                        cmd.Parameters.AddWithValue("@StopEx", item.StopEx);
                        cmd.Parameters.AddWithValue("@Idle", item.Idle);
                        cmd.Parameters.AddWithValue("@Move", item.Move);
                        cmd.Parameters.AddWithValue("@StopCount", item.StopCount);
                        cmd.Parameters.AddWithValue("@Mileage", item.Mileage);
                        cmd.Parameters.AddWithValue("@LastIgnition", item.LastIgnition);
                        cmd.Parameters.AddWithValue("@Location", item.Location);
                        cmd.Parameters.AddWithValue("@Asset", item.Asset);
                        cmd.Parameters.AddWithValue("@CategoryId", item.CategoryId);
                        cmd.Parameters.AddWithValue("@CompanyId", item.CompanyId);
                        cmd.Parameters.AddWithValue("@Category", item.Category);
                        cmd.ExecuteNonQuery();

 
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(mProjName, ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }

            return item;
        }

        public bool Remove(int utilID)
        {
            bool retVal = false;
            string query = string.Format("DELETE FROM utilization WHERE util_id = {0}", utilID);

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
                    Logger.LogEvent(mProjName, ex.Message, System.Diagnostics.EventLogEntryType.Error);
                }
            }

            return retVal;
        }

        public bool Update(UtilizationInfo item)
        {
            bool retVal = false;

            return retVal;
        }


    }
}