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


namespace FMSWebApi
{
    public class VehTools
    {
        private static int GoogleRevGeoCount = 0;

        private static Enums.Engine GetEngineStatus(PosInfo currPos, AssetInfo currAsset)
        {
            return GetEngineStatus(currPos.Ignition, currPos.Speed, currPos.Timestamp, currAsset.LastMove);
        }

        private static Enums.Engine GetEngineStatus(int vehIgnition, double vehSpeed, DateTime currTimestamp, DateTime lastMove)
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
                            udtPos.Location = GetGoogleAddress(lLatitude, lLongitude);
							//udtPos.Location = GetMapQuestAddress(lLatitude, lLongitude);
                            //udtPos.Location = GetBingAddress(lLatitude, lLongitude);
                            //udtPos.Location = GetHereAddress(lLatitude, lLongitude);
                            //udtPos.Location = GetGeoFarmAddress(lLatitude, lLongitude);
                            udtPos.LocID = 0;

                            //// limit location string length
                            //if (udtPos.Location.Length > 100)
                            //    udtPos.Location = udtPos.Location.Substring(0, 100);

                            //log to file for reference
                            GoogleRevGeoCount++;
                            Logger.LogToFile(string.Format("{0}\tGoogleCount: {1}", DateTime.Now, GoogleRevGeoCount.ToString()), "RevGeocodeLog.txt");

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
                            Logger.LogEvent("Get formatted_address TRACK Demo: " + bytes, System.Diagnostics.EventLogEntryType.Error);
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
                //
                //string apiKey = "AIzaSyB4bOc6eRc8dUFYi7qJSu6Z2Xscdq_Zia4";//@track.asiacom@gmail.com
                //string apiKey = "AIzaSyBLur5AuI1VPdx8JAtANJHKZ4G_ZU7_iMw";
                //string apiKey = "AIzaSyDe8ea1P8bPBoFho7i4jJ2Qlp7OV0y15Uw"; //track.singapore@gmail.com
                //var address = String.Format("https://maps.googleapis.com/maps/api/geocode/json?latlng={0},{1}&result_type=street_address&key={2}", lat, lon, apiKey);
                const String clientID = "gme-skymapglobalpteltd";
                const String key = "zhS30RlIryjJfBVZVCNSybCObBI=";

                //const String clientID = "gme-wlocatepteltd";
                //const String key = "vV03WX7p_9aEpF3udv_p7aX6m14=";


                string language = "en";

                var urlRequest = String.Format("/maps/api/geocode/json?latlng={0},{1}&result_type=street_address&sensor=false&client={2}&language={3}", lat, lon, clientID, language);

                HMACSHA1 myhmacsha1 = new HMACSHA1();
                myhmacsha1.Key = Convert.FromBase64String(key);
                var hash = myhmacsha1.ComputeHash(Encoding.ASCII.GetBytes(urlRequest));

                var url = String.Format("http://maps.googleapis.com{0}&signature={1}", urlRequest, Convert.ToBase64String(hash).Replace("+", "-").Replace("/", "_"));
                Logger.LogEvent("Get google url " + url, System.Diagnostics.EventLogEntryType.Error);

                var request = (HttpWebRequest)HttpWebRequest.Create(url);          
               // Logger.LogEvent("Get google request " + request, System.Diagnostics.EventLogEntryType.Error);

                var result = new System.Net.WebClient().DownloadString(url);
                JavaScriptSerializer jss = new JavaScriptSerializer();

               //var address = Encoding.UTF8.GetBytes(result);
                //var bytes = Encoding.UTF8.GetString(address);

                string utf8_String = result;
                byte[] bytes = Encoding.Default.GetBytes(utf8_String);

                var myString = Encoding.UTF8.GetString(bytes);
         
                retResponse = jss.Deserialize<GoogleGeoCodeResponse>(myString);

                Logger.LogEvent("Get google result " + result, System.Diagnostics.EventLogEntryType.Error);
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

                Logger.LogEvent("GeoFarmGeoCodeResponse Result: " + result, System.Diagnostics.EventLogEntryType.Error);
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



        public static void GetLocationInfo(PosInfo currPos)
        {
            LocationInfo retLocation = new LocationInfo();
            
            //apply the location
            currPos.Location = retLocation.Location;
            currPos.LocID = retLocation.LocationID;
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