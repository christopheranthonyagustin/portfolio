using System;
using System.Collections.Generic;
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
            LogEvent(Consts.PROJECT_NAME, strMsg, logType);
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
                string strLog = String.Format("{0}\\WebAPI: {1}", instanceName, strMsg);
                EventLog.WriteEntry(strSource, strLog, logType);
            }
            catch(Exception ex)
            {
                LogToFile("LogEvent: " + ex.Message, "LogEvent.txt");
            }
        }

        /// <summary>
        /// logs string to external file
        /// </summary>
        public static void LogToFile(string strData, string strName)
        {
            try
            {
                // check directory
                string strFile = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, strName);
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
            catch { }
        }
    }
}