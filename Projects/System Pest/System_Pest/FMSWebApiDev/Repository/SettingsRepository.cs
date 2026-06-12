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

        public IEnumerable<ComfortSettingsInfo> GetComfort()
        {

            ComfortSettingsInfo currSettings = new ComfortSettingsInfo();
            List<ComfortSettingsInfo> arrSettings = new List<ComfortSettingsInfo>();

            currSettings.Host = "103.237.168.119";
            currSettings.Port = 18026;
            currSettings.TimeInterval = 5;
            currSettings.AlertTitle = "TRACKLitePro - Comfort Ambulance";
            currSettings.ErrorMessage = "Unable to process your request. Error Status: Parser error.";
            currSettings.EndpointURL = "http://103.237.168.119/trackliteprodevwebapi/api/";
            currSettings.User = "systemacecom";
            currSettings.Password = "1af372c8ea5e3190a178c93a1261024e2644b3a46b827f4ccd2de4aec4ba2ffc";
            currSettings.CountDown = 30;
            currSettings.LoginUsername = true;
            currSettings.LoginPassword = true;
            currSettings.Paramedic = true;
            currSettings.Driver = false;
            currSettings.Patient = false;
            currSettings.DateTime = false;
            currSettings.Patient = false;
            currSettings.Caller = false;
            currSettings.CallerContact = false;
            currSettings.MedCondition = false;
            currSettings.Remarks = false;
            currSettings.Trip = false;
            currSettings.Amount = false;
            currSettings.NewAmount = true;
            currSettings.Payment = false;
            currSettings.Origin = false;
            currSettings.Destination = false;
            currSettings.Unit = false;
            currSettings.Bed = false;
            currSettings.Accesories = false;
            currSettings.Receipt = true;
            currSettings.JobConn = false;
            currSettings.GPSConn = false;


            arrSettings.Add(currSettings);

            return arrSettings.ToArray();
        }

        public IEnumerable<RoyalSettingsInfo> GetRoyal()
        {

            RoyalSettingsInfo currSettings = new RoyalSettingsInfo();
            List<RoyalSettingsInfo> arrSettings = new List<RoyalSettingsInfo>();

            currSettings.Host = "103.237.168.119";
            currSettings.Port = 18027;
            currSettings.TimeInterval = 30;
            currSettings.AlertTitle = "TRACKLitePro - Royal Ambulance";
            currSettings.ErrorMessage = "Unable to process your request. Error Status: Parser error.";
            currSettings.EndpointURL = "http://103.237.168.119/trackliteprodevwebapi/api/";
            currSettings.User = "systemacecom";
            currSettings.Password = "1af372c8ea5e3190a178c93a1261024e2644b3a46b827f4ccd2de4aec4ba2ffc";
            currSettings.CountDown = 30;
            currSettings.LoginUsername = true;
            currSettings.LoginPassword = true;
            currSettings.Paramedic = true;
            currSettings.Driver = false;
            currSettings.Patient = false;
            currSettings.DateTime = false;
            currSettings.Patient = false;
            currSettings.Caller = false;
            currSettings.CallerContact = false;
            currSettings.MedCondition = false;
            currSettings.Remarks = false;
            currSettings.Trip = false;
            currSettings.Amount = false;
            currSettings.NewAmount = true;
            currSettings.Payment = false;
            currSettings.Origin = false;
            currSettings.Destination = false;
            currSettings.Unit = false;
            currSettings.Bed = false;
            currSettings.Accesories = false;
            currSettings.Receipt = true;
            currSettings.JobConn = false;
            currSettings.GPSConn = false;

            arrSettings.Add(currSettings);

            return arrSettings.ToArray();
        }

        public IEnumerable<DemoSettingsInfo> GetDemo()
        {

            DemoSettingsInfo currSettings = new DemoSettingsInfo();
            List<DemoSettingsInfo> arrSettings = new List<DemoSettingsInfo>();

            currSettings.Host = "103.237.168.119";
            currSettings.Port = 18026;
            currSettings.TimeInterval = 30;
            currSettings.AlertTitle = "TRACKLitePro - Demo";
            currSettings.ErrorMessage = "Unable to process your request. Error Status: Parser error.";
            currSettings.EndpointURL = "http://103.237.168.119/trackliteprodevwebapi/api/";
            currSettings.User = "demoacecom";
            currSettings.Password = "1af372c8ea5e3190a178c93a1261024e2644b3a46b827f4ccd2de4aec4ba2ffc";
            currSettings.CountDown = 30;
            currSettings.LoginUsername = true;
            currSettings.LoginPassword = true;
            currSettings.Paramedic = true;
            currSettings.Driver = false;
            currSettings.Patient = false;
            currSettings.DateTime = false;
            currSettings.Patient = false;
            currSettings.Caller = false;
            currSettings.CallerContact = false;
            currSettings.MedCondition = false;
            currSettings.Trip = false;
            currSettings.Amount = false;
            currSettings.NewAmount = true;
            currSettings.Payment = false;
            currSettings.Origin = false;
            currSettings.Destination = false;
            currSettings.Unit = false;
            currSettings.Bed = false;
            currSettings.Accesories = false;
            currSettings.Receipt = true;
            currSettings.JobConn = false;
            currSettings.GPSConn = false;

            arrSettings.Add(currSettings);

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
                const String clientID = "gme-acecomtechnologies";
                const String key = "mX2Q9L9WwcYYMdUF5nJqpWz31aY=";


                string language = "en";

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



    }
}

     