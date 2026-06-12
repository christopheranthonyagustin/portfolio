using FMSWebApi.Models;
using Newtonsoft.Json;
using Protocols;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;

namespace FMSWinSvcTester
{
    class Program
    {
        static void Main(string[] args)
        {
            ParseData();
           //string dante = "110000000001L09/07/15";
            //string king = "110000000001L11/07/15";
           //Console.WriteLine(king.Substring(19, 2));
           //Console.WriteLine(dante.Length);
            //string king = "L09/07/15";
            //Console.WriteLine(king);
            //Console.ReadLine();
        }

        

        private static void ParseData()
        {
            string rawData = "";


            //GG400 Device
            //Consume WebAPI
            //string rawData = "STX863070014951650 r$GPRMC,193025.584,A,0122.8905,N,10356.3237,E,000.0,000.0,170315,,,A*67,525,01,0030,2C45,22,100,1000,0011,100,Timer;03";
            //string rawData = "STX863070014951650 r$GPRMC,065323.635,A,0117.2120,N,10348.9658,E,000.0,026.8,150415,,,A*6D,525,01,004D,0D0E,17,100,1000,0001,100,Timer;73";
            rawData = "STX863070014951650 r$GPRMC,193025.584,A,0122.8905,N,10356.3237,E,000.0,000.0,170315,,,A*67,525,01,0030,2C45,22,100,1000,0011,100,Timer;03";


            //Coban Device
            rawData = "imei:359710048615695,tracker,150525143028,,F,143029.000,A,0122.8745,N,10356.3683,E,0.00,0,,1,0,0.00%,,;";

            //iRevo
            rawData = "110000000001L11/07/15,17:07:12,1.38183,103.93881,000,A,K,010,008";

            RunAsync(rawData).Wait();

            //string strTemp = "##,imei:359710048615695,A;";
            //strTemp = "359710048615695;";
            //if (strTemp.StartsWith("##")) Console.WriteLine("LOAD");// Send("LOAD", sockInfo.Socket, false);//[Dan:18May15]
            //else if (strTemp.Length == 16) Console.WriteLine("ON"); //Send("ON", sockInfo.Socket, false);//[Dan:18May15]
        }

        static async Task RunAsync(string rawData)
        {
            
            using (var client = new HttpClient())
            {
                
                //GG400 devGg = new GG400();
                //var gizmo2 = devGg.ParseData(rawData);

                //Coban103A devCoban = new Coban103A();
                //var gizmo2 = devCoban.ParseData(rawData);

                iRevo deviRevo = new iRevo();
                var gizmo2 = deviRevo.ParseData(rawData);

                client.BaseAddress = new Uri("http://103.237.168.119/tracksgwebapi/");
                client.DefaultRequestHeaders.Accept.Clear();
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                HttpResponseMessage response = await client.PostAsJsonAsync("api/posinfo/", gizmo2);
                if (response.IsSuccessStatusCode)
                {
                    // Get the URI of the created resource.
                    Uri gizmoUrl = response.Headers.Location;
                }
                else
                {
                    Console.WriteLine("failed");
                }

                Console.ReadLine();
            }
        }

        private static PosInfo ParseDataGG400(string rawData)
        {
            const string GG400WT_HEAD = "STX";
            /*
            STX863070014951650 Q$GPRMC,082446.00,V,,,,,,,170315,,,N*76,525,01,0074,2A72,23,100,0000,0001,99,Timer;0D
            STX863070014951650 R$GPRMC,082546.00,V,,,,,,,170315,,,N*76,525,01,0074,2A72,20,100,0000,0001,100,Timer;3D
            STX863070014951650 R$GPRMC,082646.00,V,,,,,,,170315,,,N*76,525,01,0074,2B7C,24,100,0000,0001,100,Timer;48
21:22:49	14.100.134.98:60289	STX863070014951650 r$GPRMC,132249.766,A,0122.8892,N,10356.3225,E,000.0,199.8,170315,,,A*63,525,01,0030,0399,26,100,1000,0001,100,Timer;79
21:23:49	14.100.134.98:60289	STX863070014951650 r$GPRMC,132348.766,A,0122.8889,N,10356.3187,E,000.0,000.3,170315,,,A*68,525,01,0030,0399,26,100,1000,0001,100,Timer;79
21:24:49	14.100.134.98:60289	STX863070014951650 r$GPRMC,132448.766,A,0122.8886,N,10356.3175,E,000.0,177.1,170315,,,A*68,525,01,0030,0399,26,100,1000,0001,100,Timer;7F
03:30:26	14.100.134.102:32906	STX863070014951650 r$GPRMC,193025.584,A,0122.8905,N,10356.3237,E,000.0,000.0,170315,,,A*67,525,01,0030,2C45,22,100,1000,0011,100,Timer;03//Ignition ON             
             */
            string deviceID = "";
            //string cmd = "";
            string newdata = "";
            string realData = "";

            PosInfo newPos = new PosInfo();
            if (rawData.Contains(GG400WT_HEAD))
            {
                //get IMEI/Device ID
                deviceID = rawData.Substring(GG400WT_HEAD.Length, 16);
                newdata = rawData.Substring(GG400WT_HEAD.Length + deviceID.Length);

                //cmd = Encoding.ASCII.GetString(rawData.Substring(0, )
                realData = rawData.Substring(rawData.IndexOf("$GPRMC"));

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

            return newPos;
        }

        private static int BuildIgnition(string ignition)
        {
            char[] arrInputs = ignition.ToCharArray();
            int retVal = 0;
            int.TryParse(arrInputs[2].ToString(), out retVal);
            return retVal;
        }

        private static int BuildBattery(string batt)
        {
            int retVal = 0;
            int.TryParse(batt, out retVal);
            return retVal;
        }

        private static double BuildCourse(string course)
        {
            double retVal = 0;
            double.TryParse(course, out retVal);
            return retVal;
        }

        private static double BuildSpeed(string speedInKnots)
        {
            //1 knot = 1.852 km/hr
            double retVal = 0;
            double.TryParse(speedInKnots, out retVal);
            return retVal * 1.852;
        }

        private static double BuildLatLong(string strDms, string strHemisphere)
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

        private static DateTime BuildTimestamp(string time, string date)
        {
            try
            {
                string strTimestamp = String.Format("{0}/{1}/{2} {3}:{4}:{5}",
                        date.Substring(2, 2), date.Substring(0, 2), date.Substring(4, 2),
                        time.Substring(0, 2), time.Substring(4, 2), time.Substring(6, 2));
                return DateTime.Parse(strTimestamp, System.Globalization.CultureInfo.CreateSpecificCulture("en-US"));
            }
            catch
            {
                return new DateTime(2000, 1, 1, 0, 0, 0);
            }
        }

        public string ConvertHexToString(string HexValue)
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
