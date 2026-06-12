using FMSWebApi.Models;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.IO;
using System.Web.Hosting;
using System.Configuration;
using System.Web.UI.WebControls;
using FMSWebApi.Properties;

namespace FMSWebApi.Repository
{
    public class MaintenanceRepository : IMaintenanceRepository
    {
        private string mConnStr = "server=localhost;uid=root;pwd=@c3c0M;database=sp;Charset=utf8;max pool size=500;default command timeout=999999;";
        private string mProjName = "SP";
        public IEnumerable<MaintenanceInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<MaintenanceInfo> arrMaintenance = new List<MaintenanceInfo>();

            try
            {
                conn.ConnectionString = mConnStr;
                conn.Open();

                cmd.CommandText = "view_maintenance";
                cmd.Connection = conn;
                cmd.CommandType = CommandType.TableDirect;
                MySqlDataReader reader = cmd.ExecuteReader();

                if ((reader != null) && (reader.HasRows))
                {
                    while (reader.Read())
                    {
                        MaintenanceInfo currMaintenance = DataMgrTools.BuildMaintenance(reader);
                        arrMaintenance.Add(currMaintenance);
                    }
                }
                conn.Close();
            }
            catch (MySqlException ex)
            {
                Logger.LogEvent(mProjName, "GetAll Maintenance: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }

            if (conn != null)
                conn.Close();

            return arrMaintenance.ToArray();
        }
        public IEnumerable<MaintenanceInfo> GetAllEx()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<MaintenanceInfo> arrMaintenance = new List<MaintenanceInfo>();

            return arrMaintenance.ToArray();
        }
        public IEnumerable<MaintenanceInfo> GetMaintenance(MaintenanceInfo param)
        {
            List<MaintenanceInfo> arrMaintenance = new List<MaintenanceInfo>();
            MaintenanceInfo currMaintenance = new MaintenanceInfo();

            string query = "";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    query = "SELECT * FROM view_maintenance WHERE company_id = @CompanyID";

                    if (!string.IsNullOrEmpty(param.ParamFlag)) query += " and flag IN (" + param.ParamFlag + ")";
                    query += " order by timestamp desc LIMIT 10";

                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@CompanyID", param.CompanyID);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currMaintenance = DataMgrTools.BuildMaintenance(reader);
                                    currMaintenance.ReferenceNo = GetReferenceNo(currMaintenance.MaintenanceID);
                                    if (string.IsNullOrEmpty(currMaintenance.ReferenceNo)) currMaintenance.ReferenceNo = "No Reference No.";
                                    arrMaintenance.Add(currMaintenance);
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(Maintenance)", System.Diagnostics.EventLogEntryType.Error);

                }


            }

