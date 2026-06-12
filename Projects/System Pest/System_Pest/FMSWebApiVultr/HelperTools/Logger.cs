using System;
using System.Collections.Generic;
using System.Configuration;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Security;
using System.Web;
using System.Web.Services.Description;
using System.Threading.Tasks;

namespace FMSWebApi
{
    public static class Logger
    {
        private static readonly string LogDirectory = @"C:\inetpub\wwwroot\WebApi\SystemPest\logs";

        private static readonly string FallbackLogPath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "App_Logs", "ErrorLog.txt");

        public static void LogEvent(string strMsg, EventLogEntryType logType)
        {
            string projName = "SP";
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
                string strLog = String.Format("{0}\\WebAPI: {1}", instanceName, strMsg);
                EventLog.WriteEntry(strSource, strLog, logType);
            }
            catch (SecurityException)
            {
                LogEvent("Administrator rights required to create event source. Falling back to file logging.", EventLogEntryType.Error);
            }
            catch (Exception ex)
            {
                LogEvent($"Error creating event source: {ex.Message}", EventLogEntryType.Error);
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
                string strLog = String.Format("WlocateWeb: {0}\r\n\"{1}\"", strError, strSql);
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
                string strLog = String.Format("{0}\\FMS: {1}", instanceName, strEvent);
                switch (iType)
                {
                    case 0: EventLog.WriteEntry(strSource, strLog, EventLogEntryType.Information); break;
                    case 1: EventLog.WriteEntry(strSource, strLog, EventLogEntryType.Warning); break;
                    case 2: EventLog.WriteEntry(strSource, strLog, EventLogEntryType.Error); break;
                }
            }
            catch { }
        }


        public static async Task LogDailyAsync(string message, EventLogEntryType type)
        {
            try
            {
                // Ensure directory exists
                if (!Directory.Exists(LogDirectory))
                    Directory.CreateDirectory(LogDirectory);

                // File name based on today's date
                string fileName = $"{DateTime.Now:yyyyMMdd}.log";
                string fullPath = Path.Combine(LogDirectory, fileName);

                string logEntry = $"[{DateTime.Now:yyyy-MM-dd HH:mm:ss}] [{type}] {message}";

                // Append the log entry asynchronously
                using (StreamWriter writer = new StreamWriter(fullPath, true))
                {
                    await writer.WriteLineAsync(logEntry);
                }
            }
            catch (Exception ex)
            {
                // In case logging fails, fallback to EventLog
                EventLogEntryType logType = EventLogEntryType.Error;
                EventLog.WriteEntry("SystemPestLogger", $"Failed to write daily log: {ex.Message}", logType);
            }
        }

        public static void LogDaily(string message, EventLogEntryType type)
        {
            try
            {
                // Ensure directory exists
                if (!Directory.Exists(LogDirectory))
                    Directory.CreateDirectory(LogDirectory);

                // File name based on today's date
                string fileName = $"{DateTime.Now:yyyyMMdd}.log";
                string fullPath = Path.Combine(LogDirectory, fileName);

                string logEntry = $"[{DateTime.Now:yyyy-MM-dd HH:mm:ss}] [{type}] {message}";

                // Append the log entry asynchronously
                using (StreamWriter writer = new StreamWriter(fullPath, true))
                {
                    writer.WriteLineAsync(logEntry);
                }
            }
            catch (Exception ex)
            {
                // In case logging fails, fallback to EventLog
                EventLogEntryType logType = EventLogEntryType.Error;
                EventLog.WriteEntry("SystemPestLogger", $"Failed to write daily log: {ex.Message}", logType);
            }
        }

    }
}