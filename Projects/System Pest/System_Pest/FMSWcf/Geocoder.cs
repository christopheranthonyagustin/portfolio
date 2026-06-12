using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Management;
using System.Net;
using System.Net.NetworkInformation;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Xml;
using FmsWcf.Geocode;

namespace WlocateWeb
{
    public class Geocoder
    {
        /// <summary>
        /// downloads coordinates of specified address
        /// </summary>
        /// <param name="strLocation"></param>
        /// <returns></returns>
        public static string Geocode(string strLocation)
        {
            DateTime dtTimestamp = DateTime.Now;
            string strRet = "";
            string strError = "";
            try
            {
                // check location
                string strLoc = strLocation.Trim();
                if (strLoc == "") return strRet;

                // parse location
                string[] arrTemp = strLoc.Trim().Split();
                if (arrTemp.Length > 0)
                {
                    // get default country
                    string strCountry = "Singapore";
                    string strCountryInit = (strCountry != "" ? strCountry.Substring(0, 1).ToUpper() : "");
                    int iZipCode = 0;
                    try
                    {
                        // check if first parameter is zipcode
                        iZipCode = Convert.ToInt32(arrTemp[0].Trim(strCountryInit.ToCharArray()));
                        strLoc = iZipCode.ToString();
                        arrTemp = strLoc.Split();
                    }
                    catch { }
                    try
                    {
                        // check last parameter if zip code (exception will be thrown otherwise)
                        iZipCode = Convert.ToInt32(arrTemp[arrTemp.Length - 1].Trim(strCountryInit.ToCharArray()));
                        if (arrTemp.Length == 1) strLoc = String.Format("{0}, {1}", strLoc, strCountry);
                        else strLoc = String.Join(" ", arrTemp, 0, arrTemp.Length - 1);
                    }
                    catch { }
                }

                // check onemapsg api key
                string strKey = ConfigurationManager.AppSettings["OneMapKey"];
                if ((strRet == "") && (strKey != ""))
                {
                    try
                    {
                        // request geocode from onemap.sg
                        string strUri = String.Format("http://www.onemap.sg/API/services.svc/getToken?accessKEY={0}", strKey);
                        Dictionary<string, object> arrParams = Deserialize(strUri, "GetToken", 0);

                        // check response
                        if (arrParams != null)
                        {
                            // get api token
                            string strToken = arrParams["NewToken"].ToString();
                            if (strToken != "")
                            {
                                // request geocode from onemap.sg
                                strUri = String.Format("http://www.onemap.sg/API/services.svc/basicSearch?token={0}" +
                                    "&searchVal={1}&otptFlds=SEARCHVAL,CATEGORY&returnGeom=1", strToken, strLocation);
                                arrParams = Deserialize(strUri, "SearchResults", 1);

                                // check response
                                if (arrParams != null)
                                {
                                    double lon = Convert.ToDouble(arrParams["X"]);
                                    double lat = Convert.ToDouble(arrParams["Y"]);

                                    // transform using onemap esri projection
                                    strUri = "http://www.onemap.sg/ArcGIS/rest/services/Geometry/GeometryServer/project?" +
                                        "inSR=3414&outSR=4326&geometries={\"geometryType\":\"esriGeometryPoint\"," +
                                        "\"geometries\":[{\"x\":" + lon + ",\"y\":" + lat + "}]}&f=json";
                                    arrParams = Deserialize(strUri, "geometries", 0);

                                    // check response
                                    if (arrParams != null)
                                    {
                                        // get geocode
                                        lon = Convert.ToDouble(arrParams["x"]);
                                        lat = Convert.ToDouble(arrParams["y"]);
                                        strRet = String.Format("{0},{1}\r{2}", lat, lon, strLoc);
                                    }
                                }
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        // log error
                        strError += String.Format("\rOneMapSG: {0}", ex.Message);
                    }
                }

                // check google maps api key
                strKey = ConfigurationManager.AppSettings["GoogleBusinessKey"];
                if ((strRet == "") && (strKey != ""))
                {
                    try
                    {
                        // request geocode from google
                        string strUri = String.Format("http://maps.googleapis.com/maps/api/geocode/xml?address={0}&client={1}&sensor=false",
                            strLoc, ConfigurationManager.AppSettings["GoogleClientID"]);
                        strUri = SignGoogleUri(strUri, strKey);
                        HttpDownloader httpLoader = new HttpDownloader(strUri, "", "");
                        string strXml = httpLoader.GetPage();

                        // check response
                        if (strXml != "")
                        {
                            // parse xml string
                            XmlDocument xmlDoc = new XmlDocument();
                            xmlDoc.LoadXml(strXml);

                            // check status
                            if (xmlDoc.NodeValue("/GeocodeResponse/status") == "OK")
                            {
                                // get geocode
                                strRet = String.Format("{0},{1}\r{2}",
                                    xmlDoc.NodeValue("/GeocodeResponse/result/geometry/location/lat"),
                                    xmlDoc.NodeValue("/GeocodeResponse/result/geometry/location/lng"),
                                    xmlDoc.NodeValue("/GeocodeResponse/result/formatted_address"));
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        // log error
                        strError += String.Format("\rGoogle Maps: {0}", ex.Message);
                    }
                }

                // check yahoo maps api key
                strKey = ConfigurationManager.AppSettings["YahooMapKey"];
                if ((strRet == "") && (strKey != ""))
                {
                    try
                    {
                        // request geocode from yahoo
                        string strUrl = String.Format("http://gws2.maps.yahoo.com/findlocation?q={0}", strLocation);
                        HttpDownloader httpLoader = new HttpDownloader(strUrl, "", "");
                        string strXml = httpLoader.GetPage();

                        // check response
                        if (strXml != "")
                        {
                            // parse xml string
                            XmlDocument xmlDoc = new XmlDocument();
                            xmlDoc.LoadXml(strXml);

                            // check status
                            if (xmlDoc.NodeValue("/ResultSet/Error") == "0")
                            {
                                // get geocode
                                strRet = String.Format("{0},{1}\r{2}",
                                    xmlDoc.NodeValue("/ResultSet/Result/Latitude"),
                                    xmlDoc.NodeValue("/ResultSet/Result/Longitude"),
                                    strLoc);
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        // log error
                        strError += String.Format("\rYahoo Maps: {0}", ex.Message);
                    }
                }

                // check bing maps api key
                strKey = ConfigurationManager.AppSettings["BingKey"];
                if ((strRet == "") && (strKey != ""))
                {
                    try
                    {
                        // create request  
                        GeocodeRequest reqGeocode = new GeocodeRequest();
                        reqGeocode.Credentials = new Credentials();
                        reqGeocode.Credentials.ApplicationId = strKey;
                        reqGeocode.ExecutionOptions = new ExecutionOptions();
                        reqGeocode.ExecutionOptions.SuppressFaults = true;
                        reqGeocode.Query = strLoc;

                        // request geocode from microsoft
                        GeocodeServiceClient svcGeocode = new GeocodeServiceClient("BasicHttpBinding_IGeocodeService");
                        GeocodeResponse respGeocode = svcGeocode.Geocode(reqGeocode);
                        if ((respGeocode != null) && (respGeocode.Results != null))
                        {
                            // loop through results
                            foreach (GeocodeResult retGeocode in respGeocode.Results)
                            {
                                // check location
                                if (retGeocode.Locations.Count > 0)
                                {
                                    // get reverse geocode
                                    strRet = String.Format("{0},{1}\r{2}", retGeocode.Locations[0].Latitude,
                                        retGeocode.Locations[0].Longitude, retGeocode.DisplayName);
                                    break;
                                }
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        // log error
                        strError += String.Format("\rBing Maps: {0}", ex.Message);
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                strError += ex.Message;
            }

            // log event
            if ((strRet == "") && (strError.Trim() != ""))
                DatabaseMgr.LogEvent("Geocode: " + strError.Trim(), 1);
            return strRet;
        }

        /// <summary>
        /// formats valid google api URL
        /// </summary>
        /// <param name="strUrl"></param>
        /// <param name="strKey"></param>
        /// <returns></returns>
        public static string SignGoogleUri(string strUrl, string strKey)
        {
            // converting key to bytes will throw an exception, need to replace '-' and '_' characters first.
            ASCIIEncoding encoding = new ASCIIEncoding();
            string usablePrivateKey = strKey.Replace("-", "+").Replace("_", "/");
            byte[] privateKeyBytes = Convert.FromBase64String(usablePrivateKey);

            // format uri
            Uri uri = new Uri(strUrl);
            byte[] encodedPathAndQueryBytes = encoding.GetBytes(uri.LocalPath + uri.Query);

            // compute the hash
            HMACSHA1 algorithm = new HMACSHA1(privateKeyBytes);
            byte[] hash = algorithm.ComputeHash(encodedPathAndQueryBytes);

            // add the signature to the existing uri
            string signature = Convert.ToBase64String(hash).Replace("+", "-").Replace("/", "_");
            return uri.Scheme + "://" + uri.Host + uri.LocalPath + uri.Query + "&signature=" + signature;
        }

        /// <summary>
        /// downloads uri and parses json response
        /// </summary>
        /// <param name="strUri"></param>
        /// <param name="strKey"></param>
        /// <param name="iIndex"></param>
        /// <returns></returns>
        public static Dictionary<string, object> Deserialize(string strUri, string strKey, int iIndex)
        {
            // download json string
            HttpDownloader httpLoader = new HttpDownloader(strUri, "", "");
            string strJson = httpLoader.GetPage();
            if ((strJson != "") && !strJson.ToLower().Contains("error"))
            {
                // deserialize string
                JavaScriptSerializer jsSerializer = new JavaScriptSerializer();
                Dictionary<string, object> arrParams = jsSerializer.Deserialize<Dictionary<string, object>>(strJson);

                // check parameter
                if (strKey == "") return arrParams;
                else if (arrParams.ContainsKey(strKey))
                {
                    // get parameter
                    ArrayList arrTemp = (ArrayList)arrParams[strKey];
                    if (arrTemp.Count > iIndex)
                        return (Dictionary<string, object>)arrTemp[iIndex];
                }
            }
            return null;
        }

        /// <summary>
        /// downloads uri and parses json response
        /// </summary>
        /// <param name="strUri"></param>
        /// <param name="strKey"></param>
        /// <returns></returns>
        public static ArrayList DeserializeList(string strUri, string strKeys)
        {
            // download json string
            ArrayList arrList = new ArrayList();
            HttpDownloader httpLoader = new HttpDownloader(strUri, "", "");
            string strJson = httpLoader.GetPage();
            if (strJson != "")
            {
                // deserialize string
                JavaScriptSerializer jsSerializer = new JavaScriptSerializer();
                Dictionary<string, object> arrParams = jsSerializer.Deserialize<Dictionary<string, object>>(strJson);
                string[] arrKeys = strKeys.Split("/".ToCharArray(), StringSplitOptions.RemoveEmptyEntries);

                // loop through keys
                for (int i = 0; i < arrKeys.Length; i++)
                {
                    // check key
                    string strKey = arrKeys[i];
                    if ((strKey != "") && arrParams.ContainsKey(strKey))
                    {
                        // check if last key
                        if (arrParams[strKey] is ArrayList) return (ArrayList)arrParams[strKey];
                        arrParams = (Dictionary<string, object>)arrParams[strKey];
                    }
                    else
                    {
                        // loop through keys
                        foreach (string strKeyEx in arrParams.Keys)
                        {
                            // check key
                            if (strKeyEx.StartsWith(strKey))
                            {
                                Dictionary<string, object> arrInner = (Dictionary<string, object>)arrParams[strKeyEx];
                                for (int j = i + 1; j < arrKeys.Length; j++)
                                {
                                    // check key
                                    string strKey2 = arrKeys[j];
                                    if ((strKey2 != "") && arrInner.ContainsKey(strKey2))
                                    {
                                        // check if last key
                                        if (arrInner[strKey2] is ArrayList)
                                        {
                                            // append to array list
                                            arrList.AddRange((ArrayList)arrInner[strKey2]);
                                            break;
                                        }
                                        arrInner = (Dictionary<string, object>)arrInner[strKey2];
                                    }
                                }
                            }
                            else break;
                        }
                    }
                }
            }
            return arrList;
        }

        /// <summary>
        /// downloads address of specified coordinates
        /// </summary>
        /// <param name="lLatitude"></param>
        /// <param name="lLongitude"></param>
        /// <returns></returns>
        public static string ReverseGeocode(double lLatitude, double lLongitude)
        {
            DateTime dtTimestamp = DateTime.Now;
            string strRet = "";
            string strError = "";
            try
            {
                // check google maps api key
                string strKey = ConfigurationManager.AppSettings["GoogleBusinessKey"];
                if ((strRet == "") && (strKey != ""))
                {
                    try
                    {
                        // request reverse geocode from google
                        string strUri = String.Format("http://maps.googleapis.com/maps/api/geocode/xml?latlng={0},{1}&client={2}&sensor=false",
                            lLatitude, lLongitude, ConfigurationManager.AppSettings["GoogleClientID"]);
                        strUri = SignGoogleUri(strUri, strKey);
                        HttpDownloader httpLoader = new HttpDownloader(strUri, "", "");
                        string strXml = httpLoader.GetPage();

                        // check response
                        if (strXml != "")
                        {
                            // parse xml string
                            XmlDocument xmlDoc = new XmlDocument();
                            xmlDoc.LoadXml(strXml);

                            // check status
                            if (xmlDoc.NodeValue("/GeocodeResponse/status") == "OK")
                                strRet = xmlDoc.NodeValue("/GeocodeResponse/result/formatted_address");
                        }
                    }
                    catch (Exception ex)
                    {
                        // log error
                        strError += String.Format("\rGoogle Maps: {0}", ex.Message);
                    }
                }

                // check reverse geocode
                if (strRet == "")
                {
                    try
                    {
                        // request reverse geocode from openstreetmap
                        string strUri = String.Format("http://nominatim.openstreetmap.org/reverse?format=xml&lat={0}&lon={1}" +
                            "&zoom=18&addressdetails=1", lLatitude, lLongitude);
                        HttpDownloader httpLoader = new HttpDownloader(strUri, "", "");
                        string strXml = httpLoader.GetPage();

                        // check response
                        if (strXml != "")
                        {
                            // parse xml string
                            XmlDocument xmlDoc = new XmlDocument();
                            xmlDoc.LoadXml(strXml);

                            // get reverse geocode
                            strRet = xmlDoc.NodeValue("/reversegeocode/result");
                        }
                    }
                    catch (Exception ex)
                    {
                        // log error
                        strError += String.Format("\rOpenStreetMap: {0}", ex.Message);
                    }
                }

                // check reverse geocode
                strKey = ""; // todo: sign up for geonames.org account (e.g. username = "holcim")
                if ((strRet == "") && (strKey != ""))
                {
                    try
                    {
                        // request reverse geocode from geonames
                        string strUri = String.Format("http://api.geonames.org/findNearby?lat={0}&lng={1}&username={2}",
                            lLatitude, lLongitude, strKey);
                        HttpDownloader httpLoader = new HttpDownloader(strUri, "", "");
                        string strXml = httpLoader.GetPage();

                        // check response
                        if (strXml != "")
                        {
                            // parse xml string
                            XmlDocument xmlDoc = new XmlDocument();
                            xmlDoc.LoadXml(strXml);

                            // get reverse geocode
                            if ((xmlDoc.NodeValue("/geonames/geoname/lat") != "0") && (xmlDoc.NodeValue("/geonames/geoname/lng") != "0")
                                && (xmlDoc.NodeValue("/geonames/geoname/toponymName") != "Earth"))
                                strRet = xmlDoc.NodeValue("/geonames/geoname/toponymName");
                        }
                    }
                    catch (Exception ex)
                    {
                        // log error
                        strError += String.Format("\rGeoNames: {0}", ex.Message);
                    }
                }

                // check yahoo maps api key
                strKey = ConfigurationManager.AppSettings["YahooMapKey"];
                if ((strRet == "") && (strKey != ""))
                {
                    try
                    {
                        // request reverse geocode from yahoo
                        string strYql = String.Format("select locality1 from geo.places where text=\"{0},{1}\"",
                            lLatitude, lLongitude);
                        string strUrl = String.Format("http://query.yahooapis.com/v1/public/yql?q={0}",
                            HttpUtility.UrlEncode(strYql));
                        HttpDownloader httpLoader = new HttpDownloader(strUrl, "", "");
                        string strData = httpLoader.GetPage();

                        // parse xml string
                        XmlDocument xmlDoc = new XmlDocument();
                        xmlDoc.LoadXml(strData);

                        // check result
                        string strLine1 = xmlDoc.NodeValue("/ResultSet/Result/line1").Trim();
                        if ((xmlDoc.NodeValue("/ResultSet/Error") == "0") && !strLine1.Contains("0 0"))
                        {
                            try
                            {
                                // parse comma
                                string strTemp = strLine1;
                                if (strTemp.Contains(","))
                                    strTemp = strTemp.Substring(0, strTemp.IndexOf(","));

                                // check first line if coordinates
                                string[] arrTemp = strTemp.Split();
                                double lTemp = Convert.ToDouble(arrTemp[0].Trim());
                                lTemp = Convert.ToDouble(arrTemp[1].Trim());
                                strLine1 = "";
                            }
                            catch { }

                            // format reverse geocode
                            strRet = String.Format("{0},{1},{2}", strLine1,
                                xmlDoc.NodeValue("/ResultSet/Result/line2"),
                                xmlDoc.NodeValue("/ResultSet/Result/line4")).Trim(",".ToCharArray());
                        }
                    }
                    catch (Exception ex)
                    {
                        // log error
                        strError += String.Format("\rYahoo Maps: {0}", ex.Message);
                    }
                }

                // check onemapsg api key
                strKey = ConfigurationManager.AppSettings["OneMapKey"];
                if ((strRet == "") && (strKey != ""))
                {
                    try
                    {
                        // request geocode from onemap.sg
                        string strUri = String.Format("http://www.onemap.sg/API/services.svc/getToken?accessKEY={0}", strKey);
                        Dictionary<string, object> arrParams = Deserialize(strUri, "GetToken", 0);

                        // check response
                        if ((arrParams != null) && (arrParams["NewToken"] != null))
                        {
                            // get api token
                            string strToken = arrParams["NewToken"].ToString();
                            if (strToken != "")
                            {
                                // request reverse geocode from onemap
                                strUri = String.Format("http://www.onemap.sg/API/services.svc/revgeocode?token={0}&location={1},{2}",
                                    strToken, lLongitude, lLatitude);
                                arrParams = Deserialize(strUri, "GeocodeInfo", 0);

                                // get reverse geocode
                                if ((arrParams != null) && (arrParams["ROAD"] != null))
                                    strRet = arrParams["ROAD"].ToString();
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        // log error
                        strError += String.Format("\rOneMapSG: {0}", ex.Message);
                    }
                }

                // check bing maps api key
                strKey = ConfigurationManager.AppSettings["BingKey"];
                if ((strRet == "") && (strKey != ""))
                {
                    try
                    {
                        // initialize reverse geocode request
                        ReverseGeocodeRequest reqGeocode = new ReverseGeocodeRequest();
                        reqGeocode.Credentials = new Credentials();
                        reqGeocode.Credentials.ApplicationId = strKey;
                        reqGeocode.ExecutionOptions = new ExecutionOptions();
                        reqGeocode.ExecutionOptions.SuppressFaults = true;
                        reqGeocode.Location = new Location();
                        reqGeocode.Location.Latitude = lLatitude;
                        reqGeocode.Location.Longitude = lLongitude;

                        // request reverse geocode from microsoft
                        GeocodeServiceClient svcGeocode = new GeocodeServiceClient("BasicHttpBinding_IGeocodeService");
                        GeocodeResponse respGeocode = svcGeocode.ReverseGeocode(reqGeocode);
                        if ((respGeocode != null) && (respGeocode.Results != null))
                        {
                            // loop through results
                            foreach (GeocodeResult retGeocode in respGeocode.Results)
                            {
                                // check location
                                if (retGeocode.DisplayName != "")
                                    strRet = retGeocode.DisplayName;
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        // log error
                        strError += String.Format("\rBing Maps SOAP: {0}", ex.Message);
                    }
                }

                // check bing maps api key
                strKey = ConfigurationManager.AppSettings["BingKey"];
                if ((strRet == "") && (strKey != ""))
                {
                    try
                    {
                        // request reverse geocode from bing maps
                        string strUri = String.Format("http://dev.virtualearth.net/REST/v1/Locations/{0},{1}?o=xml&key={2}",
                            lLatitude, lLongitude, strKey);
                        HttpDownloader httpLoader = new HttpDownloader(strUri, "", "");
                        string strXml = httpLoader.GetPage();

                        // check response
                        if (strXml != "")
                        {
                            // parse xml string
                            XmlDocument xmlDoc = new XmlDocument();
                            xmlDoc.LoadXml(strXml);

                            // get reverse geocode
                            if (xmlDoc.NodeValue("/Response/StatusDescription") == "OK")
                                strRet = xmlDoc.NodeValue("/Response/ResourceSets/ResourceSet/Resources/Location/Name");
                        }
                    }
                    catch (Exception ex)
                    {
                        // log error
                        strError += String.Format("\rBing Maps REST: {0}", ex.Message);
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                strError += ex.Message;
            }

            // log error
            if (strError.Trim() != "")
                DatabaseMgr.LogEvent("ReverseGeocode: " + strError.Trim(), 1);
            return strRet;
        }

        /// <summary>
        /// searches points of interest
        /// </summary>
        /// <param name="strSearch"></param>
        /// <returns></returns>
        public static List<ZoneInfo> GetPois(string strSearch)
        {
            List<ZoneInfo> arrZones = new List<ZoneInfo>();
            DateTime dtTimestamp = DateTime.Now;
            try
            {
                // check google maps api key
                string strKey = ConfigurationManager.AppSettings["GoogleBusinessKey"];
                if (strKey != "")
                {
                    // request pois from google
                    string strUri = String.Format("http://maps.googleapis.com/maps/api/place/textsearch/xml?" +
                        "query={0}&client={1}&sensor=false", strSearch, ConfigurationManager.AppSettings["GoogleClientID"]);
                    strUri = SignGoogleUri(strUri, strKey);
                    HttpDownloader httpLoader = new HttpDownloader(strUri, "", "");
                    string strResult = httpLoader.GetPage();

                    // parse xml string
                    XmlDocument xmlDoc = new XmlDocument();
                    xmlDoc.LoadXml(strResult);

                    // check result
                    string strStatus = xmlDoc.NodeValue("/PlaceSearchResponse/status");
                    if (strStatus != "OK") DatabaseMgr.LogEvent("GetPois: " + strStatus, 1);
                    else
                    {
                        // loop through results
                        XmlNodeList results = xmlDoc.GetElementsByTagName("result");
                        foreach (XmlNode result in results)
                        {
                            // build zone info
                            ZoneInfo udtZone = new ZoneInfo();
                            udtZone.ZoneID = arrZones.Count;
                            udtZone.Name = result.SelectSingleNode(".//name").InnerText;
                            udtZone.Type = result.SelectSingleNode(".//type").InnerText.ToTitleCase();
                            udtZone.Location = result.SelectSingleNode(".//formatted_address").InnerText;
                            double lLat = Convert.ToDouble(result.SelectSingleNode(".//geometry/location/lat").InnerText);
                            double lLon = Convert.ToDouble(result.SelectSingleNode(".//geometry/location/lng").InnerText);
                            udtZone.Perimeter = String.Format("{0},{1} {0},{2}", lLat, lLon, lLon + 0.0022);
                            udtZone.Color = "#495f75";
                            udtZone.Image = result.SelectSingleNode(".//icon").InnerText;
                            udtZone.ImageFill = "Uniform";
                            arrZones.Add(udtZone);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgr.LogEvent("GetPois: " + ex.Message, 1);
            }
            return arrZones;
        }

        /// <summary>
        /// searches nearby points of interest
        /// </summary>
        /// <param name="ptLoc"></param>
        /// <param name="iRadius"></param>
        /// <returns></returns>
        public static List<ZoneInfo> GetPoisEx(double lLatitude, double lLongitude, double lRadius)
        {
            List<ZoneInfo> arrZones = new List<ZoneInfo>();
            DateTime dtTimestamp = DateTime.Now;
            try
            {
                // check google maps api key
                string strKey = ConfigurationManager.AppSettings["GoogleBusinessKey"];
                if (strKey != "")
                {
                    // request pois from google
                    string strCountry = "Singapore";
                    string strUri = String.Format("http://maps.googleapis.com/maps/api/place/nearbysearch/xml?" +
                        "location={0},{1}&radius={2}&client={3}&sensor=false", lLatitude, lLongitude, lRadius,
                        ConfigurationManager.AppSettings["GoogleClientID"]);
                    strUri = SignGoogleUri(strUri, strKey);
                    HttpDownloader httpLoader = new HttpDownloader(strUri, "", "");
                    string strResult = httpLoader.GetPage();

                    // parse xml string
                    XmlDocument xmlDoc = new XmlDocument();
                    xmlDoc.LoadXml(strResult);

                    // check result
                    string strStatus = xmlDoc.NodeValue("/PlaceSearchResponse/status");
                    if (strStatus != "OK") DatabaseMgr.LogEvent("GetPoisEx: " + strStatus, 1);
                    else
                    {
                        // loop through results
                        XmlNodeList results = xmlDoc.GetElementsByTagName("result");
                        foreach (XmlNode result in results)
                        {
                            try
                            {
                                // get location
                                double lLat = Convert.ToDouble(result.SelectSingleNode(".//geometry/location/lat").InnerText);
                                double lLon = Convert.ToDouble(result.SelectSingleNode(".//geometry/location/lng").InnerText);

                                // check distance
                                if (CalcDistance(lLat, lLon, lLatitude, lLongitude) <= (lRadius / 1000))
                                {
                                    // build poi info
                                    ZoneInfo udtZone = new ZoneInfo();
                                    udtZone.ZoneID = arrZones.Count;
                                    udtZone.Name = result.SelectSingleNode(".//name").InnerText;
                                    udtZone.Type = result.SelectNodes(".//type")[0].InnerText.ToTitleCase();
                                    XmlNode xmlLoc = result.SelectSingleNode(".//vicinity");
                                    udtZone.Location = (xmlLoc != null ? xmlLoc.InnerText : strCountry);
                                    if (udtZone.Location == "") udtZone.Location = strCountry;
                                    udtZone.Perimeter = String.Format("{0},{1} {0},{2}", lLat, lLon, lLon + 0.0022);
                                    udtZone.Color = "#495f75";
                                    udtZone.Image = result.SelectSingleNode(".//icon").InnerText;
                                    udtZone.ImageFill = "Uniform";

                                    // check poi if already in list
                                    var arrTemp = (from poi in arrZones where (poi.Name == udtZone.Name) select poi);
                                    if (arrTemp.Count() == 0) arrZones.Add(udtZone);
                                }
                            }
                            catch { }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // log error
                DatabaseMgr.LogEvent("GetPoisEx: " + ex.Message, 1);
            }
            return arrZones;
        }

        /// <summary>
        /// calculates distance between two geocoordinates
        /// </summary>
        /// <param name="sLatitude"></param>
        /// <param name="sLongitude"></param>
        /// <param name="eLatitude"></param>
        /// <param name="eLongitude"></param>
        /// <returns></returns>
        public static double CalcDistance(double lLat1, double lLon1, double lLat2, double lLon2)
        {
            // get radians
            double lLatDiff = (lLat2 - lLat1) * (Math.PI / 180.0);
            double lLonDiff = (lLon2 - lLon1) * (Math.PI / 180.0);
            double lLat1Rad = lLat1 * (Math.PI / 180.0);
            double lLat2Rad = lLat2 * (Math.PI / 180.0);

            // calculate distance
            double lTemp = Math.Sin(lLatDiff / 2) * Math.Sin(lLatDiff / 2) +
                Math.Sin(lLonDiff / 2) * Math.Sin(lLonDiff / 2) * Math.Cos(lLat1Rad) * Math.Cos(lLat2Rad);
            double lDist = 6371 * 2 * Math.Atan2(Math.Sqrt(lTemp), Math.Sqrt(1 - lTemp));
            return lDist;
        }
    }
}
