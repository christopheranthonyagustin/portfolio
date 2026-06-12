using FMSWebApi.Models;
using FMSWebApi.Properties;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Http;

namespace FMSWebApi.Repository
{
    public class RoleRepository : IRoleRepository
    {
        //private string mConnStr = "server=localhost;uid=root;pwd=$B$Transit888;database=adas;charset=utf8;max pool size=500;";
        private string mConnStr = "server=localhost;uid=root;pwd=$B$Transit888;database=adas;charset=utf8;max pool size=500;default command timeout=99999;";
        private string mProjName = "SBS";
        public IEnumerable<RoleInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<RoleInfo> arrAssets = new List<RoleInfo>();

            try
            {
                conn.ConnectionString = mConnStr;
                conn.Open();

                cmd.CommandText = "roles";
                cmd.Connection = conn;
                cmd.CommandType = CommandType.TableDirect;
                MySqlDataReader reader = cmd.ExecuteReader();

                //Console.WriteLine(String.Format("Total Data: {0}", dbRdr.FieldCount));

                if ((reader != null) && (reader.HasRows))
                {
                    while (reader.Read())
                    {
                        RoleInfo currAsset = DataMgrTools.BuildRole(reader);
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

        public IEnumerable<RoleInfo> GetByRoleID(RoleInfo param)
        {

            List<RoleInfo> arrRoles = new List<RoleInfo>();
            RoleInfo currRole = new RoleInfo();
            object objTemp = new object();

            string query = "SELECT * FROM view_roles WHERE role_id >= @RoleID";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@RoleID", param.RoleID);
                        cmd.Parameters.AddWithValue("@RoleDesc", param.RoleDesc);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currRole = DataMgrTools.BuildRole(reader);
                                    arrRoles.Add(currRole);
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(GetByRoleID)", System.Diagnostics.EventLogEntryType.Error);
                }
            }

            return arrRoles;
        }

        public RoleInfo GetByRole(string roleName)
        {
            RoleInfo currRole = new RoleInfo();

            if (string.IsNullOrEmpty(roleName))
            {
                currRole.ErrorMessage = Consts.ERR_USER_ROLEERROR;
                return currRole;
            }

            string query = string.Format("SELECT * FROM roles WHERE role_desc = @Roles");

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
                        cmd.Parameters.AddWithValue("@Roles", roleName.Trim());
                        MySqlDataReader reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            currRole = DataMgrTools.BuildRole(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-GetByRole(RoleRepository)", System.Diagnostics.EventLogEntryType.Error);
                    conn.Close();
                }
            }
            return currRole;
        }

        public RoleInfo Get(int roleID)
        {
            RoleInfo currAsset = new RoleInfo();
            string query = string.Format("SELECT * FROM roles WHERE role_id = {0}", roleID);

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
                            currAsset = DataMgrTools.BuildRole(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    conn.Close();
                }
            }
            return currAsset;
        }

        public int GetByUserID(int iUserID)
        {
            
            string query = string.Format("SELECT role_id FROM users WHERE user_id = {0}", iUserID);

            int iRoleID = 3;

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        // check user role


                        object objTemp = cmd.ExecuteScalar();
                        if (objTemp != null) iRoleID = Convert.ToInt32(objTemp);

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    conn.Close();

                }
            }
            Logger.LogEvent("-(GetByUserID)" + iRoleID, System.Diagnostics.EventLogEntryType.Information);
            return iRoleID;
        }

        public RoleInfo Add(RoleInfo currRole)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO roles (role_id, role_desc) " +
                            "VALUES (@RoleID, @RoleDesc)";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@RoleID", currRole.RoleID);
                        cmd.Parameters.AddWithValue("@RoleDesc", currRole.RoleDesc);
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {

            }

            return currRole;
        }

        public bool Remove(int roleID)
        {
            bool retVal = false;
            string query = string.Format("DELETE FROM roles WHERE role_id = {0}", roleID);

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

        public bool Update(RoleInfo currRole)
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
                            cmd.CommandText = "UPDATE roles SET role_id = @RoleID, role_desc = @RoleDesc" +
                                                    "WHERE role_id = @RoleID";
                            cmd.Prepare();
                            cmd.Parameters.AddWithValue("@RoleID", currRole.RoleID);
                            cmd.Parameters.AddWithValue("@RoleDesc", currRole.RoleDesc);

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