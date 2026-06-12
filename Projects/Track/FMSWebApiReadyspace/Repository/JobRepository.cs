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

namespace FMSWebApi.Repository
{
    public class JobRepository : IJobRepository
    {
        private string mConnStr = "server=localhost;uid=root;pwd=@c3c0M;database=tracksg;Charset=utf8;max pool size=500;";
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

        public IEnumerable<JobInfo> GetByCompany(JobInfo param)
        {
            List<JobInfo> arrJobs = new List<JobInfo>();
            JobInfo currJob = new JobInfo();
            object objTemp = new object();

            string query = "SELECT * FROM view_jobs WHERE (timestamp between @StartTS and @EndTS)";

            //string query = "SELECT * FROM view_jobs WHERE reseller_id = @AssetResellerID";       
            if (param.AssetResellerID > 0) query += " and reseller_id = @AssetResellerID";
            if (param.AssetCompanyID > 0) query += " and company_id = @AssetCompanyID";
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
                        cmd.Parameters.AddWithValue("@EndTS", param.RxTime);
                        cmd.Parameters.AddWithValue("@AssetResellerID", param.AssetResellerID);
                        cmd.Parameters.AddWithValue("@AssetCompanyID", param.AssetCompanyID);
                       // cmd.Parameters.AddWithValue("@AssetID", param.AssetID);
                        if (param.AssetID > 0) cmd.Parameters.AddWithValue("@AssetID", param.AssetID);
                        else if (!string.IsNullOrEmpty(param.Asset)) cmd.Parameters.AddWithValue("@AssetName", param.Asset);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currJob = DataMgrTools.BuildJob(reader);
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
                        cmd.CommandText = "INSERT INTO jobs (job_number, company, timestamp, rx_time, company_id, reseller_id, asset_id) " +
                            "VALUES (@JobNumber, @Company, @Timestamp, @RxTime, @AssetCompanyID, @AssetResellerID, @AssetID)";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@JobNumber", currJob.JobNumber);
                        cmd.Parameters.AddWithValue("@Company", currJob.Company);
                        cmd.Parameters.AddWithValue("@Timestamp", currJob.Timestamp);
                        cmd.Parameters.AddWithValue("@RxTime", currJob.RxTime);
                        cmd.Parameters.AddWithValue("@AssetCompanyID", currJob.AssetCompanyID);
                        cmd.Parameters.AddWithValue("@AssetResellerID", currJob.AssetResellerID);
                        cmd.Parameters.AddWithValue("@AssetID", currJob.AssetID);
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
                        cmd.CommandText = "UPDATE jobs SET job_number = @JobNumber,company = @Company, timestamp = @Timestamp, rx_time = @RxTime, company_id = @AssetCompanyID, reseller_id = @AssetResellerID, asset_id = @AssetID WHERE job_id = @JobID";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@JobNumber", currJob.JobNumber);
                        cmd.Parameters.AddWithValue("@Company", currJob.Company);
                        cmd.Parameters.AddWithValue("@Timestamp", currJob.Timestamp);
                        cmd.Parameters.AddWithValue("@RxTime", currJob.RxTime);
                        cmd.Parameters.AddWithValue("@AssetCompanyID", currJob.AssetCompanyID);
                        cmd.Parameters.AddWithValue("@AssetResellerID", currJob.AssetResellerID);
                        cmd.Parameters.AddWithValue("@AssetID", currJob.AssetID);
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
                    string strUri = String.Format("{0}/images/{1}", "https://track-asia.com/tracksgwebapi", strTemp);

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