using FMSWebApi.Models;
using FMSWebApi.Properties;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Hosting;

namespace FMSWebApi.Repository
{
    public class RegionRepository : IRegionRepository
    {
        private string mConnStr = Settings.Default.DB;
        private string mProjName = "FMS-Singapore";
        public IEnumerable<RegionInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<RegionInfo> arrRegion = new List<RegionInfo>();

            if (conn != null)
                conn.Close();

            return arrRegion.ToArray();
        }
        public RegionInfo GetByName(string regionName, int companyID)
        {
            RegionInfo currRegion = new RegionInfo();

            if (string.IsNullOrEmpty(regionName))
            {
                currRegion.ErrorMessage = Consts.ERR_REGIONERROR;
                return currRegion;
            }

            string query = string.Format("SELECT * FROM area_covered_region WHERE region_name = @Name and company_id = @CompanyID");

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = query;
                        
                        cmd.Parameters.AddWithValue("@Name", regionName.Trim());
                        cmd.Parameters.AddWithValue("@CompanyID", companyID);
                        MySqlDataReader reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            currRegion = DataMgrTools.BuildRegion(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-GetByName(RegionRepository)", System.Diagnostics.EventLogEntryType.Error);
                    conn.Close();
                }
            }
            return currRegion;
        }

        public IEnumerable<RegionInfo> GetByCompanyID(RegionInfo param)
        {

            List<RegionInfo> arrRegion = new List<RegionInfo>();
            RegionInfo currRegion = new RegionInfo();
            object objTemp = new object();

            string query = "SELECT * FROM area_covered_region WHERE company_id = @CompanyID";
            if (!string.IsNullOrEmpty(param.RegionName)) query += " and region_name = @RegionName";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        
                        cmd.Parameters.AddWithValue("@CompanyID", param.CompanyID);
                        cmd.Parameters.AddWithValue("@RegionName", param.RegionName);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currRegion = DataMgrTools.BuildRegion(reader);
                                    currRegion.ErrorMessage = "Success";
                                    arrRegion.Add(currRegion);
                                }
                            }
                            else
                            {
                                currRegion.RegionID = 0;
                                currRegion.RegionName = param.RegionName;
                                currRegion.ErrorMessage = "Not Found";
                                arrRegion.Add(currRegion);
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(GetByID)", System.Diagnostics.EventLogEntryType.Error);

                }


            }

            return arrRegion;
        }

 
        public RegionInfo Get(int id)
        {
            RegionInfo currRegion = new RegionInfo();
            string query = string.Format("SELECT * FROM area_covered_region WHERE acr_id = {0}", id);
            
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
                            currRegion = DataMgrTools.BuildRegion(reader);
                        }
                        
                    }
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Get(RegionRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return currRegion;
        }


        public RegionInfo Add(RegionInfo currRegion)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO area_covered_region (company_id, region_name) " +
                                                                  "VALUES (@CompanyID, @RegionName)";
                        
                        cmd.Parameters.AddWithValue("@CompanyID", currRegion.CompanyID);
                        cmd.Parameters.AddWithValue("@RegionName", currRegion.RegionName);

                        cmd.ExecuteNonQuery();
                        long id = cmd.LastInsertedId;
                        currRegion.RegionID = id;

                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(RegionRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return currRegion;
        }

        public bool Remove(int id)
        {
            bool retVal = false;
            string query = string.Format("DELETE FROM area_covered_region WHERE acr_id = {0}", id);
            
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
                        conn.Close();
                    }   
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Remove(RegionRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return retVal;
        }

        public bool Update(RegionInfo currRegion)
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
                        cmd.CommandText = "UPDATE area_covered_region SET company_id = @CompanyID, region_name = @RegionName " +
                                                                "WHERE acr_id = @RegionID";
                        
                        cmd.Parameters.AddWithValue("@CompanyID", currRegion.CompanyID);
                        cmd.Parameters.AddWithValue("@RegionName", currRegion.RegionName);
                        cmd.Parameters.AddWithValue("@RegionID", currRegion.RegionID);  

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
                Logger.LogEvent(ex.Message + "-Update(RegionRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }




    }
}