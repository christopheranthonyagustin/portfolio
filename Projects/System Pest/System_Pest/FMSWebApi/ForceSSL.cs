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
using System.Web.Http.Filters;
using System.Web.Http.Controllers;
using System.Net.Http;


namespace ForceSSL.Modules
{
    public class RequireHttpsAttribute : AuthorizationFilterAttribute
    {
        public override void OnAuthorization(HttpActionContext actionContext)
        {
            if (actionContext == null)
            {
                throw new ArgumentNullException("actionContext");
            }

            if (actionContext.Request.RequestUri.Scheme != Uri.UriSchemeHttps)
            {
                HandleNonHttpsRequest(actionContext);
            }
            else
            {
                base.OnAuthorization(actionContext);
            }
        }

        protected virtual void HandleNonHttpsRequest(HttpActionContext actionContext)
        {
            var _Request = actionContext.Request;
            var _HtmlBody = "<h2>System Pest - 403 Https is required</h2>" + "<br />Forbidden: You don't have permission to access on this server";

            actionContext.Response = _Request.CreateResponse(HttpStatusCode.NotFound);
            actionContext.Response.Content = new StringContent(_HtmlBody, Encoding.UTF8, "text/html");
            //actionContext.Response = new HttpResponseMessage(System.Net.HttpStatusCode.Forbidden);
            actionContext.Response.ReasonPhrase = "SSL Required";

        }
    }
}