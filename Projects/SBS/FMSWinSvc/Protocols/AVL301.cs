using FMSWinSvc;
using HelperTools;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Protocols
{
    public class AVL301
    {
        public AVL301()
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
                //            1  2   3,            4,  5,  6,        7,        8,    9,   10, 11,   12,       13, 14, 15,   16,   17, 18, 19, 20,   21,   22,   23
                //rawData = "24,24, 2D, 0F0A0D090D16, 0E, 04, 000C593D, 03B53B13, 0000, 1486, 07, 013C, 013C6A82, 08, 10, 01BD, 0512, 15, AA, 00, 0098, C625, 0D0A
                //           24,24, 2D, 0F0C11041E2A, 0E, 06, 000C3145, 03B7341E, 0000, 1560, 07, 015B, 013D7027, 08, 10, 019F, 04B9, 0A, AA, 00, 0178, 1914, 0D0A
                // 0123456789 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62
                // 24242D0F0C  1  1  0  4  1  E  2  A  0  E  0  6  0  0  0  C  3  1  4  5  0  3  B  7  3  4  1  E  0  0  0  0  1  5  6  0  0  7  0  1  5  B  0  1  3  D  7  0  2  7  0  8  10019F04B90AAA00017819140D0A
                //24242D0F0C16051B0B 0E 0C 000C7514 03B71D04 0E10 150E 0701 58013A6AE6081001A004C115AA00000910970D0A
                //24242D0F0C160523060E0C000C47B603B718430000 148D07015B013D703F 0810  01AE  04, C214AA000007326F0D0A
                //24242D0F0C16051B0B0E0C000C751403B71D040E10 150E070158013A6AE6 0810  01A0  04, C115AA00000910970D0A
                //24242D0F0A0D090D160E04000C593D03B53B130000 148607013C013C6A82 0810, 01BD, 0512, 15, AA, 00, 0098, C625, 0D0A
                //24242D0F0C1607112C0E08000C31E803B72D300000 1508, 07015B013D79B1 0810  0199  04BB  0FAA0000047CB60D0A
                //24242D0F0C1607112C0E08 000C31E8 03B72D30 0000 1508 07015B013D79B1 0810, 0199, 04BB, 0FAA0000047CB60D0A
                /*
                861311003887519;24242D0F0C110139140E05000C314503B7341E0000155E07013D013D8051081001B004BF08AA000055FBD10D0A00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
                */
                string deviceID = "";

                string[] arrData = rawData.Split("".ToCharArray());

                if (rawData.Contains(Consts.AVL301_HEAD))
                {
                    string[] realRaw = rawData.Split(";".ToCharArray());
                    string actualData = realRaw[1];
                    deviceID = realRaw[0];

                    Logger.LogToEvent("AVL301 Get Real Data: " + actualData, System.Diagnostics.EventLogEntryType.Warning);

                    //861311003887519
                    //get IMEI/Device ID
                    newPos.Tag = deviceID;
                    //Logger.LogToEvent("AVL301 Check Raw Data deviceID: " + newPos.deviceID, System.Diagnostics.EventLogEntryType.Warning);
                    newPos.RxTime = DateTime.UtcNow;
                    //Logger.LogToEvent("AVL301 Check Raw Data RxTime: " + newPos.RxTime, System.Diagnostics.EventLogEntryType.Warning);
                    newPos.Satellites = BuildSatellite(realRaw[1].Substring(20, 2));
                    Logger.LogToEvent("AVL301 Check Raw Data Satellites: " + newPos.Satellites, System.Diagnostics.EventLogEntryType.Warning);
                    newPos.FixID = (newPos.Satellites > 3 ? 2 : 1);
                    Logger.LogToEvent("AVL301 Check Raw Data FixID: " + newPos.FixID, System.Diagnostics.EventLogEntryType.Warning);
                    newPos.Timestamp = GetTimestamp(realRaw[1].Substring(6, 12));
                    Logger.LogToEvent("AVL301 Check Raw Data Timestamp: " + newPos.Timestamp, System.Diagnostics.EventLogEntryType.Warning);
                    newPos.PosY = ParseLatLong11(realRaw[1].Substring(22, 8));//parse latitude
                    Logger.LogToEvent("AVL301 Check Raw Data PosY: " + newPos.PosY, System.Diagnostics.EventLogEntryType.Warning);
                    newPos.PosX = ParseLatLong11(realRaw[1].Substring(30, 8));//parse longitude
                    Logger.LogToEvent("AVL301 Check Raw Data PosX: " + newPos.PosX, System.Diagnostics.EventLogEntryType.Warning);
                    newPos.Speed = BuildSpeed(realRaw[1].Substring(38, 4)); //parse speed
                    Logger.LogToEvent("AVL301 Check Raw Data Speed: " + newPos.Speed, System.Diagnostics.EventLogEntryType.Warning);
                    newPos.Course = BuildCourse(realRaw[1].Substring(44, 2)); //parse course
                    Logger.LogToEvent("AVL301 Check Raw Data Course: " + newPos.Course, System.Diagnostics.EventLogEntryType.Warning);
                    newPos.Battery = BuildBattery(realRaw[1].Substring(64, 4));//parse battery
                    Logger.LogToEvent("AVL301 Check Raw Data Battery: " + newPos.Battery, System.Diagnostics.EventLogEntryType.Warning);
                    newPos.Ignition = BuildIgnition(realRaw[1].Substring(62, 2));// parse ignition
                    Logger.LogToEvent("AVL301 Check Raw Data Ignition: " + newPos.Ignition, System.Diagnostics.EventLogEntryType.Warning);

                }

            }
            catch (Exception ex)
            {

                Logger.LogToEvent("AVL301 ParseData: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
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