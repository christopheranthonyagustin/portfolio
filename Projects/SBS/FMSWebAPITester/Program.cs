using MySql.Data.MySqlClient;
using FMSWebApi.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net.Http;
using System.Net.Http.Headers;
using Newtonsoft.Json;

namespace FMSWebAPITester
{
    class Program
    {
        static void Main(string[] args)
        {
            //GetAssets();

            RunAsyncWebApi().Wait();
        }


        static async Task RunAsyncWebApi()
        {

            using (var client = new HttpClient())
            {
                HttpResponseMessage response;

                // New code:
                client.BaseAddress = new Uri("http://track.asiacom.co.th/WebApi/TestSite/");
                //client.BaseAddress = new Uri("http://track.asiacom.co.th/fmswebapi/");
                client.DefaultRequestHeaders.Accept.Clear();
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                string apiUpdateAsset = "api/assetinfo?id=";
                string apiUpdateCompany = "api/companyinfo?id=";
                string apiUpdateZone = "api/zoneinfo?id=";
                string apiUpdateUser = "api/userinfo?id=";
                string apiGetPosArr = "api/posinfo?id=";
                string apiLoginUser = "api/login";

                string apiGetPosTimestamp = "api/posinfo";
                //http://103.237.168.119/WebApi/TestSite/api/login
                //http://track.asiacom.co.th/fmswebapi/api/assetinfo?id=59
                //response = await UpdateAssetInfo(client, apiUpdateAsset);
                //response = await UpdateZoneInfo(client, apiUpdateZone);
                //response = await UpdateCompanyInfo(client, apiUpdateCompany);
                //response = await UpdateUserInfo(client, apiUpdateUser);
                //response = await GetPosInfo(client, apiGetPosArr);
                response = await LoginUserInfo(client, apiLoginUser);
                

                Console.ReadLine();

                

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

        private static async Task<HttpResponseMessage> LoginUserInfo(HttpClient client, string url)
        {
            HttpResponseMessage response;

            UserInfo newInfo = new UserInfo();
            newInfo.User = "systemacecom";
            newInfo.Password = "acecome2015";

            response = await client.PostAsJsonAsync(String.Format("{0}", url), newInfo);
            //response = await client.GetAsync(String.Format("{0}", url));
            if (response.IsSuccessStatusCode)
            {
                var jsonString = await response.Content.ReadAsStringAsync();
                //AssetInfo dnCreated = JsonConvert.DeserializeObject<AssetInfo>(jsonString);
                Console.WriteLine(JsonConvert.DeserializeObject<UserInfo>(jsonString));
            }
            return response;
        }


        private static async Task<HttpResponseMessage> GetPosInfo(HttpClient client, string url)
        {
            HttpResponseMessage response;
            PosInfo gizmo = new PosInfo()
            {
                Tag = "861311002788718",
                Timestamp = DateTime.UtcNow,
                RxTime = DateTime.UtcNow,
                FixID = 2,
                Satellites = 12,
                PosX = 103.938065,
                PosY = 1.381109,
                PosZ = 1.1,
                Speed = 10,
                Course = 98,
                HDOP = 2.9,
                Ignition = 1,
                Mileage = 1001.98,
                Remarks = "Testing from PC",
                Engine = "2",
                Driver = "2594"
            };

            response = await client.GetAsync(String.Format("{0}{1}", url, 1));
            if (response.IsSuccessStatusCode)
            {
                var jsonString = await response.Content.ReadAsStringAsync();
                //AssetInfo dnCreated = JsonConvert.DeserializeObject<AssetInfo>(jsonString);
                Console.WriteLine(JsonConvert.DeserializeObject<bool>(jsonString));
            }
            return response;
        }

        private static async Task<HttpResponseMessage> UpdateUserInfo(HttpClient client, string url)
        {
            HttpResponseMessage response;
            /*
            cmd.Parameters.AddWithValue("@Name", currUser.Name);
            cmd.Parameters.AddWithValue("@UserName", currUser.User);
            cmd.Parameters.AddWithValue("@Password", currUser.Password);
            cmd.Parameters.AddWithValue("@RoleID", roleId);
            cmd.Parameters.AddWithValue("@Phone", currUser.Phone);
            cmd.Parameters.AddWithValue("@Email", currUser.Email);
            cmd.Parameters.AddWithValue("@CompanyId", coyId);
            cmd.Parameters.AddWithValue("@Assets", currUser.Assets);
            cmd.Parameters.AddWithValue("@Notifications", currUser.Notifications);
            cmd.Parameters.AddWithValue("@LoginRetry", currUser.LoginRetry);
            cmd.Parameters.AddWithValue("@Reports", currUser.Reports);
            cmd.Parameters.AddWithValue("@LanguageID", langId);
            cmd.Parameters.AddWithValue("@ApiKey", currUser.ApiKey);
             */

            UserInfo newInfo = new UserInfo();
            newInfo.Name = "Administrator";
            newInfo.User = "systemacecom";
            newInfo.Password = "1F2236B682A074DEBBEE8D48098667C0";
            newInfo.RoleID = 1;
            newInfo.Phone = "";
            newInfo.Email = "";
            newInfo.CompanyID = 1;
            //newInfo.Assets = "";
            newInfo.Notifications = "";
            newInfo.LoginRetry = "10";
            newInfo.Reports = "";
            newInfo.LanguageID = 1;
            newInfo.ApiKey = "w46Ei61OlkaFiF9Sf58yTg";

            response = await client.PutAsJsonAsync(String.Format("{0}{1}", url, 1), newInfo);
            if (response.IsSuccessStatusCode)
            {
                var jsonString = await response.Content.ReadAsStringAsync();
                //AssetInfo dnCreated = JsonConvert.DeserializeObject<AssetInfo>(jsonString);
                Console.WriteLine(JsonConvert.DeserializeObject<bool>(jsonString));
            }
            return response;
        }

        private static async Task<HttpResponseMessage> UpdateZoneInfo(HttpClient client, string url)
        {
            HttpResponseMessage response;
            /*
            cmd.Parameters.AddWithValue("@Name", currZone.Name);
            cmd.Parameters.AddWithValue("@TypeID", currZone.TypeID);
            cmd.Parameters.AddWithValue("@Perimeter", currZone.Perimeter);
            cmd.Parameters.AddWithValue("@CellIds", currZone.CellIds);
            cmd.Parameters.AddWithValue("@Location", currZone.Location);
            cmd.Parameters.AddWithValue("@CompanyID", coyId);
            cmd.Parameters.AddWithValue("@CreatedDate", currZone.CreatedDate);
            cmd.Parameters.AddWithValue("@LastModified", DateTime.UtcNow);
            cmd.Parameters.AddWithValue("@ModifiedID", currZone.Modified_UserID);
            cmd.Parameters.AddWithValue("@ModifiedName", currZone.Modified_User);
            cmd.Parameters.AddWithValue("@ZoneID", currZone.ZoneID);
             */

            ZoneInfo newInfo = new ZoneInfo();
            newInfo.Name = "Thailand Zone Test";
            newInfo.TypeID = 1;
            newInfo.Perimeter = "14.040672893673618,100.06759643554688 14.136575651477944,100.07171630859375 14.12325823495085,100.39306640625 14.019355706886051,100.35186767578125 14.032679180892865,100.24337768554688 13.720708401412068,100.11566162109375 14.032679180892865,100.162353515625";
            newInfo.CellIds = "";
            newInfo.Location = "";
            newInfo.CompanyID = 1;
            newInfo.Modified_UserID = 1;
            newInfo.Modified_User = "Dante";
            newInfo.ZoneID = 0;

            response = await client.PutAsJsonAsync(String.Format("{0}{1}", url, 24), newInfo);
            if (response.IsSuccessStatusCode)
            {
                var jsonString = await response.Content.ReadAsStringAsync();
                //AssetInfo dnCreated = JsonConvert.DeserializeObject<AssetInfo>(jsonString);
                Console.WriteLine(JsonConvert.DeserializeObject<bool>(jsonString));
            }
            return response;
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
            newInfo.TagID = 11;//17
            newInfo.Company = "Asiacom Co. Ltd.";
            newInfo.Phone = "94388982";
            newInfo.Email = "";
            newInfo.Home = 0;
            newInfo.AlertZones = "";
            newInfo.CurfewStart = new DateTime(2015, 06, 1, 7, 0, 0);
            newInfo.CurfewEnd = new DateTime(2015, 06, 1, 18, 0, 0);
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
            newInfo.UserLimit = 1000;
            newInfo.ZoneLimit = 0;
            newInfo.AssetLimit = 0;
            newInfo.SmsLimit = 0;
            newInfo.Reports = "1,2,3,4,5,6,7,8,9,10,12,17";
            newInfo.Flag = FMSWebApi.Enums.Status.Enabled;
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

        private static void GetAssets()
        {
            MySqlConnection conn;
            MySqlCommand cmd;
            List<AssetInfo> customers = new List<AssetInfo>();

            //string myConnectionString = "server=127.0.0.1;uid=root;pwd=12345;database=test;";
            string myConnectionString = "server=103.237.168.119;uid=root;pwd=@c3c0M;database=tracksg;";

            try
            {
                conn = new MySqlConnection();
                cmd = new MySqlCommand();

                conn.ConnectionString = myConnectionString;
                conn.Open();

                cmd.CommandText = "view_assets";
                cmd.Connection = conn;
                cmd.CommandType = CommandType.TableDirect;
                MySqlDataReader dbRdr = cmd.ExecuteReader();

                //Console.WriteLine(String.Format("Total Data: {0}", dbRdr.FieldCount));

                if ((dbRdr != null) && (dbRdr.HasRows))
                {
                    while (dbRdr.Read())
                    {
                        while (dbRdr.Read())
                        {
                            AssetInfo currAsset = new AssetInfo();

                            BuildAsset(dbRdr);

                            customers.Add(currAsset);
                        }
                        //Console.WriteLine(String.Format("Total Data: {0}Data1:{0}\r\nData2:{1}", reader[0], reader[1]));
                    }
                }

                conn.Close();
                Console.ReadLine();
            }
            catch (MySqlException ex)
            {
                //FMSHelper.LogEvent(mProjName, ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
        }

        /// <summary>
        /// builds asset info from database record
        /// </summary>
        /// <param name="dbRdr"></param>
        /// <param name="strImage"></param>
        /// <returns></returns>
        private static AssetInfo BuildAsset(MySqlDataReader dbRdr)
        {
            AssetInfo udtAsset = new AssetInfo();
            try
            {
                // check assigned tag
                string strTag = dbRdr.ToString("tag");
                if (strTag == "") strTag = "--";

                // get curfew times
                DateTime dtStart = dbRdr.ToDateTime("curfew_start");
                DateTime dtEnd = dbRdr.ToDateTime("curfew_end");

                // adjust curfew times
                dtStart = Convert.ToDateTime(String.Format("{0:dd-MMM-yy} {1:HH:mm:ss}", DateTime.Now, dtStart));
                dtEnd = Convert.ToDateTime(String.Format("{0:dd-MMM-yy} {1:HH:mm:ss}", DateTime.Now, dtEnd));
                if (dtStart > dtEnd)
                    dtEnd = dtEnd.AddDays(1.0);

                // set asset parameters
                udtAsset.AssetID = dbRdr.ToInt32("asset_id");
                udtAsset.Name = dbRdr.ToString("name");
                udtAsset.CategoryID = dbRdr.ToInt32("category_id");
                udtAsset.Phone = dbRdr.ToString("phone");
                udtAsset.Email = dbRdr.ToString("email");
                udtAsset.Home = dbRdr.ToInt32("home");
                udtAsset.AlertZones = dbRdr.ToString("restricted");

                //udtAsset.Category = dbRdr.ToString("category_desc");
                udtAsset.TagID = dbRdr.ToInt32("tag_id");
                udtAsset.Tag = strTag;
                udtAsset.Phone = dbRdr.ToString("tagphone");
                //udtAsset.IdleLimit = dbRdr.ToDouble("idle_limit");
                //udtAsset.SpeedLimit = dbRdr.ToDouble("speed_limit");
                //udtAsset.BaseMileage = dbRdr.ToDouble("base_mileage");
                udtAsset.Mileage = dbRdr.ToDouble("mileage");
                //udtAsset.MileageDist = Math.Abs(dbRdr.ToDouble("mileage_dist"));
                //udtAsset.MileageDate = dbRdr.ToDateTime("mileage_date");
                //udtAsset.CompanyID = dbRdr.ToInt32("company_id");
                udtAsset.Company = dbRdr.ToString("company");
                udtAsset.Driver = dbRdr.ToString("driver");
                
                //udtAsset.Email = dbRdr.ToString("email");
                //udtAsset.Notifications = dbRdr.ToString("notifications");
                
                
                udtAsset.CurfewStart = dtStart;
                udtAsset.CurfewEnd = dtEnd;
                // udtAsset.Timestamp = dbRdr.ToDateTime("timestamp");
                udtAsset.Temperature = 0.0;
                udtAsset.Temperature2 = 0.0;
                udtAsset.RFID = "";
                try
                {
                    udtAsset.Temperature = dbRdr.ToDouble("temperature");
                    udtAsset.Temperature2 = dbRdr.ToDouble("temperature2");
                    udtAsset.RFID = dbRdr.ToString("rfid");
                }
                catch { }

                // get asset image
                string strFill = "";
                //udtAsset.Image = GetImage(String.Format("assets/{0}", udtAsset.AssetID), strImage, ref strFill);
                udtAsset.ImageFill = strFill;

                // initialize asset status
                udtAsset.StatusID = dbRdr.ToInt32("status_id");
                udtAsset.Status = dbRdr.ToString("status_desc");
                udtAsset.StatusEx = dbRdr.ToString("status_ex");
                udtAsset.Remarks = "";
                udtAsset.AlertLevel = 0;
                udtAsset.Ignition = dbRdr.ToInt32("ignition");
                //udtAsset.Gps = 2;
                //udtAsset.Gprs = 2;

                //// initialize last event / position
                ////[Chinky:14Nov2014] Added Try/Catch 
                //try
                //{
                //    udtAsset.LastEventID = dbRdr.ToInt64("last_event");
                //    udtAsset.LastEnterID = dbRdr.ToInt64("last_enter");
                //    udtAsset.LastExitID = dbRdr.ToInt64("last_exit");
                //    udtAsset.LastPosID = dbRdr.ToInt64("last_pos");
                //    udtAsset.LastFixID = dbRdr.ToInt64("last_fix");
                //    udtAsset.LastGpsID = dbRdr.ToInt64("last_gps");
                //    udtAsset.LastIdle = dbRdr.ToDateTime("last_idle");
                //    udtAsset.LastMove = dbRdr.ToDateTime("last_move"); //GetAssetInfoTimeStamp(PosInfoType.Move, udtAsset.AssetID);
                //}
                //catch (Exception ex)
                //{
                //    DatabaseMgr.LogError(ex.Message, "Initialize Event/Position");
                //}

                //// initialize activity list
                //udtAsset.Activities = new List<ActivityInfo>();
                //udtAsset.Trips = new List<TripInfo>();
                ////udtAsset.TapInfo = GetZoneTapInfo(udtAsset.Tag);
                //udtAsset.RFID_Status = 0;
                //udtAsset.InstallDate = dbRdr.ToDateTime("install_date");
                //udtAsset.InstallRemarks = dbRdr.ToString("asset_remarks");


            }
            catch (Exception ex)
            {
                //// log error
                //DatabaseMgr.LogError(ex.Message, "BuildAsset: Error:");
            }
            return udtAsset;
        }
    }
}
