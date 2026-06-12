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

namespace FMSWebApi
{
    public class VehTools
    {
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
        public static void ApplyReverseGeocode(AssetInfo udtAsset, PosInfo udtPos, PosInfo udtPrev)
        {
            Enums.Engine currEngine = GetEngineStatus(udtPos.Ignition, udtPos.Speed, udtPos.Timestamp, udtAsset.LastMove);
            //Logger.LogEvent("ApplyReverseGeocode: GetEngineStatus " + currEngine.ToString(), System.Diagnostics.EventLogEntryType.Information);//testing

            //initialize default
            udtPos.LocID = 0;
            udtPos.Location = Settings.Default.Country;

            //use last pos if available
            if (udtPrev != null && udtPrev.FixID > 0)
            {
                udtPos.LocID = udtPrev.LocID;
                udtPos.Location = udtPrev.Location;
                //Logger.LogEvent("ApplyReverseGeocode: Use Previous Pos: " + udtPrev.Location, System.Diagnostics.EventLogEntryType.Information);//testing
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
                            //udtPos.Location = GetGoogleAddress(lLatitude, lLongitude);
                            //udtPos.Location = GetMapQuestAddress(lLatitude, lLongitude);
                            //udtPos.Location = GetBingAddress(lLatitude, lLongitude);
                            //udtPos.Location = GetHereAddress(lLatitude, lLongitude);
                            //udtPos.Location = GetGeoFarmAddress(lLatitude, lLongitude);
                            udtPos.Location = GetLocationIQ(lLatitude, lLongitude);
                            udtPos.LocID = 0;

                            //// limit location string length
                            //if (udtPos.Location.Length > 100)
                            //    udtPos.Location = udtPos.Location.Substring(0, 100);

                            //log to file for reference
                            GoogleRevGeoCount++;
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
                //Logger.LogEvent("GetLocationIQ Error: " + revGeocodeRes.error, System.Diagnostics.EventLogEntryType.Information);
                if (revGeocodeRes.display_name != null && revGeocodeRes.error == null || string.IsNullOrEmpty(revGeocodeRes.error))
                {
                    var address = Encoding.UTF8.GetBytes(revGeocodeRes.display_name);
                    var bytes = Encoding.UTF8.GetString(address);

                    //retAddress = revGeocodeRes.display_name;

                    string[] arrData = bytes.Split(",".ToCharArray());
                    //Logger.LogEvent("GetLocationIQ: " + arrData.Length, System.Diagnostics.EventLogEntryType.Warning);
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
            }
            return retAddress;
        }
        private static LocationIQGeoCodeResponse LocationIQReverseGeocode(double lat, double lon)
        {
            LocationIQGeoCodeResponse retResponse = new LocationIQGeoCodeResponse();
            HttpWebResponse response = null;
            try
            {

                //https://us1.locationiq.org/v1/reverse.php?key=762444d094ca6d&lat=1.3319867&lon=103.89698&format=json
                const String key = "ece7de2808b2c0";
                string language = "en";
                string format = "json";

                var urlRequest = String.Format("/v1/reverse.php?key={0}&lat={1}&lon={2}&format={3}&language={4}", key, lat, lon, format, language);


                var url = String.Format("https://us1.locationiq.org{0}", urlRequest);
                //Logger.LogEvent("Get google url " + url, System.Diagnostics.EventLogEntryType.Warning);

                var request = (HttpWebRequest)HttpWebRequest.Create(url);
                response = (HttpWebResponse)request.GetResponse();
                StreamReader sr = new StreamReader(response.GetResponseStream());
                //Logger.LogEvent("Get response code " + sr.ReadToEnd(), System.Diagnostics.EventLogEntryType.Information);
                //Logger.LogEvent("Get google request " + urlRequest, System.Diagnostics.EventLogEntryType.Information);

                var result = new System.Net.WebClient().DownloadString(url);
                JavaScriptSerializer jss = new JavaScriptSerializer();

                //var address = Encoding.UTF8.GetBytes(result);
                //var bytes = Encoding.UTF8.GetString(address);

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
                    //Console.Write("Errorcode: {0}", (int)response.StatusCode);
                    //Logger.LogEvent("Errorcode if: " + (int)response.StatusCode, System.Diagnostics.EventLogEntryType.Error);
                    //Logger.LogEvent("Errorcode desc if: " + BuildWebCode((int)response.StatusCode), System.Diagnostics.EventLogEntryType.Error);
                    retResponse.error = BuildWebCode((int)response.StatusCode);
                }
                else
                {
                    //Console.Write("Error: {0}", ex.Status);
                    Logger.LogEvent("Errorcode else: " + ex.Status, System.Diagnostics.EventLogEntryType.Error);
                    retResponse.error = BuildWebCode((int)response.StatusCode);
                }
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
                case 404:
                    retStr = "No location or places were found for the given input";
                    break;
                case 429:
                    retStr = "Request exceeded";
                    break;
                case 500:
                    retStr = "This is an error on the server's side, we monitor this 24x7 and you should try again.";
                    break;
            }

            return retStr;

        }

        public struct GoogleSignedUrl
        {

            public static string Sign(string url, string keyString)
            {
                ASCIIEncoding encoding = new ASCIIEncoding();

                // converting key to bytes will throw an exception, need to replace '-' and '_' characters first.
                string usablePrivateKey = keyString.Replace("-", "+").Replace("_", "/");
                byte[] privateKeyBytes = Convert.FromBase64String(usablePrivateKey);

                Uri uri = new Uri(url);
                byte[] encodedPathAndQueryBytes = encoding.GetBytes(uri.LocalPath + uri.Query);

                // compute the hash
                HMACSHA1 algorithm = new HMACSHA1(privateKeyBytes);
                byte[] hash = algorithm.ComputeHash(encodedPathAndQueryBytes);

                // convert the bytes to string and make url-safe by replacing '+' and '/' characters
                string signature = Convert.ToBase64String(hash).Replace("+", "-").Replace("/", "_");

                // Add the signature to the existing URI.
                return uri.Scheme + "://" + uri.Host + uri.LocalPath + uri.Query + "&signature=" + signature;
            }
        }

    }
}