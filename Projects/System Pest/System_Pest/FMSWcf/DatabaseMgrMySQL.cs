using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using Microsoft.SqlServer.Types;
using MySql.Data.MySqlClient;

namespace WlocateWeb
{
    public class DatabaseMgrMySQL
    {
        private MySqlConnection m_sqlConnection;
        private MySqlCommand m_sqlCommand = new MySqlCommand();

        /// <summary>
        /// database handler constructor
        /// </summary>
        public DatabaseMgrMySQL()
        {
            // create database connection
            string strConnection = ConfigurationManager.AppSettings["ConnectionString"];
            m_sqlConnection = new MySqlConnection(strConnection);
        }

        /// <summary>
        /// database handler constructor
        /// </summary>
        public DatabaseMgrMySQL(string strConnection)
        {
            // create database connection
            m_sqlConnection = new MySqlConnection(strConnection);
        }

        /// <summary>
        /// opens database connection
        /// </summary>
        public bool Open()
        {
            // check connection state
            if (IsOpen()) return true;
            try
            {
                // open database
                m_sqlConnection.Open();
                m_sqlCommand.Connection = m_sqlConnection;

                // verify connection state
                if (m_sqlConnection.State == ConnectionState.Open)
                    return true;
                else
                {
                    // open secondary connection
                    m_sqlConnection = new MySqlConnection(ConfigurationManager.AppSettings["ConnectionString2"]);
                    return Open();
                }
            }
            catch (Exception ex)
            {
                // log error
                LogError(ex.Message.ToString(), "Open");
            }
            return false;
        }

        /// <summary>
        /// reads an object data from the database
        /// </summary>
        public object ExecuteScalar(string strSql) { return ExecuteScalar(strSql, null); }
        public object ExecuteScalar(string strSql, object[] arrValues)
        {
            object objData = null;
            string strParams = "";
            try
            {
                // initialize sql command
                strParams = LoadParameters(strSql, arrValues);
                if (!IsOpen()) Open();

                // run query
                objData = m_sqlCommand.ExecuteScalar();
            }
            catch (Exception ex)
            {
                // log error
                LogError(ex.Message, String.Format("{0}\r{1}", strSql, strParams).Trim());
            }
            return objData;
        }

        /// <summary>
        /// counts record from the database
        /// </summary>
        public int Count(string strSql) { return Count(strSql, null); }
        public int Count(string strSql, object[] arrValues)
        {
            int iCount = 0;
            try
            {
                // run query
                object objData = ExecuteScalar(strSql, arrValues);
                if (objData != null) iCount = Convert.ToInt32(objData);
            }
            catch (Exception ex)
            {
                // log error
                LogError(ex.Message, strSql);
            }
            return iCount;
        }

        /// <summary>
        /// checks if a record already exists in the database
        /// </summary>
        public bool Exists(string strSql) { return Exists(strSql, null); }
        public bool Exists(string strSql, object[] arrValues) { return (ExecuteScalar(strSql, arrValues) != null); }

        /// <summary>
        /// reads a set of data from the database
        /// </summary>
        public DbDataReader ExecuteReader(string strSql) { return ExecuteReader(strSql, null); }
        public DbDataReader ExecuteReader(string strSql, object[] arrValues)
        {
            DbDataReader dbReader = null;
            string strParams = "";
            try
            {
                // initialize sql command
                strParams = LoadParameters(strSql, arrValues);
                if (!IsOpen()) Open();

                // run query
                dbReader = m_sqlCommand.ExecuteReader();
            }
            catch (Exception ex)
            {
                // log error
                LogError(ex.Message, String.Format("{0}\r{1}", strSql, strParams));
            }
            return dbReader;
        }

        /// <summary>
        /// executes a non-query SQL statement
        /// </summary>
        public int ExecuteNonQuery(string strSql) { return ExecuteNonQuery(strSql, null); }
        public int ExecuteNonQuery(string strSql, object[] arrValues)
        {
            int iRet = 0;
            string strParams = "";
            try
            {
                // initialize sql command
                strParams = LoadParameters(strSql, arrValues);
                if (!IsOpen()) Open();

                // run query
                iRet = m_sqlCommand.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                // log error
                LogError(ex.Message, String.Format("{0}\r{1}", strSql, strParams));
            }
            return iRet;
        }

