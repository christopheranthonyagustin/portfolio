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
        private string mConnStr = Settings.Default.DB;
        private string mProjName = "FMS-Singapore";
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
                        currJob.Forms = GetImage(String.Format("forms/{0}", currJob.JobID), ref strFill);
                        currJob.FormsFill = strFill;
                        currJob.Signature = GetImage(String.Format("quarantine_sign/{0}", currJob.JobID), ref strFill);
                        currJob.SignatureFill = strFill;
                        arrJobs.Add(currJob);
                    }
                }
                conn.Close();
            }
            catch (MySqlException ex)
            {
                Logger.LogEvent(mProjName, "GetAll Jobs: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }

            if (conn != null)
                conn.Close();

            return arrJobs.ToArray();
        }

        public IEnumerable<JobInfo> GetByDriver(JobInfo param)
        {
            List<JobInfo> arrJobs = new List<JobInfo>();
            JobInfo currJob = new JobInfo();

            string query = "SELECT * FROM view_jobs WHERE company_id = @CompanyID and driver_id = @DriverID";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        
                        cmd.Parameters.AddWithValue("@CompanyID", param.CompanyID);
                        cmd.Parameters.AddWithValue("@DriverID", param.DriverID);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currJob = DataMgrTools.BuildJob(reader);
                                    string strFill = "";
                                    currJob.Forms = GetImage(String.Format("forms/{0}", currJob.JobID), ref strFill);
                                    currJob.FormsFill = strFill;
                                    currJob.Signature = GetImage(String.Format("quarantine_sign/{0}", currJob.JobID), ref strFill);
                                    currJob.SignatureFill = strFill;
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

        public IEnumerable<JobInfo> GetByCompany(JobInfo param)
        {
            List<JobInfo> arrJobs = new List<JobInfo>();
            JobInfo currJob = new JobInfo();

            string query = "SELECT * FROM view_jobs WHERE (timestamp between @StartTS and @EndTS)";
    
            if (param.ResellerID > 0) query += " and reseller_id = @ResellerID";
            if (param.CompanyID > 0) query += " and company_id = @CompanyID";
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
                        cmd.Parameters.AddWithValue("@EndTS", param.RxTime);
                        cmd.Parameters.AddWithValue("@ResellerID", param.ResellerID);
                        cmd.Parameters.AddWithValue("@CompanyID", param.CompanyID);
                        cmd.Parameters.AddWithValue("@DriverID", param.DriverID);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currJob = DataMgrTools.BuildJob(reader);
                                    string strFill = "";
                                    currJob.Forms = GetImage(String.Format("forms/{0}", currJob.JobID), ref strFill);
                                    currJob.FormsFill = strFill;
                                    currJob.Signature = GetImage(String.Format("quarantine_sign/{0}", currJob.JobID), ref strFill);
                                    currJob.SignatureFill = strFill;
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
                        cmd.CommandText = "INSERT INTO jobs (job_number, timestamp, rx_time, cancelled, company_id, reseller_id, driver_id, user_id, remarks, flag) " +
                                                    "VALUES (@JobNumber, @Timestamp, @RxTime, @Cancelled, @CompanyID, @ResellerID, @DriverID, @UserID, @Remarks, @Flag)";
                        
                        cmd.Parameters.AddWithValue("@JobNumber", currJob.JobNumber);
                        cmd.Parameters.AddWithValue("@Timestamp", currJob.Timestamp);
                        cmd.Parameters.AddWithValue("@RxTime", currJob.RxTime);
                        cmd.Parameters.AddWithValue("@Cancelled", currJob.Cancelled);
                        cmd.Parameters.AddWithValue("@CompanyID", currJob.CompanyID);
                        cmd.Parameters.AddWithValue("@ResellerID", currJob.ResellerID);
                        cmd.Parameters.AddWithValue("@DriverID", currJob.DriverID);
                        cmd.Parameters.AddWithValue("@UserID", currJob.UserID);
                        cmd.Parameters.AddWithValue("@Remarks", currJob.Remarks);
                        cmd.Parameters.AddWithValue("@Flag", currJob.Flag);
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
                        cmd.CommandText = "UPDATE jobs SET job_number = @JobNumber, timestamp = @Timestamp, rx_time = @RxTime, cancelled = @Cancelled, company_id = @CompanyID, reseller_id = @ResellerID, driver_id = @DriverID, user_id = @UserID, remarks = @Remarks, flag = @Flag WHERE job_id = @JobID";
                        
                        cmd.Parameters.AddWithValue("@JobNumber", currJob.JobNumber);
                        cmd.Parameters.AddWithValue("@Timestamp", currJob.Timestamp);
                        cmd.Parameters.AddWithValue("@RxTime", currJob.RxTime);
                        cmd.Parameters.AddWithValue("@Cancelled", currJob.Cancelled);
                        cmd.Parameters.AddWithValue("@CompanyID", currJob.CompanyID);
                        cmd.Parameters.AddWithValue("@ResellerID", currJob.ResellerID);
                        cmd.Parameters.AddWithValue("@DriverID", currJob.DriverID);
                        cmd.Parameters.AddWithValue("@UserID", currJob.UserID);
                        cmd.Parameters.AddWithValue("@Remarks", currJob.Remarks);
                        cmd.Parameters.AddWithValue("@Flag", currJob.Flag);
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