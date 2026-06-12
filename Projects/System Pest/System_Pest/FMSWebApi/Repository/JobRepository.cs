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
    public class JobRepository : IJobRepository
    {
        private string mConnStr = "server=localhost;uid=root;pwd=@c3c0M;database=sp;Charset=utf8;max pool size=500;";
        private string mProjName = "SP";
        public IEnumerable<JobInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<JobInfo> arrJobs = new List<JobInfo>();

            return arrJobs.ToArray();
        }
        public IEnumerable<JobOverviewInfo> GetAllOverview()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<JobOverviewInfo> arrJobs = new List<JobOverviewInfo>();

            return arrJobs.ToArray();
        }
        public IEnumerable<AppInfo> Clear()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<AppInfo> arrJobs = new List<AppInfo>();

            return arrJobs.ToArray();
        }
        public IEnumerable<JobInfo> ClearJobs()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<JobInfo> arrJobs = new List<JobInfo>();

            return arrJobs.ToArray();
        }
        public IEnumerable<JobInfo> GetHistory(JobInfo param)
        {
            List<JobInfo> arrJobs = new List<JobInfo>();
            JobInfo currJob = new JobInfo();
            object objTemp = new object();

            string query = "SELECT * FROM view_jobs WHERE (timestamp between @StartTS and @EndTS)";

            if (param.AssetResellerID > 0) query += " and reseller_id = @AssetResellerID";

            if (param.AssetCompanyID == 1) query += " and company_id IN (1,3)";
            else query += " and company_id = @AssetCompanyID";


            if (param.Flag > 0) query += " and flag >= @Flag";
            if (!string.IsNullOrEmpty(param.FlagValue)) query += " and flag_value = @FlagValue";
            if (param.UserID > 0) query += " and user_id = @UserID";
            if (param.DriverID > 0) query += " and driver_id = @DriverID";
            if (param.AssetID > 0) query += " and asset_id = @AssetID";
            else if (!string.IsNullOrEmpty(param.Asset)) query += " and asset_id = (SELECT asset_id FROM view_assets WHERE name = @AssetName)";

            query += " order by timestamp desc";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@StartTS", param.Timestamp);
                        cmd.Parameters.AddWithValue("@EndTS", param.RxTime);
                        cmd.Parameters.AddWithValue("@AssetResellerID", param.AssetResellerID);
                        cmd.Parameters.AddWithValue("@AssetCompanyID", param.AssetCompanyID);
                        cmd.Parameters.AddWithValue("@FlagValue", param.FlagValue);
                        cmd.Parameters.AddWithValue("@UserID", param.UserID);
                        cmd.Parameters.AddWithValue("@DriverID", param.DriverID);
                        cmd.Parameters.AddWithValue("@Flag", param.Flag);
                        if (param.AssetID > 0) cmd.Parameters.AddWithValue("@AssetID", param.AssetID);
                        else if (!string.IsNullOrEmpty(param.Asset)) cmd.Parameters.AddWithValue("@AssetName", param.Asset);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currJob = DataMgrTools.BuildJob(reader);
                                    string strFill = "";
                                    currJob.TechSignatures = GetImage(String.Format("techniciansignatures/{0}", currJob.JobID), ref strFill);
                                    currJob.TechSignaturesFill = strFill;
                                    currJob.ClientSignatures = GetImage(String.Format("clientsignatures/{0}", currJob.JobID), ref strFill);
                                    currJob.ClientSignaturesFill = strFill;
                                    currJob.Forms = GetImage(String.Format("forms/{0}", currJob.JobID), ref strFill);
                                    currJob.FormsFill = strFill;
                                    currJob.Pest = GetPestTreatment(currJob.JobID);
                                    currJob.Findings = GetFindings(currJob.JobID);
                                    arrJobs.Add(currJob);
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(ByCompany)", System.Diagnostics.EventLogEntryType.Error);

                }

                if (param.AssetCompanyID == 1 || param.AssetCompanyID == 3)
                {
                    try
                    {
                        using (MySqlCommand cmd = new MySqlCommand(query, conn))
                        {
                            conn.Open();
                            for (int i = 0; i < arrJobs.Count; i++)
                            {
                                query = string.Format("SELECT * FROM area_covered where postal_sector = {0}", arrJobs[i].Postal.ToString().Substring(0, 2));
                                cmd.CommandText = query;
                                cmd.Connection = conn;
                                cmd.CommandType = CommandType.Text;
                                using (MySqlDataReader reader = cmd.ExecuteReader())
                                {
                                    AcInfo currAc = new AcInfo();
                                    if ((reader != null) && (reader.HasRows))
                                    {
                                        while (reader.Read())
                                        {
                                            currAc = DataMgrTools.BuildAc(reader);
                                            arrJobs[i].AcInfo = currAc;
                                        }
                                    }
                                    else
                                    {
                                        arrJobs[i].AcInfo = currAc;
                                    }

                                }
                            }
                            conn.Close();
                        }
                    }
                    catch (Exception ex)
                    {
                        Logger.LogEvent("GetByCompany-areacovered: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                    }
                }

                if (param.AssetCompanyID == 2)
                {
                    try
                    {
                        using (MySqlCommand cmd = new MySqlCommand(query, conn))
                        {
                            conn.Open();
                            for (int i = 0; i < arrJobs.Count; i++)
                            {
                                query = string.Format("SELECT * FROM area_covered_my WHERE {0} BETWEEN lower_bound AND upper_bound order by lower_bound desc LIMIT 1", arrJobs[i].Postal);
                                cmd.CommandText = query;
                                cmd.Connection = conn;
                                cmd.CommandType = CommandType.Text;
                                using (MySqlDataReader reader = cmd.ExecuteReader())
                                {
                                    AcMyInfo currAcMy = new AcMyInfo();
                                    if ((reader != null) && (reader.HasRows))
                                    {
                                        while (reader.Read())
                                        {
                                            currAcMy = DataMgrTools.BuildAcMy(reader);
                                            arrJobs[i].AcMyInfo = currAcMy;
                                        }
                                    }
                                    else
                                    {
                                        arrJobs[i].AcMyInfo = currAcMy;
                                    }

                                }
                            }
                            conn.Close();
                        }
                    }
                    catch (Exception ex)
                    {
                        Logger.LogEvent("GetByCompany-areacovered: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                    }
                }

            }

            return arrJobs;
        }
        public IEnumerable<JobOverviewInfo> GetJobOverview(JobOverviewInfo param)
        {
            List<JobOverviewInfo> arrJobs = new List<JobOverviewInfo>();
            JobOverviewInfo currJob = new JobOverviewInfo();
            object objTemp = new object();

            string query = "";

            if (param.AssetCompanyID == 1 || param.AssetCompanyID == 3)
            {
                query = "SELECT * FROM view_jobs_sg WHERE (timestamp between @StartTS and @EndTS)";
            }
            else if (param.AssetCompanyID == 2)
            {
                query = "SELECT * FROM view_jobs_my WHERE (timestamp between @StartTS and @EndTS)";
            }

            if (param.AssetResellerID > 0) query += " and reseller_id = @AssetResellerID";

            if (param.AssetCompanyID == 1) query += " and company_id IN (1,3)";
            else query += " and company_id = @AssetCompanyID";

            if (param.Flag > 0) query += " and flag >= @Flag";
            if (!string.IsNullOrEmpty(param.FlagValue)) query += " and flag_value = @FlagValue";
            if (param.UserID > 0) query += " and user_id = @UserID";
            if (param.DriverID > 0) query += " and driver_id = @DriverID";
            if (!string.IsNullOrEmpty(param.Groups)) query += " and groups_ac = @Groups";

            if (param.AssetID > 0) query += " and asset_id = @AssetID";
            else if (!string.IsNullOrEmpty(param.Asset)) query += " and asset_id = (SELECT asset_id FROM view_assets WHERE name = @AssetName)";

            query += " order by timestamp asc";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@StartTS", param.Timestamp);
                        //cmd.Parameters.AddWithValue("@EndTS", param.RxTime);
                        cmd.Parameters.AddWithValue("@EndTS", param.Timestamp.AddMinutes(1679));
                        cmd.Parameters.AddWithValue("@AssetResellerID", param.AssetResellerID);
                        cmd.Parameters.AddWithValue("@AssetCompanyID", param.AssetCompanyID);
                        cmd.Parameters.AddWithValue("@FlagValue", param.FlagValue);
                        cmd.Parameters.AddWithValue("@UserID", param.UserID);
                        cmd.Parameters.AddWithValue("@DriverID", param.DriverID);
                        cmd.Parameters.AddWithValue("@FormType", param.FormType);
                        cmd.Parameters.AddWithValue("@Flag", param.Flag);
                        cmd.Parameters.AddWithValue("@Groups", param.Groups);
                        if (param.AssetID > 0) cmd.Parameters.AddWithValue("@AssetID", param.AssetID);
                        else if (!string.IsNullOrEmpty(param.Asset)) cmd.Parameters.AddWithValue("@AssetName", param.Asset);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    
                                    if (param.AssetCompanyID == 1 || param.AssetCompanyID == 3) { currJob = DataMgrTools.BuildJobOverviewSg(reader); }
                                    else if (param.AssetCompanyID == 2) { currJob = DataMgrTools.BuildJobOverviewMy(reader); }
                                    currJob.Pest = GetPestTreatment(currJob.JobID);
                                    arrJobs.Add(currJob);
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(ByCompany)", System.Diagnostics.EventLogEntryType.Error);

                }

            }

            return arrJobs;
        }
        public IEnumerable<JobInfo> GetOverview(JobInfo param)
        {
            List<JobInfo> arrJobs = new List<JobInfo>();
            JobInfo currJob = new JobInfo();
            object objTemp = new object();

            string query = "SELECT * FROM view_jobs WHERE (timestamp between @StartTS and @EndTS)";

            if (param.AssetResellerID > 0) query += " and reseller_id = @AssetResellerID";

            if (param.AssetCompanyID == 1) query += " and company_id IN (1,3)";
            else query += " and company_id = @AssetCompanyID";

            if (param.Flag > 0) query += " and flag >= @Flag";
            if (!string.IsNullOrEmpty(param.FlagValue)) query += " and flag_value = @FlagValue";
            if (param.UserID > 0) query += " and user_id = @UserID";
            if (param.DriverID > 0) query += " and driver_id = @DriverID";

            if (param.AssetID > 0) query += " and asset_id = @AssetID";
            else if (!string.IsNullOrEmpty(param.Asset)) query += " and asset_id = (SELECT asset_id FROM view_assets WHERE name = @AssetName)";

            query += " order by timestamp desc";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@StartTS", param.Timestamp);
                        cmd.Parameters.AddWithValue("@EndTS", param.RxTime);
                        cmd.Parameters.AddWithValue("@AssetResellerID", param.AssetResellerID);
                        cmd.Parameters.AddWithValue("@AssetCompanyID", param.AssetCompanyID);
                        cmd.Parameters.AddWithValue("@FlagValue", param.FlagValue);
                        cmd.Parameters.AddWithValue("@UserID", param.UserID);
                        cmd.Parameters.AddWithValue("@DriverID", param.DriverID);
                        cmd.Parameters.AddWithValue("@FormType", param.FormType);
                        cmd.Parameters.AddWithValue("@Flag", param.Flag);
                        if (param.AssetID > 0) cmd.Parameters.AddWithValue("@AssetID", param.AssetID);
                        else if (!string.IsNullOrEmpty(param.Asset)) cmd.Parameters.AddWithValue("@AssetName", param.Asset);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currJob = DataMgrTools.BuildJob(reader);
                                    string strFill = "";
                                    currJob.TechSignatures = GetImage(String.Format("techniciansignatures/{0}", currJob.JobID), ref strFill);
                                    currJob.TechSignaturesFill = strFill;
                                    currJob.ClientSignatures = GetImage(String.Format("clientsignatures/{0}", currJob.JobID), ref strFill);
                                    currJob.ClientSignaturesFill = strFill;
                                    currJob.Forms = GetImage(String.Format("forms/{0}", currJob.JobID), ref strFill);
                                    currJob.FormsFill = strFill;
                                    currJob.Pest = GetPestTreatment(currJob.JobID);
                                    currJob.Findings = GetFindings(currJob.JobID);
                                    arrJobs.Add(currJob);
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(ByCompany)", System.Diagnostics.EventLogEntryType.Error);

                }

                if (param.AssetCompanyID == 1 || param.AssetCompanyID == 3)
                {
                    try
                    {
                        using (MySqlCommand cmd = new MySqlCommand(query, conn))
                        {
                            conn.Open();
                            for (int i = 0; i < arrJobs.Count; i++)
                            {
                                query = string.Format("SELECT * FROM area_covered where postal_sector = {0}", arrJobs[i].Postal.ToString().Substring(0, 2));
                                cmd.CommandText = query;
                                cmd.Connection = conn;
                                cmd.CommandType = CommandType.Text;
                                using (MySqlDataReader reader = cmd.ExecuteReader())
                                {
                                    AcInfo currAc = new AcInfo();
                                    if ((reader != null) && (reader.HasRows))
                                    {
                                        while (reader.Read())
                                        {
                                            currAc = DataMgrTools.BuildAc(reader);
                                            arrJobs[i].AcInfo = currAc;
                                        }
                                    }
                                    else
                                    {
                                        arrJobs[i].AcInfo = currAc;
                                    }

                                }
                            }
                            conn.Close();
                        }
                    }
                    catch (Exception ex)
                    {
                        Logger.LogEvent("GetByCompany-areacovered: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                    }
                }

                if (param.AssetCompanyID == 2)
                {
                    try
                    {
                        using (MySqlCommand cmd = new MySqlCommand(query, conn))
                        {
                            conn.Open();
                            for (int i = 0; i < arrJobs.Count; i++)
                            {
                                query = string.Format("SELECT * FROM area_covered_my WHERE {0} BETWEEN lower_bound AND upper_bound order by lower_bound desc LIMIT 1", arrJobs[i].Postal);
                                cmd.CommandText = query;
                                cmd.Connection = conn;
                                cmd.CommandType = CommandType.Text;
                                using (MySqlDataReader reader = cmd.ExecuteReader())
                                {
                                    AcMyInfo currAcMy = new AcMyInfo();
                                    if ((reader != null) && (reader.HasRows))
                                    {
                                        while (reader.Read())
                                        {
                                            currAcMy = DataMgrTools.BuildAcMy(reader);
                                            arrJobs[i].AcMyInfo = currAcMy;
                                        }
                                    }
                                    else
                                    {
                                        arrJobs[i].AcMyInfo = currAcMy;
                                    }

                                }
                            }
                            conn.Close();
                        }
                    }
                    catch (Exception ex)
                    {
                        Logger.LogEvent("GetByCompany-areacovered: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                    }
                }

            }

            return arrJobs;
        }
        public IEnumerable<AppInfo> GetByCompany(AppInfo param)
        {
            List<AppInfo> arrJobs = new List<AppInfo>();
            AppInfo currJob = new AppInfo();

            currJob.Timestamp = param.Timestamp;
            currJob.RxTime = param.RxTime;
            currJob.AssetResellerID = param.AssetResellerID;
            currJob.AssetCompanyID = param.AssetCompanyID;
            currJob.Jobs = GetJobs(param.Timestamp, param.RxTime, param.AssetResellerID, param.AssetCompanyID, param.DriverID);
            currJob.Maintenance = GetMaintenanceJob(param.Timestamp, param.RxTime, param.AssetResellerID, param.AssetCompanyID, param.DriverID);
            arrJobs.Add(currJob);

            return arrJobs;
        }
        private List<JobInfo> GetJobs(DateTime timestamp, DateTime rxtime, int reseller_id, int company_id, int driver_id)
        {
            List<JobInfo> arrJobs = new List<JobInfo>();
            JobInfo currJob = new JobInfo();

            string query = "";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    //query = "SELECT * FROM view_jobs WHERE (timestamp between @StartTS and @EndTS)";
                    query = "SELECT * FROM view_jobs WHERE DATE_ADD(timestamp, INTERVAL 8 HOUR) >= CURDATE() - INTERVAL 1 DAY AND DATE_ADD(DATE_ADD(timestamp, INTERVAL 8 HOUR), INTERVAL 1 MINUTE) <= CURDATE() + INTERVAL 2 DAY";
                    if (reseller_id > 0) query += " and reseller_id = @AssetResellerID";
                    if (company_id == 1) query += " and company_id IN (1,3)";
                    else query += " and company_id = @AssetCompanyID";

                    if (driver_id > 0) query += " and driver_id = @DriverID";

                    query += " order by timestamp desc";

                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        cmd.Prepare();
                        //cmd.Parameters.AddWithValue("@StartTS", timestamp);
                        //cmd.Parameters.AddWithValue("@EndTS", rxtime);
                        cmd.Parameters.AddWithValue("@AssetResellerID", reseller_id);
                        cmd.Parameters.AddWithValue("@AssetCompanyID", company_id);
                        cmd.Parameters.AddWithValue("@DriverID", driver_id);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currJob = DataMgrTools.BuildJob(reader);
                                    string strFill = "";
                                    currJob.TechSignatures = GetImage(String.Format("techniciansignatures/{0}", currJob.JobID), ref strFill);
                                    currJob.TechSignaturesFill = strFill;
                                    currJob.ClientSignatures = GetImage(String.Format("clientsignatures/{0}", currJob.JobID), ref strFill);
                                    currJob.ClientSignaturesFill = strFill;
                                    currJob.Forms = GetImage(String.Format("forms/{0}", currJob.JobID), ref strFill);
                                    currJob.FormsFill = strFill;
                                    currJob.Pest = GetPestTreatment(currJob.JobID);
                                    currJob.Findings = GetFindings(currJob.JobID);
                                    arrJobs.Add(currJob);
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(ByCompany)", System.Diagnostics.EventLogEntryType.Error);
                }

                if (company_id == 1 || company_id == 3)
                {
                    try
                    {
                        using (MySqlCommand cmd = new MySqlCommand(query, conn))
                        {
                            conn.Open();
                            for (int i = 0; i < arrJobs.Count; i++)
                            {
                                query = string.Format("SELECT * FROM area_covered where postal_sector = {0}", arrJobs[i].Postal.ToString().Substring(0, 2));
                                cmd.CommandText = query;
                                cmd.Connection = conn;
                                cmd.CommandType = CommandType.Text;
                                using (MySqlDataReader reader = cmd.ExecuteReader())
                                {
                                    AcInfo currAc = new AcInfo();
                                    if ((reader != null) && (reader.HasRows))
                                    {
                                        while (reader.Read())
                                        {
                                            currAc = DataMgrTools.BuildAc(reader);
                                            arrJobs[i].AcInfo = currAc;
                                        }
                                    }
                                    else
                                    {
                                        arrJobs[i].AcInfo = currAc;
                                    }

                                }
                            }
                            conn.Close();
                        }
                    }
                    catch (Exception ex)
                    {
                        Logger.LogEvent("GetByCompany-areacovered: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                    }
                }

                if (company_id == 2)
                {
                    try
                    {
                        using (MySqlCommand cmd = new MySqlCommand(query, conn))
                        {
                            conn.Open();
                            for (int i = 0; i < arrJobs.Count; i++)
                            {
                                query = string.Format("SELECT * FROM area_covered_my WHERE {0} BETWEEN lower_bound AND upper_bound order by lower_bound desc LIMIT 1", arrJobs[i].Postal);
                                cmd.CommandText = query;
                                cmd.Connection = conn;
                                cmd.CommandType = CommandType.Text;
                                using (MySqlDataReader reader = cmd.ExecuteReader())
                                {
                                    AcMyInfo currAcMy = new AcMyInfo();
                                    if ((reader != null) && (reader.HasRows))
                                    {
                                        while (reader.Read())
                                        {
                                            currAcMy = DataMgrTools.BuildAcMy(reader);
                                            arrJobs[i].AcMyInfo = currAcMy;
                                        }
                                    }
                                    else
                                    {
                                        arrJobs[i].AcMyInfo = currAcMy;
                                    }

                                }
                            }
                            conn.Close();
                        }
                    }
                    catch (Exception ex)
                    {
                        Logger.LogEvent("GetByCompany-areacovered: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                    }
                }

            }

            return arrJobs;
        }
        private List<MaintenanceInfo> GetMaintenance(DateTime timestamp, DateTime rxtime, int reseller_id, int company_id, int driver_id)
        {
            List<MaintenanceInfo> arrMaintenance = new List<MaintenanceInfo>();
            MaintenanceInfo currMaintenance = new MaintenanceInfo();
            List<MaintenanceInfo> arrMaintenanceJob = new List<MaintenanceInfo>();

            string query = "";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    query = "SELECT * FROM view_maintenance";
                    if (company_id == 1) query += " WHERE company_id IN (1,3)";
                    else query += " WHERE company_id = @CompanyID";

                    query += " order by timestamp desc";

                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@CompanyID", company_id);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currMaintenance = DataMgrTools.BuildMaintenance(reader);
                                    currMaintenance.MaintenanceJob = GetNextMaintenanceJob(currMaintenance.MaintenanceID, driver_id);
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
        private List<MaintenanceJobApp> GetMaintenanceJob(DateTime timestamp, DateTime rxtime, int reseller_id, int company_id, int driver_id)
        {
            List<MaintenanceJobApp> arrMaintenance = new List<MaintenanceJobApp>();
            MaintenanceJobApp currMaintenance = new MaintenanceJobApp();
            List<MaintenanceJobApp> arrMaintenanceJob = new List<MaintenanceJobApp>();

            string query = "";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    //query = "SELECT * FROM view_maintenance_job_app WHERE (timestamp between @StartTS and @EndTS)";
                    query = "SELECT * FROM view_maintenance_job_app WHERE DATE_ADD(timestamp, INTERVAL 8 HOUR) >= CURDATE() - INTERVAL 1 DAY AND DATE_ADD(DATE_ADD(timestamp, INTERVAL 8 HOUR), INTERVAL 1 MINUTE) <= CURDATE() + INTERVAL 2 DAY";
                    if (company_id == 1) query += " AND company_id IN (1,3)";
                    else query += " AND company_id = @CompanyID";

                    if (driver_id > 0) query += " AND driver_id = @DriverID";

                    query += " order by timestamp desc";

                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@StartTS", timestamp);
                        cmd.Parameters.AddWithValue("@EndTS", rxtime);
                        cmd.Parameters.AddWithValue("@CompanyID", company_id);
                        cmd.Parameters.AddWithValue("@DriverID", driver_id);


                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currMaintenance = DataMgrTools.BuildMaintenanceJobApp(reader);
                                    currMaintenance.Pest = GetMainPestTreatment(currMaintenance.MaintenanceJobID);
                                    currMaintenance.Findings = GetMainFindings(currMaintenance.MaintenanceJobID);
                                    //currMaintenance.MaintenanceJob = GetNextMaintenanceJob(currMaintenance.MaintenanceID, driver_id);
                                    //currMaintenance.ReferenceNo = GetReferenceNo(currMaintenance.MaintenanceID);
                                    //if (string.IsNullOrEmpty(currMaintenance.ReferenceNo)) currMaintenance.ReferenceNo = "No Reference No.";
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
        public List<MaintenanceJobInfo> GetNextMaintenanceJob(long maintenanceID, int driver_id)
        {
            List<MaintenanceJobInfo> arrMaintenanceJob = new List<MaintenanceJobInfo>();
            MaintenanceJobInfo currMaintenanceJob = new MaintenanceJobInfo();  

            string query = "";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {

                    query = "SELECT * FROM view_maintenance_job where maintenance_id = @MaintenanceID and flag > 0";
                    if (driver_id > 0) query += " and driver_id = @DriverID";
                    query += " order by timestamp asc limit 1";

                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@MaintenanceID", maintenanceID);
                        cmd.Parameters.AddWithValue("@DriverID", driver_id);
                        MySqlDataReader reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            currMaintenanceJob = DataMgrTools.BuildMaintenanceJob(reader);
                            currMaintenanceJob.Pest = GetMainPestTreatment(currMaintenanceJob.MaintenanceJobID);
                            currMaintenanceJob.Findings = GetMainFindings(currMaintenanceJob.MaintenanceJobID);
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

        private List<MainPestTreatmentInfo> GetMainPestTreatment(long jobID)
        {
            List<MainPestTreatmentInfo> arrPestTreatment = new List<MainPestTreatmentInfo>();
            MainPestTreatmentInfo currPestTreatment = new MainPestTreatmentInfo();
            string query = string.Format("SELECT * FROM main_pests_treatment where maintenancejob_id = {0} order by item_no asc", jobID);

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
                            currPestTreatment = DataMgrTools.BuildMainPestTreatment(reader);
                            arrPestTreatment.Add(currPestTreatment);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(mProjName, "Main GetPestTreatment: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                }
            }

            return arrPestTreatment;
        }
        private List<FindingsMaintenanceInfo> GetMainFindings(long maintenanceID)
        {
            List<FindingsMaintenanceInfo> arrFindings = new List<FindingsMaintenanceInfo>();
            FindingsMaintenanceInfo currFindingsMaintenance = new FindingsMaintenanceInfo();
            string query = string.Format("SELECT * FROM findings_maintenance where maintenancejob_id = {0} order by item_no asc", maintenanceID);

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
                            currFindingsMaintenance = DataMgrTools.BuildFindingsMaintenance(reader);
                            arrFindings.Add(currFindingsMaintenance);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(mProjName, "GetFindingsMaintenance: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                }
            }

            return arrFindings;
        }
        private List<PestTreatmentInfo> GetPestTreatment(long jobID)
        {
            List<PestTreatmentInfo> arrPestTreatment = new List<PestTreatmentInfo>();
            PestTreatmentInfo currPestTreatment = new PestTreatmentInfo();
            string query = string.Format("SELECT * FROM pests_treatment where job_id = {0} order by item_no asc", jobID);

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
                            currPestTreatment = DataMgrTools.BuildPestTreatment(reader);
                            arrPestTreatment.Add(currPestTreatment);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(mProjName, "GetPestTreatment: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                }
            }

            return arrPestTreatment;
        }
        private List<FindingsInfo> GetFindings(long jobID)
        {
            List<FindingsInfo> arrFindings = new List<FindingsInfo>();
            FindingsInfo currPestTreatment = new FindingsInfo();
            string query = string.Format("SELECT * FROM findings where job_id = {0} order by item_no asc", jobID);

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
                            currPestTreatment = DataMgrTools.BuildFindings(reader);
                            arrFindings.Add(currPestTreatment);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(mProjName, "GetFindings: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                }
            }

            return arrFindings;
        }
        public IEnumerable<JobInfo> GetByCompanyEx(JobInfo param)
        {
            List<JobInfo> arrJobs = new List<JobInfo>();
            JobInfo currJob = new JobInfo();
            object objTemp = new object();

            string query = "SELECT * FROM view_jobs WHERE timestamp >= CURDATE()";

            if (param.AssetResellerID > 0) query += " and reseller_id = @AssetResellerID";

            if (param.AssetCompanyID == 1) query += " and company_id IN (1,3)";
            else if (param.AssetCompanyID == 3) query += " and company_id = @AssetCompanyID";
            else if (param.AssetCompanyID == 2) query += " and company_id = @AssetCompanyID";

            if (param.Flag > 0) query += " and flag >= @Flag";
            if (param.AssetID > 0) query += " and asset_id = @AssetID";
            else if (!string.IsNullOrEmpty(param.Asset)) query += " and asset_id = (SELECT asset_id FROM view_assets WHERE name = @AssetName)";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@AssetResellerID", param.AssetResellerID);
                        cmd.Parameters.AddWithValue("@AssetCompanyID", param.AssetCompanyID);
                        cmd.Parameters.AddWithValue("@Flag", param.Flag);
                        if (param.AssetID > 0) cmd.Parameters.AddWithValue("@AssetID", param.AssetID);
                        else if (!string.IsNullOrEmpty(param.Asset)) cmd.Parameters.AddWithValue("@AssetName", param.Asset);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currJob = DataMgrTools.BuildJob(reader);
                                    string strFill = "";
                                    currJob.TechSignatures = GetImage(String.Format("techniciansignatures/{0}", currJob.JobID), ref strFill);
                                    currJob.TechSignaturesFill = strFill;
                                    currJob.ClientSignatures = GetImage(String.Format("clientsignatures/{0}", currJob.JobID), ref strFill);
                                    currJob.ClientSignaturesFill = strFill;
                                    currJob.Forms = GetImage(String.Format("forms/{0}", currJob.JobID), ref strFill);
                                    currJob.FormsFill = strFill;
                                    arrJobs.Add(currJob);
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(ByCompany)", System.Diagnostics.EventLogEntryType.Error);

                }

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        for (int i = 0; i < arrJobs.Count; i++)
                        {
                            query = string.Format("SELECT * FROM view_drivers where asset_id = {0}", arrJobs[i].AssetID);

                            cmd.CommandText = query;
                            cmd.Connection = conn;
                            cmd.CommandType = CommandType.Text;
                            using (MySqlDataReader reader = cmd.ExecuteReader())
                            {
                                DriverInfo currDriver = new DriverInfo();
                                if ((reader != null) && (reader.HasRows))
                                {
                                    while (reader.Read())
                                    {
                                        currDriver = DataMgrTools.BuildDriver(reader);
                                        string strFill = "";
                                        currDriver.Image = GetImage(String.Format("drivers/{0}", currDriver.DriverID), ref strFill);
                                        currDriver.ImageFill = strFill;
                                        arrJobs[i].DriverInfo = currDriver;
                                    }
                                }
                                else
                                {
                                    arrJobs[i].DriverInfo = currDriver;

                                }

                            }
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent("GetByCompany-view_driver: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                }
            }

            return arrJobs;
        }
        public IEnumerable<JobInfo> GetJobList(JobInfo param)
        {
            List<JobInfo> arrJobs = new List<JobInfo>();
            JobInfo currJob = new JobInfo();
            object objTemp = new object();

            string query = "SELECT * FROM view_jobs WHERE (timestamp between @StartTS and @EndTS)";

            if (param.AssetResellerID > 0) query += " and reseller_id = @AssetResellerID";
            if (param.AssetCompanyID > 0) query += " and company_id = @AssetCompanyID";

            if (param.DriverID > 0) query += " and driver_id = @DriverID";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@StartTS", param.Timestamp);
                        cmd.Parameters.AddWithValue("@EndTS", param.RxTime);
                        cmd.Parameters.AddWithValue("@AssetResellerID", param.AssetResellerID);
                        cmd.Parameters.AddWithValue("@AssetCompanyID", param.AssetCompanyID);
                        cmd.Parameters.AddWithValue("@DriverID", param.DriverID);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currJob = DataMgrTools.BuildJob(reader);
                                    string strFill = "";
                                    currJob.TechSignatures = GetImage(String.Format("techniciansignatures/{0}", currJob.JobID), ref strFill);
                                    currJob.TechSignaturesFill = strFill;
                                    currJob.ClientSignatures = GetImage(String.Format("clientsignatures/{0}", currJob.JobID), ref strFill);
                                    currJob.ClientSignaturesFill = strFill;
                                    currJob.Forms = GetImage(String.Format("forms/{0}", currJob.JobID), ref strFill);
                                    currJob.FormsFill = strFill;
                                    arrJobs.Add(currJob);
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(ByCompany)", System.Diagnostics.EventLogEntryType.Error);

                }

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        for (int i = 0; i < arrJobs.Count; i++)
                        {
                            query = string.Format("SELECT * FROM view_drivers where asset_id = {0}", arrJobs[i].AssetID);

                            cmd.CommandText = query;
                            cmd.Connection = conn;
                            cmd.CommandType = CommandType.Text;
                            using (MySqlDataReader reader = cmd.ExecuteReader())
                            {
                                DriverInfo currDriver = new DriverInfo();
                                if ((reader != null) && (reader.HasRows))
                                {
                                    while (reader.Read())
                                    {
                                        currDriver = DataMgrTools.BuildDriver(reader);
                                        string strFill = "";
                                        currDriver.Image = GetImage(String.Format("drivers/{0}", currDriver.DriverID), ref strFill);
                                        currDriver.ImageFill = strFill;
                                        arrJobs[i].DriverInfo = currDriver;
                                    }
                                }
                                else
                                {
                                    arrJobs[i].DriverInfo = currDriver;

                                }

                            }
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent("GetByCompany-view_driver: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                }
            }

            return arrJobs;
        }
        public IEnumerable<JobInfo> GetIncompleteJobs(JobInfo param)
        {
            List<JobInfo> arrJobs = new List<JobInfo>();
            JobInfo currJob = new JobInfo();
            object objTemp = new object();

            string query = "SELECT * FROM view_jobs WHERE timestamp <= @StartTS";

            if (param.AssetResellerID > 0) query += " and reseller_id = @AssetResellerID";
            if (param.AssetCompanyID > 0) query += " and company_id = @AssetCompanyID";
            if (param.Flag > 0) query += " and flag >= @Flag";
            if (param.AssetID > 0) query += " and asset_id = @AssetID";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@StartTS", param.Timestamp);
                        cmd.Parameters.AddWithValue("@AssetResellerID", param.AssetResellerID);
                        cmd.Parameters.AddWithValue("@AssetCompanyID", param.AssetCompanyID);
                        cmd.Parameters.AddWithValue("@Flag", param.Flag);
                        if (param.AssetID > 0) cmd.Parameters.AddWithValue("@AssetID", param.AssetID);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currJob = DataMgrTools.BuildJob(reader);
                                    string strFill = "";
                                    currJob.TechSignatures = GetImage(String.Format("techniciansignatures/{0}", currJob.JobID), ref strFill);
                                    currJob.TechSignaturesFill = strFill;
                                    currJob.ClientSignatures = GetImage(String.Format("clientsignatures/{0}", currJob.JobID), ref strFill);
                                    currJob.ClientSignaturesFill = strFill;
                                    currJob.Forms = GetImage(String.Format("forms/{0}", currJob.JobID), ref strFill);
                                    currJob.FormsFill = strFill;
                                    arrJobs.Add(currJob);
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(ByCompany)", System.Diagnostics.EventLogEntryType.Error);

                }

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        for (int i = 0; i < arrJobs.Count; i++)
                        {
                            query = string.Format("SELECT * FROM view_drivers where asset_id = {0}", arrJobs[i].AssetID);

                            cmd.CommandText = query;
                            cmd.Connection = conn;
                            cmd.CommandType = CommandType.Text;
                            using (MySqlDataReader reader = cmd.ExecuteReader())
                            {
                                DriverInfo currDriver = new DriverInfo();
                                if ((reader != null) && (reader.HasRows))
                                {
                                    while (reader.Read())
                                    {
                                        currDriver = DataMgrTools.BuildDriver(reader);
                                        string strFill = "";
                                        currDriver.Image = GetImage(String.Format("drivers/{0}", currDriver.DriverID), ref strFill);
                                        currDriver.ImageFill = strFill;
                                        arrJobs[i].DriverInfo = currDriver;
                                    }
                                }
                                else
                                {
                                    arrJobs[i].DriverInfo = currDriver;

                                }

                            }
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent("SearchIncompleteJobs: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                }
            }

            return arrJobs;
        }
        public JobInfo GetIncompleteJobsEx(JobInfo item)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "UPDATE jobs SET flag = @Flag WHERE timestamp < @Timestamp and flag > 0 and asset_id = @AssetID";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@Timestamp", item.Timestamp);
                        cmd.Parameters.AddWithValue("@Flag", 0);
                        cmd.Parameters.AddWithValue("@AssetID", item.AssetID);
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-GetIncompleteJobsEx", System.Diagnostics.EventLogEntryType.Error);
            }

            return item;
        }
        public JobInfo Get(int jobID)
        {
            List<JobInfo> arrJobs = new List<JobInfo>();
            JobInfo currJob = new JobInfo();
            string query = string.Format("SELECT * FROM view_jobs WHERE job_id = {0}", jobID);

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
                            currJob = DataMgrTools.BuildJob(reader);
                            string strFill = "";
                            currJob.TechSignatures = GetImage(String.Format("techniciansignatures/{0}", currJob.JobID), ref strFill);
                            currJob.TechSignaturesFill = strFill;
                            currJob.ClientSignatures = GetImage(String.Format("clientsignatures/{0}", currJob.JobID), ref strFill);
                            currJob.ClientSignaturesFill = strFill;
                            currJob.Forms = GetImage(String.Format("forms/{0}", currJob.JobID), ref strFill);
                            currJob.FormsFill = strFill;
                            currJob.Pest = GetPestTreatment(currJob.JobID);
                            currJob.Findings = GetFindings(currJob.JobID);
                            arrJobs.Add(currJob);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(mProjName, "Get: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                    conn.Close();
                }

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        for (int i = 0; i < arrJobs.Count; i++)
                        {
                            query = string.Format("SELECT * FROM area_covered where postal_sector = {0}", arrJobs[i].Postal.ToString().Substring(0, 2));
                            cmd.CommandText = query;
                            cmd.Connection = conn;
                            cmd.CommandType = CommandType.Text;
                            using (MySqlDataReader reader = cmd.ExecuteReader())
                            {
                                AcInfo currAc = new AcInfo();
                                if ((reader != null) && (reader.HasRows))
                                {
                                    while (reader.Read())
                                    {
                                        currAc = DataMgrTools.BuildAc(reader);
                                        arrJobs[i].AcInfo = currAc;
                                    }
                                }
                                else
                                {
                                    arrJobs[i].AcInfo = currAc;
                                }

                            }
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent("Get-areacovered: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                }
            }
            return currJob;
        }
        public JobInfo Add(JobInfo currJob)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO jobs (job_number, company, timestamp, rx_time, company_id, reseller_id, asset_id, amount, pic, destination, " + 
                                                            "phone, unit, remarks, flag, receipt_number, user_id, driver_id, technician, postal, job_accepted, job_completed, " +
                                                            "cus_email, site, received_amount, payment_type, recommendations, reference_no, form_type) " +
                                                    "VALUES (@JobNumber, @Company, @Timestamp, @RxTime, @AssetCompanyID, @AssetResellerID, @AssetID, @Amount, @PIC, @Destination, " + 
                                                            "@Phone, @Unit, @Remarks, @Flag, @Receipt, @UserID, @DriverID, @Technician, @Postal, @JobAccepted, @JobCompleted, " +
                                                            "@CusEmail, @Site, @ReceivedAmount, @PaymentType, @Recommendations, @ReferenceNo, @FormType)";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@JobNumber", currJob.JobNumber);
                        cmd.Parameters.AddWithValue("@Company", currJob.Company);
                        cmd.Parameters.AddWithValue("@Timestamp", currJob.Timestamp);
                        cmd.Parameters.AddWithValue("@RxTime", currJob.RxTime);
                        cmd.Parameters.AddWithValue("@AssetCompanyID", currJob.AssetCompanyID);
                        cmd.Parameters.AddWithValue("@AssetResellerID", currJob.AssetResellerID);
                        cmd.Parameters.AddWithValue("@AssetID", currJob.AssetID);
                        cmd.Parameters.AddWithValue("@Amount", currJob.Amount);
                        cmd.Parameters.AddWithValue("@PIC", currJob.PIC);
                        cmd.Parameters.AddWithValue("@Destination", currJob.Destination);
                        cmd.Parameters.AddWithValue("@Phone", currJob.Phone);
                        cmd.Parameters.AddWithValue("@Unit", currJob.Unit);
                        cmd.Parameters.AddWithValue("@Remarks", currJob.Remarks);
                        cmd.Parameters.AddWithValue("@Flag", currJob.Flag);
                        cmd.Parameters.AddWithValue("@Receipt", "");
                        cmd.Parameters.AddWithValue("@UserID", currJob.UserID);
                        cmd.Parameters.AddWithValue("@DriverID", currJob.DriverID);
                        cmd.Parameters.AddWithValue("@Technician", currJob.Technician);
                        cmd.Parameters.AddWithValue("@Postal", currJob.Postal);
                        cmd.Parameters.AddWithValue("@JobAccepted", null);
                        cmd.Parameters.AddWithValue("@JobCompleted", null);
                        cmd.Parameters.AddWithValue("@CusEmail", currJob.CusEmail);
                        cmd.Parameters.AddWithValue("@Site", currJob.Site);
                        cmd.Parameters.AddWithValue("@ReceivedAmount", currJob.ReceivedAmount);
                        cmd.Parameters.AddWithValue("@PaymentType", currJob.PaymentType);
                        cmd.Parameters.AddWithValue("@Recommendations", currJob.Recommendations);
                        cmd.Parameters.AddWithValue("@ReferenceNo", currJob.ReferenceNo);
                        cmd.Parameters.AddWithValue("@FormType", currJob.FormType);
                        cmd.ExecuteNonQuery();

                        long id = cmd.LastInsertedId;
                        currJob.JobID = id;

                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(JobRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return currJob;
        }
        public bool Remove(int jobID)
        {
            bool retVal = false;
            string query = "";

            try
            {
                query = string.Format("DELETE FROM jobs WHERE job_id = {0}", jobID);

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
                Logger.LogEvent(ex.Message + "-Remove(JobRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            try
            {
                query = string.Format("DELETE FROM pests_treatment WHERE job_id = {0}", jobID);

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
                Logger.LogEvent(ex.Message + "-Remove(PestTreatmentRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }
        public bool Update(JobInfo currJob)
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
                        cmd.CommandText = "UPDATE jobs SET job_number = @JobNumber, company = @Company, timestamp = @Timestamp, rx_time = @RxTime, company_id = @AssetCompanyID, reseller_id = @AssetResellerID, asset_id = @AssetID, amount = @Amount, pic = @PIC, destination = @Destination, " +
                                                            "phone = @Phone, unit = @Unit, remarks = @Remarks, flag = @Flag, receipt_number = @Receipt, user_id = @UserID, driver_id = @DriverID, technician = @Technician, postal = @Postal, job_accepted = @JobAccepted, job_completed = @JobCompleted, " +
                                                            "cus_email = @CusEmail, site = @Site, received_amount = @ReceivedAmount, payment_type = @PaymentType, recommendations = @Recommendations, reference_no = @ReferenceNo, form_type = @FormType WHERE job_id = @JobID";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@JobNumber", currJob.JobNumber);
                        cmd.Parameters.AddWithValue("@Company", currJob.Company);
                        cmd.Parameters.AddWithValue("@Timestamp", currJob.Timestamp);
                        cmd.Parameters.AddWithValue("@RxTime", currJob.RxTime);
                        cmd.Parameters.AddWithValue("@AssetCompanyID", currJob.AssetCompanyID);
                        cmd.Parameters.AddWithValue("@AssetResellerID", currJob.AssetResellerID);
                        cmd.Parameters.AddWithValue("@AssetID", currJob.AssetID);
                        cmd.Parameters.AddWithValue("@Amount", currJob.Amount);
                        cmd.Parameters.AddWithValue("@PIC", currJob.PIC);
                        cmd.Parameters.AddWithValue("@Destination", currJob.Destination);
                        cmd.Parameters.AddWithValue("@Phone", currJob.Phone);
                        cmd.Parameters.AddWithValue("@Unit", currJob.Unit);
                        cmd.Parameters.AddWithValue("@Remarks", currJob.Remarks);
                        cmd.Parameters.AddWithValue("@Flag", currJob.Flag);
                        cmd.Parameters.AddWithValue("@Receipt", currJob.Receipt);
                        cmd.Parameters.AddWithValue("@UserID", currJob.UserID);
                        cmd.Parameters.AddWithValue("@DriverID", currJob.DriverID);
                        cmd.Parameters.AddWithValue("@Technician", currJob.Technician);
                        cmd.Parameters.AddWithValue("@Postal", currJob.Postal);
                        cmd.Parameters.AddWithValue("@JobAccepted", currJob.JobAccepted);
                        cmd.Parameters.AddWithValue("@JobCompleted", currJob.JobCompleted);
                        cmd.Parameters.AddWithValue("@CusEmail", currJob.CusEmail);
                        cmd.Parameters.AddWithValue("@Site", currJob.Site);
                        cmd.Parameters.AddWithValue("@ReceivedAmount", currJob.ReceivedAmount);
                        cmd.Parameters.AddWithValue("@PaymentType", currJob.PaymentType);
                        cmd.Parameters.AddWithValue("@Recommendations", currJob.Recommendations);
                        cmd.Parameters.AddWithValue("@ReferenceNo", currJob.ReferenceNo);
                        cmd.Parameters.AddWithValue("@FormType", currJob.FormType);
                        cmd.Parameters.AddWithValue("@JobID", currJob.JobID);

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
                Logger.LogEvent(ex.Message + "-Update(JobRepository)", System.Diagnostics.EventLogEntryType.Error);
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
        public JobInfo GetByAssetID(int assetID)
        {

            JobInfo currJob = new JobInfo();
            string query = string.Format("SELECT * FROM view_jobs WHERE asset_id = @AssetID and flag >= 1 order by timestamp desc");


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
                        cmd.Parameters.AddWithValue("@AssetID", assetID);
                        MySqlDataReader reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            currJob = DataMgrTools.BuildJob(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-GetByAssetID", System.Diagnostics.EventLogEntryType.Error);
                    conn.Close();
                }
            }
            return currJob;
        }
        public JobInfo UpdateJobByZone(JobInfo currJob)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "UPDATE jobs SET job_number = @JobNumber, company = @Company, timestamp = @Timestamp, rx_time = @RxTime, company_id = @AssetCompanyID, reseller_id = @AssetResellerID, asset_id = @AssetID, amount = @Amount, pic = @PIC, destination = @Destination, " +
                                    "phone = @Phone, unit = @Unit, remarks = @Remarks, flag = @Flag, receipt_number = @Receipt, user_id = @UserID, driver_id = @DriverID, technician = @Technician, postal = @Postal, job_accepted = @JobAccepted, job_completed = @JobCompleted, " +
                                    "cus_email = @CusEmail, site = @Site, received_amount = @ReceivedAmount, payment_type = @PaymentType, recommendations = @Recommendations, reference_no = @ReferenceNo, form_type = @FormType WHERE job_id = @JobID";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@JobNumber", currJob.JobNumber);
                        cmd.Parameters.AddWithValue("@Company", currJob.Company);
                        cmd.Parameters.AddWithValue("@Timestamp", currJob.Timestamp);
                        cmd.Parameters.AddWithValue("@RxTime", currJob.RxTime);
                        cmd.Parameters.AddWithValue("@AssetCompanyID", currJob.AssetCompanyID);
                        cmd.Parameters.AddWithValue("@AssetResellerID", currJob.AssetResellerID);
                        cmd.Parameters.AddWithValue("@AssetID", currJob.AssetID);
                        cmd.Parameters.AddWithValue("@Amount", currJob.Amount);
                        cmd.Parameters.AddWithValue("@PIC", currJob.PIC);
                        cmd.Parameters.AddWithValue("@Destination", currJob.Destination);
                        cmd.Parameters.AddWithValue("@Phone", currJob.Phone);
                        cmd.Parameters.AddWithValue("@Unit", currJob.Unit);
                        cmd.Parameters.AddWithValue("@Remarks", currJob.Remarks);
                        cmd.Parameters.AddWithValue("@Flag", currJob.Flag);
                        cmd.Parameters.AddWithValue("@Receipt", currJob.Receipt);
                        cmd.Parameters.AddWithValue("@UserID", currJob.UserID);
                        cmd.Parameters.AddWithValue("@DriverID", currJob.DriverID);
                        cmd.Parameters.AddWithValue("@Technician", currJob.Technician);
                        cmd.Parameters.AddWithValue("@Postal", currJob.Postal);
                        cmd.Parameters.AddWithValue("@JobAccepted", currJob.JobAccepted);
                        cmd.Parameters.AddWithValue("@JobCompleted", currJob.JobCompleted);
                        cmd.Parameters.AddWithValue("@CusEmail", currJob.CusEmail);
                        cmd.Parameters.AddWithValue("@Site", currJob.Site);
                        cmd.Parameters.AddWithValue("@ReceivedAmount", currJob.ReceivedAmount);
                        cmd.Parameters.AddWithValue("@PaymentType", currJob.PaymentType);
                        cmd.Parameters.AddWithValue("@Recommendations", currJob.Recommendations);
                        cmd.Parameters.AddWithValue("@ReferenceNo", currJob.ReferenceNo);
                        cmd.Parameters.AddWithValue("@FormType", currJob.FormType);
                        cmd.Parameters.AddWithValue("@JobID", currJob.JobID);
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-UpdateJobByZone(JobRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return currJob;
        }

    }
}