            return arrMaintenance;
        }
        public IEnumerable<MaintenanceInfo> GetMaintenanceFilter(MaintenanceInfo param)
        {
            List<MaintenanceInfo> arrMaintenance = new List<MaintenanceInfo>();
            MaintenanceInfo currMaintenance = new MaintenanceInfo();

            string query = "";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    query = "SELECT * FROM view_maintenance WHERE company_id = @CompanyID";

                    if (!string.IsNullOrEmpty(param.CusCompany)) query += " and cus_company like '%" + param.CusCompany + "%'";
                    if (!string.IsNullOrEmpty(param.PIC)) query += " and pic like '%" + param.PIC + "%'";
                    if (!string.IsNullOrEmpty(param.Postal)) query += " and postal like '%" + param.Postal + "%'";
                    if (!string.IsNullOrEmpty(param.Address)) query += " and address like '%" + param.Address + "%'";
                    if (!string.IsNullOrEmpty(param.Phone)) query += " and phone like '%" + param.Phone + "%'";
                    if (param.ContractStart != DateTime.MinValue && param.ContractEnd != DateTime.MinValue) query += " and contract_start between @StartTS and @EndTS";
                    query += " order by timestamp desc";

                    Logger.LogEvent("Get(Maintenance Filter) - " + query, System.Diagnostics.EventLogEntryType.Warning);

                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@CompanyID", param.CompanyID);
                        cmd.Parameters.AddWithValue("@StartTS", param.ContractStart);
                        cmd.Parameters.AddWithValue("@EndTS", param.ContractEnd);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currMaintenance = DataMgrTools.BuildMaintenance(reader);
                                    currMaintenance.ReferenceNo = GetReferenceNo(currMaintenance.MaintenanceID);
                                    if (string.IsNullOrEmpty(currMaintenance.ReferenceNo)) currMaintenance.ReferenceNo = "No Reference No.";
                                    arrMaintenance.Add(currMaintenance);
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(Maintenance Filter)", System.Diagnostics.EventLogEntryType.Error);

                }


            }

            return arrMaintenance;
        }
        public string GetReferenceNo(long maintenanceID)
        {
            MaintenanceJobInfo currMaintenanceJob = new MaintenanceJobInfo();
            string query = string.Format("SELECT * FROM view_maintenance_job where maintenance_id = {0} and reference_no IS NOT NULL order by timestamp asc LIMIT 1", maintenanceID);

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
                            currMaintenanceJob = DataMgrTools.BuildMaintenanceJob(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(mProjName, "GetReferenceNo: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                }
            }

            return currMaintenanceJob.ReferenceNo;
        }
        public List<MaintenanceJobInfo> GetMaintenanceJob(long maintenanceID)
        {
            List<MaintenanceJobInfo> arrMaintenanceJob = new List<MaintenanceJobInfo>();
            MaintenanceJobInfo currMaintenanceJob = new MaintenanceJobInfo();
            string query = string.Format("SELECT * FROM view_maintenance_job where maintenance_id = {0} order by timestamp asc", maintenanceID);

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
                            currMaintenanceJob = DataMgrTools.BuildMaintenanceJob(reader);
                            arrMaintenanceJob.Add(currMaintenanceJob);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(mProjName, "GetMaintenanceJob: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                }
            }

            return arrMaintenanceJob;
        }
        public IEnumerable<MaintenanceInfo> GetNextMaintenance(MaintenanceInfo param)
        {
            List<MaintenanceInfo> arrMaintenance = new List<MaintenanceInfo>();
            MaintenanceInfo currMaintenance = new MaintenanceInfo();

            string query = "";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    query = "SELECT * FROM view_maintenance WHERE company_id = @CompanyID";

                    if (!string.IsNullOrEmpty(param.ParamFlag)) query += " and flag IN (" + param.ParamFlag + ")";
                    query += " order by timestamp desc";

                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@CompanyID", param.CompanyID);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currMaintenance = DataMgrTools.BuildMaintenance(reader);
                                    currMaintenance.MaintenanceJob = GetNextMaintenanceJob(currMaintenance.MaintenanceID);
                                    arrMaintenance.Add(currMaintenance);
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(Maintenance)", System.Diagnostics.EventLogEntryType.Error);
                }

            }

            return arrMaintenance;
        }
        public IEnumerable<MaintenanceInfo> GetAutoCompleteCompany(MaintenanceInfo param)
        {
            List<MaintenanceInfo> arrMaintenance = new List<MaintenanceInfo>();
            MaintenanceInfo currMaintenance = new MaintenanceInfo();

            string query = "";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    query = "SELECT * FROM view_maintenance WHERE company_id = @CompanyID";
                    if (!string.IsNullOrEmpty(param.CusCompany)) query += " and cus_company like '%" + param.CusCompany + "%'";
                    if (!string.IsNullOrEmpty(param.ParamFlag)) query += " and flag IN (" + param.ParamFlag + ")";
                    query += " group by cus_company order by cus_company asc LIMIT 100";

                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@CompanyID", param.CompanyID);
                        cmd.Parameters.AddWithValue("@CusCompany", param.CusCompany);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currMaintenance = DataMgrTools.BuildMaintenance(reader);
                                    currMaintenance.MaintenanceJob = GetNextMaintenanceJob(currMaintenance.MaintenanceID);
                                    arrMaintenance.Add(currMaintenance);
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(Maintenance)", System.Diagnostics.EventLogEntryType.Error);
                }

            }

            return arrMaintenance;
        }
        public IEnumerable<MaintenanceInfo> GetAutoCompleteAddress(MaintenanceInfo param)
        {
            List<MaintenanceInfo> arrMaintenance = new List<MaintenanceInfo>();
            MaintenanceInfo currMaintenance = new MaintenanceInfo();

            string query = "";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    query = "SELECT * FROM view_maintenance WHERE company_id = @CompanyID";
                    if (!string.IsNullOrEmpty(param.Address)) query += " and address like '%" + param.Address + "%'";
                    if (!string.IsNullOrEmpty(param.ParamFlag)) query += " and flag IN (" + param.ParamFlag + ")";
                    query += " group by address order by address asc LIMIT 100";

                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@CompanyID", param.CompanyID);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currMaintenance = DataMgrTools.BuildMaintenance(reader);
                                    currMaintenance.MaintenanceJob = GetNextMaintenanceJob(currMaintenance.MaintenanceID);
                                    arrMaintenance.Add(currMaintenance);
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(Maintenance)", System.Diagnostics.EventLogEntryType.Error);
                }

            }

            return arrMaintenance;
        }
        public List<MaintenanceJobInfo> GetNextMaintenanceJob(long maintenanceID)
        {
            List<MaintenanceJobInfo> arrMaintenanceJob = new List<MaintenanceJobInfo>();
            MaintenanceJobInfo currMaintenanceJob = new MaintenanceJobInfo();
            string query = string.Format("SELECT * FROM view_maintenance_job where maintenance_id = {0} and flag > 0 and timestamp >= CURDATE() order by timestamp asc limit 1", maintenanceID);

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
                            currMaintenanceJob = DataMgrTools.BuildMaintenanceJob(reader);
                            arrMaintenanceJob.Add(currMaintenanceJob);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(mProjName, "GetMaintenanceJob: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                }
            }

            return arrMaintenanceJob;
        }
        public MaintenanceInfo Get(int maintenanceID)
        {
            MaintenanceInfo currMaintenance = new MaintenanceInfo();
            string query = string.Format("SELECT * FROM view_maintenance WHERE maintenance_id = {0}", maintenanceID);

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
                            currMaintenance = DataMgrTools.BuildMaintenance(reader);
                            currMaintenance.ReferenceNo = GetReferenceNo(currMaintenance.MaintenanceID);
                            if (string.IsNullOrEmpty(currMaintenance.ReferenceNo)) currMaintenance.ReferenceNo = "No Reference No.";
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(mProjName, "Get: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                }
            }
            return currMaintenance;
        }
        public MaintenanceInfo Add(MaintenanceInfo currMaintenance)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO maintenance (company_id, timestamp, rx_time, remarks, user_id, " +
                                                                 "address, postal, unit, cus_company, pic, phone, email, site, " +
                                                                 "contract_start, contract_end, maintenance_interval, notification_interval)" +
                                                          " VALUES (@CompanyID, @Timestamp, @RxTime, @Remarks, @UserID, " +
                                                                  "@Address, @Postal, @Unit, @CusCompany, @PIC, @Phone, @Email, @Site, " +
                                                                  "@ContractStart, @ContractEnd, @MaintenanceInterval, @NotificationInterval)";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@CompanyID", currMaintenance.CompanyID);
                        cmd.Parameters.AddWithValue("@Timestamp", currMaintenance.Timestamp);
                        cmd.Parameters.AddWithValue("@RxTime", currMaintenance.RxTime);
                        cmd.Parameters.AddWithValue("@Remarks", currMaintenance.Remarks);
                        cmd.Parameters.AddWithValue("@UserID", currMaintenance.UserID);
                        cmd.Parameters.AddWithValue("@Address", currMaintenance.Address);
                        cmd.Parameters.AddWithValue("@Postal", currMaintenance.Postal);
                        cmd.Parameters.AddWithValue("@Unit", currMaintenance.Unit);
                        cmd.Parameters.AddWithValue("@CusCompany", currMaintenance.CusCompany);
                        cmd.Parameters.AddWithValue("@PIC", currMaintenance.PIC);
                        cmd.Parameters.AddWithValue("@Phone", currMaintenance.Phone);
                        cmd.Parameters.AddWithValue("@Email", currMaintenance.Email);
                        cmd.Parameters.AddWithValue("@Site", currMaintenance.Site);
                        cmd.Parameters.AddWithValue("@ContractStart", currMaintenance.ContractStart);
                        cmd.Parameters.AddWithValue("@ContractEnd", currMaintenance.ContractEnd);
                        cmd.Parameters.AddWithValue("@MaintenanceInterval", currMaintenance.MaintenanceInterval);
                        cmd.Parameters.AddWithValue("@NotificationInterval", currMaintenance.NotificationInterval);
                        cmd.ExecuteNonQuery();

                        long id = cmd.LastInsertedId;
                        currMaintenance.MaintenanceID = id;

                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(MaintenanceRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return currMaintenance;
        }
        public bool Remove(int jobID)
        {
            bool retVal = false;
            string query = "";
            MaintenanceJobInfo currMaintenanceJob = new MaintenanceJobInfo();
            List<MaintenanceJobInfo> arrMaintenanceJob = new List<MaintenanceJobInfo>();

            try
            {
                query = string.Format("SELECT * FROM view_maintenance_job WHERE maintenance_id = {0}", jobID);

                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        cmd.Prepare();

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currMaintenanceJob = DataMgrTools.BuildMaintenanceJob(reader);
                                    arrMaintenanceJob.Add(currMaintenanceJob);
                                }
                            }
                        }
                        conn.Close();
                    }

                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Remove(Select MaintenanceJobRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            try
            {
                for (int i = 0; i < arrMaintenanceJob.Count; i++)
                {
                    query = string.Format("DELETE FROM main_pests_treatment where maintenancejob_id = {0}", arrMaintenanceJob[i].MaintenanceJobID);
                    //Logger.LogEvent(arrMaintenanceJob[i].MaintenanceJobID + "-Maintenance Job ID", System.Diagnostics.EventLogEntryType.Warning);
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
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Remove(Pest and Treatment)", System.Diagnostics.EventLogEntryType.Error);
            }

            try
            {
                query = string.Format("DELETE FROM maintenance_job WHERE maintenance_id = {0}", jobID);

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
                Logger.LogEvent(ex.Message + "-Remove(MaintenanceJobRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            try
            {

                query = string.Format("DELETE FROM maintenance WHERE maintenance_id = {0}", jobID);

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
                Logger.LogEvent(ex.Message + "-Remove(MaintenanceRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }
        public bool Update(MaintenanceInfo currMaintenance)
        {
            bool retVal = false;
            if (currMaintenance.CompanyID == 0) currMaintenance.CompanyID = 1;

            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "UPDATE maintenance SET company_id = @CompanyID, timestamp = @Timestamp, rx_time = @RxTime, remarks = @Remarks, user_id = @UserID, " +
                                          "address = @Address, postal = @Postal, unit = @Unit, cus_company = @CusCompany, pic = @PIC, phone = @Phone, email = @Email, site = @Site, " +
                                          "contract_start = @ContractStart, contract_end = @ContractEnd, maintenance_interval = @MaintenanceInterval, notification_interval = @NotificationInterval WHERE maintenance_id = @MaintenanceID";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@CompanyID", currMaintenance.CompanyID);
                        cmd.Parameters.AddWithValue("@Timestamp", currMaintenance.Timestamp);
                        cmd.Parameters.AddWithValue("@RxTime", currMaintenance.RxTime);
                        cmd.Parameters.AddWithValue("@Remarks", currMaintenance.Remarks);
                        cmd.Parameters.AddWithValue("@UserID", currMaintenance.UserID);
                        cmd.Parameters.AddWithValue("@Address", currMaintenance.Address);
                        cmd.Parameters.AddWithValue("@Postal", currMaintenance.Postal);
                        cmd.Parameters.AddWithValue("@Unit", currMaintenance.Unit);
                        cmd.Parameters.AddWithValue("@CusCompany", currMaintenance.CusCompany);
                        cmd.Parameters.AddWithValue("@PIC", currMaintenance.PIC);
                        cmd.Parameters.AddWithValue("@Phone", currMaintenance.Phone);
                        cmd.Parameters.AddWithValue("@Email", currMaintenance.Email);
                        cmd.Parameters.AddWithValue("@Site", currMaintenance.Site);
                        cmd.Parameters.AddWithValue("@ContractStart", currMaintenance.ContractStart);
                        cmd.Parameters.AddWithValue("@ContractEnd", currMaintenance.ContractEnd);
                        cmd.Parameters.AddWithValue("@MaintenanceInterval", currMaintenance.MaintenanceInterval);
                        cmd.Parameters.AddWithValue("@NotificationInterval", currMaintenance.NotificationInterval);
                        cmd.Parameters.AddWithValue("@MaintenanceID", currMaintenance.MaintenanceID);

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
                Logger.LogEvent(ex.Message + "-Update(MaintenanceRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }
        public string GetImage(string strName, ref string strFill)
        {
            try
            {
                // loop through image file types
                List<string> arrTypes = new List<string>() { "jpg", "png", "gif", "bmp", "pdf" };
                foreach (string strType in arrTypes)
                {
                    string strTemp = String.Format("{0}.{1}", strName, strType);
                    string strFile = String.Format("{0}images\\{1}", HostingEnvironment.ApplicationPhysicalPath, strTemp);
                    string strUri = String.Format("{0}/images/{1}", ConfigurationManager.AppSettings["ServerPath"], strTemp);

                    // check file path
                    if (File.Exists(strFile))
                    {
                        // return image path
                        strFill = "Uniform";
                        return String.Format("{0}?dt={1:ddMMMyyHHmmss}", strUri, File.GetLastWriteTimeUtc(strFile));
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogEvent("Get Image: ", ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }

            // image file not found
            strFill = "None";
            return strName;
        }
        private int ConvertToInt(string system)
        {
            int retVal = 0;
            int.TryParse(system, out retVal);
            return retVal;
        }

    }
}