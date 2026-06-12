using System;
using System.Collections.Generic;
using System.Configuration;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Web;

namespace FMSWebApi
{
    public static class Logger
    {
        public static void LogEvent(string strMsg, EventLogEntryType logType)
        {
            string projName = "SBS";
            LogEvent(projName, strMsg, logType);
        }

        /// <summary>
        /// creates event log for web service
        /// </summary>
        public static void LogEvent(string projName, string strMsg, EventLogEntryType logType)
        {
            try
            {
                // create event source
                string strSource = projName;
                string instanceName = System.AppDomain.CurrentDomain.BaseDirectory;
                EventSourceCreationData evtSource = new EventSourceCreationData(strSource, strSource);
                if (!EventLog.SourceExists(strSource))
                    EventLog.CreateEventSource(evtSource);

                // check error type
                string strLog = String.Format("{0}\\SBS WebAPI: {1}", instanceName, strMsg);
                //string strLog = String.Format("WebAPI: {0}", strMsg);
                EventLog.WriteEntry(strSource, strLog, logType);
            }
            catch(Exception ex)
            {
               // LogEvent("LogEvent: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
        }

        /// <summary>
        /// logs string to external file
        /// </summary>
        public static void LogToFile(string strData, string logFileName)
        {
            try
            {
                // check directory
                string strFile = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, logFileName);
                string strDir = Path.GetDirectoryName(strFile);
                if (!Directory.Exists(strDir))
                    Directory.CreateDirectory(strDir);

                // create error log file
                StreamWriter fWriter = new StreamWriter(strFile, true);
                if (fWriter != null)
                {
                    // log sql command
                    fWriter.WriteLine(strData);
                    fWriter.Flush();
                    fWriter.Close();
                }
            }
            catch(Exception ex)
            {
                LogEvent("LogToFile Error: " + ex.Message, EventLogEntryType.Error);
            }
        }


        /// <summary>
        /// logs sql error to external file
        /// </summary>
        public static string LogError(string strError, string strSql)
        {
            try
            {
                // log event
                string strLog = String.Format("ADSWeb: {0}\r\n\"{1}\"", strError, strSql);
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
                string strLog = String.Format("{0}\\SBS: {1}", instanceName, strEvent);
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