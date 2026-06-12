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
    public class LanguageRepository : ILanguageRepository
    {
        private string mConnStr = Settings.Default.DB;
        private string mProjName = "SBS";
        public IEnumerable<LanguageInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<LanguageInfo> arrAssets = new List<LanguageInfo>();

            try
            {
                conn.ConnectionString = mConnStr;
                conn.Open();

                cmd.CommandText = "languages";
                cmd.Connection = conn;
                cmd.CommandType = CommandType.TableDirect;
                MySqlDataReader reader = cmd.ExecuteReader();

                //Console.WriteLine(String.Format("Total Data: {0}", dbRdr.FieldCount));

                if ((reader != null) && (reader.HasRows))
                {
                    while (reader.Read())
                    {
                        LanguageInfo currAsset = DataMgrTools.BuildLanguage(reader);
                        arrAssets.Add(currAsset);
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

            return arrAssets.ToArray();
        }


        public LanguageInfo Get(int languageID)
        {
            LanguageInfo currAsset = new LanguageInfo();
            string query = string.Format("SELECT * FROM languages WHERE language_id = {0}", languageID);

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
                            currAsset = DataMgrTools.BuildLanguage(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    conn.Close();
                }
            }
            return currAsset;
        }


        public LanguageInfo GetByLanguage(string langName)
        {

            LanguageInfo currLanguage = new LanguageInfo();
            string query = string.Format("SELECT * FROM languages WHERE name = @Language");

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
                        cmd.Parameters.AddWithValue("@Language", langName);
                        MySqlDataReader reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            currLanguage = DataMgrTools.BuildLanguage(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-GetByLanguage(LanguageRepository)", System.Diagnostics.EventLogEntryType.Error);
                    conn.Close();
                }
            }
            return currLanguage;
        }

        public LanguageInfo Add(LanguageInfo currLanguage)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;


                        Logger.LogEvent("Entered Repository: " + currLanguage.Name, System.Diagnostics.EventLogEntryType.Information);//testing

                        cmd.CommandText = "INSERT INTO languages (name, culture) " +
                            "VALUES (@Name, @Culture)";
                        cmd.Prepare();
                        //cmd.Parameters.AddWithValue("@LanguageID", currLanguage.LanguageID);
                        cmd.Parameters.AddWithValue("@Name", currLanguage.Name);
                        cmd.Parameters.AddWithValue("@Culture", currLanguage.Culture);
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(LanguageInfo)", System.Diagnostics.EventLogEntryType.Error);
            }

            return currLanguage;
        }

        public bool Remove(int languageID)
        {
            bool retVal = false;
            string query = string.Format("DELETE FROM languages WHERE language_id = {0}", languageID);

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        if (cmd.ExecuteNonQuery() == 1)
                            retVal = true;
                        else
                            retVal = false;
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Remove(LanguageRepository)", System.Diagnostics.EventLogEntryType.Error);
                    conn.Close();
                }
            }

            return retVal;
        }

        public bool Update(LanguageInfo currLanguage)
        {
            bool retVal = false;
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    try
                    {
                        using (MySqlCommand cmd = new MySqlCommand())
                        {
                            conn.Open();
                            cmd.Connection = conn;
                            cmd.CommandText = "UPDATE languages SET language_id = @LanguageID, name = @Name, culture = @Culture" +
                                                    "WHERE language_id = @LanguageID";
                            cmd.Prepare();
                            cmd.Parameters.AddWithValue("@LanguageID", currLanguage.LanguageID);
                            cmd.Parameters.AddWithValue("@Name", currLanguage.Name);
                            cmd.Parameters.AddWithValue("@Culture", currLanguage.Culture);

                            if (cmd.ExecuteNonQuery() == 1)
                                retVal = true;
                            else
                                retVal = false;
                            conn.Close();
                        }
                    }
                    catch (Exception ex)
                    {
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Update(LanguageRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }
    }
}