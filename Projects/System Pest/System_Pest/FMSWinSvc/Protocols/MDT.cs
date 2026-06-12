using FMSWinSvc;
using HelperTools;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace Protocols
{
    public class MDT
    {
        public MDT()
        {
        }

        public FMSWebApi.Models.PosInfo ParseData(string rawData)
        {
            FMSWebApi.Models.PosInfo newPos = new FMSWebApi.Models.PosInfo();

            try
            {

                #region RAW DATA
                /*
                         Device ID      , Date      Time    ,       Lat,       Long,Speed,             Mileage,Course,
                 _$$ADS$,358240055953152,2016-04-17 22:57:30,14.6113121,121.0012403,  0.0,0.013548195490089588,    0.0#               
                */
                #endregion

                string deviceID = "";
                //Logger.LogToEvent("MDT RawData Test: " + rawData, System.Diagnostics.EventLogEntryType.Warning);


                if (rawData.Contains(Consts.MDT_HEAD))
                {
                    string[] arrData = rawData.Split(",".ToCharArray());

                    DateTime tmpDT = new DateTime();
                    DateTime.TryParse(String.Format("{0}-{1}-{2} {3}:{4}:{5}",
                       arrData[2].Substring(8, 2), arrData[2].Substring(5, 2), arrData[2].Substring(0, 4),
                       arrData[2].Substring(11, 2), arrData[2].Substring(14, 2), arrData[2].Substring(17, 2)),
                       out tmpDT);

                    //get IMEI/Device ID
                    deviceID = arrData[1].Substring(0, 15);

                    newPos.Tag = deviceID;
                    //Logger.LogToEvent("MDVR DeviceID: " + deviceID, System.Diagnostics.EventLogEntryType.Warning);
                    newPos.RxTime = DateTime.UtcNow;
                    newPos.Timestamp = tmpDT;
                    //Logger.LogToEvent("Check Timestamp: " + tmpDT, System.Diagnostics.EventLogEntryType.Warning);
                    newPos.PosY = Convert.ToDouble(arrData[3]);
                    //Logger.LogToEvent("MDT PosX: " + newPos.PosY, System.Diagnostics.EventLogEntryType.Warning);
                    newPos.PosX = Convert.ToDouble(arrData[4]);
                    //Logger.LogToEvent("MDT PosY: " + newPos.PosX, System.Diagnostics.EventLogEntryType.Warning);
                    newPos.Speed = BuildSpeed(arrData[5]); //parse speed
                    //Logger.LogToEvent("MDT Speed: " + newPos.Speed, System.Diagnostics.EventLogEntryType.Warning);
                    newPos.Mileage = BuildMileage(arrData[6]); //parse mileage
                    //Logger.LogToEvent("MDT Mileage: " + newPos.Mileage, System.Diagnostics.EventLogEntryType.Warning);
                    newPos.Course = BuildCourse(arrData[7]); //parse course
                    //Logger.LogToEvent("MDT Course: " + newPos.Course, System.Diagnostics.EventLogEntryType.Warning);
                    newPos.Ignition = BuildIgnition(arrData[8].Substring(0,1)); //parse ignition
                    //Logger.LogToEvent("MDT Ignition: " + newPos.Ignition, System.Diagnostics.EventLogEntryType.Warning);
                    newPos.Siren = BuildSiren(arrData[9].Substring(0, 1)); //parse input 1
                    newPos.BarLight = BuildBarLight(arrData[10].Substring(0, 1)); //parse input 2
                    //Logger.LogToEvent("MDT BarLight: " + newPos.BarLight, System.Diagnostics.EventLogEntryType.Warning);
                    newPos.Satellites = 0;
                    newPos.FixID = (arrData[0] == "$$ADS$" ? 2 : 4); // parse GPS Fix
                    //Logger.LogToEvent("MDT FIX ID: " + newPos.FixID, System.Diagnostics.EventLogEntryType.Warning);


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

        private double BuildMileage(string mileage)
        {
            double retVal = 0;
            double.TryParse(mileage, out retVal);
            return retVal;
        }


        private int BuildIgnition(string ignition)
        {
            int retVal = 0;
            int.TryParse(ignition, out retVal);
            return retVal;
        }


        private int BuildBarLight(string barlight)
        {
            int retVal = 0;
            int.TryParse(barlight, out retVal);
            return retVal;
        }

        private int BuildSiren(string siren)
        {
            int retVal = 0;
            int.TryParse(siren, out retVal);
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