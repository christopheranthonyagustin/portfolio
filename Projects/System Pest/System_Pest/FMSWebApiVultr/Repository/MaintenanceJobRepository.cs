using FMSWebApi.Models;
using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web.Hosting;
using System.Configuration;
//using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;
using Dapper;
using System.Diagnostics;
using System.Threading.Tasks;


// Add/keep these using directives at top of the file (remove other conflicting OpenXml using lines)
using System.IO;
using System.Drawing; // to get image pixel sizes (System.Drawing is OK on Windows/.NET Framework)
using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml;
using W = DocumentFormat.OpenXml.Wordprocessing; // Wordprocessing alias (cleaner)
using DW = DocumentFormat.OpenXml.Drawing.Wordprocessing;
using A = DocumentFormat.OpenXml.Drawing;
using PIC = DocumentFormat.OpenXml.Drawing.Pictures;
using System.Text;
using IOPath = System.IO.Path;
using DocumentFormat.OpenXml.Wordprocessing;
using FMSWebApiVultr.HelperTools;
using System.Collections;
using System.Reflection;
using System.Text.RegularExpressions;
using MailKit.Net.Imap;
using MailKit;
using MimeKit;
using MailKit.Search;
using MailKit.Security;
using DocumentFormat.OpenXml.Presentation;
using S = DocumentFormat.OpenXml.Spreadsheet;
using Xdr = DocumentFormat.OpenXml.Drawing.Spreadsheet;


namespace FMSWebApi.Repository
{
    public class MaintenanceJobRepository : IMaintenanceJobRepository
    {
        private string mConnStr = "server=127.0.0.1;uid=root;pwd=@c3c0M;database=sp;Charset=utf8;SSL Mode=None;default command timeout=999999;Pooling=true;Allow user variables=true;ConnectionReset=true;";
        private string mProjName = "SP";

        private static DateTime _lastBounceCheck = DateTime.MinValue;
        private static readonly object _bounceLock = new object();
        private static readonly HashSet<long> _sentJobs = new HashSet<long>();


        public IEnumerable<MaintenanceJobInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<MaintenanceJobInfo> arrMaintenanceJob = new List<MaintenanceJobInfo>();

            try
            {
                conn.ConnectionString = mConnStr;
                conn.Open();

                cmd.CommandText = "SELECT * FROM view_maintenance_job";
                cmd.Connection = conn;
                cmd.CommandType = CommandType.Text;
                MySqlDataReader reader = cmd.ExecuteReader();

                if ((reader != null) && (reader.HasRows))
                {
                    while (reader.Read())
                    {
                        MaintenanceJobInfo currMaintenanceJob = DataMgrTools.BuildMaintenanceJob(reader);
                        arrMaintenanceJob.Add(currMaintenanceJob);
                    }
                }
                conn.Close();
            }
            catch (MySqlException ex)
            {
                Logger.LogEvent(mProjName, "GetAll Maintenance Job: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }

            if (conn != null)
                conn.Close();

            return arrMaintenanceJob.ToArray();
        }
        public IEnumerable<MaintenanceJobInfo> GetAllEx()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<MaintenanceJobInfo> arrMaintenanceJob = new List<MaintenanceJobInfo>();

            return arrMaintenanceJob.ToArray();
        }
        public IEnumerable<MaintenanceCalJobInfo> GetAllCal()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<MaintenanceCalJobInfo> arrMaintenanceJob = new List<MaintenanceCalJobInfo>();

            return arrMaintenanceJob.ToArray();
        }
        public IEnumerable<MaintenanceJobInfo> GetMaintenanceJob(MaintenanceJobInfo param)
        {
            List<MaintenanceJobInfo> arrMaintenanceJob = new List<MaintenanceJobInfo>();
            MaintenanceJobInfo currMaintenanceJob = new MaintenanceJobInfo();

            string query = "SELECT * FROM view_maintenance_job WHERE maintenance_id = @MaintenanceID";

            if (!string.IsNullOrEmpty(param.ParamFlag)) query += " and flag IN (" + param.ParamFlag + ")";
            query += " order by timestamp asc";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        cmd.Parameters.AddWithValue("@MaintenanceID", param.MaintenanceID);
                        //cmd.Prepare();

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currMaintenanceJob = DataMgrTools.BuildMaintenanceJob(reader);
                                    string strFill = "";
                                    currMaintenanceJob.MainTechSignatures = GetImage(String.Format("maintenance_technician_signatures/{0}", currMaintenanceJob.MaintenanceJobID), ref strFill);
                                    currMaintenanceJob.MainTechFillSignatures = strFill;
                                    currMaintenanceJob.MainClientSignatures = GetImage(String.Format("maintenance_client_signatures/{0}", currMaintenanceJob.MaintenanceJobID), ref strFill);
                                    currMaintenanceJob.MainClientFillSignatures = strFill;
                                    currMaintenanceJob.MainForms = GetImage(String.Format("maintenance_forms/{0}", currMaintenanceJob.MaintenanceJobID), ref strFill);
                                    currMaintenanceJob.MainFormsFill = strFill;
                                    currMaintenanceJob.Pest = GetPestTreatment(currMaintenanceJob.MaintenanceJobID);
                                    currMaintenanceJob.Findings = GetFindings(currMaintenanceJob.MaintenanceJobID);
                                    arrMaintenanceJob.Add(currMaintenanceJob);
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-(GetMaintenanceJob)", System.Diagnostics.EventLogEntryType.Error);
                }


