using FMSWinSvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Protocols
{
    public class GG400
    {
        public GG400()
        {
        }

        public FMSWebApi.Models.PosInfo ParseData(string rawData)
        {
            FMSWebApi.Models.PosInfo newPos = new FMSWebApi.Models.PosInfo();

            try
            {
                

                #region RAW DATA
                /*
            STX863070014951650 Q$GPRMC,082446.00,V,,,,,,,170315,,,N*76,525,01,0074,2A72,23,100,0000,0001,99,Timer;0D
            STX863070014951650 R$GPRMC,082546.00,V,,,,,,,170315,,,N*76,525,01,0074,2A72,20,100,0000,0001,100,Timer;3D
            STX863070014951650 R$GPRMC,082646.00,V,,,,,,,170315,,,N*76,525,01,0074,2B7C,24,100,0000,0001,100,Timer;48
21:22:49	14.100.134.98:60289	STX863070014951650 r$GPRMC,132249.766,A,0122.8892,N,10356.3225,E,000.0,199.8,170315,,,A*63,525,01,0030,0399,26,100,1000,0001,100,Timer;79
21:23:49	14.100.134.98:60289	STX863070014951650 r$GPRMC,132348.766,A,0122.8889,N,10356.3187,E,000.0,000.3,170315,,,A*68,525,01,0030,0399,26,100,1000,0001,100,Timer;79
21:24:49	14.100.134.98:60289	STX863070014951650 r$GPRMC,132448.766,A,0122.8886,N,10356.3175,E,000.0,177.1,170315,,,A*68,525,01,0030,0399,26,100,1000,0001,100,Timer;7F
03:30:26	14.100.134.102:32906	STX863070014951650 r$GPRMC,193025.584,A,0122.8905,N,10356.3237,E,000.0,000.0,170315,,,A*67,525,01,0030,2C45,22,100,1000,0011,100,Timer;03//Ignition ON             
             */
                #endregion

                //rawData = "STX863070014951650 r$GPRMC,193025.584,A,0122.8905,N,10356.3237,E,000.0,000.0,170315,,,A*67,525,01,0030,2C45,22,100,1000,0011,100,Timer;03";
                string deviceID = "";
                //string cmd = "";
                string newdata = "";
                string realData = "";

                if (rawData.Contains(Consts.GG400WT_HEAD))
                {
                    //get IMEI/Device ID
                    deviceID = rawData.Substring(Consts.GG400WT_HEAD.Length, 16);
                    newdata = rawData.Substring(Consts.GG400WT_HEAD.Length + deviceID.Length);

                    //cmd = Encoding.ASCII.GetString(rawData.Substring(0, )
                    realData = rawData.Substring(rawData.IndexOf(Consts.GG400WT_DATA));

                    string[] arrData = realData.Split(",".ToCharArray());
                    if (arrData[2] == "A")
                    {
                        newPos.Tag = deviceID;
                        newPos.RxTime = DateTime.UtcNow;
                        newPos.FixID = (arrData[2] == "A" ? 2 : 4);
                        newPos.Satellites = 0;
                        newPos.Timestamp = BuildTimestamp(arrData[1], arrData[9]);
                        newPos.PosY = BuildLatLong(arrData[3], arrData[4]);//parse latitude
                        newPos.PosX = BuildLatLong(arrData[5], arrData[6]);//parse longitude
                        newPos.Speed = BuildSpeed(arrData[7]); //parse speed
                        newPos.Course = BuildCourse(arrData[8]);//parse course
                        newPos.Battery = BuildBattery(arrData[18]);//parse battery
                        newPos.Ignition = BuildIgnition(arrData[20]);// parse ignition
                    }
                }
            }
            catch (Exception ex)
            {

                //Logger.LogToEvent("ParseData: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
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
            char[] arrInputs = ignition.ToCharArray();
            int retVal = 0;
            int.TryParse(arrInputs[2].ToString(), out retVal);
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

        private DateTime BuildTimestamp(string time, string date)
        {
            try
            {
                string strTimestamp = String.Format("{0}/{1}/{2} {3}:{4}:{5}",
                        date.Substring(2, 2), date.Substring(0, 2), date.Substring(4, 2),
                        time.Substring(0, 2), time.Substring(2, 2), time.Substring(4, 2));
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


    }
}