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
    public class InterchangeRepository : IInterchangeRepository
    {
        //private string mConnStr = "server=localhost;uid=root;pwd=$B$Transit888;database=adas;charset=utf8;max pool size=500;default command timeout=999;";
        private string mConnStr = "server=localhost;uid=root;pwd=$B$Transit888;database=adas;charset=utf8;max pool size=500;default command timeout=99999;";
        private string mProjName = "SBS";

        public IEnumerable<InterchangeInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<InterchangeInfo> arrInterchange = new List<InterchangeInfo>();

            try
            {
                conn.ConnectionString = mConnStr;
                conn.Open();

                cmd.CommandText = "interchange";
                cmd.Connection = conn;
                cmd.CommandType = CommandType.TableDirect;
                MySqlDataReader reader = cmd.ExecuteReader();

                //Console.WriteLine(String.Format("Total Data: {0}", dbRdr.FieldCount));

                if ((reader != null) && (reader.HasRows))
                {
                    while (reader.Read())
                    {
                        InterchangeInfo currInterchange = DataMgrTools.BuildInterchange(reader);
                        arrInterchange.Add(currInterchange);
                    }
                }
                conn.Close();
            }
            catch (MySqlException ex)
            {
                Logger.LogEvent(ex.Message + "-GetAll(InterchangeRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            if (conn != null)
                conn.Close();

            return arrInterchange.ToArray();
        }

        public IEnumerable<InterchangeInfo> GetInterchange(InterchangeInfo param)
        {

            List<InterchangeInfo> arrInterchange = new List<InterchangeInfo>();
            InterchangeInfo currInterchange = new InterchangeInfo();
            object objTemp = new object();

            string query = "SELECT * FROM interchange WHERE depot_id IN (" + param.Depot + ")";

            if (param.InterchangeID > 0) query += " and interchange_id = @InterchangeID";


            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@InterchangeID", param.InterchangeID);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currInterchange = DataMgrTools.BuildInterchange(reader);
                                    arrInterchange.Add(currInterchange);
                                    currInterchange.Depot = param.Depot;
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(GetInterchange)", System.Diagnostics.EventLogEntryType.Error);

                }


            }

            return arrInterchange;
        }

        public InterchangeInfo Get(int interchangeID)
        {
            InterchangeInfo currInterchange = new InterchangeInfo();
            string query = string.Format("SELECT * FROM interchange WHERE interchange_id = {0}", interchangeID);
            
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
                            currInterchange = DataMgrTools.BuildInterchange(reader);
                        }
                        
                    }
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Get(InterchangeRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return currInterchange;
        }

        public InterchangeInfo GetByDesc(string interchangeName)
        {

            InterchangeInfo currInterchange = new InterchangeInfo();
            string query = string.Format("SELECT * FROM interchange WHERE name = @Name");

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
                        cmd.Parameters.AddWithValue("@Name", interchangeName);
                        MySqlDataReader reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            currInterchange = DataMgrTools.BuildInterchange(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-GetByDesc(InterchangeRepository)", System.Diagnostics.EventLogEntryType.Error);
                    conn.Close();
                }
            }
            return currInterchange;
        }

        public InterchangeInfo Add(InterchangeInfo currInterchange)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO interchange (interchange_id, name, depot_id, desc) " +
                        "VALUES (@InterchangeID, @Name, @DepotID, @Desc)";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@InterchangeID", currInterchange.InterchangeID);
                        cmd.Parameters.AddWithValue("@Name", currInterchange.Name);
                        cmd.Parameters.AddWithValue("@DepotID", currInterchange.DepotID);
                        cmd.Parameters.AddWithValue("@Desc", currInterchange.Desc);
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(InterchangeRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return currInterchange;
        }

        public bool Remove(int interchangeID)
        {
            bool retVal = false;
            string query = string.Format("DELETE FROM interchange WHERE interchange_id = {0}", interchangeID);
            
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
                Logger.LogEvent(ex.Message + "-Remove(InterchangeRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return retVal;
        }

        public bool Update(InterchangeInfo currInterchange)
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
                        cmd.CommandText = "UPDATE interchange SET name = @Name, depot_id = @DepotID, desc = @Desc WHERE depot_id = @InterchangeID";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@Name", currInterchange.Name);
                        cmd.Parameters.AddWithValue("@DepotID", currInterchange.DepotID);
                        cmd.Parameters.AddWithValue("@Desc", currInterchange.Desc);
                        cmd.Parameters.AddWithValue("@InterchangeID", currInterchange.InterchangeID);

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
                Logger.LogEvent(ex.Message + "-Update(InterchangeRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }

        
    }
}