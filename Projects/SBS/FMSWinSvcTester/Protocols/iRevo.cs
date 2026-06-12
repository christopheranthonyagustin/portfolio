using FMSWinSvc;
using FMSWinSvcTester.HelperTools;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Protocols
{
    public class iRevo
    {
        public iRevo()
        {
        }

        public FMSWebApi.Models.PosInfo ParseData(string rawData)
        {
            FMSWebApi.Models.PosInfo newPos = new FMSWebApi.Models.PosInfo();

            try
            {

                #region RAW DATA
                /*
                                1,       2,      3,        4,  5,6,7,  8,  9
            110000000001L09/07/15,07:35:46,1.34385,103.85624,040,A,K,010,008
            L09/07/15,07:36:46,1.34327,103.86151,060,A,K,010,008
            L09/07/15,07:37:47,1.34310,103.87065,072,A,K,010,008
            L09/07/15,07:38:47,1.34436,103.87718,000,A,K,010,008
            L09/07/15,07:39:47,1.34226,103.88107,064,A,K,010,008
            L09/07/15,07:40:47,1.34101,103.88439,000,A,K,010,008
            VehicleID12:LDate,Time,Latitude,Longtitude,Speed,GPS Status,Key On Status, Event, Event Value
             */
                #endregion
                //                                         1,      2,       3,  4,5,6,  7,  8
                //rawData = "110000000001L09/07/15,07:35:46,1.34385,103.85624,040,A,K,010,008";
                string deviceID = "";
                //string cmd = "";
                string newdata = "";
                //string realData = "";


                //LogToEvent("iRevo RawData: " + rawData, System.Diagnostics.EventLogEntryType.Information);


                if (rawData.Contains(Consts.iRevo_HEAD))
                {
                    string[] arrData = rawData.Split(",".ToCharArray());


                    //get IMEI/Device ID
                    deviceID = arrData[0].Substring(0, 12);
                    newdata = rawData.Substring(Consts.iRevo_HEAD.Length + deviceID.Length);

                    //cmd = Encoding.ASCII.GetString(rawData.Substring(0, )
                    //realData = rawData.Substring(rawData.IndexOf(Consts.iRevo_DATA));                


                    if (deviceID.Length == 12)
                        {

                            if (arrData[5] == "A")
                            {


                                newPos.Tag = deviceID;
                                newPos.RxTime = DateTime.UtcNow;
                                newPos.FixID = (arrData[5] == "A" ? 2 : 4);
                                newPos.Satellites = 0;
                                newPos.Timestamp = BuildTimestamp(arrData[0], arrData[1]);
                                newPos.PosY = Convert.ToDouble(arrData[2]);
                                newPos.PosX = Convert.ToDouble(arrData[3]);
                                newPos.Speed = BuildSpeed(arrData[4]); //parse speed
                                newPos.Ignition = BuildIgnition(arrData[6]);// parse ignition                      


                            }
                        }
                    
                }
            }
            catch (Exception ex)
            {

               // LogToEvent("ParseData: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }

            return newPos;
        }

        private void LogToEvent(string p, System.Diagnostics.EventLogEntryType eventLogEntryType)
        {
            throw new NotImplementedException();
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
                string strTimestamp = String.Format("{0}/{1}/{2} {3}:{4}:{5}",
                        date.Substring(13, 2), date.Substring(16, 2), date.Substring(19, 2),
                        time.Substring(0, 2), time.Substring(3, 2), time.Substring(6, 2));
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