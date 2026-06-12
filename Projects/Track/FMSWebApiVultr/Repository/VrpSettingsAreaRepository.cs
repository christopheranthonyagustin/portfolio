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
    public class VrpSettingsAreaRepository : IVrpSettingsAreaRepository
    {
        private string mConnStr = Settings.Default.DB;
        private string mProjName = "FMS-Singapore";
        public IEnumerable<VrpSettingsAreaInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<VrpSettingsAreaInfo> arrVrpSettings = new List<VrpSettingsAreaInfo>();

            if (conn != null)
                conn.Close();

            return arrVrpSettings.ToArray();
        }
        public IEnumerable<VrpSettingsAreaInfo> GetById(VrpSettingsAreaInfo param)
        {

            List<VrpSettingsAreaInfo> arrVrpSettings = new List<VrpSettingsAreaInfo>();
            VrpSettingsAreaInfo currVrpSettings = new VrpSettingsAreaInfo();
            object objTemp = new object();

            string query = "SELECT * FROM vrp_settings_area WHERE company_id = @CompanyID";

            if (param.VrpSettingsID > 0) query += " and vrp_settings_id = @VrpSettingsID";
            if ((param.Timestamp != DateTime.MinValue && param.RxTime != DateTime.MinValue)) query += " and timestamp between @StartTS and @EndTS";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        
                        cmd.Parameters.AddWithValue("@CompanyID", param.CompanyID);
                        cmd.Parameters.AddWithValue("@StartTS", param.Timestamp);
                        cmd.Parameters.AddWithValue("@EndTS", param.RxTime);
                        cmd.Parameters.AddWithValue("@VrpSettingsID", param.VrpSettingsID);


                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currVrpSettings = DataMgrTools.BuildVrpSettingsArea(reader);
                                    arrVrpSettings.Add(currVrpSettings);
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(GetByRouteNo)", System.Diagnostics.EventLogEntryType.Error);

                }


            }

            return arrVrpSettings;
        }

 
        public VrpSettingsAreaInfo Get(int id)
        {
            VrpSettingsAreaInfo currVrpSettings = new VrpSettingsAreaInfo();
            string query = string.Format("SELECT * FROM vrp_settings_area WHERE vsa_id = {0}", id);
            
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
                            currVrpSettings = DataMgrTools.BuildVrpSettingsArea(reader);
                        }
                        
                    }
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Get(VrpSettingsAreaRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return currVrpSettings;
        }


        public VrpSettingsAreaInfo Add(VrpSettingsAreaInfo currVrpSettings)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO vrp_settings_area (vrp_settings_id, area_covered_region_id, timestamp, rx_time, company_id) " +
                                                                 "VALUES (@VrpSettingsID, @RegionID, @Timestamp, @RxTime, @CompanyID)";
                        
                        cmd.Parameters.AddWithValue("@VrpSettingsID", currVrpSettings.VrpSettingsID);
                        cmd.Parameters.AddWithValue("@RegionID", currVrpSettings.RegionID);
                        cmd.Parameters.AddWithValue("@Timestamp", currVrpSettings.Timestamp);
                        cmd.Parameters.AddWithValue("@RxTime", currVrpSettings.RxTime);
                        cmd.Parameters.AddWithValue("@CompanyID", currVrpSettings.CompanyID);
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(VrpSettingsAreaRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return currVrpSettings;
        }

        public bool Remove(int id)
        {
            bool retVal = false;
            string query = string.Format("DELETE FROM vrp_settings_area WHERE vsa_id = {0}", id);
            
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
                Logger.LogEvent(ex.Message + "-Remove(VrpSettingsAreaRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return retVal;
        }

        public bool Update(VrpSettingsAreaInfo currVrpSettings)
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
                        cmd.CommandText = "UPDATE vrp_settings_area SET vrp_settings_id = @VrpSettingsID, area_covered_region_id = @RegionID, timestamp = @Timestamp, rx_time = @RxTime, company_id = @CompanyID " +
                                                                 "WHERE vsa_id = @VrpSettingsAreaID";
                        
                        cmd.Parameters.AddWithValue("@VrpSettingsID", currVrpSettings.VrpSettingsID);
                        cmd.Parameters.AddWithValue("@RegionID", currVrpSettings.RegionID);
                        cmd.Parameters.AddWithValue("@Timestamp", currVrpSettings.Timestamp);
                        cmd.Parameters.AddWithValue("@RxTime", currVrpSettings.RxTime);
                        cmd.Parameters.AddWithValue("@CompanyID", currVrpSettings.CompanyID);
                        cmd.Parameters.AddWithValue("@VrpSettingsAreaID", currVrpSettings.VrpSettingsAreaID);  

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
                Logger.LogEvent(ex.Message + "-Update(VrpSettingsAreaRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }

        public bool RemoveVrpSettingsArea(VrpSettingsAreaInfo currVrpSettings)
        {
            bool retVal = false;
            string query = string.Format("DELETE FROM vrp_settings_area WHERE vrp_settings_id = @VrpSettingsID");

            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        
                        cmd.Parameters.AddWithValue("@VrpSettingsID", currVrpSettings.VrpSettingsID);
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
                Logger.LogEvent(ex.Message + "-RemoveVrpSettingsArea", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }


    }
}