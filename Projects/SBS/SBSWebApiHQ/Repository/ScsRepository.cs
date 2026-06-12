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
    public class ScsRepository : IScsRepository
    {
        //private string mConnStr = "server=localhost;uid=root;pwd=$B$Transit888;database=adas;charset=utf8;max pool size=500;default command timeout=999;";
        private string mConnStr = "server=localhost;uid=root;pwd=$B$Transit888;database=adas;charset=utf8;max pool size=500;default command timeout=99999;";
        private string mProjName = "SBS";
        public IEnumerable<ScsInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<ScsInfo> arrScs = new List<ScsInfo>();

            try
            {
                conn.ConnectionString = mConnStr;
                conn.Open();

                cmd.CommandText = "view_driver_sched";
                cmd.Connection = conn;
                cmd.CommandType = CommandType.TableDirect;
                MySqlDataReader reader = cmd.ExecuteReader();

                if ((reader != null) && (reader.HasRows))
                {
                    while (reader.Read())
                    {
                        ScsInfo currScs = DataMgrTools.BuildScs(reader);
                        arrScs.Add(currScs);
                    }
                }
                conn.Close();
            }
            catch (MySqlException ex)
            {
                Logger.LogEvent(ex.Message + "-GetAll(ScsRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            if (conn != null)
                conn.Close();

            return arrScs.ToArray();
        }

        public IEnumerable<ScsArchiveInfo> GetAllEx()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<ScsArchiveInfo> arrScs = new List<ScsArchiveInfo>();

            return arrScs.ToArray();
        }

        public IEnumerable<ScsInfo> GetScs(ScsInfo param)
        {

            List<ScsInfo> arrScs = new List<ScsInfo>();
            ScsInfo currScs = new ScsInfo();
            object objTemp = new object();


            string query = "SELECT * FROM view_driver_sched WHERE depot_id IN (" + param.Depot + ")";

            if (!string.IsNullOrEmpty(param.Interchange)) query += "and interchange_id IN (" + param.Interchange + ")";

            if (!string.IsNullOrEmpty(param.SVC_NO)) query += " and (SVC_NO IN (" + param.SVC_NO + "))";

            query += " order by  DRV_NO asc";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        cmd.Prepare();

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currScs = DataMgrTools.BuildScs(reader);
                                    arrScs.Add(currScs);
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(GetScs)", System.Diagnostics.EventLogEntryType.Error);

                }


            }

            return arrScs;
        }

        public IEnumerable<ScsArchiveInfo> GetScsArchive(ScsArchiveInfo param)
        {

            List<ScsArchiveInfo> arrScs = new List<ScsArchiveInfo>();
            ScsArchiveInfo currScs = new ScsArchiveInfo();
            object objTemp = new object();

            string query = "SELECT distinct DRV_NO AS DRV_NO, OP_DATE AS OP_DATE, interchange_id AS interchange_id, depot_id AS depot_id, SVC_NO AS SVC_NO FROM view_driver_sched_archive WHERE depot_id IN (" + param.Depot + ")";
            if (!string.IsNullOrEmpty(param.Interchange)) query += "and interchange_id IN (" + param.Interchange + ")";
            if (!string.IsNullOrEmpty(param.SVC_NO)) query += " and (SVC_NO IN (" + param.SVC_NO + "))";
            query += " and OP_DATE between @OP_DATE_START and @OP_DATE_END";
            query += " GROUP BY DRV_NO";
            query += " ORDER BY DRV_NO ASC";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@OP_DATE_START", param.OP_DATE_START);
                        cmd.Parameters.AddWithValue("@OP_DATE_END", param.OP_DATE_END);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currScs = DataMgrTools.BuildScsArchive(reader);
                                    currScs.Interchange = param.Interchange;
                                    currScs.Depot = param.Depot;
                                    currScs.OP_DATE_START = param.OP_DATE_START;
                                    currScs.OP_DATE_END = param.OP_DATE_END;
                                    arrScs.Add(currScs);
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(GetScsArchive)", System.Diagnostics.EventLogEntryType.Error);

                }


            }

            return arrScs;
        }

        public IEnumerable<ScsArchiveInfo> GetScsArchiveEx(ScsArchiveInfo param)
        {

            List<ScsArchiveInfo> arrScs = new List<ScsArchiveInfo>();
            ScsArchiveInfo currScs = new ScsArchiveInfo();
            object objTemp = new object();

            string query = "SELECT distinct DRV_NO AS DRV_NO, OP_DATE AS OP_DATE, interchange_id AS interchange_id, depot_id AS depot_id, SVC_NO AS SVC_NO FROM view_driver_sched_archive WHERE depot_id IN (" + param.Depot + ")";
            if (!string.IsNullOrEmpty(param.Interchange)) query += "and interchange_id IN (" + param.Interchange + ")";
            if (!string.IsNullOrEmpty(param.SVC_NO)) query += " and (SVC_NO IN (" + param.SVC_NO + "))";
            query += " and OP_DATE between @OP_DATE_START and @OP_DATE_END";
            query += " GROUP BY SVC_NO";
            query += " ORDER BY DRV_NO ASC";
            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@OP_DATE_START", param.OP_DATE_START);
                        cmd.Parameters.AddWithValue("@OP_DATE_END", param.OP_DATE_END);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currScs = DataMgrTools.BuildScsArchive(reader);
                                    currScs.Interchange = param.Interchange;
                                    currScs.Depot = param.Depot;
                                    currScs.OP_DATE_START = param.OP_DATE_START;
                                    currScs.OP_DATE_END = param.OP_DATE_END;
                                    arrScs.Add(currScs);
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(GetScsArchive)", System.Diagnostics.EventLogEntryType.Error);

                }


            }

            return arrScs;
        }
       
    }
}