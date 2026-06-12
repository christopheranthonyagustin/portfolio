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
    public class VrpInitLocationRepository : IVrpInitLocationRepository
    {
        private string mConnStr = Settings.Default.DB;
        private string mProjName = "FMS-Singapore";
        public IEnumerable<VrpInitLocationInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<VrpInitLocationInfo> arrVrpInitLocation = new List<VrpInitLocationInfo>();

            if (conn != null)
                conn.Close();

            return arrVrpInitLocation.ToArray();
        }
        public IEnumerable<VrpInitLocationInfo> GetByRouteNo(VrpInitLocationInfo param)
        {

            List<VrpInitLocationInfo> arrVrpInitLocation = new List<VrpInitLocationInfo>();
            VrpInitLocationInfo currVrpInitLocation = new VrpInitLocationInfo();
            object objTemp = new object();

            string query = "SELECT * FROM vrp_init_locations WHERE route_no = @RouteNo";


            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        
                        cmd.Parameters.AddWithValue("@RouteNo", param.RouteNo);


                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currVrpInitLocation = DataMgrTools.BuildVrpInitLlocation(reader);
                                    arrVrpInitLocation.Add(currVrpInitLocation);
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

            return arrVrpInitLocation;
        }

 
        public VrpInitLocationInfo Get(int id)
        {
            VrpInitLocationInfo currVrpInitLocation = new VrpInitLocationInfo();
            string query = string.Format("SELECT * FROM vrp_init_locations WHERE init_locations_id = {0}", id);
            
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
                            currVrpInitLocation = DataMgrTools.BuildVrpInitLlocation(reader);
                        }
                        
                    }
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Get(VrpInitLocationRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return currVrpInitLocation;
        }


        public VrpInitLocationInfo Add(VrpInitLocationInfo currVrpInitLocation)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO vrp_init_locations (route_no, latitude, longitude, address, demands, service_duration, load_duration, unload_duration, waiting_duration, item_no, node, deliver_to_node, time_window_start, time_window_end) " +
                                  "VALUES (@RouteNo, @Lat, @Long, @Address, @Demands, @ServiceDuration, @LoadDuration, @UnloadDuration, @WaitingDuration, @ItemNo, @Node, @DeliverToNode, @TimeWindowStart, @TimeWindowEnd)";
                        
                        cmd.Parameters.AddWithValue("@RouteNo", currVrpInitLocation.RouteNo);
                        cmd.Parameters.AddWithValue("@Lat", currVrpInitLocation.Lat);
                        cmd.Parameters.AddWithValue("@Long", currVrpInitLocation.Long);
                        cmd.Parameters.AddWithValue("@Address", currVrpInitLocation.Address);
                        cmd.Parameters.AddWithValue("@Demands", currVrpInitLocation.Demands);
                        cmd.Parameters.AddWithValue("@ServiceDuration", currVrpInitLocation.ServiceDuration);
                        cmd.Parameters.AddWithValue("@LoadDuration", currVrpInitLocation.LoadDuration);
                        cmd.Parameters.AddWithValue("@UnloadDuration", currVrpInitLocation.UnloadDuration);
                        cmd.Parameters.AddWithValue("@WaitingDuration", currVrpInitLocation.WaitingDuration);
                        cmd.Parameters.AddWithValue("@ItemNo", currVrpInitLocation.ItemNo);
                        cmd.Parameters.AddWithValue("@Node", currVrpInitLocation.Node);
                        cmd.Parameters.AddWithValue("@DeliverToNode", currVrpInitLocation.DeliverToNode);
                        cmd.Parameters.AddWithValue("@TimeWindowStart", currVrpInitLocation.TimeWindowStart);
                        cmd.Parameters.AddWithValue("@TimeWindowEnd", currVrpInitLocation.TimeWindowEnd);
                        cmd.ExecuteNonQuery();
                        long id = cmd.LastInsertedId;
                        currVrpInitLocation.InitialLocationID = id;

                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(VrpInitLocationRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return currVrpInitLocation;
        }

        public bool Remove(int id)
        {
            bool retVal = false;
            string query = string.Format("DELETE FROM vrp_init_locations WHERE init_locations_id = {0}", id);
            
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
                Logger.LogEvent(ex.Message + "-Remove(VrpInitLocationRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return retVal;
        }

        public bool Update(VrpInitLocationInfo currVrpInitLocation)
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
                        cmd.CommandText = "UPDATE vrp_init_locations SET route_no = @RouteNo, latitude = @Lat, longitude = @Long, address = @Address, demands = @Demands, service_duration = @ServiceDuration, load_duration = @LoadDuration, unload_duration = @UnloadDuration, " + 
                                                                "waiting_duration = @WaitingDuration, item_no = @ItemNo, node = @Node, deliver_to_node = @DeliverToNode, time_window_start = @TimeWindowStart, time_window_end = @TimeWindowEnd " +
                                                                "WHERE init_locations_id = @InitialLocationID";
                        
                        cmd.Parameters.AddWithValue("@RouteNo", currVrpInitLocation.RouteNo);
                        cmd.Parameters.AddWithValue("@Lat", currVrpInitLocation.Lat);
                        cmd.Parameters.AddWithValue("@Long", currVrpInitLocation.Long);
                        cmd.Parameters.AddWithValue("@Address", currVrpInitLocation.Address);
                        cmd.Parameters.AddWithValue("@Demands", currVrpInitLocation.Demands);
                        cmd.Parameters.AddWithValue("@ServiceDuration", currVrpInitLocation.ServiceDuration);
                        cmd.Parameters.AddWithValue("@LoadDuration", currVrpInitLocation.LoadDuration);
                        cmd.Parameters.AddWithValue("@UnloadDuration", currVrpInitLocation.UnloadDuration);
                        cmd.Parameters.AddWithValue("@WaitingDuration", currVrpInitLocation.WaitingDuration);
                        cmd.Parameters.AddWithValue("@ItemNo", currVrpInitLocation.ItemNo);
                        cmd.Parameters.AddWithValue("@Node", currVrpInitLocation.Node);
                        cmd.Parameters.AddWithValue("@DeliverToNode", currVrpInitLocation.DeliverToNode);
                        cmd.Parameters.AddWithValue("@TimeWindowStart", currVrpInitLocation.TimeWindowStart);
                        cmd.Parameters.AddWithValue("@TimeWindowEnd", currVrpInitLocation.TimeWindowEnd);
                        cmd.Parameters.AddWithValue("@InitialLocationID", currVrpInitLocation.InitialLocationID);  

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
                Logger.LogEvent(ex.Message + "-Update(VrpInitLocationRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }

        
    }
}