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
    public class DeviceTypeRepository : IDeviceTypeRepository
    {
        private string mConnStr = Settings.Default.DB;
        private string mProjName = "SBS";

        public IEnumerable<DeviceTypeInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<DeviceTypeInfo> arrAssets = new List<DeviceTypeInfo>();

            try
            {
                conn.ConnectionString = mConnStr;
                conn.Open();

                cmd.CommandText = "tag_types";
                cmd.Connection = conn;
                cmd.CommandType = CommandType.TableDirect;
                MySqlDataReader reader = cmd.ExecuteReader();

                //Console.WriteLine(String.Format("Total Data: {0}", dbRdr.FieldCount));

                if ((reader != null) && (reader.HasRows))
                {
                    while (reader.Read())
                    {
                        DeviceTypeInfo currDeviceType = DataMgrTools.BuildDeviceType(reader);
                        arrAssets.Add(currDeviceType);
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

        public DeviceTypeInfo Get(int devicetypeID)
        {
            DeviceTypeInfo currDeviceType = new DeviceTypeInfo();
            string query = string.Format("SELECT * FROM tag_types WHERE tag_typeid = {0}", devicetypeID);

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
                            currDeviceType = DataMgrTools.BuildDeviceType(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(DeviceTypeRepository)", System.Diagnostics.EventLogEntryType.Error);
                    conn.Close();
                }
            }
            return currDeviceType;
        }

        public DeviceTypeInfo Add(DeviceTypeInfo currDeviceType)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO tag_types (tag_typeid, name, supplier) " +
                            "VALUES (@DeviceTypeID, @Name, @Supplier)";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@DeviceTypeID", currDeviceType.DeviceTypeID);
                        cmd.Parameters.AddWithValue("@Name", currDeviceType.Name);
                        cmd.Parameters.AddWithValue("@Supplier", currDeviceType.Supplier);
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(DeviceTypeRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return currDeviceType;
        }

        public bool Remove(int devicetypeID)
        {
            bool retVal = false;
            string query = string.Format("DELETE FROM tag_types WHERE type_id = {0}", devicetypeID);

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
                    Logger.LogEvent(ex.Message + "-Remove(DeviceTypeRepository)", System.Diagnostics.EventLogEntryType.Error);
                }
            }

            return retVal;
        }

        public bool Update(DeviceTypeInfo currDeviceType)
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
                            cmd.CommandText = "UPDATE tag_types SET type_id = @DeviceTypeID, name = @Name, supplier = @Supplier" +
                                                    "WHERE type_id = @ZoneTypeID";
                            cmd.Prepare();
                            cmd.Parameters.AddWithValue("@DeviceTypeID", currDeviceType.DeviceTypeID);
                            cmd.Parameters.AddWithValue("@Name", currDeviceType.Name);
                            cmd.Parameters.AddWithValue("@Supplier", currDeviceType.Supplier);

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
                Logger.LogEvent(ex.Message + "-Update(DeviceTypeRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }
    }
}