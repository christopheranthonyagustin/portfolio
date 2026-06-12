using FMSWebApi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Formatting;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;

namespace FMSWinSvcTester.HelperTools
{
    public class WebAPIHelper
    {
        private string mUrl = "";
        HttpClient client = new HttpClient();

        public WebAPIHelper(string url)
        {
            this.mUrl = url;
        }

        public List<PosInfo> Get(string customerId = "")
        {
            List<PosInfo> arrPos = new List<PosInfo>();
            return arrPos;
        }

        public string Post(PosInfo obj)
        {
            string retStr = "";

            //HttpRequestMessage request = new HttpRequestMessage();
            //MediaTypeFormatter[] formatter = new MediaTypeFormatter[] { new JsonMediaTypeFormatter() };
            //var content = request. CreateContent<PosInfo>(obj, MediaTypeHeaderValue.Parse("application/json"), formatter, new FormatterSelector());
            //HttpResponseMessage response = client.PostAsync(this.mUrl, content).Result;
            //return response.Content.ToString();

            return retStr;
        }

        public string Put(string posID, PosInfo obj)
        {
            string retStr = "";
            return retStr;
        }

        public string Delete(string posID)
        {
            string retStr = "";
            return retStr;
        }
    }
}
