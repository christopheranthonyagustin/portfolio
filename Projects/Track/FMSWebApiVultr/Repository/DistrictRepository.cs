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
    public class DistrictRepository : IDistrictRepository
    {
        private string mConnStr = Settings.Default.DB;
        private string mProjName = "FMS-Singapore";
        public IEnumerable<DistrictInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<DistrictInfo> arrDistrict = new List<DistrictInfo>();

            if (conn != null)
                conn.Close();

            return arrDistrict.ToArray();
        }
        public IEnumerable<DistrictInfo> GetByCompanyID(DistrictInfo param)
        {

            List<DistrictInfo> arrDistrict = new List<DistrictInfo>();
            DistrictInfo currDistrict = new DistrictInfo();
            object objTemp = new object();

            string query = "SELECT * FROM area_covered_district WHERE company_id = @CompanyID";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        
                        cmd.Parameters.AddWithValue("@CompanyID", param.CompanyID);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currDistrict = DataMgrTools.BuildDistrict(reader);
                                    arrDistrict.Add(currDistrict);
                                }
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

            return arrDistrict;
        }

 
        public DistrictInfo Get(int id)
        {
            DistrictInfo currDistrict = new DistrictInfo();
            string query = string.Format("SELECT * FROM area_covered_district WHERE district_id = {0}", id);
            
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
                            currDistrict = DataMgrTools.BuildDistrict(reader);
                        }
                        
                    }
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Get(DistrictRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return currDistrict;
        }


        public DistrictInfo Add(DistrictInfo currDistrict)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO area_covered_district (company_id, postal_district, postal_sector, general_location, area_covered_region_id) " +
                                                                     "VALUES (@CompanyID, @PostalDistrict, @PostalSector, @GeneralLocation, @RegionID)";
                        
                        cmd.Parameters.AddWithValue("@CompanyID", currDistrict.CompanyID);
                        cmd.Parameters.AddWithValue("@PostalDistrict", currDistrict.PostalDistrict);
                        cmd.Parameters.AddWithValue("@PostalSector", currDistrict.PostalSector);
                        cmd.Parameters.AddWithValue("@GeneralLocation", currDistrict.GeneralLocation);
                        cmd.Parameters.AddWithValue("@RegionID", currDistrict.RegionID);

                        cmd.ExecuteNonQuery();
                        long id = cmd.LastInsertedId;
                        currDistrict.DistrictID = id;

                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(DistrictRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return currDistrict;
        }

        public bool Remove(int id)
        {
            bool retVal = false;
            string query = string.Format("DELETE FROM area_covered_district WHERE district_id = {0}", id);
            
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
                Logger.LogEvent(ex.Message + "-Remove(DistrictRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return retVal;
        }

        public bool Update(DistrictInfo currDistrict)
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
                        cmd.CommandText = "UPDATE area_covered_district SET company_id = @CompanyID, postal_district = @PostalDistrict, postal_sector = @PostalSector, general_location = @GeneralLocation, area_covered_region_id = @RegionID " +
                                                                "WHERE district_id = @DistrictID";
                        
                        cmd.Parameters.AddWithValue("@CompanyID", currDistrict.CompanyID);
                        cmd.Parameters.AddWithValue("@PostalDistrict", currDistrict.PostalDistrict);
                        cmd.Parameters.AddWithValue("@PostalSector", currDistrict.PostalSector);
                        cmd.Parameters.AddWithValue("@GeneralLocation", currDistrict.GeneralLocation);
                        cmd.Parameters.AddWithValue("@RegionID", currDistrict.RegionID);
                        cmd.Parameters.AddWithValue("@DistrictID", currDistrict.DistrictID);  

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
                Logger.LogEvent(ex.Message + "-Update(DistrictRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }




    }
}