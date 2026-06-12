using FMSWebApi.Models;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace FMSWebApi.Repository
{
    public class FindingsMaintenanceRepository : IFindingsMaintenanceRepository
    {
        //private string mConnStr = "server=127.0.0.1;uid=root;pwd=12345;database=test;";
        private string mConnStr = "server=localhost;uid=root;pwd=@c3c0M;database=sp;max pool size=500;";
        private string mProjName = "SP";
        public IEnumerable<FindingsMaintenanceInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<FindingsMaintenanceInfo> arrFindings = new List<FindingsMaintenanceInfo>();

            try
            {
                conn.ConnectionString = mConnStr;
                conn.Open();

                cmd.CommandText = "findings_maintenance";
                cmd.Connection = conn;
                cmd.CommandType = CommandType.TableDirect;
                MySqlDataReader reader = cmd.ExecuteReader();

                //Console.WriteLine(String.Format("Total Data: {0}", dbRdr.FieldCount));

                if ((reader != null) && (reader.HasRows))
                {
                    while (reader.Read())
                    {
                        FindingsMaintenanceInfo currFindings = DataMgrTools.BuildFindingsMaintenance(reader);
                        arrFindings.Add(currFindings);
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

            return arrFindings.ToArray();
        }

        public FindingsMaintenanceInfo Get(int findingsID)
        {
            FindingsMaintenanceInfo currFindings = new FindingsMaintenanceInfo();
            string query = string.Format("SELECT * FROM findings_maintenance WHERE findingsmaintenance_id = {0}", findingsID);

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
                            currFindings = DataMgrTools.BuildFindingsMaintenance(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(FindingsMaintenanceRepository)", System.Diagnostics.EventLogEntryType.Error);
                    conn.Close();
                }
            }
            return currFindings;
        }

        public FindingsMaintenanceInfo Add(FindingsMaintenanceInfo currFindings)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO findings_maintenance (maintenancejob_id, pest_desc, aoc_desc, findings, item_no) " +
                                                        "VALUES (@MaintenanceJobID, @PestDesc, @AocDesc, @Findings, @ItemNo)";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@MaintenanceJobID", currFindings.MaintenanceJobID);
                        cmd.Parameters.AddWithValue("@PestDesc", currFindings.PestDesc);
                        cmd.Parameters.AddWithValue("@AocDesc", currFindings.AocDesc);
                        cmd.Parameters.AddWithValue("@Findings", currFindings.Findings);
                        cmd.Parameters.AddWithValue("@ItemNo", currFindings.ItemNo);
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(FindingsMaintenanceRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return currFindings;
        }

        public bool Remove(int id)
        {
            bool retVal = false;
            string query = string.Format("DELETE FROM findings_maintenance WHERE findingsmaintenance_id = {0}", id);

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
                    Logger.LogEvent(ex.Message + "-Remove(FindingsMaintenanceRepository)", System.Diagnostics.EventLogEntryType.Error);
                }
            }

            return retVal;
        }

        public bool Update(FindingsMaintenanceInfo currFindings)
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
                        cmd.CommandText = "UPDATE findings_maintenance SET maintenancejob_id = @MaintenanceJobID, pest_desc = @PestDesc, aoc_desc = @AocDesc, findings = @Findings,item_no = @ItemNo" +
                                                " WHERE findingsmaintenance_id = @FindingsMaintenanceID";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@MaintenanceJobID", currFindings.MaintenanceJobID);
                        cmd.Parameters.AddWithValue("@PestDesc", currFindings.PestDesc);
                        cmd.Parameters.AddWithValue("@AocDesc", currFindings.AocDesc);
                        cmd.Parameters.AddWithValue("@Findings", currFindings.Findings);
                        cmd.Parameters.AddWithValue("@ItemNo", currFindings.ItemNo);
                        cmd.Parameters.AddWithValue("@FindingsMaintenanceID", currFindings.FindingsMaintenanceID);

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
                Logger.LogEvent(ex.Message + "-Update(FindingsMaintenanceRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }

        public FindingsMaintenanceInfo GetByFindings(FindingsMaintenanceInfo param)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "DELETE FROM findings_maintenance WHERE maintenancejob_id = @MaintenanceJobID";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@MaintenanceJobID", param.MaintenanceJobID);
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Remove(FindingsMaintenanceRepository-GetByFindings)", System.Diagnostics.EventLogEntryType.Error);
            }

            return param;
        }
    }
}