                if (currMaintenanceJob.AssetCompanyID == 1 || currMaintenanceJob.AssetCompanyID == 3)
                {
                    try
                    {
                        using (MySqlCommand cmd = new MySqlCommand(query, conn))
                        {
                            conn.Open();
                            for (int i = 0; i < arrMaintenanceJob.Count; i++)
                            {
                                query = string.Format("SELECT * FROM area_covered where postal_sector = {0}", arrMaintenanceJob[i].Postal.ToString().Substring(0, 2));
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
                                            arrMaintenanceJob[i].AcInfo = currAc;
                                        }
                                    }
                                    else
                                    {
                                        arrMaintenanceJob[i].AcInfo = currAc;
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

                if (currMaintenanceJob.AssetCompanyID == 2)
                {
                    try
                    {
                        using (MySqlCommand cmd = new MySqlCommand(query, conn))
                        {
                            conn.Open();
                            for (int i = 0; i < arrMaintenanceJob.Count; i++)
                            {
                                query = string.Format("SELECT * FROM area_covered_my WHERE {0} BETWEEN lower_bound AND upper_bound order by lower_bound desc LIMIT 1", arrMaintenanceJob[i].Postal);
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
                                            arrMaintenanceJob[i].AcMyInfo = currAcMy;
                                        }
                                    }
                                    else
                                    {
                                        arrMaintenanceJob[i].AcMyInfo = currAcMy;
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

            return arrMaintenanceJob;
        }
        public IEnumerable<MaintenanceCalJobInfo> GetMaintenanceJobByCal(MaintenanceCalJobInfo param)
        {
            List<MaintenanceCalJobInfo> arrMaintenanceJob = new List<MaintenanceCalJobInfo>();
            MaintenanceCalJobInfo currMaintenanceJob = new MaintenanceCalJobInfo();
            string query = "";

            if (param.AssetCompanyID == 1 || param.AssetCompanyID == 3)
            {
                query = "SELECT * FROM view_maintenance_job_sg WHERE (timestamp between @StartTS and @EndTS)";
            }
            else if (param.AssetCompanyID == 2)
            {
                query = "SELECT * FROM view_maintenance_job_my WHERE (timestamp between @StartTS and @EndTS)";
            }

            if (param.AssetCompanyID == 1) query += " and company_id IN (1,3)";
            else query += " and company_id = @AssetCompanyID";

            if (param.DriverID > 0) query += " and driver_id = @DriverID";
            if (!string.IsNullOrEmpty(param.Groups)) query += " and groups_ac = @Groups";

            query += " order by timestamp asc";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();

                        cmd.Parameters.AddWithValue("@StartTS", param.Timestamp);
                        cmd.Parameters.AddWithValue("@EndTS", param.Timestamp.AddMinutes(1679));
                        //cmd.Parameters.AddWithValue("@EndTS", param.Timestamp.AddMinutes(5037));
                        cmd.Parameters.AddWithValue("@AssetCompanyID", param.AssetCompanyID);
                        cmd.Parameters.AddWithValue("@DriverID", param.DriverID);
                        cmd.Parameters.AddWithValue("@Groups", param.Groups);
                        cmd.Prepare();

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    if (param.AssetCompanyID == 1 || param.AssetCompanyID == 3) { currMaintenanceJob = DataMgrTools.BuildMaintenanceJobCal(reader); }
                                    else if (param.AssetCompanyID == 2) { currMaintenanceJob = DataMgrTools.BuildMaintenanceJobCalMy(reader); }
                                    currMaintenanceJob.Pest = GetPestTreatment(currMaintenanceJob.MaintenanceJobID);
                                    arrMaintenanceJob.Add(currMaintenanceJob);
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(GetMaintenanceJobByCal)", System.Diagnostics.EventLogEntryType.Error);

                }

            }

            return arrMaintenanceJob;
        }
        public IEnumerable<MaintenanceCalJobInfo> GetMaintenanceJobByDate(MaintenanceCalJobInfo param)
        {
            List<MaintenanceCalJobInfo> arrMaintenanceJob = new List<MaintenanceCalJobInfo>();
            MaintenanceCalJobInfo currMaintenanceJob = new MaintenanceCalJobInfo();

            string query = "SELECT * FROM view_maintenance_job_app WHERE (timestamp between @StartTS and @EndTS)";

            if (param.AssetCompanyID == 1) query += " and company_id IN (1,3)";
            else query += " and company_id = @AssetCompanyID";

            if (param.DriverID > 0) query += " and driver_id = @DriverID";

            query += " order by timestamp asc";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();

                        cmd.Parameters.AddWithValue("@StartTS", param.Timestamp);
                        cmd.Parameters.AddWithValue("@EndTS", param.Timestamp.AddMinutes(1679));
                        cmd.Parameters.AddWithValue("@AssetCompanyID", param.AssetCompanyID);
                        cmd.Parameters.AddWithValue("@DriverID", param.DriverID);
                        //cmd.Prepare();

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currMaintenanceJob = DataMgrTools.BuildMaintenanceJobCal(reader);
                                    currMaintenanceJob.Pest = GetPestTreatment(currMaintenanceJob.MaintenanceJobID);
                                    arrMaintenanceJob.Add(currMaintenanceJob);
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(GetMaintenanceJobByDate)", System.Diagnostics.EventLogEntryType.Error);

                }


                if (currMaintenanceJob.AssetCompanyID == 1 || currMaintenanceJob.AssetCompanyID == 3)
                {
                    try
                    {
                        using (MySqlCommand cmd = new MySqlCommand(query, conn))
                        {
                            conn.Open();
                            for (int i = 0; i < arrMaintenanceJob.Count; i++)
                            {
                                query = string.Format("SELECT * FROM area_covered where postal_sector = {0}", arrMaintenanceJob[i].Postal.ToString().Substring(0, 2));
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
                                            //arrMaintenanceJob[i].AcInfo = currAc;
                                        }
                                    }
                                    else
                                    {
                                        //arrMaintenanceJob[i].AcInfo = currAc;
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

                if (currMaintenanceJob.AssetCompanyID == 2)
                {
                    try
                    {
                        using (MySqlCommand cmd = new MySqlCommand(query, conn))
                        {
                            conn.Open();
                            for (int i = 0; i < arrMaintenanceJob.Count; i++)
                            {
                                query = string.Format("SELECT * FROM area_covered_my WHERE {0} BETWEEN lower_bound AND upper_bound order by lower_bound desc LIMIT 1", arrMaintenanceJob[i].Postal);
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
                                            //arrMaintenanceJob[i].AcMyInfo = currAcMy;
                                        }
                                    }
                                    else
                                    {
                                        //arrMaintenanceJob[i].AcMyInfo = currAcMy;
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

            return arrMaintenanceJob;
        }
        private List<MainPestTreatmentInfo> GetPestTreatment(long jobID)
        {
            List<MainPestTreatmentInfo> arrPestTreatment = new List<MainPestTreatmentInfo>();
            MainPestTreatmentInfo currPestTreatment = new MainPestTreatmentInfo();
            string query = string.Format("SELECT * FROM main_pests_treatment where maintenancejob_id = {0} and `treatment_desc` NOT LIKE '%-%' order by item_no asc", jobID);

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
        private List<FindingsMaintenanceInfo> GetFindings(long maintenanceID)
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
        public MaintenanceJobInfo Get(long maintenanceID)
        {
            MaintenanceJobInfo currMaintenanceJob = new MaintenanceJobInfo();

            string query = string.Format("SELECT * FROM view_maintenance_job WHERE maintenancejob_id = {0}", maintenanceID);

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
                            currMaintenanceJob.Pest = GetPestTreatment(currMaintenanceJob.MaintenanceJobID);
                            currMaintenanceJob.Findings = GetFindings(currMaintenanceJob.MaintenanceJobID);                            
                            string strFill = "";
                            currMaintenanceJob.MainTechSignatures = GetImage(String.Format("maintenance_technician_signatures/{0}", currMaintenanceJob.MaintenanceJobID), ref strFill);
                            currMaintenanceJob.MainTechFillSignatures = strFill;
                            currMaintenanceJob.MainClientSignatures = GetImage(String.Format("maintenance_client_signatures/{0}", currMaintenanceJob.MaintenanceJobID), ref strFill);
                            currMaintenanceJob.MainClientFillSignatures = strFill;
                            currMaintenanceJob.MainForms = GetImage(String.Format("maintenance_forms/{0}", currMaintenanceJob.MaintenanceJobID), ref strFill);
                            currMaintenanceJob.MainFormsFill = strFill;

                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(mProjName, "Get: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                    conn.Close();
                }          
            }
            return currMaintenanceJob;
        }
        public MaintenanceJobInfo GetMaintenance(int maintenanceID)
        {
            MaintenanceJobInfo currMaintenanceJob = new MaintenanceJobInfo();
            string query = string.Format("SELECT * FROM view_maintenance_job WHERE maintenance_id = {0}", maintenanceID);

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
                            currMaintenanceJob.Pest = GetPestTreatment(currMaintenanceJob.MaintenanceJobID);
                            currMaintenanceJob.Findings = GetFindings(currMaintenanceJob.MaintenanceJobID);
                            string strFill = "";
                            currMaintenanceJob.MainTechSignatures = GetImage(String.Format("maintenance_technician_signatures/{0}", currMaintenanceJob.MaintenanceJobID), ref strFill);
                            currMaintenanceJob.MainTechFillSignatures = strFill;
                            currMaintenanceJob.MainClientSignatures = GetImage(String.Format("maintenance_client_signatures/{0}", currMaintenanceJob.MaintenanceJobID), ref strFill);
                            currMaintenanceJob.MainClientFillSignatures = strFill;
                            currMaintenanceJob.MainForms = GetImage(String.Format("maintenance_forms/{0}", currMaintenanceJob.MaintenanceJobID), ref strFill);
                            currMaintenanceJob.MainFormsFill = strFill;
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(mProjName, "Get Maintenance: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                    conn.Close();
                }
            }
            return currMaintenanceJob;
        }
        public MaintenanceJobInfo Add(MaintenanceJobInfo currMaintenanceJob)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO maintenance_job (maintenance_id, alert_date, timestamp, rx_time, flag, job_cancelled, cancel_remarks, admin_remarks, isSent, reference_no, driver_id, asset_id, technician)" +
                                                              " VALUES (@MaintenanceID, @AlertDate, @Timestamp, @RxTime, @Flag, @JobCancelled, @CancelRemarks, @AdminRemarks, @isSent, @ReferenceNo, @DriverID, @AssetID, @Technician)";
                        //cmd.Prepare();
                        cmd.Parameters.AddWithValue("@MaintenanceID", currMaintenanceJob.MaintenanceID);
                        cmd.Parameters.AddWithValue("@AlertDate", currMaintenanceJob.AlertDate);
                        cmd.Parameters.AddWithValue("@Timestamp", currMaintenanceJob.Timestamp);
                        cmd.Parameters.AddWithValue("@RxTime", currMaintenanceJob.RxTime);
                        cmd.Parameters.AddWithValue("@Flag", currMaintenanceJob.Flag);
                        cmd.Parameters.AddWithValue("@JobCancelled", currMaintenanceJob.JobCancelled);
                        cmd.Parameters.AddWithValue("@CancelRemarks", currMaintenanceJob.CancelRemarks);
                        cmd.Parameters.AddWithValue("@AdminRemarks", currMaintenanceJob.AdminRemarks);
                        cmd.Parameters.AddWithValue("@isSent", currMaintenanceJob.isSent);
                        cmd.Parameters.AddWithValue("@ReferenceNo", currMaintenanceJob.ReferenceNo);
                        cmd.Parameters.AddWithValue("@DriverID", currMaintenanceJob.DriverID);
                        cmd.Parameters.AddWithValue("@AssetID", currMaintenanceJob.AssetID);
                        cmd.Parameters.AddWithValue("@Technician", currMaintenanceJob.Technician);
                        cmd.ExecuteNonQuery();

                        long id = cmd.LastInsertedId;
                        currMaintenanceJob.MaintenanceJobID = id;

                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(MaintenanceJobRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return currMaintenanceJob;
        }

        // ===================== CUSTOM EMAIL MAIN METHOD =====================
        // --- CUSTOM EMAIL ASYNC ---



        // Main public method (entry point)
        public async Task<FMSWebApi.Models.MaintenanceJobInfo> CustomEmailAsync(FMSWebApi.Models.MaintenanceJobInfo _jobInfo)
        {
            MaintenanceJobInfo jobInfo = new MaintenanceJobInfo();

            try
            {

                long i = (long)_jobInfo.MaintenanceJobID;
                jobInfo = Get(i);

            }
            catch (Exception ex)
            {
                Logger.LogEvent(mProjName, "Get: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }

            if (jobInfo == null) throw new ArgumentNullException(nameof(jobInfo));

            // Paths - do not hardcode incorrectly; keep inside images folder
            string webRoot = HostingEnvironment.ApplicationPhysicalPath.TrimEnd(Path.DirectorySeparatorChar);
            string templatesDir = Path.Combine(webRoot, "images", "custom_templates");
            string generatedDir = Path.Combine(webRoot, "images", "custom_templates_generated");
            string pdfDir = Path.Combine(webRoot, "images", "custom_templates_pdf");
            string photosBase = Path.Combine(webRoot, "images", "photos");
            string profilePath = @"C:\LibreOfficeProfile"; // ensure this folder exists & permissions granted
            string logsDir = Path.Combine(webRoot, "logs");

            Directory.CreateDirectory(generatedDir);
            Directory.CreateDirectory(pdfDir);
            Directory.CreateDirectory(profilePath);
            Directory.CreateDirectory(logsDir);

            // Template selection: use TemplateID from jobInfo if present, fallback to 1
            int templateId = (jobInfo.TemplateID > 0 ? (int)jobInfo.TemplateID : 1);
            string templateFile = GetTemplateFileName(templateId); // your method — must return filename like "1.docx" or "101.xlsx"

            if (string.IsNullOrWhiteSpace(templateFile) || !File.Exists(templateFile))
            {
                string msg = $"Template not found: {templateFile}";
                Logger.LogEvent(msg, EventLogEntryType.Error);
                AppendDailyLog(logsDir, "[ERROR] " + msg);
                jobInfo.ErrorMessage = "Template not found";
                return jobInfo;
            }

            // Output filenames
            string copyFileName = $"{Path.GetFileNameWithoutExtension(templateFile)}_{jobInfo.MaintenanceJobID}{Path.GetExtension(templateFile)}";
            string targetFilePath = Path.Combine(generatedDir, copyFileName);
            string pdfFilePath = Path.Combine(pdfDir, Path.GetFileNameWithoutExtension(copyFileName) + ".pdf");

            try
            {
                // Heavy work offloaded so controller thread does not block
                await Task.Run(() =>
                {
                    // Copy template
                    try
                    {
                        File.Copy(templateFile, targetFilePath, true);
                        Logger.LogEvent($"Copied template to: {targetFilePath}", EventLogEntryType.Information);
                        AppendDailyLog(logsDir, $"[INFO] Copied template to: {targetFilePath}");
                    }
                    catch (Exception ex)
                    {
                        string m = $"Copy Template failed: {ex.Message}";
                        Logger.LogEvent(m, EventLogEntryType.Error);
                        AppendDailyLog(logsDir, "[ERROR] " + m);
                        jobInfo.ErrorMessage = "Copy failed";
                        throw;
                    }

                    // Open docx and replace placeholders + insert images
                    string ext = Path.GetExtension(targetFilePath).ToLowerInvariant();
                    if (ext == ".docx" || ext == ".doc")
                    {
                        try
                        {
                            using (var wordDoc = WordprocessingDocument.Open(targetFilePath, true))
                            {
                                var mainPart = wordDoc.MainDocumentPart;
                                if (mainPart == null)
                                {
                                    throw new InvalidOperationException("MainDocumentPart missing in template.");
                                }

                                // Build placeholder dictionary dynamically (supports simple lists/objects)
                                var placeholders = BuildPlaceholdersFromModel(jobInfo, logsDir);


                                // Replace placeholders in body/headers/footers
                                ReplacePlaceholdersInWord(mainPart, placeholders, logsDir);


                                // Insert signatures (local copies)
                                string techSignPath = ResolveSignaturePath(Path.Combine(webRoot, "images", "maintenance_technician_signatures"), jobInfo.MaintenanceJobID);
                                string clientSignPath = ResolveSignaturePath(Path.Combine(webRoot, "images", "maintenance_client_signatures"), jobInfo.MaintenanceJobID);

                                try
                                {
                                    // Search & insert in body / headers / footers

                                    // Insert signature
                                    InsertSignatureInlineAtToken(mainPart, "{{MainClientSignatures}}", clientSignPath, "{{MainTechSignatures}}", techSignPath, logsDir, jobInfo);


                                }
                                catch (Exception ex)
                                {
                                    Logger.LogEvent("Insert signatures error: " + ex.Message, EventLogEntryType.Error);
                                    AppendDailyLog(logsDir, "[ERROR] Insert signatures: " + ex.ToString());
                                }

                                // Insert photos grid (if photos folder exists)
                                string photosDir = Path.Combine(photosBase, jobInfo.MaintenanceJobID.ToString());
                                if (Directory.Exists(photosDir))
                                {
                                    var photoFiles = Directory.GetFiles(photosDir)
                                        .Where(f => f.EndsWith(".jpg", StringComparison.OrdinalIgnoreCase) || f.EndsWith(".jpeg", StringComparison.OrdinalIgnoreCase) || f.EndsWith(".png", StringComparison.OrdinalIgnoreCase))
                                        .OrderBy(f => f)
                                        .ToList();

                                    if (photoFiles.Any())
                                    {
                                        try
                                        {
                                            InsertPhotosTable(mainPart, photoFiles, columns: 3, imageWidthPx: 280, logsDir: logsDir);
                                        }
                                        catch (Exception ex)
                                        {
                                            Logger.LogEvent("Insert photos error: " + ex.Message, EventLogEntryType.Error);
                                            AppendDailyLog(logsDir, "[ERROR] Insert photos: " + ex.ToString());
                                        }
                                    }
                                    else
                                    {
                                        AppendDailyLog(logsDir, "[INFO] No photo files found in: " + photosDir);
                                    }
                                } // photosDir exists

                                mainPart.Document.Save();
                            } // using wordDoc

                            AppendDailyLog(logsDir, "[INFO] Document modifications saved: " + targetFilePath);
                        }
                        catch (Exception ex)
                        {
                            string m = "Replace/Insert in Word failed: " + ex.Message;
                            Logger.LogEvent(m, EventLogEntryType.Error);
                            AppendDailyLog(logsDir, "[ERROR] " + ex.ToString());
                            jobInfo.ErrorMessage = "Replace failed";
                            throw;
                        }
                    }
                    //else if (ext == ".xlsx" || ext == ".xls")
                    //{
                    //    // If you need Excel support later, implement a similar ReplacePlaceholdersInExcel.
                    //    string m = "Excel templates are not yet supported by this code path.";
                    //    Logger.LogEvent(m, EventLogEntryType.Warning);
                    //    AppendDailyLog(logsDir, "[WARN] " + m);
                    //    throw new NotSupportedException(m);
                    //}
                    else if (ext == ".xlsx" || ext == ".xls")
                    {
                        try
                        {
                            // Build placeholders
                            var placeholders = BuildPlaceholdersFromModel(jobInfo, logsDir);

                            // Photos folder (same as Word path)
                            string photosDir = Path.Combine(photosBase, jobInfo.MaintenanceJobID.ToString());
                            List<string> photoFiles = null;
                            if (Directory.Exists(photosDir))
                            {
                                photoFiles = Directory.GetFiles(photosDir)
                                    .Where(f => f.EndsWith(".jpg", StringComparison.OrdinalIgnoreCase) ||
                                                f.EndsWith(".jpeg", StringComparison.OrdinalIgnoreCase) ||
                                                f.EndsWith(".png", StringComparison.OrdinalIgnoreCase))
                                    .OrderBy(f => f)
                                    .ToList();
                            }

                            // Call Excel replacement
                            ReplacePlaceholdersInExcel(templatePath: templateFile, outputPath: targetFilePath, placeholders: placeholders, photos: photoFiles, photosPerRow: 1);

                            AppendDailyLog(logsDir, "[INFO] Excel modifications saved: " + targetFilePath);
                        }
                        catch (Exception ex)
                        {
                            string m = "Replace/Insert in Excel failed: " + ex.Message;
                            Logger.LogEvent(m, EventLogEntryType.Error);
                            AppendDailyLog(logsDir, "[ERROR] " + ex.ToString());
                            jobInfo.ErrorMessage = "Excel replace failed";
                            throw;
                        }
                    }
                    else
                    {
                        string m = "Unsupported template type: " + ext;
                        Logger.LogEvent(m, EventLogEntryType.Error);
                        AppendDailyLog(logsDir, "[ERROR] " + m);
                        jobInfo.ErrorMessage = "Unsupported template type";
                        throw new NotSupportedException(m);
                    }

                    // Convert to PDF using LibreOffice
                    try
                    {
                        bool ok = ConvertAndOptimizeReportPdf(targetFilePath, pdfFilePath, profilePath, logsDir, jobInfo);
                        if (ok)
                        {
                            string optimizedPdf = Path.Combine(Path.GetDirectoryName(pdfFilePath), Path.GetFileNameWithoutExtension(pdfFilePath) + "_small.pdf");

                            if (OptimizePdfWithGhostscript(pdfFilePath, optimizedPdf, logsDir, jobInfo))
                            {
                                File.Delete(pdfFilePath); // delete original large file
                                File.Move(optimizedPdf, pdfFilePath); // replace with smaller version
                                AppendDailyLog(logsDir, "[INFO] PDF optimized with Ghostscript: " + pdfFilePath);
                            }
                        }

                        AppendDailyLog(logsDir, "[INFO] PDF created: " + pdfFilePath);
                    }
                    catch (Exception ex)
                    {
                        Logger.LogEvent("ConvertToPdf Error: " + ex.Message, EventLogEntryType.Error);
                        AppendDailyLog(logsDir, "[ERROR] ConvertToPdf: " + ex.ToString());
                        throw;
                    }

                }); // Task.Run
            }
            catch (Exception outerEx)
            {
                // already logged in inner blocks; set ErrorMessage
                jobInfo.ErrorMessage = outerEx.Message;
                return jobInfo;
            }

            jobInfo.ErrorMessage = "Success";
            return jobInfo;
        }

        /* ---------------------
           Helper Methods
           --------------------- */

        // Insert an inline image right where the token text appears, then a line-break + small label.
        // No justification/paragraph changes = respects template positioning (left/right/center/table cell).
        // Entry point: pass jobInfo into signature insertion
        private void InsertSignatureInlineAtToken(
            MainDocumentPart mainPart,
            string clientToken,
            string clientImagePath,
            string techToken,
            string techImagePath,
            string logsDir,
            MaintenanceJobInfo jobInfo,
            int maxWidthPx = 120,
            int maxHeightPx = 48)
        {
            try
            {
                if (mainPart == null)
                    return;

                // Process body + headers + footers
                ProcessScope(mainPart.Document?.Body, clientToken, clientImagePath, techToken, techImagePath, jobInfo, maxWidthPx, maxHeightPx, mainPart);
                foreach (var h in mainPart.HeaderParts)
                    ProcessScope(h.Header, clientToken, clientImagePath, techToken, techImagePath, jobInfo, maxWidthPx, maxHeightPx, mainPart);
                foreach (var f in mainPart.FooterParts)
                    ProcessScope(f.Footer, clientToken, clientImagePath, techToken, techImagePath, jobInfo, maxWidthPx, maxHeightPx, mainPart);

                AppendDailyLog(logsDir, "[INFO] InsertSignatureInlineAtToken: processed client + technician signatures.");
            }
            catch (Exception ex)
            {
                AppendDailyLog(logsDir, "[ERROR] InsertSignatureInlineAtToken: " + ex);
                throw;
            }
        }

        private void ProcessScope(OpenXmlElement scope,
             string clientToken,
             string clientImagePath,
             string techToken,
             string techImagePath,
             MaintenanceJobInfo jobInfo,
             int maxWidthPx,
             int maxHeightPx,
             MainDocumentPart mainPart)
        {
            if (scope == null) return;

            var paragraphs = scope.Descendants<DocumentFormat.OpenXml.Wordprocessing.Paragraph>().ToList();

            foreach (var para in paragraphs)
            {
                string fullText = string.Concat(para.Descendants<DocumentFormat.OpenXml.Wordprocessing.Text>().Select(t => t.Text));
                if (string.IsNullOrWhiteSpace(fullText)) continue;

                bool hasClient = fullText.Contains(clientToken);
                bool hasTech = fullText.Contains(techToken);

                // ✅ If no placeholder tokens → skip
                if (!hasClient && !hasTech)
                    continue;

                bool clientAvailable = hasClient && !string.IsNullOrEmpty(clientImagePath) && File.Exists(clientImagePath);
                bool techAvailable = hasTech && !string.IsNullOrEmpty(techImagePath) && File.Exists(techImagePath);

                // ✅ If neither signature is available → remove placeholder and skip
                if (!clientAvailable && !techAvailable)
                {
                    para.Remove();
                    continue;
                }

                // --- Build table ---
                var table = new Table(
                    new TableProperties(
                        new TableBorders(
                            new TopBorder { Val = BorderValues.None },
                            new LeftBorder { Val = BorderValues.None },
                            new BottomBorder { Val = BorderValues.None },
                            new RightBorder { Val = BorderValues.None },
                            new InsideHorizontalBorder { Val = BorderValues.None },
                            new InsideVerticalBorder { Val = BorderValues.None }
                        ),
                        new TableWidth { Type = TableWidthUnitValues.Pct, Width = "5000" }, // 100%
                        new TableJustification { Val = TableRowAlignmentValues.Center }
                    )
                );

                var tr1 = new TableRow(
                    new TableRowProperties(new TableRowHeight { Val = 2000, HeightType = HeightRuleValues.Exact })
                );
                var tr2 = new TableRow();

                int columnCount = (clientAvailable ? 1 : 0) + (techAvailable ? 1 : 0);
                int colWidth = 5000 / Math.Max(1, columnCount);

                var paraProps = new ParagraphProperties(
                    new Justification { Val = JustificationValues.Center },
                    new SpacingBetweenLines { Before = "720" }
                );

                // --- CLIENT column ---
                if (clientAvailable)
                {
                    var clientCell1 = new TableCell(
                        new TableCellProperties(new TableCellWidth { Type = TableWidthUnitValues.Pct, Width = colWidth.ToString() })
                    );
                    var clientPara = new Paragraph(paraProps.CloneNode(true));
                    var run = new Run();
                    AddImageToRun(mainPart, run, clientImagePath, maxWidthPx, maxHeightPx);
                    run.AppendChild(new Break());
                    var labelRun = new Run(
                        new RunProperties(new Underline { Val = UnderlineValues.Single }),
                        new W.Text(jobInfo?.PIC ?? "Customer")
                    );
                    clientPara.Append(run);
                    clientPara.Append(labelRun);
                    clientCell1.Append(clientPara);
                    tr1.Append(clientCell1);

                    var clientCell2 = new TableCell(new TableCellProperties(new TableCellWidth { Type = TableWidthUnitValues.Pct, Width = colWidth.ToString() }));
                    var clientNote = new Paragraph(new ParagraphProperties(new Justification { Val = JustificationValues.Center }));
                    clientNote.Append(new Run(new RunProperties(new FontSize { Val = "16" }), new W.Text("(Signature over Printed Name)")));
                    clientCell2.Append(clientNote);
                    tr2.Append(clientCell2);
                }

                // --- TECHNICIAN column ---
                if (techAvailable)
                {
                    var techCell1 = new TableCell(
                        new TableCellProperties(new TableCellWidth { Type = TableWidthUnitValues.Pct, Width = colWidth.ToString() })
                    );
                    var techPara = new Paragraph(paraProps.CloneNode(true));
                    var run = new Run();
                    AddImageToRun(mainPart, run, techImagePath, maxWidthPx, maxHeightPx);
                    run.AppendChild(new Break());
                    var labelRun = new Run(
                        new RunProperties(new Underline { Val = UnderlineValues.Single }),
                        new W.Text(jobInfo?.Technician ?? "Technician")
                    );
                    techPara.Append(run);
                    techPara.Append(labelRun);
                    techCell1.Append(techPara);
                    tr1.Append(techCell1);

                    var techCell2 = new TableCell(new TableCellProperties(new TableCellWidth { Type = TableWidthUnitValues.Pct, Width = colWidth.ToString() }));
                    var techNote = new Paragraph(new ParagraphProperties(new Justification { Val = JustificationValues.Center }));
                    techNote.Append(new Run(new RunProperties(new FontSize { Val = "16" }), new W.Text("(Signature over Printed Name)")));
                    techCell2.Append(techNote);
                    tr2.Append(techCell2);
                }

                table.Append(tr1);
                table.Append(tr2);

                para.InsertBeforeSelf(table);
                para.Remove();
            }
        }



        // Replace placeholders in body, headers, footers (merges split runs, then rewrites single run)
        private void ReplacePlaceholdersInWord(
            MainDocumentPart mainPart,
            Dictionary<string, string> placeholders,
            string logsDir)
        {
            if (mainPart == null || placeholders == null)
            {
                AppendDailyLog(logsDir, "[WARN] ReplacePlaceholdersInWord called with null parameters.");
                return;
            }

            try
            {
                if (placeholders.Count == 0)
                {
                    AppendDailyLog(logsDir, "[WARN] No placeholders provided.");
                    return;
                }

                // 1) Build a map of {{Key}} → Value (skip photos/signatures)
                var map = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase);
                foreach (var kvp in placeholders)
                {
                    var rawKey = kvp.Key?.Trim();
                    if (string.IsNullOrEmpty(rawKey)) continue;

                    if (string.Equals(rawKey, "Photos", StringComparison.OrdinalIgnoreCase) ||
                        string.Equals(rawKey, "{{Photos}}", StringComparison.OrdinalIgnoreCase) ||
                        string.Equals(rawKey, "MainClientSignatures", StringComparison.OrdinalIgnoreCase) ||
                        string.Equals(rawKey, "{{MainClientSignatures}}", StringComparison.OrdinalIgnoreCase) ||
                        string.Equals(rawKey, "MainTechSignatures", StringComparison.OrdinalIgnoreCase) ||
                        string.Equals(rawKey, "{{MainTechSignatures}}", StringComparison.OrdinalIgnoreCase))
                    {
                        continue; // skip images/signatures here
                    }

                    var token = rawKey.StartsWith("{{", StringComparison.Ordinal) ? rawKey : "{{" + rawKey + "}}";
                    map[token] = kvp.Value ?? string.Empty;
                }

                // 2) Replace in body
                var body = mainPart.Document.Body;
                if (body != null)
                    ReplacePlaceholdersInParagraphs(body.Elements<Paragraph>(), map, logsDir, "Body");

                // 3) Replace in headers
                foreach (var header in mainPart.HeaderParts)
                    ReplacePlaceholdersInParagraphs(header.Header.Descendants<Paragraph>(), map, logsDir, "Header");

                // 4) Replace in footers
                foreach (var footer in mainPart.FooterParts)
                    ReplacePlaceholdersInParagraphs(footer.Footer.Descendants<Paragraph>(), map, logsDir, "Footer");

                // 5) Replace inside tables
                ReplacePlaceholdersInTables(mainPart, map, logsDir);

                mainPart.Document.Save();
                AppendDailyLog(logsDir, "[INFO] Placeholders replaced successfully.");
            }
            catch (Exception ex)
            {
                AppendDailyLog(logsDir, "[ERROR] ReplacePlaceholdersInWord: " + ex);
                throw;
            }
        }

        // REPLACE the whole method with this version
        private void ReplacePlaceholdersInParagraphs(
            IEnumerable<Paragraph> paragraphs,
            Dictionary<string, string> map,
            string logsDir,
            string scope = "Body")
        {
            try
            {
                // Prepare token list once
                var tokens = map.Keys.ToList();
                foreach (var paragraph in paragraphs)
                {
                    // Collect contiguous text with run mapping
                    var pieces = new List<(W.Run Run, W.Text Text, string Value, int Start, int Length)>();
                    int cursor = 0;
                    foreach (var t in paragraph.Descendants<W.Text>())
                    {
                        var v = t.Text ?? string.Empty;
                        pieces.Add((t.Ancestors<W.Run>().FirstOrDefault(), t, v, cursor, v.Length));
                        cursor += v.Length;
                    }
                    if (cursor == 0) continue;

                    string full = string.Concat(pieces.Select(p => p.Value));
                    if (!tokens.Any(tok => full.IndexOf(tok, StringComparison.Ordinal) >= 0))
                        continue;

                    // Find matches across flattened text
                    var matches = new List<_Match>();
                    foreach (var tok in tokens)
                    {
                        int idx = 0;
                        while ((idx = full.IndexOf(tok, idx, StringComparison.Ordinal)) >= 0)
                        {
                            matches.Add(new _Match
                            {
                                Start = idx,
                                Length = tok.Length,
                                Replacement = map[tok] ?? string.Empty,
                                Token = tok
                            });
                            idx += tok.Length;
                        }
                    }
                    if (matches.Count == 0) continue;

                    // Sort + de-overlap
                    matches.Sort((a, b) => a.Start.CompareTo(b.Start));
                    var filtered = new List<_Match>();
                    int consumedUntil = -1;
                    foreach (var m in matches)
                    {
                        if (m.Start >= consumedUntil)
                        {
                            filtered.Add(m);
                            consumedUntil = m.Start + m.Length;
                        }
                    }

                    // Helpers
                    var outChildren = new List<OpenXmlElement>();

                    void CopyOriginalSlice(int start, int length)
                    {
                        int remaining = length, pos = start;
                        while (remaining > 0)
                        {
                            var piece = pieces.FirstOrDefault(p => pos >= p.Start && pos < p.Start + p.Length);
                            if (piece.Text == null) break;

                            int offset = pos - piece.Start;
                            int take = Math.Min(remaining, piece.Length - offset);
                            string slice = piece.Value.Substring(offset, take);

                            var newRun = new W.Run();
                            if (piece.Run?.RunProperties != null)
                                newRun.RunProperties = (W.RunProperties)piece.Run.RunProperties.CloneNode(true);

                            newRun.Append(new W.Text(slice) { Space = SpaceProcessingModeValues.Preserve });
                            outChildren.Add(newRun);

                            pos += take;
                            remaining -= take;
                        }
                    }

                    void AppendReplacementWithLineBreaks(string replacement, string tokenForLog)
                    {
                        // Turn \n into <w:br/> so formatting is kept
                        var lines = (replacement ?? string.Empty).Split(new[] { "\n" }, StringSplitOptions.None);
                        for (int i = 0; i < lines.Length; i++)
                        {
                            outChildren.Add(new W.Run(new W.Text(lines[i] ?? string.Empty)
                            {
                                Space = SpaceProcessingModeValues.Preserve
                            }));
                            if (i < lines.Length - 1)
                                outChildren.Add(new W.Break());
                        }
                        AppendDailyLog(logsDir, $"[INFO][{scope}] Replaced {tokenForLog} → '{replacement}'.");
                    }

                    // Rebuild the paragraph
                    int current = 0;
                    foreach (var m in filtered)
                    {
                        if (m.Start > current)
                            CopyOriginalSlice(current, m.Start - current);

                        AppendReplacementWithLineBreaks(m.Replacement, m.Token);
                        current = m.Start + m.Length;
                    }
                    if (current < full.Length)
                        CopyOriginalSlice(current, full.Length - current);

                    paragraph.RemoveAllChildren<W.Run>();
                    foreach (var child in outChildren) paragraph.Append(child);
                }
            }
            catch (Exception ex)
            {
                AppendDailyLog(logsDir, $"[ERROR][{scope}] ReplacePlaceholdersInParagraphs: {ex}");
                throw;
            }
        }


        private void InsertNumberedListAtPlaceholder(
            Paragraph paragraph,
            string placeholder,
            string value,
            string logsDir,
            string scope)
        {
            try
            {
                var parent = paragraph.Parent;
                if (parent == null) return;

                // Remove placeholder text
                foreach (var text in paragraph.Descendants<W.Text>())
                {
                    if (text.Text.Contains(placeholder))
                    {
                        text.Text = text.Text.Replace(placeholder, "");
                    }
                }

                if (string.IsNullOrWhiteSpace(value)) return;

                var items = value.Split(new[] { '\n' }, StringSplitOptions.RemoveEmptyEntries);

                foreach (var item in items)
                {
                    var newPara = new Paragraph(new Run(new W.Text(item)));
                    parent.InsertAfter(newPara, paragraph);
                }

                AppendDailyLog(logsDir, $"[LIST][{scope}] Expanded {placeholder} into {items.Length} items.");
            }
            catch (Exception ex)
            {
                AppendDailyLog(logsDir, $"[ERROR][{scope}] InsertNumberedListAtPlaceholder: {ex}");
            }
        }




        /// <summary>
        /// Checks if a file is an image based on extension.
        /// </summary>
        private bool IsImageFile(string path)
        {
            string ext = Path.GetExtension(path)?.ToLower();
            return ext == ".png" || ext == ".jpg" || ext == ".jpeg" || ext == ".bmp" || ext == ".gif" || ext == ".tiff";
        }


        // Add drawing/image into an existing Run (adds image part to document and a Drawing inline)
        // Append an inline image into the given run (no assumptions about run.Parent).
        // Defaults keep signatures small. For photos, pass a larger width from your table code.
        // Add drawing/image into an existing Run (adds image part to document and a Drawing inline)
        // Append an inline image into the given run (no assumptions about run.Parent).
        // maxWidthPx / maxHeightPx are caps (no upscaling). Uses EMUs conversion 9525 emu per px.
        private void AddImageToRun(MainDocumentPart mainPart, W.Run run, string imagePath, int maxWidthPx = 140, int maxHeightPx = 80)
        {
            if (mainPart == null || run == null || string.IsNullOrWhiteSpace(imagePath) || !File.Exists(imagePath))
                return;

            // pick part type and add image part
            var partType = GetImagePartType(IOPath.GetExtension(imagePath));
            var imagePart = mainPart.AddImagePart(partType);

            using (var fs = new FileStream(imagePath, FileMode.Open, FileAccess.Read))
                imagePart.FeedData(fs);

            string relId = mainPart.GetIdOfPart(imagePart);

            // compute scaled pixel dims (preserve aspect ratio, don't upscale)
            int finalWidthPx, finalHeightPx;
            using (var img = System.Drawing.Image.FromFile(imagePath))
            {
                double ratioX = (double)maxWidthPx / img.Width;
                double ratioY = (double)maxHeightPx / img.Height;
                double ratio = Math.Min(ratioX, ratioY);
                if (ratio <= 0) ratio = 1.0;
                if (ratio > 1.0) ratio = 1.0; // no upscaling

                finalWidthPx = (int)Math.Round(img.Width * ratio);
                finalHeightPx = (int)Math.Round(img.Height * ratio);
            }

            // EMU conversion: 1 px = 9525 EMUs (assuming 96 DPI). This is safe & widely used.
            const long emuPerPx = 9525L;
            long cx = finalWidthPx * emuPerPx;
            long cy = finalHeightPx * emuPerPx;

            // build inline drawing (inline makes it behave like text and appear exactly where appended)
            var inline =
                new DW.Inline(
                    new DW.Extent { Cx = cx, Cy = cy },
                    new DW.EffectExtent { LeftEdge = 0L, TopEdge = 0L, RightEdge = 0L, BottomEdge = 0L },
                    new DW.DocProperties { Id = (UInt32Value)1U, Name = IOPath.GetFileName(imagePath) },
                    new DW.NonVisualGraphicFrameDrawingProperties(new A.GraphicFrameLocks { NoChangeAspect = true }),
                    new A.Graphic(
                        new A.GraphicData(
                            new PIC.Picture(
                                new PIC.NonVisualPictureProperties(
                                    new PIC.NonVisualDrawingProperties { Id = 0U, Name = IOPath.GetFileName(imagePath) },
                                    new PIC.NonVisualPictureDrawingProperties()),
                                new PIC.BlipFill(
                                    new A.Blip { Embed = relId },
                                    new A.Stretch(new A.FillRectangle())
                                ),
                                new PIC.ShapeProperties(
                                    new A.Transform2D(
                                        new A.Offset { X = 0L, Y = 0L },
                                        new A.Extents { Cx = cx, Cy = cy }
                                    ),
                                    new A.PresetGeometry(new A.AdjustValueList()) { Preset = A.ShapeTypeValues.Rectangle }
                                )
                            )
                        )
                        { Uri = "http://schemas.openxmlformats.org/drawingml/2006/picture" }
                    )
                )
                {
                    DistanceFromTop = 0U,
                    DistanceFromBottom = 0U,
                    DistanceFromLeft = 0U,
                    DistanceFromRight = 0U
                };

            // Append the inline drawing as a Wordprocessing Drawing element
            run.Append(new W.Drawing(inline));
        }

        private static ImagePartType GetImagePartType(string extension)
        {
            switch (extension.ToLower())
            {
                case ".png": return ImagePartType.Png;
                case ".jpg":
                case ".jpeg": return ImagePartType.Jpeg;
                case ".gif": return ImagePartType.Gif;
                case ".bmp": return ImagePartType.Bmp;
                case ".tiff": return ImagePartType.Tiff;
                default: throw new ArgumentException("Unsupported image format: " + extension);
            }
        }

        // Insert a photos table replacing the first paragraph that contains "{{Photos}}"
        // columns = number of images per row; imageWidthPx = width in px to scale each image
        // 3 per row, centered images, no borders. Replaces the {{Photos}} paragraph even if the token is split/styled.
        private void InsertPhotosTable(
            MainDocumentPart mainPart,
            List<string> photos,
            int columns,
            int imageWidthPx,
            string logsDir)
        {
            if (mainPart == null) return;

            // Gather all scopes: body + headers + footers
            var scopes = new List<OpenXmlElement>();
            if (mainPart.Document?.Body != null) scopes.Add(mainPart.Document.Body);
            scopes.AddRange(mainPart.HeaderParts.Select(h => (OpenXmlElement)h.Header));
            scopes.AddRange(mainPart.FooterParts.Select(f => (OpenXmlElement)f.Footer));

            // --- Find the placeholder paragraph ---
            W.Paragraph placeholderPara = null;
            foreach (var scope in scopes.Where(s => s != null))
            {
                placeholderPara = scope.Descendants<W.Paragraph>()
                                       .FirstOrDefault(p => (p.InnerText ?? "").Contains("{{Photos}}"));
                if (placeholderPara == null)
                {
                    var tNode = scope.Descendants<W.Text>()
                                     .FirstOrDefault(t => (t.Text ?? "").Contains("{{Photos}}"));
                    if (tNode != null)
                        placeholderPara = tNode.Ancestors<W.Paragraph>().FirstOrDefault();
                }
                if (placeholderPara != null) break;
            }

            // --- If no photos supplied ---
            if (photos == null || photos.Count == 0)
            {
                if (placeholderPara != null)
                {
                    placeholderPara.Remove();
                    AppendDailyLog(logsDir, "[INFO] No photos found → removed {{Photos}} placeholder.");
                }
                else
                {
                    AppendDailyLog(logsDir, "[INFO] No photos found and no {{Photos}} placeholder.");
                }
                return;
            }

            // --- If photos exist, build the table ---
            columns = Math.Max(1, columns);
            var table = new W.Table();

            var tblProps = new W.TableProperties(
                new W.TableBorders(
                    new W.TopBorder { Val = W.BorderValues.None },
                    new W.LeftBorder { Val = W.BorderValues.None },
                    new W.BottomBorder { Val = W.BorderValues.None },
                    new W.RightBorder { Val = W.BorderValues.None },
                    new W.InsideHorizontalBorder { Val = W.BorderValues.None },
                    new W.InsideVerticalBorder { Val = W.BorderValues.None }
                ),
                new W.TableWidth { Type = W.TableWidthUnitValues.Auto }
            );
            table.AppendChild(tblProps);

            int idx = 0;
            while (idx < photos.Count)
            {
                var tr = new W.TableRow();
                for (int c = 0; c < columns; c++)
                {
                    var tc = new W.TableCell();
                    if (idx < photos.Count)
                    {
                        string imgPath = photos[idx++];
                        var p = new W.Paragraph(
                            new W.ParagraphProperties(new W.Justification { Val = W.JustificationValues.Center })
                        );
                        var r = new W.Run();
                        AddImageToRun(mainPart, r, imgPath, maxWidthPx: imageWidthPx, maxHeightPx: imageWidthPx * 3);
                        p.Append(r);
                        tc.Append(p);
                    }
                    else
                    {
                        tc.Append(new W.Paragraph(new W.Run(new W.Text(""))));
                    }
                    tr.Append(tc);
                }
                table.Append(tr);
            }

            // --- Replace placeholder or append at the end ---
            if (placeholderPara != null)
            {
                placeholderPara.InsertBeforeSelf(table);
                placeholderPara.Remove();
            }
            else
            {
                AppendDailyLog(logsDir, "[WARN] {{Photos}} placeholder not found. Appending photos at the end.");
                mainPart.Document.Body.Append(table);
            }

            AppendDailyLog(logsDir, $"[INFO] InsertPhotosTable: inserted {photos.Count} photos in {columns}-column table");
        }


        // Convert DOCX -> PDF using LibreOffice CLI (synchronous), returns true if outputPdf present
        // LibreOffice conversion — slightly more robust logging and larger timeout.
        // Make sure profilePath exists & is writable by the app pool. If LibreOffice still fails,
        // check the logs we append to logsDir (stdout/stderr).
        private bool ConvertToPdfWithLibreOffice(string inputDocx, string outputPdf, string profilePath, string logsDir)
        {
            string libreOfficePath = @"C:\Program Files\LibreOffice\program\soffice.exe";
            if (!File.Exists(libreOfficePath))
            {
                AppendDailyLog(logsDir, "[ERROR] LibreOffice not found at: " + libreOfficePath);
                return false;
            }

            string outputDir = Path.GetDirectoryName(outputPdf);
            Directory.CreateDirectory(outputDir);
            Directory.CreateDirectory(profilePath);

            // Kill any stale processes
            foreach (var p in Process.GetProcessesByName("soffice")) { try { p.Kill(); } catch { } }
            foreach (var p in Process.GetProcessesByName("soffice.bin")) { try { p.Kill(); } catch { } }

            string userProfileUri = $"file:///{profilePath.Replace("\\", "/")}";

            // Filter options: embed fonts, JPEG compression, cap DPI
            string filterOptions =
                "ReduceImageResolution=true," +
                "MaxImageResolution=150," +          // 150 DPI for images in the report
                "UseLosslessCompression=false," +    // JPEG instead of PNG
                "EmbedStandardFonts=true," +
                "SelectPdfVersion=1";                // PDF/A-1 compliance (optional but good for reports)

            string arguments =
                $"--headless --nologo --nofirststartwizard " +
                $"-env:UserInstallation={userProfileUri} " +
                $"--convert-to pdf:writer_pdf_Export:{filterOptions} " +
                $"--outdir \"{outputDir}\" \"{inputDocx}\"";

            AppendDailyLog(logsDir, "[INFO] Running LibreOffice with arguments: " + arguments);

            var startInfo = new ProcessStartInfo
            {
                FileName = libreOfficePath,
                Arguments = arguments,
                CreateNoWindow = true,
                UseShellExecute = false,
                RedirectStandardOutput = true,
                RedirectStandardError = true
            };

            try
            {
                using (var proc = Process.Start(startInfo))
                {
                    string stdOut = proc.StandardOutput.ReadToEnd();
                    string stdErr = proc.StandardError.ReadToEnd();

                    bool exited = proc.WaitForExit(300_000); // 5 minutes
                    if (!exited)
                    {
                        try { proc.Kill(); } catch { }
                        AppendDailyLog(logsDir, "[ERROR] LibreOffice timed out.");
                        return false;
                    }

                    AppendDailyLog(logsDir, $"[LIBREOUT] STDOUT: {stdOut}");
                    AppendDailyLog(logsDir, $"[LIBREOUT] STDERR: {stdErr}");

                    string expectedPdf = Path.Combine(outputDir, Path.GetFileNameWithoutExtension(inputDocx) + ".pdf");
                    if (!File.Exists(expectedPdf))
                    {
                        AppendDailyLog(logsDir, "[ERROR] LibreOffice did not produce PDF: " + expectedPdf);
                        return false;
                    }

                    if (!string.Equals(expectedPdf, outputPdf, StringComparison.OrdinalIgnoreCase))
                    {
                        if (File.Exists(outputPdf)) File.Delete(outputPdf);
                        File.Move(expectedPdf, outputPdf);
                    }

                    AppendDailyLog(logsDir, "[INFO] PDF generated by LibreOffice: " + outputPdf);
                    return true;
                }
            }
            catch (Exception ex)
            {
                AppendDailyLog(logsDir, "[ERROR] ConvertToPdfWithLibreOffice: " + ex);
                return false;
            }
            finally
            {
                // ✅ ALWAYS clean the LO profile
                try { CleanupLibreOfficeProfile(profilePath, logsDir); } catch { }
            }
        }

        private string GetGhostscriptPath()
        {
            return @"C:\Program Files\gs\gs10.05.1\bin\gswin64c.exe"; // adjust version number
        }


        private bool OptimizePdfWithGhostscript(string inputPdf, string outputPdf, string logsDir, MaintenanceJobInfo currMaintenanceJob,
                                                int colorGrayDpi = 150, int monoDpi = 300, int jpegQuality = 85,
                                                string preset = "/ebook")
        {
            try
            {
                string gsPath = GetGhostscriptPath();
                if (string.IsNullOrWhiteSpace(gsPath) || (!File.Exists(gsPath) && !gsPath.EndsWith("exe", StringComparison.OrdinalIgnoreCase)))
                {
                    AppendDailyLog(logsDir, "[ERROR] Ghostscript not found.");
                    return false;
                }

                // For reports: /ebook is the sweet spot. /screen is smaller but noticeably softer.
                string args =
                    $"-sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook " +
                    "-dEmbedAllFonts=true -dSubsetFonts=true -dDetectDuplicateImages=true " +
                    "-dDownsampleColorImages=true -dColorImageResolution=150 " +
                    "-dDownsampleGrayImages=true -dGrayImageResolution=150 " +
                    "-dDownsampleMonoImages=true -dMonoImageResolution=300 " +
                    "-dNOPAUSE -dQUIET -dBATCH " +
                    $"-sOutputFile=\"{outputPdf}\" \"{inputPdf}\"";


                AppendDailyLog(logsDir, "[INFO] Running Ghostscript with arguments: " + args);

                var psi = new ProcessStartInfo
                {
                    FileName = gsPath,
                    Arguments = args,
                    CreateNoWindow = true,
                    UseShellExecute = false,
                    RedirectStandardOutput = true,
                    RedirectStandardError = true
                };

                using (var p = Process.Start(psi))
                {
                    string out1 = p.StandardOutput.ReadToEnd();
                    string err1 = p.StandardError.ReadToEnd();
                    bool exited = p.WaitForExit(180_000); // 3 minutes

                    if (!exited)
                    {
                        try { p.Kill(); } catch { }
                        AppendDailyLog(logsDir, "[ERROR] Ghostscript optimization timed out.");
                        return false;
                    }

                    AppendDailyLog(logsDir, $"[GHOSTSCRIPT OUT] STDOUT: {out1}");
                    AppendDailyLog(logsDir, $"[GHOSTSCRIPT OUT] STDERR: {err1}");

                    // 3) Ensure PDF is really ready
                    WaitForFile(inputPdf, logsDir);

                    // 4) Email the PDF
                    try
                    {

                        if (p.ExitCode == 0 && File.Exists(outputPdf))
                        {
                            AppendDailyLog(logsDir,
                                $"[INFO] PDF optimization succeeded. Sending optimized file. JobID={currMaintenanceJob.MaintenanceJobID}");
                            _Email(currMaintenanceJob, outputPdf, logsDir); // ✅ optimized
                        }
                        else
                        {
                            AppendDailyLog(logsDir,
                                $"[WARN] Ghostscript failed. Sending original file. JobID={currMaintenanceJob.MaintenanceJobID}");
                            _Email(currMaintenanceJob, inputPdf, logsDir);   // fallback
                        }                      
                    }
                    catch (Exception ex)
                    {
                        AppendDailyLog(logsDir, "[ERROR] Failed to send email after PDF generation: " + ex);
                        return false;
                    }

                    return File.Exists(outputPdf);
                }


            }
            catch (Exception ex)
            {
                AppendDailyLog(logsDir, "[ERROR] OptimizePdfWithGhostscript: " + ex);
                return false;
            }
        }

        private bool ConvertAndOptimizeReportPdf(string inputDocx, string finalPdfPath, string profilePath, string logsDir, MaintenanceJobInfo currMaintenanceJob)
        {
            // 1) Convert with LibreOffice
            if (!ConvertToPdfWithLibreOffice(inputDocx, finalPdfPath, profilePath, logsDir))
                return false;

            // 2) Optimize with Ghostscript to a temp file
            string tmpOptimized = Path.Combine(
                Path.GetDirectoryName(finalPdfPath),
                Path.GetFileNameWithoutExtension(finalPdfPath) + "_small.pdf");

            bool optimized = OptimizePdfWithGhostscript(
                finalPdfPath,
                tmpOptimized,
                logsDir,
                currMaintenanceJob,
                colorGrayDpi: 150,
                monoDpi: 300,
                jpegQuality: 85,
                preset: "/ebook" // good for reports
            );

            if (optimized)
            {
                try
                {
                    // Replace original with the smaller one
                    if (File.Exists(finalPdfPath)) File.Delete(finalPdfPath);
                    File.Move(tmpOptimized, finalPdfPath);
                    AppendDailyLog(logsDir, "[INFO] Replaced with optimized PDF: " + finalPdfPath);
                }
                catch (Exception moveEx)
                {
                    AppendDailyLog(logsDir, "[WARN] Failed to replace PDF with optimized version: " + moveEx);
                    // Leave the original PDF; cleanup temp if possible
                    try { if (File.Exists(tmpOptimized)) File.Delete(tmpOptimized); } catch { }
                }
            }
            else
            {
                // Cleanup stray temp file if any
                try { if (File.Exists(tmpOptimized)) File.Delete(tmpOptimized); } catch { }
            }        

            return true;
        }

        /// <summary>
        /// Wait until a file is ready to be accessed (max 10 seconds).
        /// </summary>
        /// <summary>
        /// Wait until a file is ready to be accessed (max 10 seconds).
        /// Logs progress using AppendDailyLog.
        /// </summary>
        private void WaitForFile(string filePath, string logsDir, int timeoutMs = 10000)
        {
            var sw = System.Diagnostics.Stopwatch.StartNew();

            while (sw.ElapsedMilliseconds < timeoutMs)
            {
                try
                {
                    if (File.Exists(filePath))
                    {
                        using (FileStream fs = File.Open(filePath, FileMode.Open, FileAccess.Read, FileShare.None))
                        {
                            // ✅ File is ready
                            AppendDailyLog(logsDir, "[INFO] File ready for email: " + filePath);
                            return;
                        }
                    }
                }
                catch
                {
                    // File locked → wait and retry
                }

                System.Threading.Thread.Sleep(200);
            }

            AppendDailyLog(logsDir, "[ERROR] Timeout waiting for file: " + filePath);
            throw new IOException($"Timeout waiting for file: {filePath}");
        }

        public MaintenanceJobInfo _Email(MaintenanceJobInfo currMaintenanceJob, string pdfPath, string logsDir)
        {
            string finalRecipients = "";

            // ✅ Prevent duplicate send
            if (!TryMarkJobSent(currMaintenanceJob.MaintenanceJobID))
            {
                AppendDailyLog(logsDir,
                    $"[WARN] Skipping duplicate send for JobID={currMaintenanceJob.MaintenanceJobID}");
                currMaintenanceJob.ErrorMessage = "Skipped duplicate send";
                return currMaintenanceJob;
            }

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            using (MySqlCommand cmd = new MySqlCommand())
            {
                conn.Open();
                cmd.Connection = conn;

                try
                {
                    string strSender;
                    switch (currMaintenanceJob.AssetCompanyID)
                    {
                        case 1: strSender = "system.sg.report@systempest.com"; break;
                        case 2: strSender = "my.report@systempest.com"; break;
                        case 3: strSender = "asiawhite.report@systempest.com"; break;
                        default: strSender = "system.sg.report@systempest.com"; break;
                    }

                    string strSource = "System Pest Report";
                    string m_strEmailServer = "mail.systempest.com";
                    string m_strEmailPassword = "NmRDefe22PvX";

                    // ✅ Local domain blacklist
                    string[] domainBlacklist = { "tempmail.com", "spamdomain.org", "10minutemail.net" };

                    using (MailMessage eMail = new MailMessage())
                    {
                        eMail.From = new MailAddress(strSender, strSource);
                        eMail.Subject = "Pest Control Service Report";
                        eMail.Body = @"Dear Customer,<br/><br/>
                                Pest control services has been rendered and completed. Service report as attached.<br/><br/>
                                For any queries, please contact our office directly at 6748 8966.<br/><br/>
                                This email is auto-generated. Do not reply.";
                        eMail.IsBodyHtml = true;
                        eMail.Headers.Add("Message-Id", $"<{Guid.NewGuid()}@{m_strEmailServer}>");

                        // ✅ Parse & validate recipients
                        try
                        {
                            var uniqueEmails = new HashSet<string>(StringComparer.OrdinalIgnoreCase);

                            string[] arrData = currMaintenanceJob.Email
                                .Split(new[] { ',', ';' }, StringSplitOptions.RemoveEmptyEntries);

                            foreach (string addr in arrData)
                            {
                                string cleanAddr = addr.Trim();
                                if (string.IsNullOrEmpty(cleanAddr) || !uniqueEmails.Add(cleanAddr))
                                    continue;

                                try
                                {
                                    var mailAddr = new MailAddress(cleanAddr);
                                    string domain = mailAddr.Address.Split('@').Last().ToLower();

                                    if (domainBlacklist.Contains(domain))
                                    {
                                        AppendDailyLog(logsDir,
                                            $"[WARN] Skipped blacklisted domain: {domain} | Recipient={mailAddr.Address}, JobID={currMaintenanceJob.MaintenanceJobID}, Driver={currMaintenanceJob.DriverName}, Technician={currMaintenanceJob.Technician}, Customer={currMaintenanceJob.PIC}, Address={currMaintenanceJob.Address}");
                                        continue;
                                    }

                                    eMail.To.Add(mailAddr);
                                }
                                catch (FormatException fe)
                                {
                                    AppendDailyLog(logsDir,
                                        $"[WARN] Invalid email skipped: {cleanAddr} - {fe.Message} | JobID={currMaintenanceJob.MaintenanceJobID}, Driver={currMaintenanceJob.DriverName}, Technician={currMaintenanceJob.Technician}, Customer={currMaintenanceJob.PIC}, Address={currMaintenanceJob.Address}, Email={currMaintenanceJob.Email}");
                                }
                            }

                            finalRecipients = string.Join(", ", eMail.To.Select(t => t.Address));
                            AppendDailyLog(logsDir,
                                $"[INFO] Final recipient list: {finalRecipients} | JobID={currMaintenanceJob.MaintenanceJobID}, Driver={currMaintenanceJob.DriverName}, Technician={currMaintenanceJob.Technician}, Customer={currMaintenanceJob.PIC}, Address={currMaintenanceJob.Address}");
                        }
                        catch (Exception ex)
                        {
                            AppendDailyLog(logsDir,
                                $"[ERROR] Parse Email Address: {ex.Message} | JobID={currMaintenanceJob.MaintenanceJobID}, Driver={currMaintenanceJob.DriverName}, Technician={currMaintenanceJob.Technician}, Customer={currMaintenanceJob.PIC}, Address={currMaintenanceJob.Address}, Email={currMaintenanceJob.Email}");
                        }

                        // ✅ Add BCC for traceability
                        try
                        {
                            eMail.Bcc.Add(new MailAddress("system.sg.report@systempest.com"));
                        }
                        catch (Exception bccEx)
                        {
                            AppendDailyLog(logsDir,
                                $"[WARN] Failed to add BCC: {bccEx.Message} | JobID={currMaintenanceJob.MaintenanceJobID}, Driver={currMaintenanceJob.DriverName}, Technician={currMaintenanceJob.Technician}, Customer={currMaintenanceJob.PIC}, Address={currMaintenanceJob.Address}, Email={finalRecipients}");
                        }

                        // ✅ Attach PDF
                        if (File.Exists(pdfPath))
                        {
                            eMail.Attachments.Add(new Attachment(pdfPath));
                            AppendDailyLog(logsDir,
                                $"[INFO] Attached PDF: {pdfPath} | JobID={currMaintenanceJob.MaintenanceJobID}, Driver={currMaintenanceJob.DriverName}, Technician={currMaintenanceJob.Technician}, Customer={currMaintenanceJob.PIC}, Address={currMaintenanceJob.Address}, Email={finalRecipients}");
                        }
                        else
                        {
                            AppendDailyLog(logsDir,
                                $"[WARN] PDF file not found for attachment: {pdfPath} | JobID={currMaintenanceJob.MaintenanceJobID}, Driver={currMaintenanceJob.DriverName}, Technician={currMaintenanceJob.Technician}, Customer={currMaintenanceJob.PIC}, Address={currMaintenanceJob.Address}, Email={finalRecipients}");
                        }

                        // ✅ Retry logic (3 attempts)
                        int attempts = 0;
                        bool sent = false;

                        while (!sent && attempts < 3)
                        {
                            attempts++;
                            try
                            {
                                using (SmtpClient smtp = new SmtpClient(m_strEmailServer))
                                {
                                    smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                                    smtp.Port = 26;
                                    smtp.UseDefaultCredentials = false;
                                    smtp.Credentials = new NetworkCredential(strSender, m_strEmailPassword);
                                    smtp.EnableSsl = false;

                                    AppendDailyLog(logsDir,
                                        $"[INFO] Attempting to send email (Attempt {attempts}) | JobID={currMaintenanceJob.MaintenanceJobID}, Driver={currMaintenanceJob.DriverName}, Technician={currMaintenanceJob.Technician}, Customer={currMaintenanceJob.PIC}, Address={currMaintenanceJob.Address}, Email={finalRecipients}");
                                    smtp.Send(eMail);
                                }

                                AppendDailyLog(logsDir,
                                    $"[INFO] Email successfully sent to [{finalRecipients}] on attempt {attempts} | JobID={currMaintenanceJob.MaintenanceJobID}, Driver={currMaintenanceJob.DriverName}, Technician={currMaintenanceJob.Technician}, Customer={currMaintenanceJob.PIC}, Address={currMaintenanceJob.Address}");

                                // ✅ Real-time bounce check (force check every trigger)
                                CheckBounces(
                                    logsDir,
                                    "mail.systempest.com",
                                    993,
                                    strSender,
                                    m_strEmailPassword,
                                    currMaintenanceJob
                                );

                                sent = true;
                            }
                            catch (SmtpException smtpEx)
                            {
                                string msg = smtpEx.Message.ToLower();

                                if (msg.Contains("blacklist") || msg.Contains("spamhaus") || msg.Contains("rejected") ||
                                    msg.Contains("denied") || msg.Contains("relay access denied") ||
                                    msg.Contains("unauthorized") || msg.Contains("policy") || msg.Contains("spam"))
                                {
                                    AppendDailyLog(logsDir,
                                        $"[ERROR] Likely blocked or blacklisted: {smtpEx.Message} | Sender={strSender}, Recipients={finalRecipients}, JobID={currMaintenanceJob.MaintenanceJobID}, Driver={currMaintenanceJob.DriverName}");
                                }
                                else
                                {
                                    AppendDailyLog(logsDir,
                                        $"[WARN] SMTP attempt {attempts} failed: {smtpEx.Message} | JobID={currMaintenanceJob.MaintenanceJobID}, Driver={currMaintenanceJob.DriverName}, Technician={currMaintenanceJob.Technician}, Customer={currMaintenanceJob.PIC}, Address={currMaintenanceJob.Address}, Email={finalRecipients}");
                                }

                                if (attempts < 3) System.Threading.Thread.Sleep(2000);
                            }
                            catch (Exception ex)
                            {
                                AppendDailyLog(logsDir,
                                    $"[ERROR] Unexpected error sending email: {ex.Message} | JobID={currMaintenanceJob.MaintenanceJobID}, Driver={currMaintenanceJob.DriverName}, Technician={currMaintenanceJob.Technician}, Customer={currMaintenanceJob.PIC}, Address={currMaintenanceJob.Address}, Email={finalRecipients}");
                                break;
                            }
                        }

                        if (!sent)
                        {
                            AppendDailyLog(logsDir,
                                $"[ERROR] Email failed after 3 attempts. | JobID={currMaintenanceJob.MaintenanceJobID}, Driver={currMaintenanceJob.DriverName}, Technician={currMaintenanceJob.Technician}, Customer={currMaintenanceJob.PIC}, Address={currMaintenanceJob.Address}, Email={finalRecipients}");
                        }
                    }
                }
                catch (Exception ex)
                {
                    AppendDailyLog(logsDir,
                        $"[ERROR] Email process failed: {ex.Message} | JobID={currMaintenanceJob.MaintenanceJobID}, Driver={currMaintenanceJob.DriverName}, Technician={currMaintenanceJob.Technician}, Customer={currMaintenanceJob.PIC}, Address={currMaintenanceJob.Address}, Email={currMaintenanceJob.Email}");
                }

                conn.Close();
            }

            currMaintenanceJob.ErrorMessage = "Success";
            return currMaintenanceJob;
        }

        // ✅ Bounce checker
        // ✅ Flexible Bounce Checker (IMAP + SSL/TLS fallback + multiple folders)
        // Keep these static for throttling across call
        private void CheckBounces(
            string logsDir,
            string mailServer,
            int port,
            string strSender,
            string password,
        MaintenanceJobInfo currMaintenanceJob)
        {
            int intervalMinutes = 10; // default
            bool forceCheck = false;
            bool allowPlainFallback = false;

            try
            {
                var configValue = FMSWebApi.Properties.Settings.Default.CheckBounceInterval;
                if (int.TryParse(configValue, out int configInterval))
                {
                    intervalMinutes = configInterval;

                    if (configInterval == 0)
                    {
                        forceCheck = true;
                        AppendDailyLog(logsDir,
                            $"[WARN] REAL-TIME BOUNCE CHECK MODE ENABLED (interval=0). " +
                            $"Every trigger will connect to IMAP. Be careful in production. Sender={strSender}, JobID={(currMaintenanceJob?.MaintenanceJobID ?? 0)}");
                    }
                }
            }
            catch { /* ignore config errors */ }

            try
            {
                var fallbackSetting = FMSWebApi.Properties.Settings.Default.AllowPlainImapFallback;
                if (bool.TryParse(fallbackSetting, out bool parsed))
                    allowPlainFallback = parsed;
            }
            catch { /* ignore */ }

            lock (_bounceLock)
            {
                if (!forceCheck && (DateTime.Now - _lastBounceCheck).TotalMinutes < intervalMinutes)
                {
                    AppendDailyLog(logsDir,
                        $"[INFO] Skipped bounce check (last run {Math.Round((DateTime.Now - _lastBounceCheck).TotalMinutes, 1)} mins ago, interval={intervalMinutes}m). " +
                        $"Sender={strSender}, JobID={(currMaintenanceJob?.MaintenanceJobID ?? 0)}");
                    return;
                }

                _lastBounceCheck = DateTime.Now;
            }

            try
            {
                using (var client = new ImapClient())
                {
                    client.CheckCertificateRevocation = false;
                    System.Net.ServicePointManager.SecurityProtocol =
                        SecurityProtocolType.Tls12 | SecurityProtocolType.Tls13;

                    // 🔎 Enhanced certificate logging
                    client.ServerCertificateValidationCallback = (sender, certificate, chain, sslPolicyErrors) =>
                    {
                        try
                        {
                            var cert2 = new System.Security.Cryptography.X509Certificates.X509Certificate2(certificate);

                            AppendDailyLog(logsDir,
                                $"[CERT] Presented by {mailServer}:{port} | Subject={cert2.Subject}, Issuer={cert2.Issuer}, " +
                                $"ValidFrom={cert2.NotBefore}, ValidTo={cert2.NotAfter}");

                            foreach (var ext in cert2.Extensions)
                            {
                                if (ext.Oid?.Value == "2.5.29.17") // SAN
                                {
                                    string san = ext.Format(false);
                                    AppendDailyLog(logsDir, $"[CERT] SAN={san}");
                                }
                            }

                            if (sslPolicyErrors != System.Net.Security.SslPolicyErrors.None)
                                AppendDailyLog(logsDir, $"[CERT-ERROR] PolicyErrors={sslPolicyErrors}");
                        }
                        catch (Exception ex)
                        {
                            AppendDailyLog(logsDir, $"[CERT-ERROR] Failed to parse cert: {ex.Message}");
                        }

                        return true; // still allow (bypassing validation)
                    };

                    bool connected = false;

                    try
                    {
                        client.Connect(mailServer, port, SecureSocketOptions.SslOnConnect);
                        connected = client.IsConnected;
                        AppendDailyLog(logsDir, $"[INFO] IMAP SSL connect succeeded: {mailServer}:{port}");
                    }
                    catch (SslHandshakeException exSsl)
                    {
                        return; // suppress handshake errors completely
                    }
                    catch (Exception ex1)
                    {
                        AppendDailyLog(logsDir, $"[WARN] SSL connect failed ({mailServer}:{port}): {ex1.Message}");

                        try
                        {
                            client.Connect(mailServer, 143, SecureSocketOptions.StartTls);
                            connected = client.IsConnected;
                            AppendDailyLog(logsDir, $"[INFO] IMAP STARTTLS connect succeeded: {mailServer}:143");
                        }
                        catch (SslHandshakeException exTls)
                        {
                            AppendDailyLog(logsDir,
                                $"[ERROR] STARTTLS handshake failed: {exTls.Message}. " +
                                $"Check certificate validity and trust chain. Server={mailServer}:143");
                            throw;
                        }
                        catch (Exception ex2)
                        {
                            AppendDailyLog(logsDir, $"[WARN] STARTTLS connect failed ({mailServer}:143): {ex2.Message}");

                            if (allowPlainFallback)
                            {
                                try
                                {
                                    client.Connect(mailServer, 143, SecureSocketOptions.None);
                                    connected = client.IsConnected;
                                    AppendDailyLog(logsDir,
                                        $"[WARN] IMAP PLAIN connect succeeded (INSECURE, config enabled): {mailServer}:143");
                                }
                                catch (Exception ex3)
                                {
                                    AppendDailyLog(logsDir,
                                        $"[ERROR] All IMAP connection attempts failed: {ex3.Message} | Sender={strSender}, JobID={(currMaintenanceJob?.MaintenanceJobID ?? 0)}");
                                    return;
                                }
                            }
                            else
                            {
                                AppendDailyLog(logsDir,
                                    $"[CRITICAL] All secure IMAP connection attempts failed. Plaintext fallback disabled by config. " +
                                    $"Sender={strSender}, JobID={(currMaintenanceJob?.MaintenanceJobID ?? 0)}");
                                return;
                            }
                        }
                    }

                    if (!connected)
                        return;

                    client.Authenticate(strSender, password);

                    var inbox = client.Inbox;
                    inbox.Open(FolderAccess.ReadOnly);

                    var query = SearchQuery.DeliveredAfter(DateTime.Now.AddDays(-2));
                    var results = inbox.Search(query);

                    var last100 = results.Skip(Math.Max(0, results.Count - 100)).ToList();

                    AppendDailyLog(logsDir,
                        $"[INFO] Bounce scan executed. Scanned {last100.Count} messages. Interval={intervalMinutes}m (Force={forceCheck}). Sender={strSender}");

                    foreach (var uid in last100)
                    {
                        var message = inbox.GetMessage(uid);

                        bool isBounce =
                            (message.Subject?.IndexOf("Undelivered", StringComparison.OrdinalIgnoreCase) >= 0) ||
                            (message.Subject?.IndexOf("Delivery Status", StringComparison.OrdinalIgnoreCase) >= 0) ||
                            (message.Subject?.IndexOf("Mail Delivery Failed", StringComparison.OrdinalIgnoreCase) >= 0) ||
                            message.Headers.Any(h => h.Field.Equals("Final-Recipient", StringComparison.OrdinalIgnoreCase));

                        if (isBounce)
                        {
                            string failedRecipient = "";
                            string diagnosticCode = "";

                            foreach (var line in message.TextBody?.Split('\n') ?? Array.Empty<string>())
                            {
                                if (line.IndexOf("Final-Recipient", StringComparison.OrdinalIgnoreCase) >= 0)
                                    failedRecipient = line.Trim();
                                if (line.IndexOf("Diagnostic-Code", StringComparison.OrdinalIgnoreCase) >= 0)
                                    diagnosticCode = line.Trim();
                            }

                            AppendDailyLog(logsDir,
                                $"[ERROR] Bounce detected! Recipient={failedRecipient}, Diagnostic={diagnosticCode} | " +
                                $"Sender={strSender}, JobID={(currMaintenanceJob?.MaintenanceJobID ?? 0)}, " +
                                $"Driver={currMaintenanceJob?.DriverName}, Technician={currMaintenanceJob?.Technician}, " +
                                $"Customer={currMaintenanceJob?.PIC}, Address={currMaintenanceJob?.Address}");
                        }
                    }

                    client.Disconnect(true);
                }
            }
            catch (Exception ex)
            {
                AppendDailyLog(logsDir,
                    $"[ERROR] Bounce check failed: {ex.Message} | Sender={strSender}, JobID={(currMaintenanceJob?.MaintenanceJobID ?? 0)}");
            }
        }

        private bool TryMarkJobSent(long jobId)
        {
            lock (_sentJobs)
            {
                if (_sentJobs.Contains(jobId))
                    return false; // already sent
                _sentJobs.Add(jobId);
                return true;
            }
        }

        private void CleanupLibreOfficeProfile(string profilePath, string logsDir)
        {
            try
            {
                if (!Directory.Exists(profilePath)) return;
                var di = new DirectoryInfo(profilePath);
                foreach (var child in di.GetDirectories())
                {
                    try { child.Delete(true); } catch { }
                }
                foreach (var f in di.GetFiles())
                {
                    try { f.Delete(); } catch { }
                }

                AppendDailyLog(logsDir, "[INFO] LibreOffice profile cleaned: " + profilePath);
            }
            catch (Exception ex)
            {
                AppendDailyLog(logsDir, "[WARN] CleanupLibreOfficeProfile: " + ex.Message);
            }
        }

        // Simple daily-file logger (synchronous). Writes to <logsDir>\yyyy-MM-dd.log
        private void AppendDailyLog(string logsDir, string message)
        {
            try
            {
                string filename = Path.Combine(logsDir, DateTime.UtcNow.ToString("yyyy-MM-dd") + ".log");
                string line = $"[{DateTime.UtcNow:yyyy-MM-dd HH:mm:ss}] {message}";
                File.AppendAllText(filename, line + Environment.NewLine, Encoding.UTF8);
            }
            catch
            {
                // don't crash on logging
            }
        }
        // ======= Template selection =======
        private string GetTemplateFileName(long templateId)
        {
            try
            {
                string templatesPath = IOPath.Combine(
                    HostingEnvironment.ApplicationPhysicalPath,
                    "images",
                    "custom_templates"
                );

                if (!Directory.Exists(templatesPath))
                {
                    Logger.LogEvent("Templates folder not found: " + templatesPath,
                        System.Diagnostics.EventLogEntryType.Error);
                    return null;
                }

                // Supported extensions
                string[] extensions = new[] { ".docx", ".doc", ".xlsx", ".xls" };

                foreach (var ext in extensions)
                {
                    string candidate = IOPath.Combine(templatesPath, templateId + ext);
                    if (File.Exists(candidate))
                    {
                        return candidate;
                    }
                }

                Logger.LogEvent($"Template {templateId} not found in {templatesPath}",
                    System.Diagnostics.EventLogEntryType.Error);
                return null;
            }
            catch (Exception ex)
            {
                Logger.LogEvent(
                    $"Unable to retrieve template file for Template ID {templateId}: {ex.Message}",
                    System.Diagnostics.EventLogEntryType.Error
                );
                return null;
            }
        }


        private string ResolveSignaturePath(string directory, long jobId)
        {
            if (string.IsNullOrWhiteSpace(directory) || !Directory.Exists(directory))
                return null;

            string[] exts = { ".png", ".jpg", ".jpeg", ".bmp", ".gif", ".tif", ".tiff" };
            foreach (var ext in exts)
            {
                var candidate = Path.Combine(directory, jobId.ToString() + ext);
                if (File.Exists(candidate))
                    return candidate;
            }
            return null;
        }

        /// <summary>
        /// Build placeholder dictionary from MaintenanceJobInfo model
        /// </summary>
        private Dictionary<string, string> BuildPlaceholdersFromModel(MaintenanceJobInfo job, string logsDir)
        {
            var placeholders = new Dictionary<string, string>();

            try
            {
                // Basic info
                placeholders["DriverName"] = job.DriverName ?? "";
                placeholders["MaintenanceJobID"] = job.MaintenanceJobID.ToString();
                placeholders["ReferenceNo"] = job.ReferenceNo ?? "";
                placeholders["Timestamp"] = job.Timestamp.ToString("dd-MMMM-yyyy hh:mm tt");
                placeholders["Address"] = job.Address ?? "";
                placeholders["Payment"] = job.Payment ?? "";
                placeholders["PIC"] = job.PIC ?? "";
              

                // Pests (each on its own line, numbered)
                if (job.Pest != null && job.Pest.Any())
                {
                    placeholders["{{Pest}}"] = string.Join("\n",
                           job.Pest
                           .OrderBy(p => p.ItemNo)       // keep order
                           .Select(p => p.PestDesc));
                }
                else
                {
                    placeholders["{{Pest}}"] = "";
                }

                // Treatments (each on its own line, numbered)
                if (job.Pest != null && job.Pest.Any())
                {
                    placeholders["{{Treatment}}"] = string.Join("\n",
                        job.Pest
                           .OrderBy(p => p.ItemNo)       // ensure same order as pests
                           .Select(p => p.TreatmentDesc));
                }
                else
                {
                    placeholders["{{Treatment}}"] = "";
                }

                // Findings (each on its own line, numbered)
                if (job.Findings != null && job.Findings.Any())
                {
                    placeholders["{{Findings}}"] = string.Join("\n",
                        job.Findings
                           .OrderBy(f => f.ItemNo)       // order if needed
                           .Select(p => p.Findings));
                }
                else
                {
                    placeholders["{{Findings}}"] = "";
                }

                // Areas of Concern
                if (job.Findings != null && job.Findings.Any())
                {
                    placeholders["AocDesc"] = string.Join(", ",
                        job.Findings
                           .Where(f => !string.IsNullOrWhiteSpace(f.AocDesc))
                           .Select(f => f.AocDesc.Trim())
                           .Distinct()
                           .ToList()
                    );

                    // New placeholder for current date/time in SGT (UTC+8)
                    var sgtZone = TimeZoneInfo.FindSystemTimeZoneById("Singapore Standard Time");
                    var sgtNow = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, sgtZone);
                    placeholders["{{DateNow}}"] = sgtNow.ToString("dd-MMMM-yyyy hh:mm tt");

                }
                else
                {
                    placeholders["{{AocDesc}}"] = "";
                }
            }
            catch (Exception ex)
            {
                AppendDailyLog(logsDir, "[ERROR] BuildPlaceholdersFromModel: " + ex);
            }

            return placeholders;
        }


        private sealed class _Match
        {
            public int Start;
            public int Length;
            public string Replacement;
            public string Token;
        }

        private void ReplacePlaceholdersInTables(
            MainDocumentPart mainPart,
            Dictionary<string, string> map,
            string logsDir)
        {
            if (mainPart == null || map == null || map.Count == 0) return;

            // Skip tokens handled elsewhere (images, etc.)
            var skip = new HashSet<string>(StringComparer.OrdinalIgnoreCase)
        {
        "{{Photos}}", "{{MainClientSignatures}}", "{{MainTechSignatures}}"
        };
            var tokens = map.Keys.Where(k => !skip.Contains(k)).ToList();
            if (tokens.Count == 0) return;

            void ProcessScope(OpenXmlElement scope)
            {
                if (scope == null) return;

                foreach (var para in scope.Descendants<W.TableCell>()
                                          .SelectMany(tc => tc.Descendants<W.Paragraph>()))
                {
                    ProcessParagraphInTable(para, map, tokens, logsDir);
                }
            }

            // Body + headers + footers
            ProcessScope(mainPart.Document?.Body);
            foreach (var h in mainPart.HeaderParts) ProcessScope(h.Header);
            foreach (var f in mainPart.FooterParts) ProcessScope(f.Footer);
        }

        private void ProcessParagraphInTable(
            W.Paragraph para,
            Dictionary<string, string> map,
            List<string> tokens,
            string logsDir)
        {
            if (para == null) return;

            // Collect all Text nodes in order (keep their parent Run)
            var pieces = new List<(W.Run Run, W.Text Text, string Value, int Start, int Length)>();
            int cursor = 0;
            foreach (var t in para.Descendants<W.Text>())
            {
                string v = t.Text ?? string.Empty;
                pieces.Add((t.Ancestors<W.Run>().FirstOrDefault(), t, v, cursor, v.Length));
                cursor += v.Length;
            }

            // Nothing to do?
            int totalLen = cursor;
            if (totalLen == 0) return;

            string full = string.Concat(pieces.Select(p => p.Value));
            bool containsAny = tokens.Any(tok => full.IndexOf(tok, StringComparison.Ordinal) >= 0);
            if (!containsAny) return; // do not touch paragraph if no tokens

            // Find all matches across the flattened text
            var matches = new List<_Match>();
            foreach (var tok in tokens)
            {
                if (string.IsNullOrEmpty(tok)) continue;
                int idx = 0;
                while (true)
                {
                    idx = full.IndexOf(tok, idx, StringComparison.Ordinal);
                    if (idx < 0) break;

                    matches.Add(new _Match
                    {
                        Start = idx,
                        Length = tok.Length,
                        Replacement = map[tok] ?? string.Empty,
                        Token = tok
                    });
                    idx += tok.Length;
                }
            }

            if (matches.Count == 0) return;

            // Sort & de-overlap (keep first when overlaps occur)
            matches.Sort((a, b) => a.Start.CompareTo(b.Start));
            var filtered = new List<_Match>();
            int consumedUntil = -1;
            foreach (var m in matches)
            {
                if (m.Start >= consumedUntil)
                {
                    filtered.Add(m);
                    consumedUntil = m.Start + m.Length;
                }
                // else overlapping → skip later one
            }

            // Helper to copy original text slices preserving original run formatting
            List<OpenXmlElement> outChildren = new List<OpenXmlElement>();

            void CopyOriginalSlice(int start, int length)
            {
                int remaining = length;
                int pos = start;

                while (remaining > 0)
                {
                    // Find the piece that contains current pos
                    var piece = pieces.FirstOrDefault(p => pos >= p.Start && pos < p.Start + p.Length);
                    if (piece.Run == null && piece.Text == null && piece.Value == null)
                    {
                        // Safety: if we can't map, break to avoid infinite loop
                        break;
                    }

                    int offsetInPiece = pos - piece.Start;
                    int take = Math.Min(remaining, piece.Length - offsetInPiece);

                    string slice = piece.Value.Substring(offsetInPiece, take);

                    var newRun = new W.Run();
                    if (piece.Run?.RunProperties != null)
                        newRun.RunProperties = (W.RunProperties)piece.Run.RunProperties.CloneNode(true);

                    newRun.Append(new W.Text(slice) { Space = SpaceProcessingModeValues.Preserve });
                    outChildren.Add(newRun);

                    pos += take;
                    remaining -= take;
                }
            }

            void AppendPlainReplacement(string replacement, string tokenForLog)
            {
                // Insert as plain text (no RunProperties) and preserve newlines with <w:br/>
                var lines = (replacement ?? string.Empty).Split(new[] { "\n" }, StringSplitOptions.None);
                for (int i = 0; i < lines.Length; i++)
                {
                    var r = new W.Run(new W.Text(lines[i] ?? string.Empty)
                    {
                        Space = SpaceProcessingModeValues.Preserve
                    });
                    outChildren.Add(r);

                    if (i < lines.Length - 1)
                        outChildren.Add(new W.Break());
                }
                AppendDailyLog(logsDir, $"[INFO] (Table) Replaced {tokenForLog} → '{replacement}'.");
            }

            // Rebuild paragraph: original slices + plain replacements
            int current = 0;
            foreach (var m in filtered)
            {
                if (m.Start > current)
                {
                    CopyOriginalSlice(current, m.Start - current);
                }
                AppendPlainReplacement(m.Replacement, m.Token);
                current = m.Start + m.Length;
            }

            if (current < totalLen)
            {
                CopyOriginalSlice(current, totalLen - current);
            }

            // Replace children
            para.RemoveAllChildren<W.Run>();
            foreach (var child in outChildren) para.Append(child);

            AppendDailyLog(logsDir, $"[INFO] (Table) Finished paragraph: '{para.InnerText}'");
        }


        //Excel File
        // The main public method for replacing placeholders in Excel
        // The main public method for replacing placeholders in Excel
        public void ReplacePlaceholdersInExcel(
            string templatePath,
            string outputPath,
            Dictionary<string, string> placeholders,
            List<string> photos,
            int photosPerRow = 3,
            string logsDir = "")
        {
            try
            {
                File.Copy(templatePath, outputPath, true);

                using (SpreadsheetDocument doc = SpreadsheetDocument.Open(outputPath, true))
                {
                    var workbookPart = doc.WorkbookPart;

                    // Loop through ALL worksheets
                    foreach (var sheet in workbookPart.Workbook.Descendants<S.Sheet>())
                    {
                        var wsPart = (WorksheetPart)workbookPart.GetPartById(sheet.Id);

                        // Set Page Orientation dynamically
                        SetPageOrientation(wsPart);

                        var sheetData = wsPart.Worksheet.GetFirstChild<S.SheetData>();

                        // 1. Unmerge all cells (for layout stability)
                        var mergeCells = wsPart.Worksheet.Elements<S.MergeCells>().FirstOrDefault();
                        if (mergeCells != null)
                        {
                            mergeCells.Remove();
                            wsPart.Worksheet.Save();
                        }

                        // 2. Replace all text placeholders
                        foreach (S.Row row in sheetData.Elements<S.Row>())
                        {
                            foreach (S.Cell cell in row.Elements<S.Cell>())
                            {
                                string originalCellValue = GetCellValue(cell, workbookPart);
                                if (string.IsNullOrEmpty(originalCellValue)) continue;

                                string updatedCellValue = originalCellValue;
                                bool listData = false;
                                bool replaced = false;

                                foreach (var kvp in placeholders)
                                {
                                    string placeholderToken = "{{" + kvp.Key + "}}";

                                    // Check if this placeholder contains list data that needs line breaks
                                    if (kvp.Key.Equals("Pest", StringComparison.OrdinalIgnoreCase) ||
                                        kvp.Key.Equals("Treatment", StringComparison.OrdinalIgnoreCase) ||
                                        kvp.Key.Equals("Findings", StringComparison.OrdinalIgnoreCase))
                                    {
                                        listData = true;
                                    }

                                    // Aggressive search logic: use Regex to check for placeholder, ignoring intermediate whitespace
                                    string cleanOriginalValue = Regex.Replace(updatedCellValue, @"\s+", " ");
                                    string cleanPlaceholderToken = Regex.Replace(placeholderToken, @"\s+", " ");

                                    if (cleanOriginalValue.Contains(cleanPlaceholderToken))
                                    {
                                        updatedCellValue = updatedCellValue.Replace(placeholderToken, kvp.Value ?? string.Empty);
                                        replaced = true;
                                    }
                                }

                                // CRITICAL FIX: Update the cell once with the final string, and enable WrapText if it contained list data.
                                if (replaced)
                                {
                                    SetCellValue(cell, updatedCellValue, workbookPart);
                                    if (listData)
                                    {
                                        EnableCellWrapText(cell, workbookPart);
                                    }
                                }
                            }
                        }

                        // 3. Handle photo placeholders (re-integrated into the structure)
                        var photoPlaceholders = wsPart.Worksheet.Descendants<S.Cell>()
                                                    .Where(cell => GetCellValue(cell, workbookPart)?.Contains("{{Photos}}") == true)
                                                    .ToList();

                        foreach (var cell in photoPlaceholders)
                        {
                            InsertPhotosGallery(wsPart, cell, photos, 1, workbookPart, logsDir);
                        }

                        wsPart.Worksheet.Save();
                    }

                    doc.Close();
                    AppendDailyLog(logsDir, "[INFO] Excel file successfully generated.");
                }
            }
            catch (Exception ex)
            {
                string m = "ReplacePlaceholdersInExcel failed: " + ex.Message;
                FMSWebApi.Logger.LogEvent(m, EventLogEntryType.Error);
                AppendDailyLog(logsDir, "[ERROR] " + m + " | StackTrace: " + ex.StackTrace);
            }
        }

        // --- CRITICAL HELPER METHODS ---

        private void EnableCellWrapText(S.Cell cell, WorkbookPart workbookPart)
        {
            var stylesheet = workbookPart.WorkbookStylesPart.Stylesheet;
            var cellFormats = stylesheet.Elements<S.CellFormats>().FirstOrDefault();
            if (cellFormats == null) return;

            // Get the existing format index, defaulting to 0 (the general style)
            uint styleIndex = cell.StyleIndex != null ? cell.StyleIndex.Value : 0;

            // Retrieve the current format and clone it
            S.CellFormat originalCellFormat = (S.CellFormat)cellFormats.ElementAt((int)styleIndex);

            // Only proceed if WrapText is not already explicitly set to true
            if (originalCellFormat.WrapText == null || !originalCellFormat.WrapText.Value)
            {
                S.CellFormat newCellFormat = (S.CellFormat)originalCellFormat.Clone();
                newCellFormat.WrapText = new DocumentFormat.OpenXml.BooleanValue(true);
                newCellFormat.ApplyAlignment = new DocumentFormat.OpenXml.BooleanValue(true);

                // Append the new format to the stylesheet
                cellFormats.Append(newCellFormat);
                uint newStyleIndex = (uint)cellFormats.Count() - 1;

                // Apply the new style index to the cell
                cell.StyleIndex = newStyleIndex;

                // Save the stylesheet changes
                workbookPart.WorkbookStylesPart.Stylesheet.Save();
            }
        }

        private void SetPageOrientation(WorksheetPart wsPart)
        {
            int lastUsedColumnIndex = wsPart.Worksheet.Descendants<S.Cell>()
                                            .Where(c => c.CellReference != null)
                                            .Select(c => ColumnNameToNumber(new string(c.CellReference.Value.Where(Char.IsLetter).ToArray())))
                                            .DefaultIfEmpty(0)
                                            .Max();

            S.OrientationValues orientation;
            if (lastUsedColumnIndex > 10)
            {
                orientation = S.OrientationValues.Landscape;
            }
            else
            {
                orientation = S.OrientationValues.Portrait;
            }

            var pageSetup = wsPart.Worksheet.GetFirstChild<S.PageSetup>();
            if (pageSetup == null)
            {
                pageSetup = new S.PageSetup();
                wsPart.Worksheet.AppendChild(pageSetup);
            }

            pageSetup.Orientation = orientation;
            pageSetup.FitToWidth = 1U;
            pageSetup.FitToHeight = 0U;

            wsPart.Worksheet.Save();
        }

        private string GetCellValue(S.Cell cell, WorkbookPart wbPart)
        {
            if (cell?.CellValue == null) return null;
            string value = cell.CellValue.InnerText;

            if (cell.DataType != null && cell.DataType == S.CellValues.SharedString)
            {
                var sharedStringPart = wbPart.SharedStringTablePart;

                if (sharedStringPart == null || sharedStringPart.SharedStringTable == null)
                {
                    return value;
                }

                if (int.TryParse(value, out int index) && index >= 0 &&
                    index < sharedStringPart.SharedStringTable.Elements<S.SharedStringItem>().Count())
                {
                    return sharedStringPart.SharedStringTable.Elements<S.SharedStringItem>().ElementAt(index).InnerText;
                }
                return value;
            }
            return value;
        }

        private void SetCellValue(S.Cell cell, string value, WorkbookPart wbPart)
        {
            cell.CellValue = new S.CellValue(value);
            cell.DataType = new EnumValue<S.CellValues>(S.CellValues.String);
        }

        private void GetCellPosition(string cellRef, out int col, out int row)
        {
            var match = Regex.Match(cellRef, @"([A-Za-z]+)([0-9]+)");
            if (match.Success)
            {
                string colRef = match.Groups[1].Value;
                string rowRef = match.Groups[2].Value;

                col = ColumnNameToNumber(colRef);
                if (!int.TryParse(rowRef, out row)) { row = 0; }
            }
            else { col = 0; row = 0; }
        }

        private int ColumnNameToNumber(string columnName)
        {
            int sum = 0;
            foreach (char c in columnName.ToUpper())
            {
                sum *= 26;
                sum += (c - 'A' + 1);
            }
            return sum;
        }

        private string GetColumnName(int columnNumber)
        {
            int dividend = columnNumber;
            string columnName = string.Empty;
            int modulo;

            while (dividend > 0)
            {
                modulo = (dividend - 1) % 26;
                columnName = Convert.ToChar(65 + modulo).ToString() + columnName;
                dividend = (int)((dividend - modulo) / 26);
            }
            return columnName;
        }


        public MaintenanceJobInfo Email(MaintenanceJobInfo currMaintenanceJob)
        {
            MaintenanceJobInfo _currMaintenanceJob = new MaintenanceJobInfo();

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {

                using (MySqlCommand cmd = new MySqlCommand())
                {
                    conn.Open();
                    cmd.Connection = conn;

                    try
                    {
                        long i = (long)currMaintenanceJob.MaintenanceJobID;
                        _currMaintenanceJob = Get(i);
                    }
                    catch (Exception ex)
                    {
                        Logger.LogEvent("Get Maintenance Job: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                    }


                    try
                    {

                        string strSender = "";

                        switch (_currMaintenanceJob.AssetCompanyID)
                        {
                            case 1:
                                strSender = "system.sg.report@systempest.com";
                                break;
                            case 2:
                                strSender = "my.report@systempest.com";
                                break;
                            case 3:
                                strSender = "asiawhite.report@systempest.com";
                                break;
                            default:
                                strSender = "system.sg.report@systempest.com";
                                break;
                        }


                        string strSource = "System Pest Report";
                        string m_strEmailServer = "mail.systempest.com";
                        //string m_strEmailServer = "mail.acecom.com.sg";
                        string m_strEmailPassword = "NmRDefe22PvX";

                        MailMessage eMail = new MailMessage();
                        eMail.From = new MailAddress(strSender, strSource);

                        try
                        {
                            string[] arrData = currMaintenanceJob.Email.Split(",".ToCharArray());

                            if (arrData.Length > 1)
                            {
                                for (int j = 0; j < arrData.Length; j++)
                                {
                                    eMail.To.Add(new MailAddress(arrData[j]));
                                }
                            }
                            else
                            {
                                eMail.To.Add(new MailAddress(currMaintenanceJob.Email));
                            }

                        }
                        catch (Exception ex)
                        {
                            Logger.LogEvent("Parse Email Address: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                        }

                        string body = createEmailBodyForgotPassword(_currMaintenanceJob);

                        eMail.Subject = "Pest Control Service Report";
                        eMail.Body = body;
                        eMail.IsBodyHtml = true;
                        eMail.Headers.Add("Message-Id", String.Format("<{0}@{1}>", Guid.NewGuid().ToString(), m_strEmailServer));

                        try
                        {
                            // send default email
                            //SmtpClient smtp = new SmtpClient();
                            //smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                            //smtp.Port = 25;
                            //smtp.Host = "mail.acecom.com.sg";
                            //smtp.EnableSsl = false;
                            //smtp.UseDefaultCredentials = false;
                            //NetworkCredential credentials = new NetworkCredential(strSender, "NmRDefe22PvX");
                            //smtp.Credentials = credentials;
                            //smtp.Send(eMail);

                            SmtpClient smtp = new SmtpClient(m_strEmailServer);
                            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                            smtp.Port = 26;
                            smtp.UseDefaultCredentials = false;
                            smtp.Credentials = new NetworkCredential(strSender, m_strEmailPassword);
                            smtp.EnableSsl = false;
                            smtp.Send(eMail);

                            Logger.LogEvent("Email Sent to: " + currMaintenanceJob.Email, System.Diagnostics.EventLogEntryType.Information);
                        }
                        catch (Exception ex)
                        {
                            Logger.LogEvent(String.Format("Email Sent Failed to: {0} Exception: {1}", currMaintenanceJob.Email, ex.Message), System.Diagnostics.EventLogEntryType.Error);
                        }
                    }
                    catch (Exception ex)
                    {
                        Logger.LogEvent("Process Email: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                    }

                    conn.Close();
                }
            }

            currMaintenanceJob.ErrorMessage = "Success";

            return currMaintenanceJob;
        }
        public IEnumerable<MaintenanceJobInfo> EmailBlast(MaintenanceJobInfo currMaintenanceJob)
        {
            List<MaintenanceJobInfo> arrMaintenanceJob = new List<MaintenanceJobInfo>();
            MaintenanceJobInfo _currMaintenanceJob = new MaintenanceJobInfo();

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {

                string query = string.Format("SELECT * FROM sp.view_maintenance_job where timestamp between '2024-02-29 18:00:00' and '2024-03-01 18:00:00' and flag_value = 'Completed' and email is not null and email != ''");

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        MySqlDataReader reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            _currMaintenanceJob = DataMgrTools.BuildMaintenanceJob(reader);
                            string strFill = "";
                            _currMaintenanceJob.MainForms = GetImage(String.Format("maintenance_forms/{0}", _currMaintenanceJob.MaintenanceJobID), ref strFill);
                            _currMaintenanceJob.MainFormsFill = strFill;
                            arrMaintenanceJob.Add(_currMaintenanceJob);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(mProjName, "Get view_maintenance_job: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                }


                using (MySqlCommand cmd = new MySqlCommand())
                {
                    conn.Open();
                    for (int i = 0; i < arrMaintenanceJob.Count; i++)
                    {
                        cmd.Connection = conn;

                        string strSender = "";

                        switch (arrMaintenanceJob[i].AssetCompanyID)
                        {
                            case 1:
                                strSender = "system.sg.report@systempest.com";
                                break;
                            case 2:
                                strSender = "my.report@systempest.com";
                                break;
                            case 3:
                                strSender = "asiawhite.report@systempest.com";
                                break;
                            default:
                                strSender = "system.sg.report@systempest.com";
                                break;
                        }

                        string strSource = "System Pest Report";
                        string m_strEmailServer = "mail.systempest.com";
                        string m_strEmailPassword = "NmRDefe22PvX";

                        MailMessage eMail = new MailMessage();
                        eMail.From = new MailAddress(strSender, strSource);
                        Logger.LogEvent("Get Maintenance Job: " + arrMaintenanceJob[i].MainForms, System.Diagnostics.EventLogEntryType.Warning);


                        try
                        {
                            string[] arrData = arrMaintenanceJob[i].Email.Split(",".ToCharArray());

                            if (arrData.Length > 1)
                            {
                                for (int j = 0; j < arrData.Length; j++)
                                {
                                    eMail.To.Add(new MailAddress(arrData[j]));
                                }
                            }
                            else
                            {
                                eMail.To.Add(new MailAddress(arrMaintenanceJob[i].Email));
                            }

                        }
                        catch (Exception ex)
                        {
                            Logger.LogEvent("Parse Email Address: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                        }

                        string body = createEmailBlastBody(arrMaintenanceJob[i]);

                        eMail.Subject = "Pest Control Service Report";
                        eMail.Body = body;
                        eMail.IsBodyHtml = true;
                        eMail.Headers.Add("Message-Id", String.Format("<{0}@{1}>", Guid.NewGuid().ToString(), m_strEmailServer));

                        try
                        {
                            // send default email
                            //SmtpClient smtp = new SmtpClient();
                            //smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                            //smtp.Port = 25;
                            //smtp.Host = "mail.acecom.com.sg";
                            //smtp.EnableSsl = false;
                            //smtp.UseDefaultCredentials = false;
                            //NetworkCredential credentials = new NetworkCredential(strSender, "NmRDefe22PvX");
                            //smtp.Credentials = credentials;
                            //smtp.Send(eMail);

                            SmtpClient smtp = new SmtpClient(m_strEmailServer);
                            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                            smtp.Port = 26;
                            smtp.UseDefaultCredentials = false;
                            smtp.Credentials = new NetworkCredential(strSender, m_strEmailPassword);
                            smtp.EnableSsl = false;
                            smtp.Send(eMail);

                            Logger.LogEvent("Email Sent to: " + arrMaintenanceJob[i].Email, System.Diagnostics.EventLogEntryType.Information);
                        }
                        catch (Exception ex)
                        {
                            Logger.LogEvent(String.Format("Email Sent Failed to: {0} Exception: {1}", arrMaintenanceJob[i].Email, ex.Message), System.Diagnostics.EventLogEntryType.Error);
                        }
                    }


                    conn.Close();
                }
            }

            _currMaintenanceJob.ErrorMessage = "Success";

            return arrMaintenanceJob;
        }
        private string createEmailBodyForgotPassword(MaintenanceJobInfo currMaintenanceJob)
        {
            string body = string.Empty;
            PestTreatmentInfo currPest = new PestTreatmentInfo();
            FindingsMaintenanceInfo currFindings = new FindingsMaintenanceInfo();
            MaintenanceInfo currMaintenance = new MaintenanceInfo();
            int k = (int)currMaintenanceJob.MaintenanceID;

            MaintenanceRepository repository = new MaintenanceRepository();
            currMaintenance = repository.Get(k);

            //using streamreader for reading my htmltemplate   
            try
            {
                using (StreamReader reader = new StreamReader(System.Web.HttpContext.Current.Server.MapPath("~/Report.html")))
                {
                    body = reader.ReadToEnd();
                }

                string pest_output = "";
                string findings_output = "";
                string aoc_output = "";
                string prevention_output = "";

                for (int i = 0; i < currMaintenanceJob.Pest.Count; i++)
                {
                    currPest.TreatmentDesc = currMaintenanceJob.Pest[i].TreatmentDesc;
                    prevention_output += currPest.TreatmentDesc;
                }

                for (int i = 0; i < currMaintenanceJob.Findings.Count; i++)
                {
                    currFindings.PestDesc = currMaintenanceJob.Findings[i].PestDesc;
                    currFindings.Findings = currMaintenanceJob.Findings[i].Findings;
                    currFindings.AocDesc = currMaintenanceJob.Findings[i].AocDesc;
                    pest_output += currFindings.PestDesc;
                    findings_output += currFindings.Findings;
                    aoc_output += currFindings.AocDesc;
                }

                currMaintenanceJob.Timestamp = currMaintenanceJob.Timestamp.AddHours(-8);

                body = body.Replace("{ServiceAddress}", currMaintenanceJob.Address);
                body = body.Replace("{Payment}", "");
                body = body.Replace("{Technician}", currMaintenanceJob.Technician);
                body = body.Replace("{AreasOfConcern}", aoc_output);
                body = body.Replace("{TypeOfPests}", pest_output);
                body = body.Replace("{ActionFindings}", findings_output);
                body = body.Replace("{ReportNo}", currMaintenanceJob.MaintenanceJobID.ToString());
                body = body.Replace("{ReferenceNo}", currMaintenanceJob.ReferenceNo);
                body = body.Replace("{Date}", currMaintenanceJob.Timestamp.ToString("MM/dd/yyyy HH:mm:ss"));
                body = body.Replace("{Remarks}", currMaintenance.Remarks);
                body = body.Replace("{Tips}", prevention_output);

            }
            catch (Exception ex)
            {
                Logger.LogEvent("createEmailBodyForgotPassword: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }

            return body;

        }
        private string createEmailBlastBody(MaintenanceJobInfo currMaintenanceJob)
        {
            string body = string.Empty;

            //using streamreader for reading my htmltemplate   
            try
            {
                using (StreamReader reader = new StreamReader(System.Web.HttpContext.Current.Server.MapPath("~/BlastReport.html")))
                {
                    body = reader.ReadToEnd();
                }

                body = body.Replace("{MainForms}", currMaintenanceJob.MainForms);

            }
            catch (Exception ex)
            {
                Logger.LogEvent("createEmailBodyForgotPassword: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }

            return body;

        }
        public bool Remove(long jobID)
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
                        //cmd.Prepare();

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

            return retVal;
        }
        public bool RemoveMainJob(long jobID)
        {
            bool retVal = false;
            string query = "";

            try
            {
                query = string.Format("DELETE FROM main_pests_treatment where maintenancejob_id = {0}", jobID);
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
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Remove(Pest and Treatment)", System.Diagnostics.EventLogEntryType.Error);
            }

            try
            {
                query = string.Format("DELETE FROM maintenance_job WHERE maintenancejob_id = {0}", jobID);

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

            return retVal;
        }

        public MaintenanceJobInfo BulkDelete(MaintenanceJobInfo currMaintenanceJob)
        {
            bool retVal = false;
            string query = "";

            // Split the comma-separated string into individual IDs
            var ids = currMaintenanceJob.Param.Split(',')
                            .Select(id => int.Parse(id.Trim()))
                            .ToList();

            try
            {
                using (var conn = new MySqlConnection(mConnStr))
                {
                    // Dapper automatically expands collections in parameters
                    query = "DELETE FROM main_pests_treatment where maintenancejob_id IN @Param";
                    var affectedRows = conn.Execute(query, new { Param = ids });

                    retVal = affectedRows > 0;

                    Logger.LogEvent($"{affectedRows} rows affected - BulkDelete(MaintenanceJobRepository) main_pests_treatment",
                                   System.Diagnostics.EventLogEntryType.Information);
                }


            }
            catch (Exception ex)
            {
                currMaintenanceJob.ErrorMessage = string.Format("Failed: {0}", ex.Message);
                Logger.LogEvent(ex.Message + "-BulkDelete(MaintenanceJobRepository) main_pests_treatment", System.Diagnostics.EventLogEntryType.Error);
            }

            try
            {

                using (var conn = new MySqlConnection(mConnStr))
                {
                    // Dapper automatically expands collections in parameters
                    query = "DELETE FROM maintenance_job WHERE maintenancejob_id IN @Param";
                    var affectedRows = conn.Execute(query, new { Param = ids });

                    retVal = affectedRows > 0;

                    Logger.LogEvent($"{affectedRows} rows affected - BulkDelete(MaintenanceJobRepository) maintenance_job",
                                   System.Diagnostics.EventLogEntryType.Information);
                }


            }
            catch (Exception ex)
            {
                currMaintenanceJob.ErrorMessage = string.Format("Failed: {0}", ex.Message);
                Logger.LogEvent(ex.Message + "-BulkDelete(MaintenanceJobRepository) maintenance_job", System.Diagnostics.EventLogEntryType.Error);
            }

            if (retVal) currMaintenanceJob.ErrorMessage = "Success";

            return currMaintenanceJob;
        }
        public bool Update(MaintenanceJobInfo currMaintenanceJob)
        {
            bool retVal = false;

            DateTime defaultdate = new DateTime();
            if (currMaintenanceJob.Flag == 0 || currMaintenanceJob.Flag == 1)
            {
                currMaintenanceJob.JobCancelled = defaultdate;
                currMaintenanceJob.CancelRemarks = "";
            }
            else
            {
                currMaintenanceJob.JobCancelled = currMaintenanceJob.JobCancelled;
                currMaintenanceJob.CancelRemarks = currMaintenanceJob.CancelRemarks;
            }


            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "UPDATE maintenance_job SET maintenance_id = @MaintenanceID, alert_date = @AlertDate, timestamp = @Timestamp, rx_time = @RxTime, flag = @Flag, job_cancelled = @JobCancelled, cancel_remarks = @CancelRemarks, admin_remarks = @AdminRemarks, isSent = @isSent, reference_no = @ReferenceNo, driver_id = @DriverID, asset_id = @AssetID, technician = @Technician " +
                                           "WHERE maintenancejob_id = @MaintenanceJobID";
                        //cmd.Prepare();
                        cmd.Parameters.AddWithValue("@MaintenanceID", currMaintenanceJob.MaintenanceID);
                        cmd.Parameters.AddWithValue("@AlertDate", currMaintenanceJob.AlertDate);
                        cmd.Parameters.AddWithValue("@Timestamp", currMaintenanceJob.Timestamp);
                        cmd.Parameters.AddWithValue("@RxTime", currMaintenanceJob.RxTime);
                        cmd.Parameters.AddWithValue("@Flag", currMaintenanceJob.Flag);
                        cmd.Parameters.AddWithValue("@JobCancelled", currMaintenanceJob.JobCancelled);
                        cmd.Parameters.AddWithValue("@CancelRemarks", currMaintenanceJob.CancelRemarks);
                        cmd.Parameters.AddWithValue("@AdminRemarks", currMaintenanceJob.AdminRemarks);
                        cmd.Parameters.AddWithValue("@isSent", currMaintenanceJob.isSent);
                        cmd.Parameters.AddWithValue("@ReferenceNo", currMaintenanceJob.ReferenceNo);
                        cmd.Parameters.AddWithValue("@DriverID", currMaintenanceJob.DriverID);
                        cmd.Parameters.AddWithValue("@AssetID", currMaintenanceJob.AssetID);
                        cmd.Parameters.AddWithValue("@Technician", currMaintenanceJob.Technician);
                        cmd.Parameters.AddWithValue("@MaintenanceJobID", currMaintenanceJob.MaintenanceJobID);

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
                Logger.LogEvent(ex.Message + "-Update(MaintenanceJobRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }
        public bool UpdateFlag(MaintenanceJobInfo currMaintenanceJob)
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
                        cmd.CommandText = "UPDATE maintenance_job SET isSent = @isSent " +
                                           "WHERE maintenance_id = @MaintenanceID and flag > 0 and DATE(alert_date) >= CURDATE()";
                        //cmd.Prepare();
                        cmd.Parameters.AddWithValue("@isSent", currMaintenanceJob.isSent);
                        cmd.Parameters.AddWithValue("@MaintenanceID", currMaintenanceJob.MaintenanceID);

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
                Logger.LogEvent(ex.Message + "-Update(MaintenanceJobAlertRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }
        public bool UpdateReference(MaintenanceJobInfo currMaintenanceJob)
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
                        cmd.CommandText = "UPDATE maintenance_job SET reference_no = @ReferenceNo " +
                                           "WHERE maintenance_id = @MaintenanceID";
                        //cmd.Prepare();
                        cmd.Parameters.AddWithValue("@ReferenceNo", currMaintenanceJob.ReferenceNo);
                        cmd.Parameters.AddWithValue("@MaintenanceID", currMaintenanceJob.MaintenanceID);

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
                Logger.LogEvent(ex.Message + "-Update(MaintenanceJobAlertRepository)", System.Diagnostics.EventLogEntryType.Error);
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

        public string GetDoc(string strName, ref string strFill)
        {
            string strFile = "";

            try
            {
                // loop through doc file types
                List<string> arrTypes = new List<string>() { "doc", "docx" };
                foreach (string strType in arrTypes)
                {
                    string strTemp = String.Format("{0}.{1}", strName, strType);
                    strFile = String.Format("{0}images\\{1}", HostingEnvironment.ApplicationPhysicalPath, strTemp);

                    // check file path
                    if (File.Exists(strFile))
                    {
                        Logger.LogEvent(String.Format("Template Located: {0}", strFile), System.Diagnostics.EventLogEntryType.Information);
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent("Get Template: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }

            // doc file not found
            strFill = "None";
            return strFile;
        }

    }
}