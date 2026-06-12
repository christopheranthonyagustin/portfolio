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
    public class IdlingInfoRepository : IIdlingRepository
    {
        private string mConnStr = "server=103.237.168.119;uid=root;pwd=@c3c0M;database=tracksg;charset=utf8;";
        private string mProjName = "FMS-Thailand";

        public IEnumerable<IdlingInfo> GetAll()
        {
            List<IdlingInfo> arrUtil = new List<IdlingInfo>();
            string query = "";

            return arrUtil.ToArray();
        }

        public IEnumerable<IdlingInfo> GetIdlingInfo([FromUri]IdlingInfo value)
        {   
            List<IdlingInfo> arrldling = new List<IdlingInfo>();
            string query = "SELECT * FROM view_idlereport WHERE (idle_start between @StartTS and @EndTS)";
            if (value.AssetID > 0) query += " and asset_id = @AssetID";
            else if (!string.IsNullOrEmpty(value.Asset)) query += " and asset_id = (SELECT asset_id FROM view_assets WHERE name = @AssetName)";
            query += " ORDER BY idle_start ASC";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {

                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@StartTS", value.IdleStart);
                        cmd.Parameters.AddWithValue("@EndTS", value.IdleEnd);
                        if (value.AssetID > 0) cmd.Parameters.AddWithValue("@AssetID", value.AssetID);
                        else if (!string.IsNullOrEmpty(value.Asset)) cmd.Parameters.AddWithValue("@AssetName", value.Asset);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    IdlingInfo currldling = DataMgrTools.BuildIdlingView(reader);
                                    arrldling.Add(currldling);
                                }
                            }
                        }

                        conn.Close();
                    }
                }

                catch (Exception ex)
                {
                    Logger.LogEvent(mProjName, "GetIdlingInfo Exception: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);

                }
            }

            return arrldling.ToArray();
        }

        public IdlingInfo Get(int idlereportID)
        {
            IdlingInfo currUtil = new IdlingInfo();
            string query = string.Format("SELECT * FROM view_idlereport WHERE idlereport_id = {0}", idlereportID);

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
                            currUtil = DataMgrTools.BuildIdling(reader);
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


    }
}