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
    public class DepotRepository : IDepotRepository
    {      
        //private string mConnStr = "server=localhost;uid=root;pwd=$B$Transit888;database=adas;charset=utf8;max pool size=500;";
        //private string mConnStr = "server=localhost;uid=root;pwd=$B$Transit888;database=adas;charset=utf8;max pool size=500;default command timeout=999;";
        private string mConnStr = "server=localhost;uid=root;pwd=$B$Transit888;database=adas;charset=utf8;max pool size=500;default command timeout=99999;";

        public IEnumerable<DepotInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<DepotInfo> arrDepot = new List<DepotInfo>();

            try
            {
                conn.ConnectionString = mConnStr;
                conn.Open();

                cmd.CommandText = "depot";
                cmd.Connection = conn;
                cmd.CommandType = CommandType.TableDirect;
                MySqlDataReader reader = cmd.ExecuteReader();

                //Console.WriteLine(String.Format("Total Data: {0}", dbRdr.FieldCount));

                if ((reader != null) && (reader.HasRows))
                {
                    while (reader.Read())
                    {
                        DepotInfo currDepot = DataMgrTools.BuildDepot(reader);
                        arrDepot.Add(currDepot);
                    }
                }
                conn.Close();
            }
            catch (MySqlException ex)
            {
                Logger.LogEvent(ex.Message + "-GetAll(DepotRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            if (conn != null)
                conn.Close();

            return arrDepot.ToArray();
        }

        public DepotInfo Get(int depotID)
        {
            DepotInfo currDepot = new DepotInfo();
            string query = string.Format("SELECT * FROM depot WHERE depot_id = {0}", depotID);
            
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
                            currDepot = DataMgrTools.BuildDepot(reader);
                        }
                        
                    }
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Get(DepotRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return currDepot;
        }

        public DepotInfo GetByDesc(string depotName)
        {

            DepotInfo currDepot = new DepotInfo();
            string query = string.Format("SELECT * FROM depot WHERE name = @Name");

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
                        cmd.Parameters.AddWithValue("@Name", depotName);
                        MySqlDataReader reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            currDepot = DataMgrTools.BuildDepot(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-GetByDesc(DepotRepository)", System.Diagnostics.EventLogEntryType.Error);
                    conn.Close();
                }
            }
            return currDepot;
        }

        public DepotInfo Add(DepotInfo currDepot)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO depot (depot_id, name) " +
                        "VALUES (@DepotID, @Name)";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@DepotID", currDepot.DepotID);
                        cmd.Parameters.AddWithValue("@Name", currDepot.Name);
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(DepotRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return currDepot;
        }

        public bool Remove(int depotID)
        {
            bool retVal = false;
            string query = string.Format("DELETE FROM depot WHERE depot_id = {0}", depotID);
            
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
                Logger.LogEvent(ex.Message + "-Remove(DepotRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return retVal;
        }

        public bool Update(DepotInfo currDepot)
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
                        cmd.CommandText = "UPDATE depot SET name = @Name WHERE depot_id = @DepotID";
                        cmd.Prepare();
                        
                        cmd.Parameters.AddWithValue("@Name", currDepot.Name);
                        cmd.Parameters.AddWithValue("@DepotID", currDepot.DepotID);

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
                Logger.LogEvent(ex.Message + "-Update(DepotRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }

        
    }
}