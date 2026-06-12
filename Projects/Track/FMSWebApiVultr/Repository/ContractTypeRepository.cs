using FMSWebApi.Models;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace FMSWebApi.Repository
{
    public class ContractTypeRepository : IContractTypeRepository
    {
        private string mConnStr = "server=localhost;uid=root;pwd=@c3c0M;database=tracksg;max pool size=500;default command timeout=999999;port=3306;";
        private string mProjName = "FMS-Singapore";

        public IEnumerable<ContractTypeInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<ContractTypeInfo> arrContractType = new List<ContractTypeInfo>();

            try
            {
                conn.ConnectionString = mConnStr;
                conn.Open();

                cmd.CommandText = "contract_type order by name asc";
                cmd.Connection = conn;
                cmd.CommandType = CommandType.TableDirect;
                MySqlDataReader reader = cmd.ExecuteReader();

                if ((reader != null) && (reader.HasRows))
                {
                    while (reader.Read())
                    {
                        ContractTypeInfo currContractType = DataMgrTools.BuildContractType(reader);
                        arrContractType.Add(currContractType);
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

            return arrContractType.ToArray();
        }

    }
}