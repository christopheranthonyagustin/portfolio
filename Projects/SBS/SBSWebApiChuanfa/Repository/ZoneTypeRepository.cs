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
    public class ZoneTypeRepository : IZoneTypeRepository
    {
        //private string mConnStr = "server=localhost;uid=root;pwd=$B$Transit888;database=adas;charset=utf8;max pool size=500;default command timeout=999;";
        private string mConnStr = "server=localhost;uid=root;pwd=$B$Transit888;database=adas;charset=utf8;max pool size=500;default command timeout=99999;";
        private string mProjName = "SBS";
        public IEnumerable<ZoneTypeInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<ZoneTypeInfo> arrAssets = new List<ZoneTypeInfo>();

            try
            {
                conn.ConnectionString = mConnStr;
                conn.Open();

                cmd.CommandText = "zone_types";
                cmd.Connection = conn;
                cmd.CommandType = CommandType.TableDirect;
                MySqlDataReader reader = cmd.ExecuteReader();

                //Console.WriteLine(String.Format("Total Data: {0}", dbRdr.FieldCount));

                if ((reader != null) && (reader.HasRows))
                {
                    while (reader.Read())
                    {
                        ZoneTypeInfo currAsset = DataMgrTools.BuildZoneType(reader);
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

        public ZoneTypeInfo Get(int zonetypeID)
        {
            ZoneTypeInfo currAsset = new ZoneTypeInfo();
            string query = string.Format("SELECT * FROM zone_types WHERE type_id = {0}", zonetypeID);

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
                            currAsset = DataMgrTools.BuildZoneType(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(ZoneTypeRepository)", System.Diagnostics.EventLogEntryType.Error);
                    conn.Close();
                }
            }
            return currAsset;
        }

        public ZoneTypeInfo Add(ZoneTypeInfo currZoneType)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO zone_types (type_id, name, color) " +
                            "VALUES (@ZoneTypeID, @Name, @Color)";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@ZoneTypeID", currZoneType.ZoneTypeID);
                        cmd.Parameters.AddWithValue("@Name", currZoneType.Name);
                        cmd.Parameters.AddWithValue("@Color", currZoneType.Color);
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {

            }

            return currZoneType;
        }

        public bool Remove(int zonetypeID)
        {
            bool retVal = false;
            string query = string.Format("DELETE FROM zone_types WHERE type_id = {0}", zonetypeID);

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

        public bool Update(ZoneTypeInfo currZoneType)
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
                            cmd.CommandText = "UPDATE zones_types SET type_id = @ZoneTypeID, name = @Name, color = @Color" +
                                                    "WHERE type_id = @ZoneTypeID";
                            cmd.Prepare();
                            cmd.Parameters.AddWithValue("@ZoneTypeID", currZoneType.ZoneTypeID);
                            cmd.Parameters.AddWithValue("@Name", currZoneType.Name);
                            cmd.Parameters.AddWithValue("@Color", currZoneType.Color);

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