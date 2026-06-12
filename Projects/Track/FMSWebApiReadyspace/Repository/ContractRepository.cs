using FMSWebApi.Models;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace FMSWebApi.Repository
{
    public class ContractRepository : IContractRepository
    {
        private string mConnStr = "server=localhost;uid=root;pwd=@c3c0M;database=tracksg;max pool size=500;";
        private string mProjName = "FMS-Singapore";
        public IEnumerable<ContractInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<ContractInfo> arrContracts = new List<ContractInfo>();

            if (conn != null)
                conn.Close();

            return arrContracts.ToArray();
        }
        public IEnumerable<ContractInfo> GetContractFiltered(ContractInfo param)
        {
            List<ContractInfo> arrContracts = new List<ContractInfo>();
            ContractInfo currContract = new ContractInfo();

            string query = "SELECT * FROM view_contracts WHERE company_id = @CompanyID";
         
            if (param.AssetID > 0) query += " and asset_id = @AssetID";
            query += " order by timestamp desc";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@CompanyID", param.CompanyID);
                        cmd.Parameters.AddWithValue("@AssetID", param.AssetID);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currContract = DataMgrTools.BuildContracts(reader);
                                    arrContracts.Add(currContract);
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-GetContract", System.Diagnostics.EventLogEntryType.Error);
                }
            }

            return arrContracts;
        }
        public ContractInfo Get(int contractID)
        {
            ContractInfo currContract = new ContractInfo();

            string query = string.Format("SELECT * FROM view_contracts WHERE contract_id = {0}", contractID);

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
                            currContract = DataMgrTools.BuildContracts(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(ContractRepository)", System.Diagnostics.EventLogEntryType.Error);
                }
            }
            return currContract;
        }
        public ContractInfo Add(ContractInfo currContract)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO contracts (timestamp, rx_time, company_id, user_id, asset_id, driver_id, name, contract_no, contract_type_id, " +
                                                                 "invoice_date, contract_start, contract_end, contract_interval, notification_interval, terms_and_conditions, odometer, contract_price, email, phone) " +
                                                         "VALUES (@Timestamp, @RxTime, @CompanyID, @UserID, @AssetID, @DriverID, @Name, @ContractNo, @ContractTypeID, " +
                                                                 "@InvoiceDate, @ContractStart, @ContractEnd, @ContractInterval, @NotificationInterval, @TermsAndConditions, @OdometerAtCreation, @ContractPrice, @Email, @Phone)";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@Timestamp", currContract.Timestamp.AddHours(-8));
                        cmd.Parameters.AddWithValue("@RxTime", DateTime.UtcNow);
                        cmd.Parameters.AddWithValue("@CompanyID", currContract.CompanyID);
                        cmd.Parameters.AddWithValue("@UserID", currContract.UserID);
                        cmd.Parameters.AddWithValue("@AssetID", currContract.AssetID);
                        cmd.Parameters.AddWithValue("@DriverID", currContract.DriverID);
                        cmd.Parameters.AddWithValue("@Name", currContract.Name);
                        cmd.Parameters.AddWithValue("@ContractNo", currContract.ContractNo);
                        cmd.Parameters.AddWithValue("@ContractTypeID", currContract.ContractTypeID);
                        cmd.Parameters.AddWithValue("@InvoiceDate", currContract.InvoiceDate);
                        cmd.Parameters.AddWithValue("@ContractStart", currContract.ContractStart);
                        cmd.Parameters.AddWithValue("@ContractEnd", currContract.ContractEnd);
                        cmd.Parameters.AddWithValue("@ContractInterval", currContract.ContractInterval);
                        cmd.Parameters.AddWithValue("@NotificationInterval", currContract.NotificationInterval);
                        cmd.Parameters.AddWithValue("@TermsAndConditions", currContract.TermsAndConditions);
                        cmd.Parameters.AddWithValue("@OdometerAtCreation", currContract.OdometerAtCreation);
                        cmd.Parameters.AddWithValue("@ContractPrice", currContract.ContractPrice);
                        cmd.Parameters.AddWithValue("@Email", currContract.Email);
                        cmd.Parameters.AddWithValue("@Phone", currContract.Phone);

                        cmd.ExecuteNonQuery();

                        long id = cmd.LastInsertedId;
                        currContract.ContractID = id;

                        conn.Close();
                    }
}
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(ContractRepository)", System.Diagnostics.EventLogEntryType.Error);
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
                    query = string.Format("DELETE FROM contracts WHERE contract_id = {0}", contractID);

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
                    Logger.LogEvent(ex.Message + "-Remove(ContractRepository)", System.Diagnostics.EventLogEntryType.Error);
                }

            }

            return retVal;
        }
        public bool Update(ContractInfo currContract)
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
                        cmd.CommandText = "UPDATE contracts SET timestamp = @Timestamp, rx_time = @RxTime, company_id = @CompanyID, user_id = @UserID, asset_id = @AssetID, driver_id = @DriverID, name = @Name, contract_no = @ContractNo, contract_type_id = @ContractTypeID, " +
                                                               "invoice_date = @InvoiceDate, contract_start = @ContractStart, contract_end = @ContractEnd, contract_interval = @ContractInterval, notification_interval = @NotificationInterval, terms_and_conditions = @TermsAndConditions, odometer = @OdometerAtCreation, contract_price = @ContractPrice, email = @Email, phone = @Phone " +
                                                               "WHERE contract_id = @ContractID";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@Timestamp", currContract.Timestamp.AddHours(-8));
                        cmd.Parameters.AddWithValue("@RxTime", DateTime.UtcNow);
                        cmd.Parameters.AddWithValue("@CompanyID", currContract.CompanyID);
                        cmd.Parameters.AddWithValue("@UserID", currContract.UserID);
                        cmd.Parameters.AddWithValue("@AssetID", currContract.AssetID);
                        cmd.Parameters.AddWithValue("@DriverID", currContract.DriverID);
                        cmd.Parameters.AddWithValue("@Name", currContract.Name);
                        cmd.Parameters.AddWithValue("@ContractNo", currContract.ContractNo);
                        cmd.Parameters.AddWithValue("@ContractTypeID", currContract.ContractTypeID);
                        cmd.Parameters.AddWithValue("@InvoiceDate", currContract.InvoiceDate);
                        cmd.Parameters.AddWithValue("@ContractStart", currContract.ContractStart);
                        cmd.Parameters.AddWithValue("@ContractEnd", currContract.ContractEnd);
                        cmd.Parameters.AddWithValue("@ContractInterval", currContract.ContractInterval);
                        cmd.Parameters.AddWithValue("@NotificationInterval", currContract.NotificationInterval);
                        cmd.Parameters.AddWithValue("@TermsAndConditions", currContract.TermsAndConditions);
                        cmd.Parameters.AddWithValue("@OdometerAtCreation", currContract.OdometerAtCreation);
                        cmd.Parameters.AddWithValue("@ContractPrice", currContract.ContractPrice);
                        cmd.Parameters.AddWithValue("@Email", currContract.Email);
                        cmd.Parameters.AddWithValue("@Phone", currContract.Phone);
                        cmd.Parameters.AddWithValue("@ContractID", currContract.ContractID);

                        if (cmd.ExecuteNonQuery() == 1)
                            retVal = true;
                        else
                            retVal = false;
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Update(ContractRepository)", System.Diagnostics.EventLogEntryType.Error);
                }
            }

            return retVal;
        }
    }
}