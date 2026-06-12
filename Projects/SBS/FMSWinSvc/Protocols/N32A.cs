using FMSWinSvc;
using HelperTools;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Protocols
{
    public class N32A
    {
        public N32A()
        {
        }

        public FMSWebApi.Models.PosInfo ParseData(string rawData)
        {
            FMSWebApi.Models.PosInfo newPos = new FMSWebApi.Models.PosInfo();

            try
            {
                //                    0,        1,               2,       3,4,        5,6,     7,  8,09,10,11,    12,           13,14,15,      16,    17
                //rawData = "$$KHN$4.10,         , 862951026038613, 1.33168,N,103.89703,E,  0.00,  0, 1, 0, 1,      ,            0, 0, 0,11012016,102309";
                //rawData = "$$KHN$4.10,65L103841,         1000955,10.96536,N,106.93248,E,    37,100, 1, 0, 1,152115, 123456789012, 0, 0,07012016"
                //         $$KHN$4.01.1,         , 862951026046632, 1.33146,N,103.89646,E,  0.00,  0, 1, 1, 1,      ,            0, 0,155.61,21012016,100510

                string deviceID = "";

                Logger.LogToEvent("Get raw Data: " + rawData, System.Diagnostics.EventLogEntryType.Warning);//testing


                    string[] arrData = rawData.Split(",".ToCharArray());

                    DateTime tmpDT = new DateTime();
                    DateTime.TryParse(String.Format("{0}-{1}-{2} {3}:{4}:{5}",
                        arrData[16].Substring(0, 2), arrData[16].Substring(2, 2), arrData[16].Substring(4, 4),
                        arrData[17].Substring(0, 2), arrData[17].Substring(2, 2), arrData[17].Substring(4, 2)),
                        out tmpDT);


                    deviceID = arrData[2];
                    Logger.LogToEvent("Get DeviceID: " + deviceID, System.Diagnostics.EventLogEntryType.Warning);//testing


                        newPos.Tag = deviceID;
                        newPos.RxTime = DateTime.UtcNow;
                        newPos.FixID = (arrData[0] == "$$KHN$" ? 2 : 4);
                        newPos.Satellites = 0;
                        newPos.Timestamp = tmpDT;
                        Logger.LogToEvent("Get Timestamp: " + newPos.Timestamp, System.Diagnostics.EventLogEntryType.Warning);//testing
                        //newPos.PosY = BuildPosY(arrData[3]); ;//parse latitude
                        newPos.PosY = BuildPosY(arrData[3]);
                        Logger.LogToEvent("Get PosY: " + newPos.PosY, System.Diagnostics.EventLogEntryType.Warning);//testing
                        newPos.PosX = BuildPosX(arrData[5]);//parse longitude
                        Logger.LogToEvent("Get PosX: " + newPos.PosX, System.Diagnostics.EventLogEntryType.Warning);//testing
                        newPos.Speed = BuildSpeed2(arrData[7]); //parse speed

                        newPos.Course = BuildCourse(arrData[15]);//parse course
                        Logger.LogToEvent("Get Course: " + newPos.Course, System.Diagnostics.EventLogEntryType.Warning);//testing
                        // newPos.PosZ = BuildAltitude(arrData[13]);//parse altitude
                        //newPos.Battery = BuildBattery(arrData[18]);//parse battery
                        newPos.Ignition = BuildIgnition(arrData[9]);// parse ignition    
                        Logger.LogToEvent("Get Ignition: " + newPos.Ignition, System.Diagnostics.EventLogEntryType.Warning);//testing
                    

            }
            catch (Exception ex)
            {
                //LogToEvent("ParseData: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return newPos;
        }


        private double BuildPosY(string PosY)
        {
            double retVal = 0;
            double.TryParse(PosY, out retVal);
            return retVal;
        }

        private double BuildPosX(string PosX)
        {
            double retVal = 0;
            double.TryParse(PosX, out retVal);
            return retVal;
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


        private DateTime BuildTimestamp(string date, string time)
        {
            try
            {
                //11012016
                //mm/dd/yy hh:MM:ss
                string strTimestamp = String.Format("{0}/{1}/{2} {3}:{4}:{5}",
                        date.Substring(2, 2), date.Substring(0, 2), date.Substring(4, 4),
                        time.Substring(8, 2), time.Substring(10, 2), time.Substring(12, 2));
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
