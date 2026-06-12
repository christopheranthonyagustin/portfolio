using FMSWebApi.Models;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace FMSWebApi.Repository
{
    public class RecommendationsRepository : IRecommendationsRepository
    {
        //private string mConnStr = "server=127.0.0.1;uid=root;pwd=12345;database=test;";
        private string mConnStr = "server=localhost;uid=root;pwd=@c3c0M;database=sp;max pool size=500;";
        private string mProjName = "SP";
        public IEnumerable<RecommendationsInfo> GetAll()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<RecommendationsInfo> arrRecommendations = new List<RecommendationsInfo>();

            try
            {
                conn.ConnectionString = mConnStr;
                conn.Open();

                cmd.CommandText = "recommendations";
                cmd.Connection = conn;
                cmd.CommandType = CommandType.TableDirect;
                MySqlDataReader reader = cmd.ExecuteReader();

                //Console.WriteLine(String.Format("Total Data: {0}", dbRdr.FieldCount));

                if ((reader != null) && (reader.HasRows))
                {
                    while (reader.Read())
                    {
                        RecommendationsInfo currRecommendations = DataMgrTools.BuildRecommendations(reader);
                        arrRecommendations.Add(currRecommendations);
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

            return arrRecommendations.ToArray();
        }

        public RecommendationsInfo Get(int recommendationID)
        {
            RecommendationsInfo currRecommendations = new RecommendationsInfo();
            string query = string.Format("SELECT * FROM recommendations WHERE recommendations_id = {0}", recommendationID);

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
                            currRecommendations = DataMgrTools.BuildRecommendations(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(RecommendationsRepository)", System.Diagnostics.EventLogEntryType.Error);
                    conn.Close();
                }
            }
            return currRecommendations;
        }

        public RecommendationsInfo GetByName(string recommendation)
        {
            RecommendationsInfo currRecommendations = new RecommendationsInfo();
            string query = string.Format("SELECT * FROM recommendations WHERE recommendation = @Recommendation");

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
                        cmd.Parameters.AddWithValue("@Recommendation", recommendation.Trim());
                        MySqlDataReader reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            currRecommendations = DataMgrTools.BuildRecommendations(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-GetByName(RecommendationRepository)", System.Diagnostics.EventLogEntryType.Error);
                    //conn.Close();
                }
            }
            return currRecommendations;
        }

    }
}