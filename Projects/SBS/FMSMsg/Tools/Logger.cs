using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;

namespace HelperTools
{
    public class Logger
    {
        public static void LogToEvent(string msg, EventLogEntryType errorType)
        {
            LogToEvent("SBS", msg, errorType);
        }

        public static void LogToFile(string msg)
        {
            LogToFile("FMS-Logs.txt", msg);
        }

        public static void LogToEvent(string sourceName, string msg, EventLogEntryType errorType)
        {
            string strSource = sourceName;
            string instanceName = System.AppDomain.CurrentDomain.BaseDirectory;
            EventSourceCreationData evtSource = new EventSourceCreationData(strSource, strSource);
            if (!EventLog.SourceExists(strSource))
                EventLog.CreateEventSource(evtSource);

            // check error type
            string strLog = String.Format("{0}: {1}\r\n\"{2}\"", instanceName, strSource, msg);
            EventLog.WriteEntry(strSource, strLog, errorType);
        }

        public static void LogToFile(string filename, string msg)
        {
            // check directory
            string strFile = System.IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, filename);
            string strDir = System.IO.Path.GetDirectoryName(strFile);
            if (!System.IO.Directory.Exists(strDir))
                System.IO.Directory.CreateDirectory(strDir);

            // create error log file
            System.IO.StreamWriter fWriter = new System.IO.StreamWriter(strFile, true);
            if (fWriter != null)
            {
                // log sql command
                fWriter.WriteLine(msg);
                fWriter.Flush();
                fWriter.Close();
            }
        }

        public static void LogToFile(string filename, string msg, bool isDateShow)
        {
            if (isDateShow)
                msg = string.Format("{0}\t{1}", DateTime.Now, msg);
            LogToFile(filename, msg);
        }

    }
}