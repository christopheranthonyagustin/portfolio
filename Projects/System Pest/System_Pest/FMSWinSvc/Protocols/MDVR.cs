using FMSWinSvc;
using HelperTools;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace Protocols
{
    public class MDVR
    {
        public MDVR()
        {
        }

        public FMSWebApi.Models.PosInfo ParseData(string rawData)
        {
            FMSWebApi.Models.PosInfo newPos = new FMSWebApi.Models.PosInfo();

            try
            {

                #region RAW DATA
                /*
                50000,20150623180210,113.827408,22.702954,61,185,0,-1,3,155086854,805327235,1.37,-32.1,0,+,132,0,0,16,858534705,741618482,4456|657,Reserve1,Reserve2#               
                */
                #endregion
                //               1,             2,         3,        4, 5,  6,7, 8,9,       10,       11,  12,   13,14,15, 16,17,18,19,       20,       21,      22,      23,
                //rawData = "50000,20150623180210,113.827408,22.702954,61,185,0,-1,3,155086854,805327235,1.37,-32.1, 0, +,132, 0, 0,16,858534705,741618482,4456|657,Reserve1,Reserve2#               ;
                string deviceID = "";
                //string cmd = "";
                //string newdata = "";
                //string realData = "";


                Logger.LogToEvent("MDVR RawData Test: " + rawData, System.Diagnostics.EventLogEntryType.Warning);


                if (rawData.Contains(Consts.MDVR_HEAD))
                {
                    string[] arrData = rawData.Split(",".ToCharArray());

                    //get IMEI/Device ID
                    deviceID = arrData[1].Substring(0, 5);

                    if (arrData[9] == "2")
                    {
                        newPos.Tag = deviceID;
                        Logger.LogToEvent("MDVR DeviceID: " + deviceID, System.Diagnostics.EventLogEntryType.Warning);
                        newPos.RxTime = DateTime.UtcNow;
                        //newPos.FixID = (arrData[15] == "+" ? 2 : 4);
                        newPos.Timestamp = BuildTimestamp2(arrData[2]);
                        Logger.LogToEvent("MDVR Timestamp: " + newPos.Timestamp, System.Diagnostics.EventLogEntryType.Warning);
                        newPos.PosX = Convert.ToDouble(arrData[3]);
                        Logger.LogToEvent("MDVR PosX: " + newPos.PosX, System.Diagnostics.EventLogEntryType.Warning);
                        newPos.PosY = Convert.ToDouble(arrData[4]);
                        Logger.LogToEvent("MDVR PosY: " + newPos.PosY, System.Diagnostics.EventLogEntryType.Warning);
                        newPos.Speed = BuildSpeed(arrData[5]); //parse speed
                        Logger.LogToEvent("MDVR Speed: " + newPos.Speed, System.Diagnostics.EventLogEntryType.Warning);
                        newPos.Course = BuildCourse(arrData[6]);//parse course
                        Logger.LogToEvent("MDVR Course: " + newPos.Course, System.Diagnostics.EventLogEntryType.Warning);
                        newPos.PosZ = Convert.ToDouble(arrData[7]); // parse Altitude
                        Logger.LogToEvent("MDVR PosZ: " + newPos.PosZ, System.Diagnostics.EventLogEntryType.Warning);
                        //newPos.Satellites = BuildSatellite(arrData[8]);
                        newPos.Satellites = 0;
                        //Logger.LogToEvent("MDVR Satellites: " + newPos.Satellites, System.Diagnostics.EventLogEntryType.Warning);
                        newPos.FixID = (arrData[9] == "2" ? 2 : 4); // parse GPS Fix
                        Logger.LogToEvent("MDVR FixID: " + newPos.FixID, System.Diagnostics.EventLogEntryType.Warning);
                        newPos.Mileage = Convert.ToDouble(arrData[10]); // parse Mileage
                        Logger.LogToEvent("MDVR Mileage: " + newPos.Mileage, System.Diagnostics.EventLogEntryType.Warning);
                        newPos.Ignition = ConvertDecToBinaryIgnition(arrData[11]); // parse Ignition
                        Logger.LogToEvent("MDVR Ignition: " + newPos.Ignition, System.Diagnostics.EventLogEntryType.Warning);
                        //newPos.Battery = BuildBattery(arrData[18]);//parse battery         
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

        private int BuildSatellite(string sat)
        {
            int retVal = 0;
            int.TryParse(sat, out retVal);
            return retVal;
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

        private int ConvertDecToBinaryIgnition(string DecValue)
        {
            //Logger.LogToEvent("Get DecValue: " + DecValue, System.Diagnostics.EventLogEntryType.Warning);

            int num = int.Parse(DecValue);
            //Convert string to int
            var result = Convert.ToString(num, 2).PadLeft(32, '0');
   
            //Logger.LogToEvent("Get Binary: " + result, System.Diagnostics.EventLogEntryType.Warning);      
            int retVal = 0;
            int.TryParse(result.Substring(31, 1), out retVal);

            return retVal;
        }

        private int ConvertDecToBinaryGPS(string DecValue)
        {
            //Logger.LogToEvent("Get DecValue: " + DecValue, System.Diagnostics.EventLogEntryType.Warning);

            int num = int.Parse(DecValue);
            //Convert string to int
            var result = Convert.ToString(num, 2).PadLeft(32, '0');

            //Logger.LogToEvent("Get Binary: " + result, System.Diagnostics.EventLogEntryType.Warning);      
            int retVal = 0;
            int.TryParse(result.Substring(32, 1), out retVal);

            return retVal;
        }

    }
}