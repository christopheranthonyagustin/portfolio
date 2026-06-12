using FMSWebApi.Models;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace FMSWebApi.Repository
{
    public class LocationRepository : ILocationRepository
    {
        //private string mConnStr = "server=127.0.0.1;uid=root;pwd=12345;database=test;";
        private string mConnStr = "server=103.237.168.119;uid=root;pwd=@c3c0M;database=tracksg;max pool size=500;";
        private string mProjName = "FMS-Singapore";
        public IEnumerable<LocationInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<LocationInfo> arrLocations = new List<LocationInfo>();

            if (conn != null)
                conn.Close();

            return arrLocations.ToArray();
        }

        public LocationInfo Get(int locID)
        {
            LocationInfo currLocation = new LocationInfo();
            string query = string.Format("SELECT * FROM locations WHERE loc_id = {0}", locID);

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
                            currLocation = DataMgrTools.BuildLocation(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(CategoryRepository)", System.Diagnostics.EventLogEntryType.Error);
                    conn.Close();
                }
            }
            return currLocation;
        }

        public LocationInfo GetByName(string catName)
        {
            LocationInfo currLocation = new LocationInfo();
            string query = string.Format("SELECT * FROM categories WHERE category_desc = @Cat");

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
                        cmd.Parameters.AddWithValue("@Cat", catName.Trim());
                        MySqlDataReader reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            currLocation = DataMgrTools.BuildLocation(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-GetByName(CategoryRepository)", System.Diagnostics.EventLogEntryType.Error);
                }
            }
            return currLocation;
        }

        public LocationInfo Add(LocationInfo currLocation)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO categories (category_id, category_desc) " +
                            "VALUES (@locID, @CategoryDesc)";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@locID", currLocation.LocationID);
                        cmd.Parameters.AddWithValue("@CategoryDesc", currLocation.Segment);
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(LocationRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return currLocation;
        }

        public bool Remove(int locID)
        {
            bool retVal = false;
            string query = string.Format("DELETE FROM locations WHERE location_id = {0}", locID);

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
                    Logger.LogEvent(ex.Message + "-Remove(LocationRepository)", System.Diagnostics.EventLogEntryType.Error);
                }
            }

            return retVal;
        }

        public bool Update(LocationInfo currLocation)
        {
            bool retVal = false;
            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "UPDATE locations SET category_id = @locID, category_desc = @CategoryDesc" +
                                                "WHERE category_id = @locID";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@locID", currLocation.LocationID);
                        cmd.Parameters.AddWithValue("@CategoryDesc", currLocation.Segment);

                        if (cmd.ExecuteNonQuery() == 1)
                            retVal = true;
                        else
                            retVal = false;
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Update(LocationRepository)", System.Diagnostics.EventLogEntryType.Error);
                }
            }

            return retVal;
        }
    }
}