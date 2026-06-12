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
    public class SearchJobRepository : ISearchJobRepository
    {
        private string mConnStr = "server=103.237.168.119;uid=root;pwd=@c3c0M;database=trackliteprodev;Charset=utf8;max pool size=500;";
        private string mProjName = "TRACKLitePro";
        public IEnumerable<SearchJob> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<SearchJob> arrJobs = new List<SearchJob>();


            return arrJobs.ToArray();
        }

        public IEnumerable<SearchJob> GetByCompany(SearchJob param)
        {
            List<SearchJob> arrJobs = new List<SearchJob>();
            SearchJob currJob = new SearchJob();
            object objTemp = new object();

            string query = "SELECT * FROM view_jobs WHERE job_number = @JobNumber";
  
            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        cmd.Prepare();
                        if (!string.IsNullOrEmpty(param.JobNumber)) cmd.Parameters.AddWithValue("@JobNumber", param.JobNumber);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currJob = DataMgrTools.BuildSearchJob(reader);
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

        public SearchJob Get(int jobID)
        {
            SearchJob currJob = new SearchJob();
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
                            currJob = DataMgrTools.BuildSearchJob(reader);
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

        public SearchJob Add(SearchJob currJob)
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
                Logger.LogEvent(ex.Message + "-Add(SearchJobRepository)", System.Diagnostics.EventLogEntryType.Error);
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
                Logger.LogEvent(ex.Message + "-Remove(SearchJobRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }

        public bool Update(SearchJob currJob)
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
                Logger.LogEvent(ex.Message + "-Update(SearchJobRepository)", System.Diagnostics.EventLogEntryType.Error);
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

    }
}