        /// <summary>
        /// loads the sql parameters
        /// </summary>
        /// <param name="strSql"></param>
        /// <param name="arrValues"></param>
        private string LoadParameters(string strSql, object[] arrValues)
        {
            string strParams = "";
            try
            {
                // initialize sql command
                m_sqlCommand.CommandText = strSql;
                m_sqlCommand.Parameters.Clear();

                // check parameters
                if (arrValues != null)
                {
                    // parse sql statement
                    List<string> arrParams = new List<string>();
                    int i = -1;
                    do
                    {
                        // check parameter
                        i = strSql.IndexOf("@", i + 1);
                        if (i > -1)
                        {
                            // get parameter name
                            string strParam = "@";
                            for (int j = i + 1; j < strSql.Length; j++)
                            {
                                // check if alphanumeric
                                if (Char.IsLetterOrDigit(strSql, j))
                                    strParam += strSql.Substring(j, 1);
                                else break;
                            }

                            // add parameter to list
                            arrParams.Add(strParam);
                        }
                    }
                    while (i > -1);

                    // loop through parameters
                    for (i = 0; i < arrParams.Count; i++)
                    {
                        // check parameter value
                        if (arrValues.Length > i)
                        {
                            // check if geography
                            object objValue = (arrValues[i] == null ? "" : arrValues[i]);
                            if (objValue.ToString().StartsWith("geography::"))
                            {
                                try
                                {
                                    // parse geography string
                                    string strGeo = objValue.ToString();
                                    strGeo = strGeo.Substring(strGeo.IndexOf("(") + 1);
                                    strGeo = strGeo.Substring(0, strGeo.IndexOf(")"));
                                    string[] arrGeo = strGeo.Split(",".ToCharArray());

                                    // check type
                                    if (objValue.ToString().Contains("Point") && (arrGeo.Length > 1))
                                    {
                                        // build geography parameter
                                        SqlGeographyBuilder sqlGeoBuilder = new SqlGeographyBuilder();
                                        sqlGeoBuilder.SetSrid(4326);
                                        sqlGeoBuilder.BeginGeography(OpenGisGeographyType.Point);
                                        sqlGeoBuilder.BeginFigure(Convert.ToDouble(arrGeo[0].Trim()), Convert.ToDouble(arrGeo[1].Trim()));
                                        sqlGeoBuilder.EndFigure();
                                        sqlGeoBuilder.EndGeography();

                                        // create geography parameter
                                        SqlGeography sqlGeo = sqlGeoBuilder.ConstructedGeography;
                                        SqlParameter sqlParam = new SqlParameter(arrParams[i], sqlGeo);
                                        sqlParam.Direction = ParameterDirection.Input;
                                        sqlParam.SqlDbType = SqlDbType.Udt;
                                        sqlParam.UdtTypeName = "GEOGRAPHY";

                                        // add parameter
                                        m_sqlCommand.Parameters.Add(sqlParam);
                                        strParams += String.Format("\"{0}={1}\",", arrParams[i], sqlGeo.ToString());
                                    }
                                    continue;
                                }
                                catch { }
                            }

                            // add parameter
                            m_sqlCommand.Parameters.AddWithValue(arrParams[i], objValue);
                            strParams += String.Format("\"{0}={1}\",", arrParams[i], objValue);
                        }
                    }
                }
            }
            catch { }
            return strParams.Trim("\r".ToCharArray());
        }

        /// <summary>
        /// checks the connection state
        /// </summary>
        public bool IsOpen()
        {
            // verify connection state
            return (m_sqlConnection.State == ConnectionState.Open);
        }

        /// <summary>
        /// closes the database connection
        /// </summary>
        public bool Close()
        {
            try
            {
                // close database
                m_sqlConnection.Close();
                if (m_sqlConnection.State == ConnectionState.Closed)
                    return true;
            }
            catch (Exception ex)
            {
                // log error
                LogError(ex.Message.ToString(), "Close");
            }
            return false;
        }

        /// <summary>
        /// logs sql error to external file
        /// </summary>
        public static string LogError(string strError, string strSource, string strSql)
        {
            try
            {
                // log event
                string strLog = String.Format("Track.{0}: {1}\r\n\"{2}\"", strSource, strError, strSql);
                LogEvent(strLog, 2);
            }
            catch { }
            return strError;
        }

        /// <summary>
        /// logs sql error to external file
        /// </summary>
        public static string LogError(string strError, string strSql)
        {
            try
            {
                // log event
                string strLog = String.Format("Track: {0}\r\n\"{1}\"", strError, strSql);
                LogEvent(strLog, 2);
            }
            catch { }
            return strError;
        }

        /// <summary>
        /// creates event log for web service
        /// </summary>
        public static void LogEvent(string strEvent, int iType)
        {
            try
            {
                // create event source
                string strSource = ConfigurationManager.AppSettings["ProjectName"];
                string instanceName = System.AppDomain.CurrentDomain.BaseDirectory;
                EventSourceCreationData evtSource = new EventSourceCreationData(strSource, strSource);
                if (!EventLog.SourceExists(strSource))
                    EventLog.CreateEventSource(evtSource);

                // check error type
                string strLog = String.Format("{0}\\TRACKWeb: {1}", instanceName, strEvent);
                switch (iType)
                {
                case 0: EventLog.WriteEntry(strSource, strLog, EventLogEntryType.Information); break;
                case 1: EventLog.WriteEntry(strSource, strLog, EventLogEntryType.Warning); break;
                case 2: EventLog.WriteEntry(strSource, strLog, EventLogEntryType.Error); break;
                }
            }
            catch { }
        }
    }
}
