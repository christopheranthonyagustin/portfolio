using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Globalization;

namespace FMSWinSvc
{
    public class BUC
    {
        /// <summary>
        /// converts string to datetime
        /// </summary>
        /// <param name="strTimestamp"></param>
        /// <returns></returns>
        public static DateTime ParseTime10(string strTimestamp, string strSeconds)
        {
            try
            {
                // parse timestamp
                // 4 4 10 09 05
                string strDate = String.Format("{1}/{2}/{0}", 2010 + Convert.ToInt32(strTimestamp.Substring(0, 1), 16),
                    Convert.ToInt32(strTimestamp.Substring(1, 1), 16), Convert.ToInt32(strTimestamp.Substring(2, 2), 16));
                string strTime = String.Format("{0}:{1}:{2}", Convert.ToInt32(strTimestamp.Substring(4, 2), 16),
                    Convert.ToInt32(strTimestamp.Substring(6, 2), 16), Convert.ToInt32(strSeconds, 16));
                return DateTime.Parse(String.Format("{0} {1}", strDate, strTime), CultureInfo.CreateSpecificCulture("en-US"));
            }
            catch { }
            return new DateTime(2000, 1, 1, 0, 0, 0);
        }

        /// <summary>
        /// converts dms string to lat-long
        /// </summary>
        /// <param name="strDms"></param>
        /// <returns></returns>
        public static double ParseLatLong10(string strDms)
        {
            // 00 01 D8 64 = 120932
            // 1.20932 = 1.3488666666666667
            // convert coordinate to decimal degrees
            strDms = Convert.ToInt32(strDms, 16).ToString();
            double lDegree = Math.Truncate(Convert.ToDouble(strDms) / 100000);
            double lMinutes = Convert.ToDouble(strDms.Substring(strDms.Length - 5)) / 1000;
            return lDegree + (lMinutes / 60);
        }

        public static string GetDeviceID(string strData)
        {
            string retResult = "";

            if (string.IsNullOrEmpty(strData))
                return retResult;

            
            // check if sce ion200 protocol
            if (strData.Substring(1, 2) == "00")
            {
                if (strData.Length >= 19)
                    retResult = strData.Substring(3, 16);
            }
            else
            {
                // parse device info if sce ion300
                string[] arrData = strData.Split("|".ToCharArray());
                if (arrData.Length > 1)
                {
                    // update raw data
                    retResult = arrData[1].Trim();
                }
            }

            return retResult;
        }

        /// <summary>
        /// converts string to datetime
        /// </summary>
        /// <param name="strTimestamp"></param>
        /// <returns></returns>
        public static DateTime ParseTime11(string strTimestamp)
        {
            try
            {
                // parse timestamp
                return new DateTime(1970, 1, 1).AddSeconds(Convert.ToInt32(strTimestamp, 16));
            }
            catch { }
            return new DateTime(2000, 1, 1, 0, 0, 0);
        }

        /// <summary>
        /// converts dms string to lat-long
        /// </summary>
        /// <param name="strDms"></param>
        /// <returns></returns>
        public static double ParseLatLong11(string strDms)
        {
            // 009F5D6F = 10444143
            // convert coordinate to decimal degrees
            return (((double)(Convert.ToInt32(strDms, 16)) / 30000) / 60);
        }


    }
}
