using FMSWebApi.Models;
using MySqlConnector;
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
        private string mConnStr = "server=127.0.0.1;uid=root;pwd=@c3c0M;database=sp;max pool size=500;SSL Mode=None;";
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

                cmd.CommandText = "SELECT * FROM recommendations";
                cmd.Connection = conn;
                cmd.CommandType = CommandType.Text;
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
        public IEnumerable<RecommendationsInfo> GetAllEx()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            List<RecommendationsInfo> arrRecommendations = new List<RecommendationsInfo>();


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
            RecommendationsInfo currRecommendation = new RecommendationsInfo();
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
                        //cmd.Prepare();
                        cmd.Parameters.AddWithValue("@Recommendation", recommendation.Trim());
                        MySqlDataReader reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            currRecommendation = DataMgrTools.BuildRecommendations(reader);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-GetByName(RecommendationRepository)", System.Diagnostics.EventLogEntryType.Error);
                }
            }
            return currRecommendation;
        }
        public IEnumerable<RecommendationsInfo> GetByRecommendationName(RecommendationsInfo param)
        {
            List<RecommendationsInfo> arrRecommendations = new List<RecommendationsInfo>();
            RecommendationsInfo currRecommendation = new RecommendationsInfo();
            object objTemp = new object();

            string query = "SELECT * FROM recommendations WHERE recommendation = @Recommendation";

            using (MySqlConnection conn = new MySqlConnection(mConnStr))
            {

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        //cmd.Prepare();
                        cmd.Parameters.AddWithValue("@Recommendation", param.Recommendation);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if ((reader != null) && (reader.HasRows))
                            {
                                while (reader.Read())
                                {
                                    currRecommendation = DataMgrTools.BuildRecommendations(reader);
                                    arrRecommendations.Add(currRecommendation);
                                }
                            }
                        }

                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Logger.LogEvent(ex.Message + "-Get(GetByRecommendationName)", System.Diagnostics.EventLogEntryType.Error);

                }


            }

            return arrRecommendations;
        }

        public RecommendationsInfo Add(RecommendationsInfo currRecommendation)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = "INSERT INTO recommendations (recommendations_id, recommendation) " +
                            "VALUES (@RecommendationsID, @Recommendation)";
                        //cmd.Prepare();
                        cmd.Parameters.AddWithValue("@RecommendationsID", currRecommendation.RecommendationsID);
                        cmd.Parameters.AddWithValue("@Recommendation", currRecommendation.Recommendation);
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Add(RecommendationRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return currRecommendation;
        }

        public bool Remove(int recommendationID)
        {
            bool retVal = false;
            string query = string.Format("DELETE FROM recommendations WHERE recommendations_id = {0}", recommendationID);

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
                    Logger.LogEvent(ex.Message + "-Remove(RecommendationRepository)", System.Diagnostics.EventLogEntryType.Error);
                }
            }

            return retVal;
        }

        public bool Update(RecommendationsInfo currRecommendation)
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
                        cmd.CommandText = "UPDATE recommendations SET recommendations_id = @RecommendationsID, recommendation = @Recommendation" +
                                          " WHERE recommendations_id = @RecommendationsID";
                        //cmd.Prepare();
                        cmd.Parameters.AddWithValue("@RecommendationsID", currRecommendation.RecommendationsID);
                        cmd.Parameters.AddWithValue("@Recommendation", currRecommendation.Recommendation);

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
                Logger.LogEvent(ex.Message + "-Update(TreatmentRepository)", System.Diagnostics.EventLogEntryType.Error);
            }

            return retVal;
        }

    }
}