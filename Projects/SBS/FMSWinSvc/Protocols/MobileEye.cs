using FMSWinSvc;
using HelperTools;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace Protocols
{
    public class MobileEye
    {
        public MobileEye()
        {
        }

        public FMSWebApi.Models.PosInfo ParseData(string rawData)
        {
            FMSWebApi.Models.PosInfo newPos = new FMSWebApi.Models.PosInfo();

            try
            {

                #region RAW DATA
                /*                Device ID
                   Login Data - I,    7601L,060100,173609,52,FF,S,00,060100,173612,4F,FF,L,00,060100,173615,4C,FF,I,00,060100,173645,4F,FF,I,00,060100,173650,4F,FF,S,01,060100,173655,52,10,S,00,060100,173700,52,12,H,02,060100,173700,52,12,S,01,060100,173708,52,19,S,00,060100,173715,4F,00,I,00,060100,173735,4F,00,S,01,060100,173745,52,00,I,00,060100,173745,52,00,S,00,060100,173815,4F,0C,I,00,060100,173819,4C,0E,H,02,060100,173826,49,19,L,00,060100,173832,46,00,L,00,060100,173845,46,FF,I,00,060100,173915,49,19,I,00,060100,173925,40,12,H,02,060100,173936,3D,12,S,03,060100,173944,3D,12,S,02,060100,173945,3A,12,I,00,060100,173954,37,14,S,01,060100,174007,33,00,S,00,060100,174015,30,00,I,00,060100,174045,15,00,I,00,060100,174115,21,0C,I,00
                                0,     1,     2, 3, 4,5, 6,     7,     8, 9,10,11 12,    13,    14,15,16,17,18,    19,    20,21,22,23,24,    25,    26,27,28,29,30,    31,    32,33,34,35,36,    37,    38,39,40,
                   Connected  - L,060100,174115,21,0A,H,02,060100,174145,37,0E, I,00,060100,174215,3D,12, I,00,060100,174231,3D,12, H,02,060100,174245,43,06, I,00,060100,174249,43,0A, H,02,060100,174315,3A,FF,I,00,060100,174345,46,14,I,00,060100,174415,46,14,I,00,060100,174422,49,0E,H,02,060100,174438,43,00,S,04,060100,174443,3A,00,S,02,060100,174445,3A,FF,I,00,060100,174512,37,FF,S,01,060100,174515,33,FF,I,00,060100,174517,37,FF,S,00,060100,174522,37,FF,S,02,060100,174527,33,FF,S,01,060100,174532,1B,FF,S,00,060100,174545,06,FF,I,00,060100,174615,27,00,I,00,060100,174645,1E,00,I,00,060100,174715,09,FF,I,00,060100,174745,03,FF,I,00,060100,174756,03,FF,D,00,060100,174815,00,FF,I,00,060100,174845,00,FF,I,00,060100,174855,09,FF,D,00
                 1 - Date
                 2 - Time
                 3 - Speed
                 4 - Head Way
                 5 - Event
                 6 - Event Value
                 7 - Date2
                 8 - Time2
                 9 - Speed2
                10 - Head Way2
                11 - Event2
                12 - Event Value2
                */
                #endregion
                //
                //               1,             2,         3,        4, 5,  6,7, 8,9,       10,       11,  12,   13,14,15, 16,17,18,19,       20,       21,      22,      23,
                //rawData = "50000,20150623180210,113.827408,22.702954,61,185,0,-1,3,155086854,805327235,1.37,-32.1, 0, +,132, 0, 0,16,858534705,741618482,4456|657,Reserve1,Reserve2#;
                //L,00002,180216,160121,00,FF,I,00;
                //L,00003,240516,102430,+02.12345,120.12345,045,1,5A,0A,I,0 CR
                
                Logger.LogToEvent("Raw Data Class: " + rawData, System.Diagnostics.EventLogEntryType.Warning);

                string deviceID = "";

                if (rawData.Contains(Consts.MobileEye_HEAD))
                {
                    string[] arrData = rawData.Split(",".ToCharArray());

                    DateTime tmpDT = new DateTime();
                    DateTime.TryParse(String.Format("{0}-{1}-{2} {3}:{4}:{5}",
                        arrData[2].Substring(0, 2), arrData[2].Substring(2, 2), arrData[2].Substring(4, 2),
                        arrData[3].Substring(0, 2), arrData[3].Substring(2, 2), arrData[3].Substring(4, 2)),
                        out tmpDT);

                    if (arrData.Length > 0)
                    {
                        //get IMEI/Device ID
                        deviceID = arrData[1].Substring(arrData[0].IndexOf(':') + 1);
                        newPos.Tag = deviceID;
                        Logger.LogToEvent("Get Device ID: " + deviceID, System.Diagnostics.EventLogEntryType.Warning);
                        newPos.RxTime = DateTime.UtcNow;
                        newPos.FixID = (arrData[7] == "1" ? 2 : 4);
                        newPos.Satellites = 0;
                        newPos.Timestamp = tmpDT;
                        Logger.LogToEvent("Get Timestamp: " + newPos.Timestamp, System.Diagnostics.EventLogEntryType.Warning);
                        newPos.PosY = ConvertLatLong(arrData[4]);//parse latitude
                        newPos.PosX = ConvertLatLong(arrData[5]);//parse longitude
                        newPos.Course = BuildCourse(arrData[6]);
                        newPos.Speed = ConvertDoubleHexToDecimal(arrData[8]);
                        Logger.LogToEvent("Get Speed: " + newPos.Speed, System.Diagnostics.EventLogEntryType.Warning);
                        newPos.Headway = ConvertHexToDecimal(arrData[9]);  //parse headway
                        Logger.LogToEvent("Get Headway: " + newPos.Headway, System.Diagnostics.EventLogEntryType.Warning);
                        newPos.Event = ConvertHexToASCII(arrData[10]); //parse event
                        Logger.LogToEvent("Get Event: " + newPos.Event, System.Diagnostics.EventLogEntryType.Warning);
                        newPos.EventValue = ConvertHexToDecimal(arrData[11].Substring(0,2));//parse event value
                        Logger.LogToEvent("Get Event Value: " + newPos.EventValue, System.Diagnostics.EventLogEntryType.Warning);
                    }
                }               
            }
            catch (Exception ex)
            {

             // Logger.LogToEvent("ParseData: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }

            return newPos;
        }


        public bool SendData(FMSWebApi.Models.PosInfo sendPos)
        {
            bool retBool = false;


            return retBool;
        }


        private int BuildIgnition(string ignition)
        {
            int retVal = 0;
            int.TryParse(ignition, out retVal);
            return retVal;
        }


        private int BuildBattery(string batt)
        {
            int retVal = 0;
            int.TryParse(batt, out retVal);
            return retVal;
        }

        private double BuildCourse(string course)
        {
            double retVal = 0;
            double.TryParse(course, out retVal);
            return retVal;
        }

        private double BuildSpeed(string speedInKnots)
        {
            //1 knot = 1.852 km/hr
            double retVal = 0;
            double.TryParse(speedInKnots, out retVal);
            return retVal * 1.852;
        }

        private double BuildSpeed2(string speedInKnots)
        {
            //1 knot = 1.852 km/hr
            double retVal = 0;
            double.TryParse(speedInKnots, out retVal);
            return retVal;
        }

        private double ConvertLatLong(string latlong)
        {
            double retVal = 0;
            double.TryParse(latlong, out retVal);
            return retVal;
        }

        private double BuildLatLong(string strDms, string strHemisphere)
        {
            // NMEA to decimal: http://stefanchurch1.blogspot.sg/2008/09/c-nmea-latitudelongitude.html
            // 0122.8886,N,10356.3175,E
            double lDegree = Math.Truncate(Convert.ToDouble(strDms) / 100);
            double lMinutes = Convert.ToDouble(strDms.Substring(strDms.IndexOf(".") - 2));

            if (strHemisphere == "S" || strHemisphere == "W")
                return -(lDegree + (lMinutes / 60));
            else
                return lDegree + (lMinutes / 60);
        }

        private DateTime BuildTimestamp(string date, string time)
        {
            try
            {
                string strTimestamp = String.Format("{1}/{0}/{2} {3}:{4}:{5}",
                       date.Substring(13, 2), date.Substring(16, 2), date.Substring(19, 2),
                       time.Substring(0, 2), time.Substring(3, 2), time.Substring(6, 2));
                return DateTime.Parse(strTimestamp, System.Globalization.CultureInfo.CreateSpecificCulture("en-US"));
            }
            catch
            {
                return new DateTime(2000, 1, 1, 0, 0, 0);
            }
        }

        private DateTime BuildTimestamp2(string timestamp)
        {
            try
            {

                //20151117122414
                //20151117162901
                //mm/dd/yy hh:MM:ss
                string strTimestamp = String.Format("{0}/{1}/{2} {3}:{4}:{5}",
                        timestamp.Substring(4, 2), timestamp.Substring(6, 2), timestamp.Substring(2, 2),
                        timestamp.Substring(8, 2), timestamp.Substring(10, 2), timestamp.Substring(12, 2));
                return DateTime.Parse(strTimestamp, System.Globalization.CultureInfo.CreateSpecificCulture("en-US"));
            }
            catch
            {
                return new DateTime(2000, 1, 1, 0, 0, 0);
            }
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

        private string ConvertHexToDecimal(string HexValue)
        {
            int decValue = Convert.ToInt32(HexValue, 16);
            string StrValue = decValue.ToString();
            
            return StrValue;
        }

        private double ConvertDoubleHexToDecimal(string HexValue)
        {
            int decValue = Convert.ToInt32(HexValue, 16);
            double retVal = System.Convert.ToDouble(decValue);

            return retVal;
        }

        private string ConvertHexToASCII(string HexValue)
        {
            string StrValue = "";
            foreach (char c in HexValue)
            {
               int IntValue = System.Convert.ToInt32(c);
               StrValue = IntValue.ToString();
            }
            
            return StrValue;
        }


        public static string GetDeviceID(string rawData)
        {
            int imeiPos = 3;
            int imeiLen = 6;

            if (!String.IsNullOrEmpty(rawData))
            {
                try
                {
                    return rawData.Substring(imeiPos, imeiLen);                   
                }
                catch (Exception ex)
                {
                    //return "";
                    Logger.LogToEvent("GetDeviceID: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
                }
            }
            return "";
        }


    }
}