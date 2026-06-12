using FmsWcf;
using FMSWebApi.Bing;
using FMSWebApi.MapQuest;
using FMSWebApi.Here;
using FMSWebApi.GeoFarm;
using FMSWebApi.Models;
using FMSWebApi.Properties;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
using System.Net;
using System.IO;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Net.Http.Formatting;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;
using System.Threading;

namespace FMSWebApi
{
    public class VehTools
    {
        private static string mConnStr = Settings.Default.DB;
        private string mProjName = "FMS-Singapore";
        private static int GoogleRevGeoCount = 0;
        public static Enums.Engine GetEngineStatus(PosInfo currPos, AssetInfo currAsset)
        {
            return GetEngineStatus(currPos.Ignition, currPos.Speed, currPos.Timestamp, currAsset.LastMove);
        }
        public static Enums.Engine GetEngineStatus(int vehIgnition, double vehSpeed, DateTime currTimestamp, DateTime lastMove)
        {
            Enums.Engine retStatus = Enums.Engine.STOP;

            try
            {
                // check engine status
                int iEngine = (vehIgnition == 0 ? 0 : (vehSpeed > 0 ? 2 : 1));
                if ((iEngine == 2) && (vehSpeed < Consts.MIN_SPEED))
                {
                    // check if idling
                    TimeSpan tsDiff = currTimestamp - lastMove;
                    if (tsDiff.TotalMinutes < 3)
                        iEngine = 1;
                }
            }
            catch(Exception ex)
            {
                Logger.LogEvent("GetEngineStatus ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return retStatus;
        }
        public static void ApplyOneMapReverseGeocode(AssetInfo udtAsset, PosInfo udtPos, PosInfo udtPrev)
        {
            Enums.Engine currEngine = GetEngineStatus(udtPos.Ignition, udtPos.Speed, udtPos.Timestamp, udtAsset.LastMove);

            ////initialize default
            //udtPos.LocID = 0;
            //udtPos.Location = Settings.Default.Country;

            ////use last pos if available
            //if (udtPrev != null && udtPrev.FixID > 0)
            //{
            //    udtPos.LocID = udtPrev.LocID;
            //    udtPos.Location = udtPrev.Location;
            //}

            try
            {
                //TODO: Apply reverse geocode even when STOP; Need to change when more than 5 vehicles
                switch (currEngine)
                {
                    case Enums.Engine.IDLE:
                    case Enums.Engine.MOVE:
                    case Enums.Engine.STOP:
                        {
                            // round off coordinates
                            double lLatitude = Math.Round(udtPos.PosY, 6);
                            double lLongitude = Math.Round(udtPos.PosX, 6);


                            // parse reverse geocode
                            udtPos.Location = GetOneMap(lLatitude, lLongitude, udtAsset.CompanyID);
                            udtPos.LocID = 0;
                            //Logger.LogEvent("ApplyOneMapReverseGeocode Locations: " + udtPos.Location, System.Diagnostics.EventLogEntryType.Warning);
                            if (udtPos.Location.Length == 0 || udtPos.Location.Equals("") || udtPos.Location.Equals("Atlas Buoy 0.00E 0.00N")) udtPos.Location = "ZERO_RESULTS";
                            else if (lLatitude == 0 && lLongitude == 0) udtPos.Location = "No Coordinates";


                            //// limit location string length
                            //if (udtPos.Location.Length > 100)
                            //    udtPos.Location = udtPos.Location.Substring(0, 100);

                            //log to file for reference
                            //GoogleRevGeoCount++;
                            //Logger.LogToFile(string.Format("{0}\tGoogleCount: {1}", DateTime.Now, GoogleRevGeoCount.ToString()), "RevGeocodeLog.txt");

                        }
                        break;
                    default://already handled in initialize part
                        Logger.LogEvent("ApplyOneMapReverseGeocode: switch fall into Default: " + currEngine.ToString(), System.Diagnostics.EventLogEntryType.Information);//testing

                        break;
                }
            }
            //catch (Exception ex)
            //{
            //    Logger.LogEvent("ApplyOneMapReverseGeocode ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);

            //    if (ex.InnerException != null)
            //    {
            //        Logger.LogEvent("ApplyOneMapReverseGeocode InnerException: " + ex.InnerException, System.Diagnostics.EventLogEntryType.Error);
            //    }
            //}
            catch (WebException e)
            {
                if (e.Status == WebExceptionStatus.ProtocolError)
                {
                    WebResponse resp = e.Response;
                    using (StreamReader sr = new StreamReader(resp.GetResponseStream()))
                    {
                        Logger.LogEvent("ApplyOneMapReverseGeocode WebException: " + sr, System.Diagnostics.EventLogEntryType.Error);
                    }
                }

                if (e.InnerException != null)
                {
                    Logger.LogEvent("ApplyOneMapReverseGeocode InnerException: " + e.InnerException, System.Diagnostics.EventLogEntryType.Error);
                }
            }
        }
        public static void ApplyReverseGeocode(AssetInfo udtAsset, PosInfo udtPos, PosInfo udtPrev)
        {
            Enums.Engine currEngine = GetEngineStatus(udtPos.Ignition, udtPos.Speed, udtPos.Timestamp, udtAsset.LastMove);

            //initialize default
            udtPos.LocID = 0;
            udtPos.Location = Settings.Default.Country;

            //use last pos if available
            if (udtPrev != null && udtPrev.FixID > 0)
            {
                udtPos.LocID = udtPrev.LocID;
                udtPos.Location = udtPrev.Location;
            }

            try
            {
                //TODO: Apply reverse geocode even when STOP; Need to change when more than 5 vehicles
                switch (currEngine)
                {
                    case Enums.Engine.IDLE:
                    case Enums.Engine.MOVE:
                    case Enums.Engine.STOP:
                        {
                            // round off coordinates
                            double lLatitude = Math.Round(udtPos.PosY, 6);
                            double lLongitude = Math.Round(udtPos.PosX, 6);


                            // parse reverse geocode
                            udtPos.Location = GetLocationIQ(lLatitude, lLongitude);
                            udtPos.LocID = 0;

                            if (udtPos.Location.Length == 0) udtPos.Location = "Singapore";

                            //// limit location string length
                            //if (udtPos.Location.Length > 100)
                            //    udtPos.Location = udtPos.Location.Substring(0, 100);

                            //log to file for reference
                            //GoogleRevGeoCount++;
                            //Logger.LogToFile(string.Format("{0}\tGoogleCount: {1}", DateTime.Now, GoogleRevGeoCount.ToString()), "RevGeocodeLog.txt");

                        }
                        break;
                    default://already handled in initialize part
                        Logger.LogEvent("ApplyReverseGeocode: switch fall into Default: " + currEngine.ToString(), System.Diagnostics.EventLogEntryType.Information);//testing

                        break;
                }
            }
            catch(Exception ex)
            {
                Logger.LogEvent("ApplyReverseGeocode ERROR: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);

                if (ex.InnerException != null)
                {
                    Logger.LogEvent("ApplyReverseGeocode InnerException: " + ex.InnerException, System.Diagnostics.EventLogEntryType.Error);
                }
            }
        }
        private static string GetGoogleAddress(double lat, double lon)
        {
            string retAddress = "";

            try
            {
                GoogleGeoCodeResponse revGeocodeRes = GoogleReverseGeocode(lat, lon);
                if (revGeocodeRes.status == "OK")
                {
                    if (revGeocodeRes.results != null)
                    {
                        foreach (results currResult in revGeocodeRes.results)
                        {                    
                            var address = Encoding.UTF8.GetBytes(currResult.formatted_address);
                            var bytes = Encoding.UTF8.GetString(address);
                            //Logger.LogEvent("Get formatted_address TRACK Singapore: " + bytes, System.Diagnostics.EventLogEntryType.Error);
                            retAddress = bytes;
                        }
                    }
                }
                else
                {
                    retAddress = revGeocodeRes.status;
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent("GetGoogleAddress Error: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);

            }
            return retAddress;
        }
        private static GoogleGeoCodeResponse GoogleReverseGeocode(double lat, double lon)
        {
            GoogleGeoCodeResponse retResponse = new GoogleGeoCodeResponse();
            try
            {
                
                //var address = String.Format("https://maps.googleapis.com/maps/api/geocode/json?latlng={0},{1}&result_type=street_address&key={2}", lat, lon, apiKey);
                //const String clientID = "gme-skymapglobalpteltd";
                //const String key = "zhS30RlIryjJfBVZVCNSybCObBI=";

                //const String clientID = "gme-wlocatepteltd";
                //const String key = "vV03WX7p_9aEpF3udv_p7aX6m14=";
			    const String clientID = "gme-acecomtechnologies";
                const String key = "mX2Q9L9WwcYYMdUF5nJqpWz31aY=";
                string language = "en";
                //var urlRequest = String.Format("/maps/api/geocode/json?latlng={0},{1}&result_type=street_address%7Croute&language={2}&client={3}", lat, lon, language, clientID);
                var urlRequest = String.Format("/maps/api/geocode/json?latlng={0},{1}&result_type=street_address%7Croute&language={2}&client={3}", lat, lon, language, clientID);

                HMACSHA1 myhmacsha1 = new HMACSHA1();
                myhmacsha1.Key = Convert.FromBase64String(key);
                var hash = myhmacsha1.ComputeHash(Encoding.ASCII.GetBytes(urlRequest));

                var url = String.Format("http://maps.googleapis.com{0}&signature={1}", urlRequest, Convert.ToBase64String(hash).Replace("+", "-").Replace("/", "_"));
                var request = (HttpWebRequest)HttpWebRequest.Create(url);          


                var result = new System.Net.WebClient().DownloadString(url);
                JavaScriptSerializer jss = new JavaScriptSerializer();

                string utf8_String = result;
                byte[] bytes = Encoding.Default.GetBytes(utf8_String);
                var myString = Encoding.UTF8.GetString(bytes);
         
                retResponse = jss.Deserialize<GoogleGeoCodeResponse>(myString);

            }
            catch (Exception ex)
            {
                Logger.LogEvent("GoogleReverseGeocode Error: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return retResponse;
        }		
		private static string GetMapQuestAddress(double lat, double lon)
        {
            string retAddress = "";

            try
            {
                MapQuestGeoCodeResponse revMapQuestGeocodeRes = MapQuestReverseGeocode(lat, lon);

                    if (revMapQuestGeocodeRes.results != null)
                    {
                        foreach (result currResult in revMapQuestGeocodeRes.results)
                        {
                            retAddress = currResult.locations[0].street + " " + currResult.locations[0].postalCode;
                        }
                    }

            }
            catch (Exception ex)
            {
                Logger.LogEvent("GetMapQuestAddress Error: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);

            }
            return retAddress;
        }
        private static MapQuestGeoCodeResponse MapQuestReverseGeocode(double lat, double lon)
        {
            MapQuestGeoCodeResponse retResponse = new MapQuestGeoCodeResponse();
            try
            {

                //string apiKey = "emM7X38xWbptAJt6iZReJPlFuiX7nUrh";//Map Quest
                string apiKey = "Xap4CDGAu3taATJh8k1MTAYFeBqF2OMZ";//Map Quest - TRACK SG API
                var address = String.Format("http://open.mapquestapi.com/geocoding/v1/reverse?key={2}&location={0},{1}", lat, lon, apiKey);
                //var address = String.Format("http://open.mapquestapi.com/nominatim/v1/reverse.php?format=json&lat={0}&lon={1}", lat, lon, apiKey);
                var result = new System.Net.WebClient().DownloadString(address);
                JavaScriptSerializer jss = new JavaScriptSerializer();
                retResponse = jss.Deserialize<MapQuestGeoCodeResponse>(result);
            }
            catch (Exception ex)
            {
                Logger.LogEvent("MapQuestGeoCodeResponse Error: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return retResponse;
        }
        private static string GetGeoFarmAddress(double lat, double lon)
        {
            string retAddress = "";

            try
            {
                GeoFarmGeoCodeResponse revGeoFarmGeocodeRes = GeoFarmReverseGeocode(lat, lon);

                if (revGeoFarmGeocodeRes.geocoding_results != null)
                {
                    foreach (RESULTS currResult in revGeoFarmGeocodeRes.geocoding_results.RESULTS)
                    {
                        retAddress = currResult.formatted_address;
                    }
                }

            }
            catch (Exception ex)
            {
                Logger.LogEvent("GetGeoFarmAddress Error: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);

            }
            return retAddress;
        }
        private static GeoFarmGeoCodeResponse GeoFarmReverseGeocode(double lat, double lon)
        {
            GeoFarmGeoCodeResponse retResponse = new GeoFarmGeoCodeResponse();
            try
            {

                //string apiKey = "emM7X38xWbptAJt6iZReJPlFuiX7nUrh";//Map Quest
                //string apiKey = "Xap4CDGAu3taATJh8k1MTAYFeBqF2OMZ";//Map Quest - TRACK SG API
                var address = String.Format("https://www.geocode.farm/v3/json/reverse/?lat={0}&lon={1}&country=us&lang=en&count=1", lat, lon);
                var result = new System.Net.WebClient().DownloadString(address);
                JavaScriptSerializer jss = new JavaScriptSerializer();
                retResponse = jss.Deserialize<GeoFarmGeoCodeResponse>(result);

               // Logger.LogEvent("GeoFarmGeoCodeResponse Result: " + result, System.Diagnostics.EventLogEntryType.Error);
            }
            catch (Exception ex)
            {
                Logger.LogEvent("MapQuestGeoCodeResponse Error: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return retResponse;
        }
        private static string GetBingAddress(double lat, double lon)
        {
            string retAddress = "";

            try
            {
                BingGeoCodeResponse revBingGeocodeRes = BingReverseGeocode(lat, lon);

                if (revBingGeocodeRes.statusDescription == "OK")
                {
                    if (revBingGeocodeRes.resourceSets != null)
                    {
                        foreach (resourceSets currResult in revBingGeocodeRes.resourceSets)
                        {
                            retAddress = currResult.resources[0].name;
                           // retAddress = currResult.resources[0].address[0].formattedAddress;
                            //retAddress = currResult.formatted_address;
                        }
                    }
                }
                else
                {
                    retAddress = revBingGeocodeRes.statusDescription;
                }

            }
            catch (Exception ex)
            {
                Logger.LogEvent("GetBingAddress Error: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);

            }
            return retAddress;
        }
        private static BingGeoCodeResponse BingReverseGeocode(double lat, double lon)
        {
            BingGeoCodeResponse retResponse = new BingGeoCodeResponse();

            try
            {
                string apiKey = "AsOGgkWDpWfq6YDZFJe9lXAwoEVZbMajhOv87jVEdiuAeANOh96C4yjYuOMLCQ5X";//Bing - TRACK SG API
                var address = String.Format("http://dev.virtualearth.net/REST/v1/Locations/{0},{1}?o=json&key={2}", lat, lon, apiKey);
                var result = new System.Net.WebClient().DownloadString(address);
                Logger.LogEvent("Get Result: " + result, System.Diagnostics.EventLogEntryType.Error);

                JavaScriptSerializer jss = new JavaScriptSerializer();
                retResponse = jss.Deserialize<BingGeoCodeResponse>(result);
            }
            catch (Exception ex)
            {
                Logger.LogEvent("BingReverseGeocode Error: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return retResponse;
        }

        private static string GetHereAddress(double lat, double lon)
        {
            string retAddress = "";

            try
            {
                HereGeoCodeResponse revHereGeocodeRes = HereReverseGeocode(lat, lon);


                if (revHereGeocodeRes.Response != null)
                {
                    foreach (Result currResult in revHereGeocodeRes.View[0].Result)
                    {
                        retAddress = currResult.Address.Label;
                    }
                }
         

            }
            catch (Exception ex)
            {
                Logger.LogEvent("GetHereAddress Error: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);

            }
            return retAddress;
        }
        private static HereGeoCodeResponse HereReverseGeocode(double lat, double lon)
        {
            HereGeoCodeResponse retResponse = new HereGeoCodeResponse();
            try
            {
                string AppId = "mVfKUuYSlnZL2YyJk9xl";
                string AppCode = "Kc04v0e59zZreqswBcj0gw";
                var address = String.Format("http://reverse.geocoder.cit.api.here.com/6.2/reversegeocode.json?app_id={2}&app_code={3}&gen=8&pos={0},{1}&mode=trackPosition", lat, lon, AppId, AppCode);
                var result = new System.Net.WebClient().DownloadString(address);
                JavaScriptSerializer jss = new JavaScriptSerializer();
                retResponse = jss.Deserialize<HereGeoCodeResponse>(result);

                Logger.LogEvent("result  : " + result, System.Diagnostics.EventLogEntryType.Error);
                Logger.LogEvent("retResponse  : " + retResponse, System.Diagnostics.EventLogEntryType.Error);
            }
            catch (Exception ex)
            {
                Logger.LogEvent("HereGeoCodeResponse Error: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return retResponse;
        }
        private static string GetLocationIQ(double lat, double lon)
        {
            string retAddress = "";

            try
            {
                LocationIQGeoCodeResponse revGeocodeRes = LocationIQReverseGeocode(lat, lon);
                if (revGeocodeRes.display_name != null && revGeocodeRes.error == null || string.IsNullOrEmpty(revGeocodeRes.error))
                {
                    var address = Encoding.UTF8.GetBytes(revGeocodeRes.display_name);
                    var bytes = Encoding.UTF8.GetString(address);

                    //retAddress = revGeocodeRes.display_name;

                    string[] arrData = bytes.Split(",".ToCharArray());
                    if (arrData.Length == 8)
                    {
                        //        0  1  2         3    4         5          6       7
                        //Focus one, 1, Ubi View, Ubi, Mei Hwan, Southeast, 408867, Singapore
                        retAddress = string.Format("{0} {1} {2}, {3} {4}", arrData[1], arrData[2], arrData[0], arrData[7], arrData[6]);
                    }
                    else if (arrData.Length == 5)
                    {
                        //Central Expressway, Bishan, Central, 556818, Singapore
                        retAddress = string.Format("{0} {1} {2}, {3} {4}", arrData[1], arrData[2], arrData[0], arrData[4], arrData[3]);
                    }
                    else if (arrData.Length == 6)
                    {
                        //                                  0  1               2              3      4          5
                        //The Integrated Building(CGH - SACH), Simei Street 3, Simpang Bedok, Simei, Southeast, 529898
                        retAddress = string.Format("{0} {1} {2}, {3} {4}", arrData[1], arrData[2], arrData[0], arrData[3], arrData[5]);
                    }
                    else if (arrData.Length == 7)
                    {

                        //Changi General Hospital, Simei Street 3, Simpang Bedok, Simei, Southeast, 520101, Singapore          
                        retAddress = string.Format("{0} {1} {2}, {3} {4}", arrData[1], arrData[2], arrData[0], arrData[6], arrData[5]);
                    }
                    else
                    {
                        retAddress = revGeocodeRes.display_name;
                    }
                }
                else
                {
                    if (!string.IsNullOrEmpty(revGeocodeRes.error)) retAddress = revGeocodeRes.error;
                    else retAddress = "No Address Result";
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent("GetLocationIQ Error: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);

                if (ex.InnerException != null)
                {
                    Logger.LogEvent("GetOneMap InnerException: " + ex.InnerException, System.Diagnostics.EventLogEntryType.Error);
                }
            }
            return retAddress;
        }
        private static LocationIQGeoCodeResponse LocationIQReverseGeocode(double lat, double lon)
        {
            LocationIQGeoCodeResponse retResponse = new LocationIQGeoCodeResponse();
            HttpWebResponse response = null;
            StreamReader sr = null;


            //https://us1.locationiq.org/v1/reverse.php?key=762444d094ca6d&lat=1.3319867&lon=103.89698&format=json
            const String key = "ece7de2808b2c0";
            string language = "en";
            string format = "json";

            var urlRequest = String.Format("/v1/reverse.php?key={0}&lat={1}&lon={2}&format={3}&language={4}", key, lat, lon, format, language);
            var url = String.Format("https://us1.locationiq.org{0}", urlRequest);


            var request = (HttpWebRequest)HttpWebRequest.Create(url);

            try
            {

                request.Timeout = 5000;
                request.ReadWriteTimeout = 5000;
                response = (HttpWebResponse)request.GetResponse();
                sr = new StreamReader(response.GetResponseStream());

                var result = new System.Net.WebClient().DownloadString(url);
                JavaScriptSerializer jss = new JavaScriptSerializer();


                string utf8_String = result;
                byte[] bytes = Encoding.Default.GetBytes(utf8_String);
                var myString = Encoding.UTF8.GetString(bytes);

                retResponse = jss.Deserialize<LocationIQGeoCodeResponse>(myString);

                //Logger.LogEvent("Get Location IQ result " + result, System.Diagnostics.EventLogEntryType.Information);
            }
            catch (WebException ex)
            {
                if (ex.Status == WebExceptionStatus.ProtocolError)
                {
                    response = (HttpWebResponse)ex.Response;
                    string error = new System.IO.StreamReader(ex.Response.GetResponseStream()).ReadToEnd();
                    //Console.Write("Errorcode: {0}", (int)response.StatusCode);
                    //Logger.LogEvent(string.Format("Location IQ ErrorWebCode: {0} Errorcode: {1} Status: {2}", BuildWebCode((int)response.StatusCode), (int)response.StatusCode, ex.Status), System.Diagnostics.EventLogEntryType.Error);
                    retResponse.error = BuildWebCode((int)response.StatusCode);
                }
                //else
                //{
                    //Console.Write("Error: {0}", ex.Status);
                    //Logger.LogEvent(string.Format("Location IQ WebExceptionStatus: {0} ErrorWebCode: {1}", ex.Status, BuildWebCode((int)response.StatusCode)), System.Diagnostics.EventLogEntryType.Error);
                    //retResponse.error = BuildWebCode((int)response.StatusCode);
                //}

                ex.Response.Close();
            }
            finally
            {
                request.Abort();
                if (sr != null)
                    sr.Dispose();
                if (response != null)
                    response.Close();
            }

            return retResponse;
        }
        public static string BuildWebCode(int code)
        {
            string retStr = "";
            switch (code)
            {
                case 400:
                    retStr = "Required parameters are missing, or invalid";
                    break;
                case 401:
                    retStr = "API Key provided is invalid or inactive";
                    break;
                case 402:
                    retStr = "Payment Required";
                    break;
                case 403:
                    retStr = "Forbidden";
                    break;
                case 404:
                    retStr = "No location or places were found for the given input";
                    break;
                case 405:
                    retStr = "Method not allowed";
                    break;
                case 429:
                    retStr = "Request exceeded";
                    break;
                case 500:
                    retStr = "This is an error on the server's side, we monitor this 24x7 and you should try again.";
                    break;
                case 502:
                    retStr = "Bad Gateway server";
                    break;
                default:
                    retStr = string.Format("Web Code: {0}", code.ToString());
                    break;
            }

            return retStr;

        }
        public static string GetOneMap(double lat, double lon, int company_id)
        {
            string retAddress = "";
            byte[] address;

            if (lat == 0 && lon == 0 || company_id == 0) return retAddress;

            OneMapReverseGeoCodeResponse revGeocodeRes = OneMapReverseGeocode(lat, lon, company_id);

            try
            {
                if (revGeocodeRes.GeocodeInfo != null)
                {
                    foreach (GeocodeInfo currResult in revGeocodeRes.GeocodeInfo)
                    {
                       

                        if (string.IsNullOrEmpty(currResult.BUILDINGNAME) || currResult.BUILDINGNAME.Equals("null") || currResult.BUILDINGNAME == "")
                        {

                            if (currResult.POSTALCODE.Equals("0") || (currResult.POSTALCODE == 0) || currResult.POSTALCODE.Equals("NIL"))
                            {
                                address = Encoding.UTF8.GetBytes(string.Format("{0} {1}", currResult.BLOCK, currResult.ROAD).Trim());
                            }
                            else
                            {
                                address = Encoding.UTF8.GetBytes(string.Format("{0} {1} {2}", currResult.BLOCK, currResult.ROAD, currResult.POSTALCODE).Trim());
                            }
                        }
                        else
                        {
                            if (currResult.POSTALCODE.Equals("0") || (currResult.POSTALCODE == 0) || currResult.POSTALCODE.Equals("NIL"))
                            {
                                address = Encoding.UTF8.GetBytes(string.Format("{0} {1} {2}", currResult.BLOCK, currResult.ROAD, currResult.BUILDINGNAME).Trim());
                            }
                            else
                            {
                                address = Encoding.UTF8.GetBytes(string.Format("{0} {1} {2} {3}", currResult.BLOCK, currResult.ROAD, currResult.BUILDINGNAME, currResult.POSTALCODE).Trim());
                            }                           
                        }
                      
                        var bytes = Encoding.UTF8.GetString(address);

                        //Logger.LogEvent(string.Format("Building name: {0} Postal Code: {1} Address: {2}", currResult.BUILDINGNAME, currResult.POSTALCODE, bytes), System.Diagnostics.EventLogEntryType.Warning);
                        retAddress = bytes;
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(string.Format("Get One Map Address Exception: {0}", ex.Message), System.Diagnostics.EventLogEntryType.Error);

                if (ex.InnerException != null)
                {
                    Logger.LogEvent("GetOneMap InnerException: " + ex.InnerException, System.Diagnostics.EventLogEntryType.Error);
                }
            }
            
            return retAddress;
        }

        public static OneMapReverseGeoCodeResponse OneMapReverseGeocode(double lat, double lon, int company_id)
        {
            OneMapReverseGeoCodeResponse retResponse = new OneMapReverseGeoCodeResponse();
            HttpWebResponse response = null;
            StreamReader sr = null;

            //https://developers.onemap.sg/privateapi/commonsvc/revgeocode?location=1.437967,103.838621&token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjIyMzUsInVzZXJfaWQiOjIyMzUsImVtYWlsIjoiYW50aG9ueV9hZ3VzdGluQGFjZWNvbS5jb20uc2ciLCJmb3JldmVyIjpmYWxzZSwiaXNzIjoiaHR0cDpcL1wvb20yLmRmZS5vbmVtYXAuc2dcL2FwaVwvdjJcL3VzZXJcL3Nlc3Npb24iLCJpYXQiOjE2MDA0MTE0NzQsImV4cCI6MTYwMDg0MzQ3NCwibmJmIjoxNjAwNDExNDc0LCJqdGkiOiIxNTA1ZTI3MjkwNmJmZmZhOTcwM2IxNmZkMDAzMWNlMSJ9.9qhXSh523tTJl4iXwU_GfIOXB0cy60VWHFdc6es_DSo

            string token = GetToken(company_id);

            //const String key = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjIyMzUsInVzZXJfaWQiOjIyMzUsImVtYWlsIjoiYW50aG9ueV9hZ3VzdGluQGFjZWNvbS5jb20uc2ciLCJmb3JldmVyIjpmYWxzZSwiaXNzIjoiaHR0cDpcL1wvb20yLmRmZS5vbmVtYXAuc2dcL2FwaVwvdjJcL3VzZXJcL3Nlc3Npb24iLCJpYXQiOjE2MDA5OTc1MjQsImV4cCI6MTYwMTQyOTUyNCwibmJmIjoxNjAwOTk3NTI0LCJqdGkiOiJiYWYwMDkwNGM2ODc3YTQxNzU0NjU3YzFhM2Y1NDhkNyJ9.na_iKXhhKbktCT6NRiYBvlUQL2dMeC8IBB5eznvwJpE";
            const String buffer = "&buffer=100&addressType=all";
            var urlRequest = String.Format("/privateapi/commonsvc/revgeocode?location={0},{1}&token={2}{3}", lat, lon, token, buffer);
            var url = String.Format("https://developers.onemap.sg{0}", urlRequest);
            //Logger.LogEvent(string.Format("Onemap URL: {0}", url), System.Diagnostics.EventLogEntryType.Warning);
            ServicePointManager.Expect100Continue = true;
            ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072;

            var request = (HttpWebRequest)HttpWebRequest.Create(url);

            try
            {

                //request.Timeout = 5000;
                //request.ReadWriteTimeout = 5000;

                request.Timeout = Timeout.Infinite;
                //request.KeepAlive = true;
                request.KeepAlive = false;

                response = (HttpWebResponse)request.GetResponse();
                sr = new StreamReader(response.GetResponseStream());


                var result = new System.Net.WebClient().DownloadString(url);
                JavaScriptSerializer jss = new JavaScriptSerializer();

                string utf8_String = result;
                byte[] bytes = Encoding.Default.GetBytes(utf8_String);
                var myString = Encoding.UTF8.GetString(bytes);

                retResponse = jss.Deserialize<OneMapReverseGeoCodeResponse>(myString);

            }
            //catch (WebException ex)
            //{
            //    if (ex.Status == WebExceptionStatus.ProtocolError)
            //    {
            //        response = (HttpWebResponse)ex.Response;
            //        string error = new System.IO.StreamReader(ex.Response.GetResponseStream()).ReadToEnd();
            //        //Logger.LogEvent(string.Format("Onemap ErrorWebCode: {0} Errorcode: {1} Status: {2} Error: {3}", BuildWebCode((int)response.StatusCode), (int)response.StatusCode, ex.Status, error), System.Diagnostics.EventLogEntryType.Error);

            //        retResponse.error = BuildWebCode((int)response.StatusCode);
            //    }
            //    //else
            //    //{
            //        //Console.Write("Error: {0}", ex.Status);
            //        //Logger.LogEvent(string.Format("Onemap WebExceptionStatus: {0} ErrorWebCode: {1}", ex.Status, BuildWebCode((int)response.StatusCode)), System.Diagnostics.EventLogEntryType.Error);
            //        //retResponse.error = BuildWebCode((int)response.StatusCode);
            //    //}

            //    ex.Response.Close();
            //}
            //catch (WebException ex)
            //{
            //    ex.Response.Close();
            //}
            catch (Exception ex)
            {
                //Logger.LogEvent(string.Format("OneMapReverseGeocode Exception: {0}", ex.Message), System.Diagnostics.EventLogEntryType.Error);


                if (ex.InnerException != null)
                {
                    Logger.LogEvent("ApplyOneMapReverseGeocode InnerException: " + ex.InnerException, System.Diagnostics.EventLogEntryType.Error);
                }
            }
            finally
            {
                request.Abort();  
                if (sr != null)
                    sr.Dispose();
                if (response != null)
                    response.Close();
            }

            return retResponse;
        }

        public static string GetToken(int company_id)
        {
            string rtnVal = "";

            CompanyInfo currCompany = new CompanyInfo();
            string query = string.Format("SELECT * FROM view_companies WHERE company_id = {0}", company_id);

            try
            {
                using (MySqlConnection conn = new MySqlConnection(mConnStr))
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        conn.Open();
                        MySqlDataReader reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            currCompany = DataMgrTools.BuildCompany(reader);
                            rtnVal = currCompany.Token;
                        }

                        conn.Close();
                    }
     
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-GetToken", System.Diagnostics.EventLogEntryType.Error);
            }

            return rtnVal;
        }

    }
}