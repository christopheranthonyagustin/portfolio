using FMSWebApi.Models;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace FMSWebApi.Repository
{
    public class TransmissionRepository : ITransmissionRepository
    {
        private string mConnStr = "server=localhost;uid=root;pwd=@c3c0M;database=tracksg;max pool size=500;";
        private string mProjName = "FMS-Singapore";

        public IEnumerable<TransmissionInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<TransmissionInfo> arrTranasmission = new List<TransmissionInfo>();

            try
            {
                conn.ConnectionString = mConnStr;
                conn.Open();

                cmd.CommandText = "transmission";
                cmd.Connection = conn;
                cmd.CommandType = CommandType.TableDirect;
                MySqlDataReader reader = cmd.ExecuteReader();

                if ((reader != null) && (reader.HasRows))
                {
                    while (reader.Read())
                    {
                        TransmissionInfo currTransmission = DataMgrTools.BuildTransmission(reader);
                        arrTranasmission.Add(currTransmission);
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

            return arrTranasmission.ToArray();
        }

    }
}