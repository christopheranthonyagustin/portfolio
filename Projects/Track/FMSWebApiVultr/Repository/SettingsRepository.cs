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

        public IEnumerable<LocationIQForwardGeoCodeResponse> ClearGeocoding()
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            LocationIQForwardGeoCodeResponse currGeocoding = new LocationIQForwardGeoCodeResponse();
            List<LocationIQForwardGeoCodeResponse> arrSettings = new List<LocationIQForwardGeoCodeResponse>();

            return arrSettings.ToArray();
        } 
        public IEnumerable<LocationIQForwardGeoCodeResponse> GetForwardGeocoding(LocationIQForwardGeoCode param)
        {
            LocationIQForwardGeoCodeResponse currForwardGeocode = new LocationIQForwardGeoCodeResponse();
            List<LocationIQForwardGeoCodeResponse> arrForwardGeocode = new List<LocationIQForwardGeoCodeResponse>();

            try
            {
                string address = param.address;
                currForwardGeocode = GetLocationIQForward(address);
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
                    revGeocodeRes.lat = revGeocodeRes.lat;
                    revGeocodeRes.lon = revGeocodeRes.lon;
                    revGeocodeRes.house_number = revGeocodeRes.house_number;
                    revGeocodeRes.road = revGeocodeRes.road;
                    revGeocodeRes.attraction = revGeocodeRes.attraction;
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
        public LocationIQForwardGeoCodeResponse GetOneMapForward(string address)
        {
            LocationIQForwardGeoCodeResponse liq_revGeocodeRes = new LocationIQForwardGeoCodeResponse();

            try
            {
                OneMapGeoCodeResponse revGeocodeRes = OneMapForwardGeocode(address);
                if (revGeocodeRes.results != null)
                {
                    foreach (_results currResult in revGeocodeRes.results)
                    {
                        liq_revGeocodeRes.result = string.Format("{0},{1}", currResult.LATITUDE, currResult.LONGITUDE);
                        liq_revGeocodeRes.lat = currResult.LATITUDE;
                        liq_revGeocodeRes.lon = currResult.LONGITUDE;
                        liq_revGeocodeRes.BLK_NO = currResult.BLK_NO;
                        liq_revGeocodeRes.ROAD_NAME = currResult.ROAD_NAME;
                        liq_revGeocodeRes.BUILDING = currResult.BUILDING;
                        liq_revGeocodeRes.error = "Ok";
                    }
                }
            }
            catch (Exception ex)
            {
                Logger.LogEvent("Get One Map Forward Error: " + ex.Message, System.Diagnostics.EventLogEntryType.Error);
            }
            return liq_revGeocodeRes;
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
                var urlRequest = String.Format("/v1/search.php?key={0}&q={1}&format={2}&limit={3}", key, address, format, limit); ;

                var url = String.Format("https://us1.locationiq.com{0}", urlRequest);
                //Logger.LogEvent("Get google url " + url, System.Diagnostics.EventLogEntryType.Warning);

                var request = (HttpWebRequest)HttpWebRequest.Create(url);
                response = (HttpWebResponse)request.GetResponse();
                StreamReader sr = new StreamReader(response.GetResponseStream());
                //Logger.LogEvent("Get response code " + sr.ReadToEnd(), System.Diagnostics.EventLogEntryType.Information);
                //Logger.LogEvent("Get google request " + urlRequest, System.Diagnostics.EventLogEntryType.Information);

                var result = new System.Net.WebClient().DownloadString(url);
                JavaScriptSerializer jss = new JavaScriptSerializer();

                string utf8_String = result;
                byte[] bytes = Encoding.Default.GetBytes(utf8_String);
                var myString = Encoding.UTF8.GetString(bytes);

                var geocode = jss.Deserialize<LocationIQForwardGeoCodeResponse[]>(myString);
                retResponse = geocode[0];


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
        private static OneMapGeoCodeResponse OneMapForwardGeocode(string address)
        {
            OneMapGeoCodeResponse retResponse = new OneMapGeoCodeResponse();
            HttpWebResponse response = null;
            try
            {
                //https://developers.onemap.sg/commonapi/search?searchVal=569507&returnGeom=Y&getAddrDetails=Y
                var urlRequest = String.Format("/commonapi/search?searchVal={0}&returnGeom=Y&getAddrDetails=Y", address);

                var url = String.Format("https://developers.onemap.sg{0}", urlRequest);

                ServicePointManager.Expect100Continue = true;
                ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072;

                var request = (HttpWebRequest)HttpWebRequest.Create(url);
                response = (HttpWebResponse)request.GetResponse();
                StreamReader sr = new StreamReader(response.GetResponseStream());

                var result = new System.Net.WebClient().DownloadString(url);
                JavaScriptSerializer jss = new JavaScriptSerializer();

                string utf8_String = result;
                byte[] bytes = Encoding.Default.GetBytes(utf8_String);
                var myString = Encoding.UTF8.GetString(bytes);
             

                retResponse = jss.Deserialize<OneMapGeoCodeResponse>(myString);
  
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
                    Logger.LogEvent(string.Format("Errorcode Status: {0} Code: {1}", ex.Status, (int)response.StatusCode), System.Diagnostics.EventLogEntryType.Error);
                    retResponse.results[0].LATITUDE = 0;
                    retResponse.results[0].LONGTITUDE = 0;
                    retResponse.error = VehTools.BuildWebCode((int)response.StatusCode);
                }
            }
            return retResponse;
        }
        public IEnumerable<LocationIQGeoCodeResponse> GetRetrieveAddress(LocationIQGeoCodeResponse param)
        {
            LocationIQForwardGeoCodeResponse fwGeocode = new LocationIQForwardGeoCodeResponse();

            LocationIQGeoCodeResponse currReverseGeocode = new LocationIQGeoCodeResponse();
            List<LocationIQGeoCodeResponse> arrReverseGeocode = new List<LocationIQGeoCodeResponse>();

            try
            {
                string address = param.display_name;
                string[] arrAdd = address.Split("".ToCharArray());
                int n;

                if (arrAdd[0] == "Singapore" || arrAdd[0].Length == 6 && int.TryParse(arrAdd[0], out n) == true)
                {
                    if (arrAdd[0] == "Singapore") fwGeocode = GetLocationIQForward(arrAdd[1]);
                    else fwGeocode = GetLocationIQForward(address);
                }
                else
                {
                    fwGeocode = GetLocationIQForward(address);
                }


                currReverseGeocode.PosY = fwGeocode.lat;
                currReverseGeocode.PosX = fwGeocode.lon;
                // round off coordinates
                double lLatitude = Math.Round(currReverseGeocode.PosY, 6);
                double lLongitude = Math.Round(currReverseGeocode.PosX, 6);

                if (lLatitude == 0 && lLongitude == 0)
                {
                    currReverseGeocode.display_name = "No Geocoding Result";
                }
                else
                {
                    currReverseGeocode = GetLocationIQAddress(lLatitude, lLongitude);
                }




                arrReverseGeocode.Add(currReverseGeocode);

            }
            catch (Exception ex)
            {
                Logger.LogEvent(ex.Message + "-GetRetrieveAddress", System.Diagnostics.EventLogEntryType.Error);
            }

            return arrReverseGeocode.ToArray();
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
        public LocationIQGeoCodeResponse GetLocationIQAddress(double lat, double lon)
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

     