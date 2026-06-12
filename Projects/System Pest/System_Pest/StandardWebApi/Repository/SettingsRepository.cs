using MySql.Data.MySqlClient;
using FMSWebApi.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Hosting;
using System.Configuration;
using System.IO;
using FMSWebApi.Properties;
using System.Text;
using System.Security.Cryptography;
using System.Net;
using System.Web.Script.Serialization;

namespace FMSWebApi.Repository
{
    public class SettingsRepository : ISettingsRepository
    {
        public IEnumerable<GoogleDistanceMatrixResponse> Clear()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            GoogleDistanceMatrixResponse currDistanceMatrix = new GoogleDistanceMatrixResponse();
            List<GoogleDistanceMatrixResponse> arrSettings = new List<GoogleDistanceMatrixResponse>();

            return arrSettings.ToArray();
        }
        public IEnumerable<LocationIQForwardGeoCodeResponse> ClearGeocoding()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            LocationIQForwardGeoCodeResponse currGeocoding = new LocationIQForwardGeoCodeResponse();
            List<LocationIQForwardGeoCodeResponse> arrSettings = new List<LocationIQForwardGeoCodeResponse>();

            return arrSettings.ToArray();
        }
        public IEnumerable<ReverseGeocodeInfo> GetReverseGeocode(ReverseGeocodeInfo param)
        {
            ReverseGeocodeInfo currReverseGeocode = new ReverseGeocodeInfo();
            List<ReverseGeocodeInfo> arrReverseGeocode = new List<ReverseGeocodeInfo>();

            try
            {
                currReverseGeocode.PosY = param.PosY;
                currReverseGeocode.PosX = param.PosX;
                // round off coordinates
                double lLatitude = Math.Round(param.PosY, 6);
                double lLongitude = Math.Round(param.PosX, 6);

                currReverseGeocode.Location = GetGoogleAddress(lLatitude, lLongitude);

                arrReverseGeocode.Add(currReverseGeocode);

            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-ReverseGeocode", System.Diagnostics.EventLogEntryType.Error);
            }

            return arrReverseGeocode.ToArray();
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
                            retAddress = currResult.formatted_address;
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
                //const String clientID = "gme-acecomtechnologies";
                const String key = "AIzaSyCKyWKb4gOhrzxCSI-wPVXoHq06qy9tZgM";


                //string language = "en";
                //https://maps.googleapis.com/maps/api/geocode/json?latlng=40.714224,-73.961452&key=YOUR_API_KEY
                //var urlRequest = String.Format("/maps/api/geocode/json?latlng={0},{1}&result_type=street_address%7Croute&language={2}&client={3}", lat, lon, language, clientID);
                var urlRequest = String.Format("/maps/api/geocode/json?latlng={0},{1}&result_type=street_address%7Croute&key={2}", lat, lon, key);

                //HMACSHA1 myhmacsha1 = new HMACSHA1();
                //myhmacsha1.Key = Convert.FromBase64String(key);
                //var hash = myhmacsha1.ComputeHash(Encoding.ASCII.GetBytes(urlRequest));

                var url = String.Format("https://maps.googleapis.com{0}", urlRequest);

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
        public IEnumerable<GoogleDistanceMatrixResponse> GetDistanceMatrix(GoogleDistanceMatrixResponse param)
        {
            List<GoogleDistanceMatrixResponse> arrSettings = new List<GoogleDistanceMatrixResponse>();
            GoogleDistanceMatrixResponse currDistance = new GoogleDistanceMatrixResponse();

            try
            {
                currDistance = GoogleDistanceMatrix(param.Origin, param.Destination);
                currDistance.Origin = param.Origin;
                currDistance.Destination = param.Destination;
                arrSettings.Add(currDistance);
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-DistanceMatrix", System.Diagnostics.EventLogEntryType.Error);
            }

            return arrSettings.ToArray();
        }
        private static GoogleDistanceMatrixResponse GoogleDistanceMatrix(string origin, string destination)
        {
            GoogleDistanceMatrixResponse retResponse = new GoogleDistanceMatrixResponse();
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

                ASCIIEncoding encoding = new ASCIIEncoding();
                // converting key to bytes will throw an exception, need to replace '-' and '_' characters first.
                string usablePrivateKey = key.Replace("-", "+").Replace("_", "/");
                byte[] privateKeyBytes = Convert.FromBase64String(usablePrivateKey);

                var urlRequest = String.Format("https://maps.googleapis.com/maps/api/distancematrix/json?origins=" + origin + "&destinations=" + destination + "&language=" + language + "&client=" + clientID);


                Uri uri = new Uri(urlRequest);
                byte[] encodedPathAndQueryBytes = encoding.GetBytes(uri.LocalPath + uri.Query);

                // compute the hash
                HMACSHA1 algorithm = new HMACSHA1(privateKeyBytes);
                byte[] hash = algorithm.ComputeHash(encodedPathAndQueryBytes);

                // convert the bytes to string and make url-safe by replacing '+' and '/' characters
                string signature = Convert.ToBase64String(hash).Replace("+", "-").Replace("/", "_");

                // Add the signature to the existing URI.
                var url = uri.Scheme + "://" + uri.Host + uri.LocalPath + uri.Query + "&signature=" + signature;

                var request = (HttpWebRequest)HttpWebRequest.Create(url);
                var result = new System.Net.WebClient().DownloadString(url);
                JavaScriptSerializer jss = new JavaScriptSerializer();
                string utf8_String = result;
                byte[] bytes = Encoding.Default.GetBytes(utf8_String);
                var myString = Encoding.UTF8.GetString(bytes);

                retResponse = jss.Deserialize<GoogleDistanceMatrixResponse>(myString);
            }
            catch (Exception ex)
            {
                Logger.LogEvent("GoogleDistanceMatrix Error: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return retResponse;
        }
        public IEnumerable<LocationIQForwardGeoCodeResponse> GetForwardGeocoding(LocationIQForwardGeoCode param)
        {
            LocationIQForwardGeoCodeResponse currForwardGeocode = new LocationIQForwardGeoCodeResponse();
            List<LocationIQForwardGeoCodeResponse> arrForwardGeocode = new List<LocationIQForwardGeoCodeResponse>();

            try
            {
                currForwardGeocode = GetLocationIQForward(param.address);
                arrForwardGeocode.Add(currForwardGeocode);
            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-ForwardGeocode", System.Diagnostics.EventLogEntryType.Error);
            }

            return arrForwardGeocode.ToArray();
        }
        public LocationIQForwardGeoCodeResponse GetLocationIQForward(string address)
        {

            LocationIQForwardGeoCodeResponse revGeocodeRes = LocationIQForwardGeocode(address);
            try
            {

                if (double.IsNaN(revGeocodeRes.lat) && double.IsNaN(revGeocodeRes.lon) && revGeocodeRes.error == null || string.IsNullOrEmpty(revGeocodeRes.error))
                {
                    revGeocodeRes.result = string.Format("{0},{1}", revGeocodeRes.lat, revGeocodeRes.lon);
                    revGeocodeRes.error = "Ok";
                }
                else
                {
                    if (!string.IsNullOrEmpty(revGeocodeRes.error)) revGeocodeRes.result = revGeocodeRes.error;
                    else revGeocodeRes.result = "No Geocoding Result";
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent("GetLocationIQ Forward Error: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return revGeocodeRes;
        }
        private static LocationIQForwardGeoCodeResponse LocationIQForwardGeocode(string address)
        {
            LocationIQForwardGeoCodeResponse retResponse = new LocationIQForwardGeoCodeResponse();
            HttpWebResponse response = null;
            try
            {

                //https://us1.locationiq.org/v1/reverse.php?key=762444d094ca6d&lat=1.3319867&lon=103.89698&format=json
                const String key = "ece7de2808b2c0";
                string format = "json";
                int limit = 1;

                var urlRequest = String.Format("/v1/search.php?key={0}&q={1}&format={2}&limit={3}", key, address, format, limit);


                var url = String.Format("https://us1.locationiq.com{0}", urlRequest);
                //Logger.LogEvent("Get google url " + url, System.Diagnostics.EventLogEntryType.Warning);

                var request = (HttpWebRequest)HttpWebRequest.Create(url);
                response = (HttpWebResponse)request.GetResponse();
                StreamReader sr = new StreamReader(response.GetResponseStream());
                Logger.LogEvent("Get response code " + sr.ReadToEnd(), System.Diagnostics.EventLogEntryType.Information);
                //Logger.LogEvent("Get google request " + urlRequest, System.Diagnostics.EventLogEntryType.Information);

                var result = new System.Net.WebClient().DownloadString(url);
                JavaScriptSerializer jss = new JavaScriptSerializer();

                string utf8_String = result;
                byte[] bytes = Encoding.Default.GetBytes(utf8_String);
                var myString = Encoding.UTF8.GetString(bytes);

                var geocode = jss.Deserialize<LocationIQForwardGeoCodeResponse[]>(myString);
                retResponse = geocode[0];

                //Logger.LogEvent("Get Location IQ result " + result, System.Diagnostics.EventLogEntryType.Information);
            }
            catch (WebException ex)
            {
                if (ex.Status == WebExceptionStatus.ProtocolError)
                {
                    response = (HttpWebResponse)ex.Response;
                    retResponse.error = VehTools.BuildWebCode((int)response.StatusCode);
                }
                else
                {
                    Logger.LogEvent("Errorcode else: " + ex.Status, System.Diagnostics.EventLogEntryType.Error);
                    retResponse.error = VehTools.BuildWebCode((int)response.StatusCode);
                }
            }
            return retResponse;
        }
        public IEnumerable<LocationIQGeoCodeResponse> GetLocationIQReverseGeocode(LocationIQGeoCodeResponse param)
        {
            LocationIQGeoCodeResponse currReverseGeocode = new LocationIQGeoCodeResponse();
            List<LocationIQGeoCodeResponse> arrReverseGeocode = new List<LocationIQGeoCodeResponse>();

            try
            {
                currReverseGeocode.PosY = param.PosY;
                currReverseGeocode.PosX = param.PosX;
                // round off coordinates
                double lLatitude = Math.Round(param.PosY, 6);
                double lLongitude = Math.Round(param.PosX, 6);

                currReverseGeocode = GetLocationIQAddress(lLatitude, lLongitude);

                arrReverseGeocode.Add(currReverseGeocode);

            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-Location IQ ReverseGeocode", System.Diagnostics.EventLogEntryType.Error);
            }

            return arrReverseGeocode.ToArray();
        }
        private LocationIQGeoCodeResponse GetLocationIQAddress(double lat, double lon)
        {
            LocationIQGeoCodeResponse revGeocodeRes = LocationIQReverseGeocode(lat, lon);
            try
            {

                //Logger.LogEvent("GetLocationIQ Error: " + revGeocodeRes.error, System.Diagnostics.EventLogEntryType.Information);
                if (revGeocodeRes.display_name != null && revGeocodeRes.error == null || string.IsNullOrEmpty(revGeocodeRes.error))
                {
                    var address = Encoding.UTF8.GetBytes(revGeocodeRes.display_name);
                    var bytes = Encoding.UTF8.GetString(address);

                    //retAddress = revGeocodeRes.display_name;

                    string[] arrData = bytes.Split(",".ToCharArray());
                    //Logger.LogEvent("GetLocationIQ: " + arrData.Length, System.Diagnostics.EventLogEntryType.Information);
                    if (arrData.Length == 8)
                    {
                        revGeocodeRes.display_name = string.Format("{0} {1} {2}, {3} {4}", arrData[1], arrData[2], arrData[0], arrData[7], arrData[6]);
                        revGeocodeRes.error = "Ok";
                    }
                    else
                    {
                        revGeocodeRes.error = "Ok";
                    }
                }
                else
                {
                    if (!string.IsNullOrEmpty(revGeocodeRes.error))
                    {
                        revGeocodeRes.display_name = revGeocodeRes.error;
                    }
                    else
                    {
                        revGeocodeRes.display_name = "No Address Result";
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent("GetLocationIQ Error: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return revGeocodeRes;
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
                Logger.LogEvent("Get response code " + sr.ReadToEnd(), System.Diagnostics.EventLogEntryType.Information);
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
                    retResponse.error = VehTools.BuildWebCode((int)response.StatusCode);
                }
                else
                {
                    //Console.Write("Error: {0}", ex.Status);
                    Logger.LogEvent("Errorcode else: " + ex.Status, System.Diagnostics.EventLogEntryType.Error);
                    retResponse.error = VehTools.BuildWebCode((int)response.StatusCode);
                }
            }
            return retResponse;
        }

    }
}

     