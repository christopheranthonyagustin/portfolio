using FMSWebApi.Models;
using Newtonsoft.Json;
using Protocols;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Formatting;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;

namespace FMSWinSvcTester
{
    class Program
    {
        static void Main(string[] args)
        {
            //ParseData();

            RunAsyncWebApi().Wait();
            Console.ReadLine();
        }

        static async Task RunAsyncWebApi()
        {
            
            using (var client = new HttpClient())
            {
                HttpResponseMessage response;

                // New code:
                client.BaseAddress = new Uri("http://track.asiacom.co.th/fmswebapi/");
                client.DefaultRequestHeaders.Accept.Clear();
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                string apiUpdateAsset = "api/assetinfo?id=";
                string apiUpdateCompany = "api/companyinfo?id=";
                //http://track.asiacom.co.th/fmswebapi/api/assetinfo?id=59

                //response = await UpdateAssetInfo(client, apiUpdateAsset);

                response = await UpdateCompanyInfo(client, apiUpdateCompany);


                Console.ReadLine();

                //VehicleInfo vehInfo = new VehicleInfo();
                //vehInfo.driverId = "2973";
                //vehInfo.number = "861311002788718";

                //HttpResponseMessage response = await client.PostAsJsonAsync(apiUpdateDriver, vehInfo);
                //if (response.IsSuccessStatusCode)
                //{
                //    Console.WriteLine(response.Content.ReadAsStringAsync().Result);
                //}
                //else
                //{
                //    Console.WriteLine("failed");
                //}

                //DNDriverResponse driverInfo = new DNDriverResponse()
                //{
                //    DnNumber = "T00000004",
                //    Status = DNStatus.REJECTED
                //};

                //HttpResponseMessage response = await client.PostAsJsonAsync(apiDnDriverResponse, driverInfo);
                //if (response.IsSuccessStatusCode)
                //{
                //    Console.WriteLine(response.Content.ReadAsStringAsync().Result);
                //}
                //else
                //{
                //    Console.WriteLine("failed");
                //}
                //Console.ReadLine();

                //RequestInfo newInfo = new RequestInfo()
                //{
                //    token = "a7d746ae894b21465115b2fd65f1d4ae"
                //};

                //response = await client.PostAsJsonAsync(apiAllVehicleInformation, newInfo);
                //if (response.IsSuccessStatusCode)
                //{
                //    Console.WriteLine(response.Content.ReadAsStringAsync().Result);
                //}
                //Console.ReadLine();

                /*
                        udtPos.FixID, udtPos.Satellites, udtPos.PosX, udtPos.PosY, udtPos.PosZ, udtPos.Speed, udtPos.Course, 
                        udtPos.HDOP, udtPos.Ignition, udtPos.Mileage, udtPos.Battery, udtPos.Fuel, udtPos.Location, udtPos.LocID, 
                        udtPos.ZoneID, (udtPos.Remarks == null ? "" : udtPos.Remarks), udtPos.Engine, udtPos.Driver
                 */
                ////http://findfleet.w-locate.com/SamwohWebApi/api/Position
                //PosInfo gizmo = new PosInfo()
                //{
                //    Tag = "861311002788718",
                //    Timestamp = DateTime.UtcNow,
                //    RxTime = DateTime.UtcNow,
                //    FixID = 2,
                //    Satellites = 12,
                //    PosX = 103.938065,
                //    PosY = 1.381109,
                //    PosZ = 1.1,
                //    Speed = 10,
                //    Course = 98,
                //    HDOP = 2.9,
                //    Ignition = 1,
                //    Mileage = 1001.98,
                //    Remarks = "Testing from PC",
                //    Engine = "2",
                //    Driver = "2594"
                //};

                //response = await client.PostAsJsonAsync("api/Position", gizmo);
                //if (response.IsSuccessStatusCode)
                //{
                //    Console.WriteLine(response.Content.ReadAsStringAsync().Result);
                //}
                //else
                //{
                //    Console.WriteLine("failed");
                //}
                //Console.ReadLine();


                //client.BaseAddress = new Uri("http://findfleet.w-locate.com/SamwohWebApi/");
                //client.DefaultRequestHeaders.Accept.Clear();
                //client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                ////
                ////// New code:
                //HttpResponseMessage response = await client.GetAsync("api/onDnCreation/");
                //if (response.IsSuccessStatusCode)
                //{
                //    DNCreateInfo dnCreated = await response.Content.ReadAsAsync<DNCreateInfo>();
                //    Console.WriteLine("{0}\t${1}\t{2}", dnCreated.data.vehicleId, dnCreated.data.date, dnCreated.data.material);
                //    Console.ReadLine();
                //}
                //else
                //{
                //    Console.WriteLine("failed");
                //}

                Console.ReadLine();
            }
        }

