using FMSWebApi.Models;
using FMSWebApi.Properties;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace FMSWebApi.Repository
{
    public class ContractAlertRepository : IContractAlertRepository
    {
        private string mConnStr = Settings.Default.DB;
        private string mProjName = "FMS-Singapore";
        public IEnumerable<ContractAlertInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<ContractAlertInfo> arrContracts = new List<ContractAlertInfo>();

            if (conn != null)
                conn.Close();

            return arrContracts.ToArray();
        }
        public IEnumerable<ContractAlertInfo> GetContractAlertFiltered(ContractAlertInfo param)
        {
            List<ContractAlertInfo> arrContracts = new List<ContractAlertInfo>();
            ContractAlertInfo currContract = new ContractAlertInfo();

            string query = "SELECT * FROM view_contract_alert WHERE contract_id = @ContractID";

            if (param.CompanyID > 0) query += " and company_id = @CompanyID";
            query += " order by timestamp asc";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        
                        cmd.Parameters.AddWithValue("@ContractID", param.ContractID);
                        cmd.Parameters.AddWithValue("@CompanyID", param.CompanyID);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currContract = DataMgrTools.BuildContractAlerts(reader);
                                    arrContracts.Add(currContract);
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-GetContractAlert", System.Diagnostics.EventLogEntryType.Error);
                }
            }

            return arrContracts;
        }
        public ContractAlertInfo Get(int contractID)
        {
            ContractAlertInfo currContract = new ContractAlertInfo();

            string query = string.Format("SELECT * FROM view_contract_alert WHERE contract_alert_id = {0}", contractID);

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
                            currContract = DataMgrTools.BuildContractAlerts(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(ContractAlertRepository)", System.Diagnostics.EventLogEntryType.Error);
                }
            }
            return currContract;
        }
        public ContractAlertInfo Add(ContractAlertInfo currContract)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO contract_alert (contract_id, alert_date, timestamp, rx_time, contract_cancelled, cancel_remarks, company_id, isSent, flag) " +
                                                              "VALUES (@ContractID, @AlertDate, @Timestamp, @RxTime, @ContractCancelled, @CancelRemarks, @CompanyID, @isSent, @Flag)";
                        
                        cmd.Parameters.AddWithValue("@ContractID", currContract.ContractID);
                        cmd.Parameters.AddWithValue("@AlertDate", currContract.AlertDate);
                        cmd.Parameters.AddWithValue("@Timestamp", currContract.Timestamp);
                        cmd.Parameters.AddWithValue("@RxTime", currContract.RxTime);
                        cmd.Parameters.AddWithValue("@ContractCancelled", currContract.ContractCancelled);
                        cmd.Parameters.AddWithValue("@CancelRemarks", currContract.CancelRemarks);
                        cmd.Parameters.AddWithValue("@CompanyID", currContract.CompanyID);
                        cmd.Parameters.AddWithValue("@isSent", currContract.isSent);
                        cmd.Parameters.AddWithValue("@Flag", currContract.Flag);

                        cmd.ExecuteNonQuery();

                        long id = cmd.LastInsertedId;
                        currContract.ContractAlertID = id;

                        conn.Close();
                    }
}
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(ContractAlertRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return currContract;
        }
        public bool Remove(int contractID)
        {
            bool retVal = false;
            string query = "";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    query = string.Format("DELETE FROM contract_alert WHERE contract_alert_id = {0}", contractID);

                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        if (cmd.ExecuteNonQuery() == 1)
                            retVal = true;
                        else if (cmd.ExecuteNonQuery() == 2)
                            retVal = true;
                        else
                            retVal = false;
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Remove(ContractAlertRepository)", System.Diagnostics.EventLogEntryType.Error);
                }

            }

            return retVal;
        }
        public bool RemoveContract(int contractID)
        {
            bool retVal = false;
            string query = "";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    query = string.Format("DELETE FROM contract_alert WHERE contract_id = {0}", contractID);

                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        if (cmd.ExecuteNonQuery() == 1)
                            retVal = true;
                        else if (cmd.ExecuteNonQuery() == 2)
                            retVal = true;
                        else
                            retVal = false;
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-RemoveCopntract(ContractAlertRepository)", System.Diagnostics.EventLogEntryType.Error);
                }

            }

            return retVal;
        }
        public bool Update(ContractAlertInfo currContract)
        {
            bool retVal = false;
            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "UPDATE contract_alert SET contract_id = @ContractID, alert_date = @AlertDate, timestamp = @Timestamp, rx_time = @RxTime, contract_cancelled = @ContractCancelled, cancel_remarks = @CancelRemarks, company_id = @CompanyID, isSent = @isSent, flag = @Flag" +
                                                               " WHERE contract_alert_id = @ContractAlertID";
                        
                        cmd.Parameters.AddWithValue("@ContractID", currContract.ContractID);
                        cmd.Parameters.AddWithValue("@AlertDate", currContract.AlertDate);
                        cmd.Parameters.AddWithValue("@Timestamp", currContract.Timestamp);
                        cmd.Parameters.AddWithValue("@RxTime", currContract.RxTime);
                        cmd.Parameters.AddWithValue("@ContractCancelled", currContract.ContractCancelled);
                        cmd.Parameters.AddWithValue("@CancelRemarks", currContract.CancelRemarks);
                        cmd.Parameters.AddWithValue("@CompanyID", currContract.CompanyID);
                        cmd.Parameters.AddWithValue("@isSent", currContract.isSent);
                        cmd.Parameters.AddWithValue("@Flag", currContract.Flag);
                        cmd.Parameters.AddWithValue("@ContractAlertID", currContract.ContractAlertID);

                        if (cmd.ExecuteNonQuery() == 1)
                            retVal = true;
                        else
                            retVal = false;

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Update(ContractAlertRepository)", System.Diagnostics.EventLogEntryType.Error);
                }
            }

            return retVal;
        }
    }
}