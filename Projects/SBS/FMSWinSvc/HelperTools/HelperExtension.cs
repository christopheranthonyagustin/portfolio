using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;

namespace FMSWebApi
{
    /// <summary>
    /// helper function class
    /// </summary>
    internal static class HelperFunctions
    {
        /// <summary>
        /// converts database value to string
        /// </summary>
        /// <param name="dbRdr"></param>
        /// <param name="strParam"></param>
        public static string ToString(this MySqlDataReader dbRdr, string strParam)
        {
            // get parameter value
            return (dbRdr[strParam] != DBNull.Value ? dbRdr[strParam].ToString() : "");
        }

        /// <summary>
        /// converts database value to integer
        /// </summary>
        /// <param name="dbRdr"></param>
        /// <param name="strParam"></param>
        public static int ToInt32(this MySqlDataReader dbRdr, string strParam)
        {
            // get parameter value
            return (dbRdr[strParam] != DBNull.Value ? Convert.ToInt32(dbRdr[strParam]) : 0);
        }

        /// <summary>
        /// converts database value to integer
        /// </summary>
        /// <param name="dbRdr"></param>
        /// <param name="strParam"></param>
        public static long ToInt64(this MySqlDataReader dbRdr, string strParam)
        {
            // get parameter value
            return (dbRdr[strParam] != DBNull.Value ? Convert.ToInt64(dbRdr[strParam]) : 0);
        }

        /// <summary>
        /// converts database value to double
        /// </summary>
        /// <param name="dbRdr"></param>
        /// <param name="strParam"></param>
        public static double ToDouble(this MySqlDataReader dbRdr, string strParam)
        {
            // get parameter value
            return (dbRdr[strParam] != DBNull.Value ? Convert.ToDouble(dbRdr[strParam]) : 0);
        }

        /// <summary>
        /// converts database value to datetime
        /// </summary>
        /// <param name="dbRdr"></param>
        /// <param name="strParam"></param>
        public static DateTime ToDateTime(this MySqlDataReader dbRdr, string strParam)
        {
            // get parameter value
            return (dbRdr[strParam] != DBNull.Value ? Convert.ToDateTime(dbRdr[strParam]) : Convert.ToDateTime("1/1/2000 00:00:00"));
        }

        /// <summary>
        /// converts database value to datetime
        /// </summary>
        /// <param name="dbRdr"></param>
        /// <param name="strParam"></param>
        public static DateTime ToDateTimeMin(this MySqlDataReader dbRdr, string strParam)
        {
            // get parameter value
            return (dbRdr[strParam] != DBNull.Value ? Convert.ToDateTime(dbRdr[strParam]) : DateTime.MinValue);
        }

        /// <summary>
        /// encloses string with xml tags
        /// </summary>
        /// <param name="strTag"></param>
        /// <returns></returns>
        public static string ToXml(this string strValue, string strTag)
        {
            // format in xml
            return String.Format("<{0}>{1}</{0}>", strTag, strValue);
        }

        /// <summary>
        /// gets value of xml node
        /// </summary>
        /// <param name="valEnum"></param>
        /// <returns></returns>
        public static string NodeValue(this XmlDocument xmlRequest, string strXPath)
        {
            // get xml value
            XmlNode xmlValue = xmlRequest.SelectSingleNode(strXPath);
            return (xmlValue != null ? xmlValue.InnerText : "");
        }

        /// <summary>
        /// formats string into title case
        /// </summary>
        /// <param name="valEnum"></param>
        /// <returns></returns>
        public static string ToTitleCase(this string strText)
        {
            // parse string
            string[] arrTemp = strText.Split();
            for (int i = 0; i < arrTemp.Length; i++)
            {
                // capitalize first letter
                if (arrTemp[i].Length > 1)
                    arrTemp[i] = String.Format("{0}{1}", arrTemp[i].Substring(0, 1).ToUpper(), arrTemp[i].Substring(1).ToLower());
                else arrTemp[i] = arrTemp[i].ToUpper();
            }
            return String.Join(" ", arrTemp);
        }
    }
}
