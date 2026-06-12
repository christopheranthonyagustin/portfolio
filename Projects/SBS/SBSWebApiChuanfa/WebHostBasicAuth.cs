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
using System.Security.Principal;
using System.Threading;
using System.Net.Http.Headers;
using FMSWebApi;
//using System.DirectoryServices;
using System.DirectoryServices.Protocols;

namespace WebHostBasicAuth.Modules
{
    public class BasicAuthHttpModule : IHttpModule
    {
        private const string Realm = "SBST ADAS WEB API";
        public const string strAuthenticatedBy = "";
        public const string strError = "";

        public void Init(HttpApplication context)
        {
            // Register event handlers
            context.AuthenticateRequest += OnApplicationAuthenticateRequest;
            context.EndRequest += OnApplicationEndRequest;
        }

        private static void SetPrincipal(IPrincipal principal)
        {
            Thread.CurrentPrincipal = principal;
            if (HttpContext.Current != null)
            {
                HttpContext.Current.User = principal;
            }
        }

        // TODO: Here is where you would validate the username and password.
        private static bool CheckPassword(string username, string password)
        {
            return username == "csctap09" && password == "2233@alex";
        }

        private static void AuthenticateUser(string credentials)
        {
            try
            {
                var encoding = Encoding.GetEncoding("iso-8859-1");
                credentials = encoding.GetString(Convert.FromBase64String(credentials));

                int separator = credentials.IndexOf(':');
                string name = credentials.Substring(0, separator);
                string password = credentials.Substring(separator + 1);

                //
                //domain w2kdc.com
                //basedn: cn=w2kdc, cd=com
                //username - csctap09   
                //password - 2233@alex
                //ldap - 

                if (CheckPassword(name, password))
                {
                    var identity = new GenericIdentity(name);
                    SetPrincipal(new GenericPrincipal(identity, null));
                }
                else
                {
                    // Invalid username or password.
                    HttpContext.Current.Response.StatusCode = 401;
                    Logger.LogEvent("Invalid username or password: " + HttpContext.Current.Response.StatusCode, System.Diagnostics.EventLogEntryType.Warning);
                }
            }
            catch (FormatException)
            {
                // Credentials were not formatted correctly.
                HttpContext.Current.Response.StatusCode = 401;
                Logger.LogEvent("AuthenticateUser: " + HttpContext.Current.Response.StatusCode, System.Diagnostics.EventLogEntryType.Error);
            }
        }

        private static void OnApplicationAuthenticateRequest(object sender, EventArgs e)
        {
            var request = HttpContext.Current.Request;
            var authHeader = request.Headers["Authorization"];
            if (authHeader != null)
            {
                var authHeaderVal = AuthenticationHeaderValue.Parse(authHeader);

                // RFC 2617 sec 1.2, "scheme" name is case-insensitive
                if (authHeaderVal.Scheme.Equals("basic",
                        StringComparison.OrdinalIgnoreCase) &&
                    authHeaderVal.Parameter != null)
                {
                    Logger.LogEvent("AuthenticateUser: " + HttpContext.Current.Response.StatusCode + " OnApplicationAuthenticateRequest" + authHeaderVal.Parameter, System.Diagnostics.EventLogEntryType.Error);
                    AuthenticateUser(authHeaderVal.Parameter);
                }
            }


        }

        // If the request was unauthorized, add the WWW-Authenticate header 
        // to the response.
        private static void OnApplicationEndRequest(object sender, EventArgs e)
        {
            var response = HttpContext.Current.Response;
            if (response.StatusCode == 401)
            {
                response.Headers.Add("WWW-Authenticate",
                    string.Format("Basic realm=\"{0}\"", Realm));
            }
        }

        public void Dispose()
        {
        }
    }
}