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
    public class MaintenanceJobRepository : IMaintenanceJobRepository
    {
        private string mConnStr = "server=localhost;uid=root;pwd=@c3c0M;database=sp;Charset=utf8;max pool size=500;default command timeout=999999;";
        private string mProjName = "SP";
        public IEnumerable<MaintenanceJobInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<MaintenanceJobInfo> arrMaintenanceJob = new List<MaintenanceJobInfo>();

            try
            {
                conn.ConnectionString = mConnStr;
                conn.Open();

                cmd.CommandText = "view_maintenance_job";
                cmd.Connection = conn;
                cmd.CommandType = CommandType.TableDirect;
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
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@MaintenanceID", param.MaintenanceID);

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
                    Logger.LogEvent(ex.Message + "-Get(MaintenanceJob)", System.Diagnostics.EventLogEntryType.Error);

                }


                if (currMaintenanceJob.AssetCompanyID != 2)
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

            if (param.AssetCompanyID != 2)
            {
                query = "SELECT * FROM view_maintenance_job_sg WHERE (timestamp between @StartTS and @EndTS)";
            }
            else if (param.AssetCompanyID == 2)
            {
                query = "SELECT * FROM view_maintenance_job_my WHERE (timestamp between @StartTS and @EndTS)";
            }

            if (param.AssetCompanyID > 0) query += " and company_id = @AssetCompanyID";


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
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@StartTS", param.Timestamp);
                        cmd.Parameters.AddWithValue("@EndTS", param.Timestamp.AddMinutes(1679));
                        cmd.Parameters.AddWithValue("@AssetCompanyID", param.AssetCompanyID);
                        cmd.Parameters.AddWithValue("@DriverID", param.DriverID);
                        cmd.Parameters.AddWithValue("@Groups", param.Groups);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    if (param.AssetCompanyID != 2) { currMaintenanceJob = DataMgrTools.BuildMaintenanceJobCal(reader); }
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
                    Logger.LogEvent(ex.Message + "-Get(MaintenanceJob)", System.Diagnostics.EventLogEntryType.Error);

                }

            }

            return arrMaintenanceJob;
        }
        public IEnumerable<MaintenanceCalJobInfo> GetMaintenanceJobByDate(MaintenanceCalJobInfo param)
        {
            List<MaintenanceCalJobInfo> arrMaintenanceJob = new List<MaintenanceCalJobInfo>();
            MaintenanceCalJobInfo currMaintenanceJob = new MaintenanceCalJobInfo();

            string query = "SELECT * FROM view_maintenance_job_app WHERE (timestamp between @StartTS and @EndTS)";

            if (param.AssetCompanyID > 0) query += " and company_id = @AssetCompanyID";


            if (param.DriverID > 0) query += " and driver_id = @DriverID";

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
                        cmd.Parameters.AddWithValue("@EndTS", param.Timestamp.AddMinutes(1679));
                        cmd.Parameters.AddWithValue("@AssetCompanyID", param.AssetCompanyID);
                        cmd.Parameters.AddWithValue("@DriverID", param.DriverID);

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
                    Logger.LogEvent(ex.Message + "-Get(MaintenanceJob)", System.Diagnostics.EventLogEntryType.Error);

                }


                if (currMaintenanceJob.AssetCompanyID != 2)
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
        public MaintenanceJobInfo Get(int maintenanceID)
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
                        cmd.CommandText = "INSERT INTO maintenance_job (maintenance_id, alert_date, timestamp, rx_time, flag, job_cancelled, cancel_remarks, isSent, reference_no, driver_id, asset_id, technician)" +
                                                              " VALUES (@MaintenanceID, @AlertDate, @Timestamp, @RxTime, @Flag, @JobCancelled, @CancelRemarks, @isSent, @ReferenceNo, @DriverID, @AssetID, @Technician)";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@MaintenanceID", currMaintenanceJob.MaintenanceID);
                        cmd.Parameters.AddWithValue("@AlertDate", currMaintenanceJob.AlertDate);
                        cmd.Parameters.AddWithValue("@Timestamp", currMaintenanceJob.Timestamp);
                        cmd.Parameters.AddWithValue("@RxTime", currMaintenanceJob.RxTime);
                        cmd.Parameters.AddWithValue("@Flag", currMaintenanceJob.Flag);
                        cmd.Parameters.AddWithValue("@JobCancelled", currMaintenanceJob.JobCancelled);
                        cmd.Parameters.AddWithValue("@CancelRemarks", currMaintenanceJob.CancelRemarks);
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

            return retVal;
        }
        public bool RemoveMainJob(int jobID)
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
                        cmd.CommandText = "UPDATE maintenance_job SET maintenance_id = @MaintenanceID, alert_date = @AlertDate, timestamp = @Timestamp, rx_time = @RxTime, flag = @Flag, job_cancelled = @JobCancelled, cancel_remarks = @CancelRemarks, isSent = @isSent, reference_no = @ReferenceNo, driver_id = @DriverID, asset_id = @AssetID, technician = @Technician " +
                                           "WHERE maintenancejob_id = @MaintenanceJobID";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@MaintenanceID", currMaintenanceJob.MaintenanceID);
                        cmd.Parameters.AddWithValue("@AlertDate", currMaintenanceJob.AlertDate);
                        cmd.Parameters.AddWithValue("@Timestamp", currMaintenanceJob.Timestamp);
                        cmd.Parameters.AddWithValue("@RxTime", currMaintenanceJob.RxTime);
                        cmd.Parameters.AddWithValue("@Flag", currMaintenanceJob.Flag);
                        cmd.Parameters.AddWithValue("@JobCancelled", currMaintenanceJob.JobCancelled);
                        cmd.Parameters.AddWithValue("@CancelRemarks", currMaintenanceJob.CancelRemarks);
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
                        cmd.Prepare();
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
                        cmd.Prepare();
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

    }
}