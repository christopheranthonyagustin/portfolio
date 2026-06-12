using FMSWinSvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Protocols
{
    public class Coban103A
    {
        public Coban103A()
        {
        }

        public FMSWebApi.Models.PosInfo ParseData(string rawData)
        {
            FMSWebApi.Models.PosInfo newPos = new FMSWebApi.Models.PosInfo();

            try
            {
                //                              1,      2,          3,4,5,         6,7,        8,9,        10,11,
                //rawData = "imei:359710048615695,tracker,150525143028,,F,143029.000,A,0122.8745,N,10356.3683,E,0.00,0,,1,0,0.00%,,;";
                //rawData = "imei:359710043994343,tracker,000000000   ,,L,          , ,74       , ,2a6d      , ,    , ,,1,0,0.44%,,"
                string deviceID = "";
                string realData = "";

                if (rawData.Contains(Consts.COBAN103A_HEAD))
                {
                    string[] arrData = rawData.Split(",".ToCharArray());

                    if (arrData.Length > 0)
                    {
                        //get IMEI/Device ID
                        deviceID = arrData[0].Substring(arrData[0].IndexOf(':') + 1);

                        if (arrData[4] == "F")
                        {
                            newPos.Tag = deviceID;
                            newPos.RxTime = DateTime.UtcNow;
                            newPos.FixID = (arrData[4] == "F" ? 2 : 4);
                            newPos.Satellites = 0;
                            newPos.Timestamp = BuildTimestamp(arrData[2]);
                            newPos.PosY = BuildLatLong(arrData[7], arrData[8]);//parse latitude
                            newPos.PosX = BuildLatLong(arrData[9], arrData[10]);//parse longitude
                            newPos.Speed = BuildSpeed2(arrData[11]); //parse speed
                            newPos.Course = BuildCourse(arrData[12]);//parse course
                            newPos.PosZ = BuildAltitude(arrData[13]);//parse altitude
                            //newPos.Battery = BuildBattery(arrData[18]);//parse battery
                            newPos.Ignition = BuildIgnition(arrData[14]);// parse ignition      
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                //LogToEvent("ParseData: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return newPos;
        }

       

        public bool SendData(FMSWebApi.Models.PosInfo sendPos)
        {
            bool retBool = false;


            return retBool;
        }

        private double BuildAltitude(string altitude)
        {
            double retVal = 0;
            double.TryParse(altitude, out retVal);
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

        private double BuildSpeed2(string speedInKnots)
        {
            //1 knot = 1.852 km/hr
            double retVal = 0;
            double.TryParse(speedInKnots, out retVal);
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

        private DateTime BuildTimestamp(string timestamp)
        {
            try
            {
                //150525143028
                //mm/dd/yy hh:MM:ss
                string strTimestamp = String.Format("{0}/{1}/{2} {3}:{4}:{5}",
                        timestamp.Substring(2, 2), timestamp.Substring(4, 2), timestamp.Substring(0, 2),
                        timestamp.Substring(6, 2), timestamp.Substring(8, 2), timestamp.Substring(10, 2));
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
