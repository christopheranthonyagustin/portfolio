using FMSWebApi.Models;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using FMSWebApi.Properties;

namespace FMSWebApi.Repository
{
    public class DepartmentRepository : IDepartmentRepository
    {
        private string mConnStr = Settings.Default.DB;
        private string mProjName = "FMS-Singapore";
        public IEnumerable<DepartmentInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<DepartmentInfo> arrDepartment = new List<DepartmentInfo>();

            try
            {
                conn.ConnectionString = mConnStr;
                conn.Open();

                cmd.CommandText = "driver_department order by department_id";
                cmd.Connection = conn;
                cmd.CommandType = CommandType.TableDirect;
                MySqlDataReader reader = cmd.ExecuteReader();

                if ((reader != null) && (reader.HasRows))
                {
                    while (reader.Read())
                    {
                        DepartmentInfo currDepartment = DataMgrTools.BuildDepartment(reader);
                        arrDepartment.Add(currDepartment);
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

            return arrDepartment.ToArray();
        }

        public DepartmentInfo Get(int deptID)
        {
            DepartmentInfo currDepartment = new DepartmentInfo();
            string query = string.Format("SELECT * FROM driver_department WHERE department_id = {0}", deptID);

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
                            currDepartment = DataMgrTools.BuildDepartment(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(DepartmentRepository)", System.Diagnostics.EventLogEntryType.Error);
                }
            }
            return currDepartment;
        }

        public DepartmentInfo GetByName(string desc)
        {
            DepartmentInfo currDepartment = new DepartmentInfo();
            string query = string.Format("SELECT * FROM driver_department WHERE description = @Desc");

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = query;
                        
                        cmd.Parameters.AddWithValue("@Desc", desc.Trim());
                        MySqlDataReader reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            currDepartment = DataMgrTools.BuildDepartment(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-GetByName(DepartmentRepository)", System.Diagnostics.EventLogEntryType.Error);
                }
            }
            return currDepartment;
        }

        public DepartmentInfo Add(DepartmentInfo currDepartment)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO driver_department (department_id, description) " +
                                                          "VALUES (@DepartmentID, @DepartmentDesc)";
                        
                        cmd.Parameters.AddWithValue("@DepartmentID", currDepartment.DepartmentID);
                        cmd.Parameters.AddWithValue("@DepartmentDesc", currDepartment.DepartmentDesc);
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(DepartmentRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return currDepartment;
        }

        public bool Remove(int deptID)
        {
            bool retVal = false;
            string query = string.Format("DELETE FROM driver_department WHERE department_id = {0}", deptID);

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
                    Logger.LogEvent(ex.Message + "-Delete(DepartmentRepository)", System.Diagnostics.EventLogEntryType.Error);
                }
            }

            return retVal;
        }

        public bool Update(DepartmentInfo currDepartment)
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
                        cmd.CommandText = "UPDATE driver_department SET description = @DepartmentDesc " +
                                                               "WHERE department_id = @DepartmentID";
                        
                        cmd.Parameters.AddWithValue("@DepartmentID", currDepartment.DepartmentID);
                        cmd.Parameters.AddWithValue("@DepartmentDesc", currDepartment.DepartmentDesc);

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
                Logger.LogEvent(ex.Message + "-Update(DepartmentRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }
    }
}