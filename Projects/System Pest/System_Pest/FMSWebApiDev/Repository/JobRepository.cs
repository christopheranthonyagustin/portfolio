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
        private string mConnStr = "server=103.237.168.119;uid=root;pwd=@c3c0M;database=trackliteprodev;Charset=utf8;max pool size=500;";
        private string mProjName = "TRACKLitePro";
        public IEnumerable<JobInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<JobInfo> arrJobs = new List<JobInfo>();

            try
            {
                conn.ConnectionString = mConnStr;
                conn.Open();

                cmd.CommandText = "view_jobs";
                cmd.Connection = conn;
                cmd.CommandType = CommandType.TableDirect;
                MySqlDataReader reader = cmd.ExecuteReader();

                //Console.WriteLine(String.Format("Total Data: {0}", dbRdr.FieldCount));

                if ((reader != null) && (reader.HasRows))
                {
                    while (reader.Read())
                    {
                        JobInfo currJob = DataMgrTools.BuildJob(reader);
                        string strFill = "";
                        currJob.Image = GetImage(String.Format("signatures/{0}", currJob.JobID), ref strFill);
                        currJob.ImageFill = strFill;
                        arrJobs.Add(currJob);
                    }
                }
                conn.Close();
            }
            catch (MySqlException ex)
            {
                Logger.LogEvent(mProjName, "GetAll Jobs: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }

            try
            {
                conn.Open();
                for (int i = 0; i < arrJobs.Count; i++)
                {
                    string query = string.Format("SELECT * FROM view_drivers where asset_id = {0}", arrJobs[i].AssetID);

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
            catch (Exception ex)
            {
                Logger.LogEvent("GetAll-view_assets: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }

            if (conn != null)
                conn.Close();

            return arrJobs.ToArray();
        }

        public IEnumerable<JobInfo> ClearJobs()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<JobInfo> arrJobs = new List<JobInfo>();

            return arrJobs.ToArray();
        }

        public IEnumerable<JobInfo> GetByCompany(JobInfo param)
        {
            List<JobInfo> arrJobs = new List<JobInfo>();
            JobInfo currJob = new JobInfo();
            object objTemp = new object();

            string query = "SELECT * FROM view_jobs WHERE (timestamp between @StartTS and @EndTS)";
  
            if (param.AssetResellerID > 0) query += " and reseller_id = @AssetResellerID";
            if (param.AssetCompanyID > 0) query += " and company_id = @AssetCompanyID";
            if (param.Flag > 0) query += " and flag >= @Flag";
            if (!string.IsNullOrEmpty(param.JobStatus)) query += " and job_status = @JobStatus";
            if (!string.IsNullOrEmpty(param.Agent)) query += " and agent = @Agent";
            if (!string.IsNullOrEmpty(param.JobUser)) query += " and driver_name = @JobUser";
            if (!string.IsNullOrEmpty(param.JobType)) query += " and job_type = @JobType";

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
                        cmd.Parameters.AddWithValue("@JobStatus", param.JobStatus);
                        cmd.Parameters.AddWithValue("@Agent", param.Agent);
                        cmd.Parameters.AddWithValue("@JobUser", param.JobUser);
                        cmd.Parameters.AddWithValue("@JobType", param.JobType);
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
                                    currJob.Image = GetImage(String.Format("signatures/{0}", currJob.JobID), ref strFill);
                                    currJob.ImageFill = strFill;
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

        public IEnumerable<JobInfo> GetByCompanyEx(JobInfo param)
        {
            List<JobInfo> arrJobs = new List<JobInfo>();
            JobInfo currJob = new JobInfo();
            object objTemp = new object();

            string query = "SELECT * FROM view_jobs WHERE timestamp <= @StartTS";

            if (param.AssetResellerID > 0) query += " and reseller_id = @AssetResellerID";
            if (param.AssetCompanyID > 0) query += " and company_id = @AssetCompanyID";
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
                        cmd.Parameters.AddWithValue("@StartTS", param.Timestamp);
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
                                    currJob.Image = GetImage(String.Format("signatures/{0}", currJob.JobID), ref strFill);
                                    currJob.ImageFill = strFill;
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

            if (!string.IsNullOrEmpty(param.JobUser)) query += " and driver_name = @JobUser";

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
                        cmd.Parameters.AddWithValue("@JobUser", param.JobUser);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currJob = DataMgrTools.BuildJob(reader);
                                    string strFill = "";
                                    currJob.Image = GetImage(String.Format("signatures/{0}", currJob.JobID), ref strFill);
                                    currJob.ImageFill = strFill;
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
                                    currJob.Image = GetImage(String.Format("signatures/{0}", currJob.JobID), ref strFill);
                                    currJob.ImageFill = strFill;
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
                        cmd.CommandText = "UPDATE jobs SET flag = @Flag, job_status = @JobStatus WHERE timestamp < @Timestamp and flag > 0 and asset_id = @AssetID";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@Timestamp", item.Timestamp);
                        cmd.Parameters.AddWithValue("@Flag", 0);
                        cmd.Parameters.AddWithValue("@JobStatus", item.JobStatus);
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

        public JobInfo LogoutAsset(JobInfo item)
        {
            try
            {
                //2016-12-01
                string strStart = (item.Timestamp != DateTime.MinValue ? String.Format("'{0:yyyy-MM-dd}'", item.Timestamp) : "NULL");
                string strEnd = (item.RxTime != DateTime.MinValue ? String.Format("'{0:yyyy-MM-dd}'", item.RxTime) : "NULL");
                string strJobType = "Scheduled";
                string strJobStatus = "Completed";

                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "UPDATE jobs SET asset_id = @AssetID WHERE timestamp between @StartTS and @EndTS and company_id = @AssetCompanyID and driver_name = @JobUser and job_type = @JobType and job_status != @JobStatus";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@AssetID", 0);
                        cmd.Parameters.AddWithValue("@AssetCompanyID", item.AssetCompanyID);
                        cmd.Parameters.AddWithValue("@JobUser", item.JobUser);
                        cmd.Parameters.AddWithValue("@StartTS", item.Timestamp);
                        cmd.Parameters.AddWithValue("@EndTS", item.RxTime);
                        cmd.Parameters.AddWithValue("@JobType", strJobType);
                        cmd.Parameters.AddWithValue("@JobStatus", strJobStatus);
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-LogoutAsset", System.Diagnostics.EventLogEntryType.Warning);
            }

            return item;
        }

        public JobInfo Get(int jobID)
        {
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
                        cmd.CommandText = "INSERT INTO jobs (job_number, company, timestamp, rx_time, company_id, reseller_id, asset_id, amount, pic, destination, phone, unit, remarks, remarks2, flag, receipt_number, agent, job_status, driver_name, job_type, postal, company_destination) " +
                            "VALUES (@JobNumber, @Company, @Timestamp, @RxTime, @AssetCompanyID, @AssetResellerID, @AssetID, @Amount, @PIC, @Destination, @Phone, @Unit, @Remarks, @Remarks2, @Flag, @Receipt, @Agent, @JobStatus, @JobUser, @JobType, @Postal, @CompanyDestination)";
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
                        cmd.Parameters.AddWithValue("@Remarks2", currJob.Remarks2);
                        cmd.Parameters.AddWithValue("@Flag", currJob.Flag);
                        cmd.Parameters.AddWithValue("@Receipt", "");
                        cmd.Parameters.AddWithValue("@JobStatus", currJob.JobStatus);
                        cmd.Parameters.AddWithValue("@Agent", currJob.Agent);
                        cmd.Parameters.AddWithValue("@JobUser", currJob.JobUser);
                        cmd.Parameters.AddWithValue("@JobType", currJob.JobType);
                        cmd.Parameters.AddWithValue("@Postal", currJob.Postal);
                        cmd.Parameters.AddWithValue("@CompanyDestination", currJob.CompanyDestination);
                        cmd.ExecuteNonQuery();
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
            string query = string.Format("DELETE FROM jobs WHERE job_id = {0}", jobID);

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
                Logger.LogEvent(ex.Message + "-Remove(JobRepository)", System.Diagnostics.EventLogEntryType.Error);
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
                        cmd.CommandText = "UPDATE jobs SET job_number = @JobNumber, company = @Company, timestamp = @Timestamp, rx_time = @RxTime, company_id = @AssetCompanyID, reseller_id = @AssetResellerID, asset_id = @AssetID, " +
                            "amount = @Amount, pic = @PIC, destination = @Destination, phone = @Phone, unit = @Unit, remarks = @Remarks, remarks2 = @Remarks2, flag = @Flag, " +
                            "receipt_number = @Receipt, agent = @Agent, job_status = @JobStatus, driver_name = @JobUser, job_type = @JobType, postal = @Postal, company_destination = @CompanyDestination WHERE job_id = @JobID";
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
                        cmd.Parameters.AddWithValue("@Remarks2", currJob.Remarks2);
                        cmd.Parameters.AddWithValue("@Flag", currJob.Flag);
                        cmd.Parameters.AddWithValue("@Receipt", "");
                        cmd.Parameters.AddWithValue("@JobStatus", currJob.JobStatus);
                        cmd.Parameters.AddWithValue("@Agent", currJob.Agent);
                        cmd.Parameters.AddWithValue("@JobUser", currJob.JobUser);
                        cmd.Parameters.AddWithValue("@JobType", currJob.JobType);
                        cmd.Parameters.AddWithValue("@Postal", currJob.Postal);
                        cmd.Parameters.AddWithValue("@CompanyDestination", currJob.CompanyDestination);
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

        /// <summary>
        /// gets image file
        /// </summary>
        /// <param name="strName"></param>
        /// <param name="strDefault"></param>
        /// <param name="strFill"></param>
        /// <returns></returns>
        public string GetImage(string strName, ref string strFill)
        {
            try
            {
                // loop through image file types
                List<string> arrTypes = new List<string>() { "jpg", "png", "gif", "bmp" };
                foreach (string strType in arrTypes)
                {
                    string strTemp = String.Format("{0}.{1}", strName, strType);
                    string strFile = String.Format("{0}images\\{1}", HostingEnvironment.ApplicationPhysicalPath, strTemp);
                    //string strUri = String.Format("{0}/images/{1}", ConfigurationManager.AppSettings["ServerPath"], strTemp);
                    string strUri = String.Format("{0}/images/{1}", "http://103.237.168.119/trackliteprodevwebapi", strTemp);

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

        public object GetAssetByJobEx(object item)
        {
            JobInfo newInfo = item as JobInfo;
            try
            {
                using (MySqlConnection conn = new MySqlConnection(Settings.Default.DB))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "SELECT * FROM view_jobs WHERE job_id = @JobID";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@JobID", newInfo.JobID);
                        MySqlDataReader reader = cmd.ExecuteReader();

                        //Console.WriteLine(String.Format("Total Data: {0}", dbRdr.FieldCount));
                        //Logger.LogEvent("Check Query: " + cmd.CommandText, System.Diagnostics.EventLogEntryType.Warning);

                        if ((reader != null) && (reader.HasRows))
                        {
                            while (reader.Read())
                            {
                                newInfo = DataMgrTools.BuildJob(reader);
                            }
                        }
                        else
                        {
                            newInfo.ErrorMessage = Consts.ERR_JOBERROR;
                        }

                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent("GetAssetByJobEx: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }

            return newInfo;
        }

        //To DEBUG To update job asset id
        public JobInfo GetAssetByJobDriver(JobInfo item)
        {
            JobInfo currJob = new JobInfo();
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {

                    #region GET THE LINKED JOBS
                    try
                    {                       
                        currJob = GetByJobDriver(item.JobUser, item.AssetCompanyID);
                        //Logger.LogEvent("Check JobType:" + currJob.JobType, System.Diagnostics.EventLogEntryType.Warning);
                        //Logger.LogEvent("Check JobStatus:" + currJob.JobStatus, System.Diagnostics.EventLogEntryType.Warning);
                        //Logger.LogEvent("GET THE LINKED Driver1: " + item.JobUser + " GET THE LINKED Driver2: " + currJob.JobUser, System.Diagnostics.EventLogEntryType.Warning);
                    }
                    catch (Exception ex)
                    {
                        Logger.LogEvent("GET THE LINKED JOBS: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                    }
                    #endregion

                    if (currJob.JobType == "Scheduled" && currJob.JobStatus == "Scheduled In Progress" && item.JobUser == currJob.JobUser)
                    {
                        using (MySqlCommand cmd = new MySqlCommand())
                        {
                            conn.Open();
                            cmd.Connection = conn;
                            cmd.CommandText = "UPDATE jobs SET company_id = @AssetCompanyID, asset_id = @AssetID WHERE job_id = @JobID";
                            cmd.Prepare();
                            cmd.Parameters.AddWithValue("@AssetCompanyID", item.AssetCompanyID);
                            cmd.Parameters.AddWithValue("@AssetID", item.AssetID);
                            cmd.Parameters.AddWithValue("@JobID", currJob.JobID);
                            Logger.LogEvent("GetAssetByJobDriver - Check Job ID: " + currJob.JobID, System.Diagnostics.EventLogEntryType.Warning);
                            cmd.ExecuteNonQuery();
                            conn.Close();
                        }
                    }

                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-GetAssetByJobDriver", System.Diagnostics.EventLogEntryType.Error);
            }

            return item;
        }

        public JobInfo GetByJobDriver(string jobDriver, int companyID)
        {
            JobInfo currJob = new JobInfo();
            string query = string.Format("SELECT * FROM view_jobs WHERE driver_name = @JobUser");
            if (currJob.AssetCompanyID > 0) query += " and company_id = @AssetCompanyID";
            query += " and flag >= 1 order by timestamp desc";

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
                        cmd.Parameters.AddWithValue("@JobUser", jobDriver);
                        cmd.Parameters.AddWithValue("@AssetCompanyID", companyID);
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
                    Logger.LogEvent(ex.Message + "-GetByJobDriver", System.Diagnostics.EventLogEntryType.Error);
                    conn.Close();
                }
            }
            return currJob;
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
                        cmd.CommandText = "UPDATE jobs SET job_number = @JobNumber, company = @Company, timestamp = @Timestamp, rx_time = @RxTime, company_id = @AssetCompanyID, reseller_id = @AssetResellerID, asset_id = @AssetID, " +
                           "amount = @Amount, pic = @PIC, destination = @Destination, phone = @Phone, unit = @Unit, remarks = @Remarks, remarks2 = @Remarks2, flag = @Flag, " +
                           "receipt_number = @Receipt, agent = @Agent, job_status = @JobStatus, driver_name = @JobUser, job_type = @JobType WHERE job_id = @JobID";
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
                        cmd.Parameters.AddWithValue("@Remarks2", currJob.Remarks2);
                        cmd.Parameters.AddWithValue("@Flag", currJob.Flag);
                        cmd.Parameters.AddWithValue("@Receipt", "");
                        cmd.Parameters.AddWithValue("@JobStatus", currJob.JobStatus);
                        cmd.Parameters.AddWithValue("@Agent", currJob.Agent);
                        cmd.Parameters.AddWithValue("@JobUser", currJob.JobUser);
                        cmd.Parameters.AddWithValue("@JobType", currJob.JobType);
                        cmd.Parameters.AddWithValue("@Postal", currJob.Postal);
                        cmd.Parameters.AddWithValue("@CompanyDestination", currJob.CompanyDestination);
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