using FMSWebApi.Models;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace FMSWebApi.Repository
{
    public class FuelTypeRepository : IFuelTypeRepository
    {
        private string mConnStr = "server=localhost;uid=root;pwd=@c3c0M;database=tracksg;max pool size=500;";
        private string mProjName = "FMS-Singapore";

        public IEnumerable<FuelTypeInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<FuelTypeInfo> arrFuelType = new List<FuelTypeInfo>();

            try
            {
                conn.ConnectionString = mConnStr;
                conn.Open();

                cmd.CommandText = "fuel_type";
                cmd.Connection = conn;
                cmd.CommandType = CommandType.TableDirect;
                MySqlDataReader reader = cmd.ExecuteReader();

                if ((reader != null) && (reader.HasRows))
                {
                    while (reader.Read())
                    {
                        FuelTypeInfo currFuelType = DataMgrTools.BuildFuelType(reader);
                        arrFuelType.Add(currFuelType);
                    }
                }
                conn.Close();
            }
            catch (MySqlException ex)
            {
                Logger.LogEvent(mProjName, ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }

            if (conn != null)
                conn.Close();

            return arrFuelType.ToArray();
        }

    }
}