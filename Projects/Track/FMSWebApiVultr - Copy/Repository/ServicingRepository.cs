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
    public class ServicingRepository : IServicingRepository
    {
        private string mConnStr = Settings.Default.DB;
        private string mProjName = "FMS-Singapore";
        public IEnumerable<ServicingInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<ServicingInfo> arrServices = new List<ServicingInfo>();

            if (conn != null)
                conn.Close();

            return arrServices.ToArray();
        }
        public IEnumerable<ServicingInfo> GetByCompany(ServicingInfo param)
        {
            List<ServicingInfo> arrServices = new List<ServicingInfo>();
            ServicingInfo currService = new ServicingInfo();

            string query = "SELECT * FROM view_servicing WHERE company_id = @CompanyID";

            if (param.Timestamp != DateTime.MinValue && param.RxTime != DateTime.MinValue) query += " and timestamp between @StartTS and @EndTS";
            if (param.DriverID > 0) query += " and driver_id = @DriverID";
            if (param.Platform == 1) { query += " and platform = @Platform"; }
            else if (param.Platform == 2) { query += " and platform = @Platform"; }
            else { query += " and platform >= @Platform"; }
            if (param.Flag > 0) query += " and flag = @Flag";

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
                        cmd.Parameters.AddWithValue("@DriverID", param.DriverID);
                        cmd.Parameters.AddWithValue("@Platform", param.Platform);
                        cmd.Parameters.AddWithValue("@Flag", param.Flag);
                        if (param.Timestamp != DateTime.MinValue && param.RxTime != DateTime.MinValue) cmd.Parameters.AddWithValue("@StartTS", param.Timestamp.AddHours(-8));
                        if (param.Timestamp != DateTime.MinValue && param.RxTime != DateTime.MinValue) cmd.Parameters.AddWithValue("@EndTS", param.RxTime.AddHours(-8));

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currService = DataMgrTools.BuildService(reader);
                                    arrServices.Add(currService);
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-GetServicing(ByCompany)", System.Diagnostics.EventLogEntryType.Error);

                }
            }

            return arrServices;
        }
        public IEnumerable<ServicingInfo> GetServiceAsset(ServicingInfo param)
        {
            List<ServicingInfo> arrServices = new List<ServicingInfo>();
            ServicingInfo currService = new ServicingInfo();

            string query = "SELECT * FROM view_servicing WHERE company_id = @CompanyID";
         
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
                                    currService = DataMgrTools.BuildService(reader);
                                    arrServices.Add(currService);
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-GetServicing(ByAsset)", System.Diagnostics.EventLogEntryType.Error);
                }
            }

            return arrServices;
        }
        public ServicingInfo Get(int serviceID)
        {
            ServicingInfo currService = new ServicingInfo();

            string query = string.Format("SELECT * FROM view_servicing WHERE service_id = {0}", serviceID);

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
                            currService = DataMgrTools.BuildService(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(ServicingRepository)", System.Diagnostics.EventLogEntryType.Error);
                }
            }
            return currService;
        }
        public ServicingInfo Add(ServicingInfo currService)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO servicing (company, company_id, asset_id, driver_id, service_type_id, timestamp, rx_time, invoice, odometer, price, address, remarks, platform, flag) " +
                                                    "VALUES (@CompanyName, @CompanyID, @AssetID, @DriverID, @ServiceTypeID, @Timestamp, @RxTime, @Invoice, @Odometer, @Price, @Address, @Remarks, @Platform , @Flag)";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@CompanyName", currService.CompanyName);
                        cmd.Parameters.AddWithValue("@CompanyID", currService.CompanyID);
                        cmd.Parameters.AddWithValue("@AssetID", currService.AssetID);
                        cmd.Parameters.AddWithValue("@DriverID", currService.DriverID);
                        cmd.Parameters.AddWithValue("@ServiceTypeID", currService.ServiceTypeID);
                        cmd.Parameters.AddWithValue("@Timestamp", currService.Timestamp.AddHours(-8));
                        cmd.Parameters.AddWithValue("@RxTime", DateTime.UtcNow);
                        cmd.Parameters.AddWithValue("@Invoice", currService.Invoice);
                        cmd.Parameters.AddWithValue("@Odometer", currService.Odometer);
                        cmd.Parameters.AddWithValue("@Price", currService.Price);
                        cmd.Parameters.AddWithValue("@Address", currService.Address);
                        cmd.Parameters.AddWithValue("@Remarks", currService.Remarks);
                        cmd.Parameters.AddWithValue("@Platform", currService.Platform);
                        cmd.Parameters.AddWithValue("@Flag", currService.Flag);
                        cmd.ExecuteNonQuery();

                        long id = cmd.LastInsertedId;
                        currService.ServiceID = id;

                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(ServicingRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return currService;
        }
        public bool Remove(int serviceID)
        {
            bool retVal = false;
            string query = "";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    query = string.Format("DELETE FROM servicing WHERE service_id = {0}", serviceID);

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
                    Logger.LogEvent(ex.Message + "-Remove(ServicingRepository)", System.Diagnostics.EventLogEntryType.Error);
                }

            }

            return retVal;
        }
        public bool Update(ServicingInfo currService)
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
                        cmd.CommandText = "UPDATE servicing SET company = @CompanyName, company_id = @CompanyID, asset_id = @AssetID, driver_id = @DriverID, service_type_id = @ServiceTypeID, timestamp = @Timestamp, rx_time = @RxTime, invoice = @Invoice, odometer = @Odometer, price = @Price, address = @Address, remarks = @Remarks, platform = @Platform, flag = @Flag" +
                                                " WHERE service_id = @ServiceID";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@CompanyName", currService.CompanyName);
                        cmd.Parameters.AddWithValue("@CompanyID", currService.CompanyID);
                        cmd.Parameters.AddWithValue("@AssetID", currService.AssetID);
                        cmd.Parameters.AddWithValue("@DriverID", currService.DriverID);
                        cmd.Parameters.AddWithValue("@ServiceTypeID", currService.ServiceTypeID);
                        cmd.Parameters.AddWithValue("@Timestamp", currService.Timestamp);
                        cmd.Parameters.AddWithValue("@RxTime", currService.RxTime);
                        cmd.Parameters.AddWithValue("@Invoice", currService.Invoice);
                        cmd.Parameters.AddWithValue("@Odometer", currService.Odometer);
                        cmd.Parameters.AddWithValue("@Price", currService.Price);
                        cmd.Parameters.AddWithValue("@Address", currService.Address);
                        cmd.Parameters.AddWithValue("@Remarks", currService.Remarks);
                        cmd.Parameters.AddWithValue("@Platform", currService.Platform);
                        cmd.Parameters.AddWithValue("@Flag", currService.Flag);
                        cmd.Parameters.AddWithValue("@ServiceID", currService.ServiceID);

                        if (cmd.ExecuteNonQuery() == 1)
                            retVal = true;
                        else
                            retVal = false;
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Update(ServicingRepository)", System.Diagnostics.EventLogEntryType.Error);
                }
            }

            return retVal;
        }
    }
}