using FMSWinSvc;
using HelperTools;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Protocols
{
    public class GG900
    {
        public GG900()
        {
        }

        public FMSWebApi.Models.PosInfo ParseData(string rawData)
        {
            FMSWebApi.Models.PosInfo newPos = new FMSWebApi.Models.PosInfo();

            try
            {
                #region RAW DATA
                /*
                0125$MGV002,860719020193193,DeviceName,R,240214,104742,A,2238.20471,N,11401.97967,E,00,03,00,1.20,0.462,356.23,137.9,1.5,460,07,262C,0F54,25,0000,0000,0,0,0,28.5,28.3,,,100,Timer;!
                 */
                #endregion
                //                     1,              2,3,4,     5,     6,7,        8,9,        10,11,12,13,14,  15,   16,    17,   18, 19, 20,21,  22,  23,24,  25,  26,  27,28,29,30,31,32,  33,34,   35,   
                //rawData = "0144$MGV002,354550050290655, ,S,150715,060252,A,2249.5312,N,11357.6643, E,00,09,00,1.01,0.000,  0.00, 37.3,0.0,   ,  ,    ,    ,  ,0000,0000,  20,10, 0,  ,  ,  , 1-0,34,Timer;!"
               //radData2 = "0162$MGV002,354550050290655, ,R,231115,082059,A,0119.9633,N,10353.7984, E,00,06,00,1.90,0.000,184.45,-29.8,0.0,525,05,01F6,195E,12,0000,0000,  20,10, 0,  ,  ,  , 1-0,72,Timer;!"
              //             0159$MGV002,354550050290655, ,R,231115,092823,A,0119.9444,N,10353.7627, E,00,08,00,1.18,0.000,  0.00, 35.6,0.0,525,05,01F6,195E,24,0000,0000,  22, 2, 0,  ,  ,  , 1-1,75,ACC ON;!
                string deviceID = "";
                //string cmd = "";
                //string newdata = "";
                string realData = "";

                //Logger.LogToEvent("GG900 RawData: " + rawData, System.Diagnostics.EventLogEntryType.Warning);

                if (rawData.Contains(Consts.GG900_HEAD))
                {
                    //get IMEI/Device ID
                    //deviceID = rawData.Substring(Consts.GG900_HEAD.Length, 16);
                    //newdata = rawData.Substring(Consts.GG900_HEAD.Length + deviceID.Length);

                    //cmd = Encoding.ASCII.GetString(rawData.Substring(0, )
                    //realData = rawData.Substring(rawData.IndexOf(Consts.GG900_DATA));

                    string[] arrData = rawData.Split(",".ToCharArray());

                    deviceID = arrData[1].Substring(0, 15);

                    //Logger.LogToEvent("GG900 DeviceID: " + deviceID, System.Diagnostics.EventLogEntryType.Warning);

                    if (arrData[6] == "A")
                    {
                        //Logger.LogToEvent("Valid GG900 Data: " + deviceID, System.Diagnostics.EventLogEntryType.Warning);

                        //string[] parsedData = rawData.Split(',');
                        DateTime tmpDT = new DateTime();
                        DateTime.TryParse(String.Format("{0}-{1}-{2} {3}:{4}:{5}",
                            arrData[4].Substring(0, 2), arrData[4].Substring(2, 2), arrData[4].Substring(4, 2),
                            arrData[5].Substring(0, 2), arrData[5].Substring(2, 2), arrData[5].Substring(4, 2)),
                            out tmpDT);
                        //Console.WriteLine(tmpDT.ToString());
                       // Logger.LogToEvent("Get Date & Time: " + tmpDT.ToString(), System.Diagnostics.EventLogEntryType.Warning);


                        Int32 tmpInt = new Int32();
                        Int32.TryParse(String.Format(arrData[24].Substring(0, 1)),
                            out tmpInt);
                   
                        newPos.Tag = deviceID;
                        newPos.RxTime = DateTime.UtcNow;
                        newPos.FixID = (arrData[6] == "A" ? 2 : 4);
                        newPos.Satellites = 0;
                        newPos.Timestamp = tmpDT;
                        newPos.PosY = BuildLatLong(arrData[7], arrData[8]);//parse latitude
                        newPos.PosX = BuildLatLong(arrData[9], arrData[10]);//parse longitude
                        //newPos.HDOP = BuildHDOP(arrData[14]); //parse HDOP
                        newPos.Speed = BuildSpeed(arrData[15]); //parse speed
                        newPos.Course = BuildCourse(arrData[16]);//parse course
                        newPos.PosZ = BuildAltitude(arrData[17]); //parse posz
                        newPos.Mileage = BuildMileage(arrData[18]); //parse mileage
                        //newPos.Mileage = Convert.ToDouble(arrData[18]); 
                        newPos.Battery = BuildBattery(arrData[33]);//parse battery
                       // newPos.Ignition = BuildIgnition(arrData[24]);// parse ignition
                        newPos.Ignition = tmpInt; 
                        Logger.LogToEvent("Valid GG900 Data Ignition: " + newPos.Ignition, System.Diagnostics.EventLogEntryType.Warning);
                    }
                }
            }
            catch (Exception ex)
            {

                Logger.LogToEvent("ParseData GG900: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
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
        private double BuildAltitude(string altitude)
        {
            double retVal = 0;
            double.TryParse(altitude, out retVal);
            return retVal;
        }

        private double BuildMileage(string mileage)
        {
            double retVal = 0;
            double.TryParse(mileage, out retVal);
            return retVal;
        }

        private double BuildHDOP(string hdop)
        {
            double retVal = 0;
            double.TryParse(hdop, out retVal);
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