        private static async Task<HttpResponseMessage> UpdateAssetInfo(HttpClient client, string url)
        {
            HttpResponseMessage response;
            /*
            cmd.Parameters.AddWithValue("@Name", currAsset.Name);
            cmd.Parameters.AddWithValue("@CategoryID", catId);
            cmd.Parameters.AddWithValue("@TagID", tagId);
            cmd.Parameters.AddWithValue("@CompanyID", coyId);
            cmd.Parameters.AddWithValue("@Phone", currAsset.Phone);
            cmd.Parameters.AddWithValue("@Email", currAsset.Email);
            cmd.Parameters.AddWithValue("@Home", currAsset.Home);
            cmd.Parameters.AddWithValue("@AlertZones", currAsset.AlertZones);
            cmd.Parameters.AddWithValue("@CurfewStart", currAsset.CurfewStart);
            cmd.Parameters.AddWithValue("@CurfewEnd", currAsset.CurfewEnd);
            cmd.Parameters.AddWithValue("@IdleLimit", 0);
            cmd.Parameters.AddWithValue("@SpeedLimit", 0);
            cmd.Parameters.AddWithValue("@Mileage", currAsset.Mileage);
            cmd.Parameters.AddWithValue("@MileageDist", 0);
            cmd.Parameters.AddWithValue("@MileageDate", DateTime.UtcNow);
            cmd.Parameters.AddWithValue("@Driver", currAsset.Driver);
            cmd.Parameters.AddWithValue("@Notifications", "");
            cmd.Parameters.AddWithValue("@InstallDate", DateTime.UtcNow);
            cmd.Parameters.AddWithValue("@AssetRemarks", currAsset.Remarks);
            cmd.Parameters.AddWithValue("@AssetID", currAsset.AssetID);
             */

            AssetInfo newInfo = new AssetInfo();
            newInfo.Name = "Thailand test";
            newInfo.CategoryID = 1;
            newInfo.TagID = 17;
            newInfo.Company = "Asiacom Co. Ltd.";
            newInfo.Phone = "94388982";
            newInfo.Email = "";
            newInfo.Home = 0;
            newInfo.AlertZones = "";
            newInfo.CurfewStart = new DateTime(2015, 05, 31, 7, 0, 0);
            newInfo.CurfewEnd = new DateTime(2015, 05, 31, 18, 0, 0);
            newInfo.Mileage = 0;
            newInfo.Driver = "Dante";
            newInfo.Remarks = "Testing from Console";

            response = await client.PutAsJsonAsync(String.Format("{0}{1}", url, 59), newInfo);
            if (response.IsSuccessStatusCode)
            {
                var jsonString = await response.Content.ReadAsStringAsync();
                //AssetInfo dnCreated = JsonConvert.DeserializeObject<AssetInfo>(jsonString);
                Console.WriteLine(JsonConvert.DeserializeObject<bool>(jsonString));
            }
            return response;
        }

        private static async Task<HttpResponseMessage> UpdateCompanyInfo(HttpClient client, string url)
        {
            /*
            cmd.Parameters.AddWithValue("@Name", currCompany.Name);
            cmd.Parameters.AddWithValue("@UserLimit", currCompany.UserLimit);
            cmd.Parameters.AddWithValue("@ZoneLimit", currCompany.ZoneLimit);
            cmd.Parameters.AddWithValue("@AssetLimit", currCompany.AssetLimit);
            cmd.Parameters.AddWithValue("@SmsLimit", currCompany.SmsLimit);
            cmd.Parameters.AddWithValue("@Reports", currCompany.Reports);
            cmd.Parameters.AddWithValue("@Flag", currCompany.Flag);
            cmd.Parameters.AddWithValue("@Categories", currCompany.Categories);
            cmd.Parameters.AddWithValue("@CompanyID", currCompany.CompanyID);
             */
            HttpResponseMessage response;

            CompanyInfo newInfo = new CompanyInfo();
            //newInfo.Name = "Asiacom Co. Ltd.";
            newInfo.Name = "Asiacom Co. Ltd.";            
            newInfo.UserLimit = 0;
            newInfo.ZoneLimit = 0;
            newInfo.AssetLimit = 0;
            newInfo.SmsLimit = 0;
            newInfo.Reports = "1,2,3,4,5,6,7,8,9,10,12,17";
            newInfo.Flag = 1;
            newInfo.Categories = "0,1,2,3,4,5,6";
            newInfo.CompanyID = 1;

            response = await client.PutAsJsonAsync(String.Format("{0}{1}", url, 1), newInfo);
            if (response.IsSuccessStatusCode)
            {
                var jsonString = await response.Content.ReadAsStringAsync();
                //AssetInfo dnCreated = JsonConvert.DeserializeObject<AssetInfo>(jsonString);
                Console.WriteLine(JsonConvert.DeserializeObject<bool>(jsonString));
            }
            return response;
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
                client.BaseAddress = new Uri("http://103.237.168.119/fmswebapi/");
                client.DefaultRequestHeaders.Accept.Clear();
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                GG400 devGg = new GG400();
                //var gizmo2 = devGg.ParseData(rawData);

                Coban103A devCoban = new Coban103A();
                var gizmo2 = devCoban.ParseData(rawData);

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
                        time.Substring(0, 2), time.Substring(2, 2), time.Substring(4, 2));
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
