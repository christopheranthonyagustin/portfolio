using FMSWinSvc;
using HelperTools;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Protocols
{
    public class AT07
    {
        public AT07()
        {
        }

        public FMSWebApi.Models.PosInfo ParseData(string rawData)
        {
            FMSWebApi.Models.PosInfo newPos = new FMSWebApi.Models.PosInfo();

            try
            {
                //             
                //rawData = "$$0108AA863835024426384|580060001603160731004009002100000000061134000003.100000000119.9226N10353.8008E010158"
                //

                string deviceID = "";
                Logger.LogToEvent("Get raw Data AT07: " + rawData, System.Diagnostics.EventLogEntryType.Warning);//testing

                if (rawData.Contains(Consts.AT07_HEAD))
                {
                    string[] arrData = rawData.Split("|".ToCharArray());
                    string actualData = arrData[1];

                    DateTime tmpDT = new DateTime();
                    DateTime.TryParse(String.Format("{0}-{1}-{2} {3}:{4}:{5}",
                        actualData.Substring(12, 2), actualData.Substring(10, 2), actualData.Substring(8, 2),
                        actualData.Substring(14, 2), actualData.Substring(16, 2), actualData.Substring(18, 2)),
                        out tmpDT);

                    deviceID = arrData[0].Substring(8,15);
                    int gpsStatus = ConvertHexToBinary2(actualData.Substring(12, 8));
                    Logger.LogToEvent("AT07 Get Real Data: " + actualData, System.Diagnostics.EventLogEntryType.Warning);
                    Logger.LogToEvent("gpsStatus: " + gpsStatus, System.Diagnostics.EventLogEntryType.Warning);


                        //863835024426384
                        //get IMEI/Device ID
                        newPos.Tag = deviceID;
                        Logger.LogToEvent("AT07 Check Raw Data deviceID: " + deviceID, System.Diagnostics.EventLogEntryType.Warning);
                        newPos.RxTime = DateTime.UtcNow;
                        //Logger.LogToEvent("AT07 Check Raw Data RxTime: " + newPos.RxTime, System.Diagnostics.EventLogEntryType.Warning);
                        newPos.Ignition = ConvertHexToBinary(actualData.Substring(12, 8));//parse ignition
                        Logger.LogToEvent("AT07 Check Raw Data Ignition: " + newPos.Ignition, System.Diagnostics.EventLogEntryType.Warning);
                        newPos.Timestamp = tmpDT;
                        Logger.LogToEvent("AT07 Check Raw Data Timestamp: " + newPos.Timestamp, System.Diagnostics.EventLogEntryType.Warning);
                        newPos.Battery = BuildBattery(actualData.Substring(20, 2));//parse battery
                        Logger.LogToEvent("AT07 Check Raw Data Battery: " + newPos.Battery, System.Diagnostics.EventLogEntryType.Warning);
                        newPos.Satellites = BuildSatellite(actualData.Substring(36, 2));
                        Logger.LogToEvent("AT07 Check Raw Data Satellites: " + newPos.Satellites, System.Diagnostics.EventLogEntryType.Warning);
                        newPos.FixID = (newPos.Satellites > 3 ? 2 : 1);
                        Logger.LogToEvent("AT07 Check Raw Data FixID: " + newPos.FixID, System.Diagnostics.EventLogEntryType.Warning);
                        newPos.Course = BuildCourse(actualData.Substring(40, 3)); //parse course
                        Logger.LogToEvent("AT07 Check Raw Data Course: " + newPos.Course, System.Diagnostics.EventLogEntryType.Warning);
                        newPos.Speed = BuildSpeed(actualData.Substring(43, 3)); //parse speed
                        Logger.LogToEvent("AT07 Check Raw Data Speed: " + newPos.Speed, System.Diagnostics.EventLogEntryType.Warning);
                        newPos.Mileage = BuildMileage(actualData.Substring(50, 7)); //parse mileage
                        Logger.LogToEvent("AT07 Check Raw Data Mileage: " + newPos.Mileage, System.Diagnostics.EventLogEntryType.Warning);
                        newPos.PosY = BuildLatLong(actualData.Substring(57, 9), actualData.Substring(66, 1)); //parse latitude
                        Logger.LogToEvent("Get PosY: " + newPos.PosY, System.Diagnostics.EventLogEntryType.Warning);//testing
                        newPos.PosX = BuildLatLong(actualData.Substring(67, 10), actualData.Substring(77, 1));//parse longitude
                        Logger.LogToEvent("Get PosX: " + newPos.PosX, System.Diagnostics.EventLogEntryType.Warning);//testing
                    
                }

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

        private double BuildMileage(string mileage)
        {
            double retVal = 0;
            double.TryParse(mileage, out retVal);
            return retVal;
        }

        private int BuildSatellite(string satellite)
        {
            int retVal = 0;
            int.TryParse(satellite, out retVal);
            return retVal;
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

        private double BuildFuel(string fuel)
        {
            double retVal = 0;
            double.TryParse(fuel, out retVal);
            return retVal;
        }
        private int BuildDoor(string door)
        {
            int retVal = 0;
            int.TryParse(door, out retVal);
            return retVal;
        }
        private int BuildAircon(string aircon)
        {
            int retVal = 0;
            int.TryParse(aircon, out retVal);
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

        private int ConvertHexToBinary(string HexValue)
        {
            //ulong number = UInt64.Parse(HexValue, System.Globalization.NumberStyles.HexNumber);

            //byte[] bytes = BitConverter.GetBytes(number);

            //string binaryString = string.Empty;
            //foreach (byte singleByte in bytes)
            //{
            //    binaryString += Convert.ToString(singleByte, 2);
            //}

            string binaryval = "";
            binaryval = Convert.ToString(Convert.ToInt32(HexValue, 16), 2);

            //Logger.LogToEvent("Get Binary: " + binaryString, System.Diagnostics.EventLogEntryType.Warning);

            //Convert string to int
            int retVal = 0;
            int.TryParse(binaryval.Substring(2, 1), out retVal);

            //Logger.LogToEvent("Get Int: " + retVal, System.Diagnostics.EventLogEntryType.Warning);



            return retVal;
        }

        private int ConvertHexToBinary2(string HexValue)
        {

            //ulong number = UInt64.Parse(HexValue, System.Globalization.NumberStyles.HexNumber);

            //byte[] bytes = BitConverter.GetBytes(number);

            //string binaryString = string.Empty;
            //foreach (byte singleByte in bytes)
            //{
            //    binaryString += Convert.ToString(singleByte, 2);
            //}
            string binaryval = "";
            binaryval = Convert.ToString(Convert.ToInt32(HexValue, 16), 2);

            Logger.LogToEvent("Get Binary: " + binaryval, System.Diagnostics.EventLogEntryType.Warning);

            //Convert string to int
            int retVal = 0;
            int.TryParse(binaryval.Substring(18, 1), out retVal);

            //Logger.LogToEvent("Get Int: " + retVal, System.Diagnostics.EventLogEntryType.Warning);



            return retVal;
        }


    }
}
