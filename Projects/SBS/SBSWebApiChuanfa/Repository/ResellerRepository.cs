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
    public class ResellerRepository : IResellerRepository
    {
        //private string mConnStr = "server=localhost;uid=root;pwd=$B$Transit888;database=adas;charset=utf8;max pool size=500;default command timeout=999;";
        private string mConnStr = "server=localhost;uid=root;pwd=$B$Transit888;database=adas;charset=utf8;max pool size=500;default command timeout=99999;";
        private string mProjName = "SBS";
        public IEnumerable<ResellerInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<ResellerInfo> arrReseller = new List<ResellerInfo>();

            try
            {
                conn.ConnectionString = mConnStr;
                conn.Open();

                cmd.CommandText = "reseller WHERE reseller_id != 0";
                cmd.Connection = conn;
                cmd.CommandType = CommandType.TableDirect;
                MySqlDataReader reader = cmd.ExecuteReader();

                //Console.WriteLine(String.Format("Total Data: {0}", dbRdr.FieldCount));

                if ((reader != null) && (reader.HasRows))
                {
                    while (reader.Read())
                    {
                        ResellerInfo currReseller = DataMgrTools.BuildReseller(reader);
                        arrReseller.Add(currReseller);
                    }
                }
                conn.Close();
            }
            catch (MySqlException ex)
            {
                Logger.LogEvent(ex.Message + "-GetAll(ResellerRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            if (conn != null)
                conn.Close();

            return arrReseller.ToArray();
        }
        public IEnumerable<ResellerInfo> GetByResellerID(ResellerInfo param)
        {

            List<ResellerInfo> arrReseller = new List<ResellerInfo>();
            ResellerInfo currReseller = new ResellerInfo();
            object objTemp = new object();

            //string query = "";

            string query = "SELECT * FROM reseller WHERE reseller_id = @ResellerID AND reseller_id != 0";


            Logger.LogEvent("GetQuery Reseller Repository: " + query, System.Diagnostics.EventLogEntryType.Information);//TESTING

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@ResellerID", param.ResellerID);
                        cmd.Parameters.AddWithValue("@Reseller", param.Name);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currReseller = DataMgrTools.BuildReseller(reader);
                                    arrReseller.Add(currReseller);
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(GetByResellerID)", System.Diagnostics.EventLogEntryType.Error);

                }


            }

            return arrReseller;
        }

        public ResellerInfo GetByName(string resellerName)
        {
            ResellerInfo currReseller = new ResellerInfo();

            if (string.IsNullOrEmpty(resellerName))
            {
                currReseller.ErrorMessage = Consts.ERR_RESELLERERROR;
                return currReseller;
            }

            string query = string.Format("SELECT * FROM reseller WHERE name = @Reseller");

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
                        cmd.Parameters.AddWithValue("@Reseller", resellerName.Trim());
                        MySqlDataReader reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            currReseller = DataMgrTools.BuildReseller(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-GetByName(ResellerRepository)", System.Diagnostics.EventLogEntryType.Error);
                    conn.Close();
                }
            }
            return currReseller;
        }

        public ResellerInfo Get(int id)
        {
            ResellerInfo currReseller = new ResellerInfo();
            string query = string.Format("SELECT * FROM reseller WHERE reseller_id = {0}", id);
            
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        MySqlDataReader reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            currReseller = DataMgrTools.BuildReseller(reader);
                        }
                        
                    }
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Get(ResellerRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return currReseller;
        }

        /// <summary>
        /// gets reseller id
        /// </summary>
        /// <param name="strReseller"></param>
        /// <returns></returns>
        public int GetResellerID(string strReseller)
        {
            int iResellerID = 0;
            string query = "";
            try
            {
                // check reseller name
                if ((strReseller == null) || (strReseller == ""))
                    return 0;

                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {

                        conn.Open();
                        MySqlDataReader reader = cmd.ExecuteReader();   
                        // get reseller id                    
                        query = string.Format("SELECT reseller_id FROM reseller WHERE name = @Reseller");
                        cmd.CommandText = query;
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@Reseller", strReseller);

                        object objTemp = cmd.ExecuteScalar();
                        if (objTemp != null) iResellerID = Convert.ToInt32(objTemp);
                        else
                        {
                            // save new reseller                        
                            query = string.Format("INSERT INTO reseller (name, flag, address, email, phone) " +
                                "VALUES (@Reseller, @Flag, @Address, @Email, @Phone)", strReseller);
                            cmd.CommandText = query;
                            cmd.Prepare();
                            cmd.Parameters.AddWithValue("@Reseller", strReseller);
                            objTemp = cmd.ExecuteScalar();

                            if (objTemp != null) iResellerID = Convert.ToInt32(objTemp);
                        }

                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                Logger.LogError(ex.Message, "GetResellerID");
            }
            return iResellerID;
        }

        public ResellerInfo Add(ResellerInfo currReseller)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO reseller (name, flag, address, email, phone) " +
                            "VALUES (@Name, @Flag, @Address, @Email, @Phone)";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@Name", currReseller.Name);
                        cmd.Parameters.AddWithValue("@Flag", (int)currReseller.Flag);
                        cmd.Parameters.AddWithValue("@Address", currReseller.Address);
                        cmd.Parameters.AddWithValue("@Email", currReseller.Email);
                        cmd.Parameters.AddWithValue("@Phone", currReseller.Phone);      
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(ResellerRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return currReseller;
        }

        public bool Remove(int resellerID)
        {
            bool retVal = false;
            string query = string.Format("DELETE FROM reseller WHERE reseller_id = {0}", resellerID);
            
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
                Logger.LogEvent(ex.Message + "-Remove(ResellerRepository)", System.Diagnostics.EventLogEntryType.Error);                
            }

            return retVal;
        }

        public bool Update(ResellerInfo currReseller)
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
                        cmd.CommandText = "UPDATE reseller SET name = @Name, flag = @Flag, address = @Address, email = @Email, phone = @Phone WHERE reseller_id = @ResellerID";
                        cmd.Prepare();
                        cmd.Parameters.AddWithValue("@Name", currReseller.Name);
                        cmd.Parameters.AddWithValue("@Flag", (int)currReseller.Flag);
                        cmd.Parameters.AddWithValue("@Address", currReseller.Address);
                        cmd.Parameters.AddWithValue("@Email", currReseller.Email);
                        cmd.Parameters.AddWithValue("@Phone", currReseller.Phone);
                        cmd.Parameters.AddWithValue("@ResellerID", currReseller.ResellerID);  

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
                Logger.LogEvent(ex.Message + "-Update(ResellerRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }

        
    }
}