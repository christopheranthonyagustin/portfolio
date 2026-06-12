using System;
using System.Collections.Generic;
using System.IO;
using System.IO.Compression;
using System.Linq;
using System.Net;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;

namespace WlocateWeb
{
    public class HttpDownloader
    {
        /// <summary>
        /// private variables
        /// </summary>
        private readonly string _referer;
        private readonly string _userAgent;

        /// <summary>
        /// public variables
        /// </summary>
        public Encoding Encoding { get; set; }
        public WebHeaderCollection Headers { get; set; }
        public Uri Url { get; set; }

        /// <summary>
        /// class constructor
        /// </summary>
        /// <param name="url"></param>
        /// <param name="referer"></param>
        /// <param name="userAgent"></param>
        public HttpDownloader(string url, string referer, string userAgent)
        {
            // initialize member variables
            Encoding = Encoding.GetEncoding("ISO-8859-1");
            Url = new Uri(url);
            _userAgent = userAgent;
            _referer = referer;
        }

        /// <summary>
        /// downloads the webpage
        /// </summary>
        /// <returns></returns>
        public string GetPage()
        {
            // create web request
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(Url);
            if (!string.IsNullOrEmpty(_referer)) request.Referer = _referer;
            if (!string.IsNullOrEmpty(_userAgent)) request.UserAgent = _userAgent;

            // initialize headers
            request.Headers.Add(HttpRequestHeader.AcceptEncoding, "gzip,deflate");
            request.Timeout = 5000;

            // download webpage
            using (HttpWebResponse response = (HttpWebResponse)request.GetResponse())
            {
                // process content
                Headers = response.Headers;
                Url = response.ResponseUri;
                return ProcessContent(response);
            }
        }

        /// <summary>
        /// processes downloaded data
        /// </summary>
        /// <param name="response"></param>
        /// <returns></returns>
        private string ProcessContent(HttpWebResponse response)
        {
            // set encoding
            SetEncodingFromHeader(response);

            // unzip if zipped
            Stream s = response.GetResponseStream();
            if (response.ContentEncoding.ToLower().Contains("gzip"))
                s = new GZipStream(s, CompressionMode.Decompress);
            else if (response.ContentEncoding.ToLower().Contains("deflate"))
                s = new DeflateStream(s, CompressionMode.Decompress);

            // write data to stream
            MemoryStream memStream = new MemoryStream();
            int bytesRead;
            byte[] buffer = new byte[0x1000];
            for (bytesRead = s.Read(buffer, 0, buffer.Length); bytesRead > 0; bytesRead = s.Read(buffer, 0, buffer.Length))
                memStream.Write(buffer, 0, bytesRead);
            s.Close();

            // read data from stream
            string html;
            memStream.Position = 0;
            using (StreamReader r = new StreamReader(memStream, Encoding))
            {
                // reencode data
                html = r.ReadToEnd().Trim();
                html = CheckMetaCharSetAndReEncode(memStream, html);
            }
            return html;
        }

        /// <summary>
        /// sets header encoding
        /// </summary>
        /// <param name="response"></param>
        private void SetEncodingFromHeader(HttpWebResponse response)
        {
            // check character set
            string charset = null;
            if (string.IsNullOrEmpty(response.CharacterSet))
            {
                // set character set
                Match m = Regex.Match(response.ContentType, @";\s*charset\s*=\s*(?<charset>.*)", RegexOptions.IgnoreCase);
                if (m.Success) charset = m.Groups["charset"].Value.Trim(new[] { '\'', '"' });
            }
            else charset = response.CharacterSet;

            // check character set
            if (!string.IsNullOrEmpty(charset))
            {
                // set encoding
                try { Encoding = Encoding.GetEncoding(charset); }
                catch (ArgumentException) { }
            }
        }

        /// <summary>
        /// checks meta character set and reencodes data
        /// </summary>
        /// <param name="memStream"></param>
        /// <param name="html"></param>
        /// <returns></returns>
        private string CheckMetaCharSetAndReEncode(Stream memStream, string html)
        {
            Match m = new Regex(@"<meta\s+.*?charset\s*=\s*(?<charset>[A-Za-z0-9_-]+)", RegexOptions.Singleline | RegexOptions.IgnoreCase).Match(html);
            if (m.Success)
            {
                // check if unicode
                string charset = m.Groups["charset"].Value.ToLower() ?? "iso-8859-1";
                if ((charset == "unicode") || (charset == "utf-16"))
                    charset = "utf-8";
                try
                {
                    // check encoding
                    Encoding metaEncoding = Encoding.GetEncoding(charset);
                    if (Encoding != metaEncoding)
                    {
                        // reencode data
                        memStream.Position = 0L;
                        StreamReader recodeReader = new StreamReader(memStream, metaEncoding);
                        html = recodeReader.ReadToEnd().Trim();
                        recodeReader.Close();
                    }
                }
                catch (ArgumentException) { }
            }
            return html;
        }
    } 
}