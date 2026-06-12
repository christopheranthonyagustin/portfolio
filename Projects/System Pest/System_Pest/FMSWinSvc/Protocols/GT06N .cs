using FMSWinSvc;
using HelperTools;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Protocols
{
    public class GT06N 
    {
        public GT06N()
        {
        }

        public FMSWebApi.Models.PosInfo ParseData(string rawData)
        {
            FMSWebApi.Models.PosInfo newPos = new FMSWebApi.Models.PosInfo();

            try
            {

                #region LOGIN RAW DATA
                /*
                        244C0F086131100388751900090D0A      
                 *      Device ID - 861311003887519
                */
                #endregion

                Logger.LogToEvent("GT06N Get Raw Data: " + rawData, System.Diagnostics.EventLogEntryType.Warning);

                string deviceID = "";

                string[] arrData = rawData.Split("".ToCharArray());

                if (rawData.Contains(Consts.GT06N_HEAD))
                {
                    string[] realRaw = rawData.Split(";".ToCharArray());
                    string actualData = realRaw[1];
                    deviceID = realRaw[0];

                    Logger.LogToEvent("GT06N Get Real Data: " + actualData, System.Diagnostics.EventLogEntryType.Warning);

                    //861311003887519
                    //get IMEI/Device ID
                    newPos.Tag = deviceID;
                    //Logger.LogToEvent("AVL301 Check Raw Data deviceID: " + newPos.deviceID, System.Diagnostics.EventLogEntryType.Warning);
                    newPos.RxTime = DateTime.UtcNow;
                    //Logger.LogToEvent("AVL301 Check Raw Data RxTime: " + newPos.RxTime, System.Diagnostics.EventLogEntryType.Warning);


                }

            }
            catch (Exception ex)
            {

                //Logger.LogToEvent("GT06N ParseData: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }

            return newPos;
        }

        public bool SendData(FMSWebApi.Models.PosInfo sendPos)
        {
            bool retBool = false;


            return retBool;
        }

        private int BuildSatellite(string satellite)
        {
            int retVal = 0;
            int.TryParse(satellite, out retVal);
            return retVal;
        }

        private int BuildIgnition(string ignition)
        {
            int retVal;
            int.TryParse(ignition, out retVal);

            if (retVal == 10)
            {
                retVal = 0;
            }
            else if (retVal == 01)
            {
                retVal = 1;
            }
            else if (retVal == 11)
            {
                retVal = 1;
            }
            else
            {
                retVal = 0;
            }

            return retVal;
        }


        private int BuildBattery(string batt)
        {
            int retVal = 0;
            string hex2binary = Convert.ToString(Convert.ToInt64(batt, 16), 2);
            string binary2decimal = Convert.ToInt32(hex2binary, 2).ToString();
            int.TryParse(binary2decimal, out retVal);
            return retVal / 100;
        }

        private double BuildCourse(string course)
        {
            //1560
            double retVal = 0;
            string hex2binary = Convert.ToString(Convert.ToInt64(course, 16), 2);
            string binary2decimal = Convert.ToInt32(hex2binary, 2).ToString();
            double.TryParse(binary2decimal, out retVal);
            return retVal;
        }

        private double BuildSpeed(string speedInKnots)
        {
            //1 knot = 1.852 km/hr
            double retVal = 0;
            string hex2binary = Convert.ToString(Convert.ToInt64(speedInKnots, 16), 2);
            string binary2decimal = Convert.ToInt32(hex2binary, 2).ToString();
            double.TryParse(binary2decimal, out retVal);
            return retVal / 100 * 1.852;
        }


        private string ConvertHexToString(string HexValue)
        {
            string StrValue = "";
            while (HexValue.Length > 0)
            {
                StrValue += System.Convert.ToChar(System.Convert.ToUInt32(HexValue.Substring(0, 2), 16)).ToString();
                HexValue = HexValue.Substring(2, HexValue.Length - 2);
            }
            return StrValue;
        }


        public static string GetDeviceID(string rawData)
        {
            int imeiPos = 7;
            int imeiLen = 8;

            if (!String.IsNullOrEmpty(rawData))
            {
                try
                {
                    return rawData.Substring(imeiPos, imeiPos + imeiLen);
                }
                catch (Exception ex)
                {
                    return "";
                }
            }
            return "";
        }

        private DateTime GetTimestamp(string timestampData)
        {
            int year = int.Parse(timestampData.Substring(0, 2), System.Globalization.NumberStyles.HexNumber);
            int month = int.Parse(timestampData.Substring(2, 2), System.Globalization.NumberStyles.HexNumber);
            int day = int.Parse(timestampData.Substring(4, 2), System.Globalization.NumberStyles.HexNumber);
            int hour = int.Parse(timestampData.Substring(6, 2), System.Globalization.NumberStyles.HexNumber);
            int min = int.Parse(timestampData.Substring(8, 2), System.Globalization.NumberStyles.HexNumber);
            int sec = int.Parse(timestampData.Substring(10, 2), System.Globalization.NumberStyles.HexNumber);

            return new DateTime(2000 + year, month, day, hour, min, sec);
        }

        private double ParseLatLong11(string strDms)
        {

            return (((double)(Convert.ToInt32(strDms, 16)) / 10000) / 60);
        }
    }
}