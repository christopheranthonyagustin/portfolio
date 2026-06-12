using FMSWebApi.Models;
using FMSWebApi.Properties;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Http;

namespace FMSWebApi.Repository
{
    public class SvcRepository : ISvcRepository
    {      
        private string mConnStr = Settings.Default.DB;
        private string mProjName = "SBS";

        public IEnumerable<SvcInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<SvcInfo> arrSvc = new List<SvcInfo>();

            try
            {
                conn.ConnectionString = mConnStr;
                conn.Open();

                cmd.CommandText = "view_svc";
                cmd.Connection = conn;
                cmd.CommandType = CommandType.TableDirect;
                MySqlDataReader reader = cmd.ExecuteReader();

                //Console.WriteLine(String.Format("Total Data: {0}", dbRdr.FieldCount));

                if ((reader != null) && (reader.HasRows))
                {
                    while (reader.Read())
                    {
                        SvcInfo currSvc = DataMgrTools.BuildSvc(reader);
                        arrSvc.Add(currSvc);
                    }
                }
                conn.Close();
            }
            catch (MySqlException ex)
            {
                Logger.LogEvent(ex.Message + "-GetAll(SvcRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            if (conn != null)
                conn.Close();

            return arrSvc.ToArray();
        }

        public IEnumerable<SvcInfo> GetSvc(SvcInfo param)
        {

            List<SvcInfo> arrSvc = new List<SvcInfo>();
            SvcInfo currSvc = new SvcInfo();
            object objTemp = new object();


            string query = "SELECT * FROM view_svc WHERE depot_id IN (" + param.Depot + ")";

            if (!string.IsNullOrEmpty(param.Interchange)) query += " and interchange_id IN (" + param.Interchange + ")";

            query += " order by svc_no asc";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        cmd.Prepare();
                        //cmd.Parameters.AddWithValue("@DepotID", param.DepotID);
                        //cmd.Parameters.AddWithValue("@InterchangeID", param.InterchangeID);
                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currSvc = DataMgrTools.BuildSvc(reader);
                                    arrSvc.Add(currSvc);
                                    currSvc.Depot = param.Depot;
                                    currSvc.Interchange = param.Interchange;
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(GetSvc)", System.Diagnostics.EventLogEntryType.Error);

                }


            }

            return arrSvc;
        }

        public SvcInfo Get(int svcID)
        {
            SvcInfo currSvc = new SvcInfo();
            string query = string.Format("SELECT * FROM svc WHERE svc_id = {0}", svcID);
            
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
                            currSvc = DataMgrTools.BuildSvc(reader);
                        }
                        
                    }
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Get(SvcRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return currSvc;
        }

        public SvcInfo GetByDesc(string svcName)
        {

            SvcInfo currSvc = new SvcInfo();
            string query = string.Format("SELECT * FROM svc WHERE svc_no = @SvcNo");

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
                        cmd.Parameters.AddWithValue("@SvcNo", svcName);
                        MySqlDataReader reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            currSvc = DataMgrTools.BuildSvc(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-GetByDesc(SvcRepository)", System.Diagnostics.EventLogEntryType.Error);
                    conn.Close();
                }
            }
            return currSvc;
        }

        public SvcInfo Add(SvcInfo currSvc)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO svc (svc_id, svc_no, interchange_id) " +
                        "VALUES (@SvcID, @SvcNo, @InterchangeID)";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@SvcID", currSvc.SvcID);
                        cmd.Parameters.AddWithValue("@SvcNo", currSvc.SvcNo);
                        cmd.Parameters.AddWithValue("@InterchangeID", currSvc.InterchangeID);
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(SvcRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return currSvc;
        }

        public bool Remove(int svcID)
        {
            bool retVal = false;
            string query = string.Format("DELETE FROM svc WHERE interchange_id = {0}", svcID);
            
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
                Logger.LogEvent(ex.Message + "-Remove(SvcRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return retVal;
        }

        public bool Update(SvcInfo currSvc)
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
                        cmd.CommandText = "UPDATE svc SET svc_no = @SvcNo, interchange_id = @InterchangeID WHERE svc_id = @SvcID";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@SvcNo", currSvc.SvcNo);
                        cmd.Parameters.AddWithValue("@InterchangeID", currSvc.InterchangeID);
                        cmd.Parameters.AddWithValue("@SvcID", currSvc.SvcID);

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
                Logger.LogEvent(ex.Message + "-Update(SvcRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }

        
    }
}