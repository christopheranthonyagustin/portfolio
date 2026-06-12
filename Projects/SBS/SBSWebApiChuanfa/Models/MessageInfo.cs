using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    /// <summary>
    /// asset info and status
    /// </summary>
    public class MessageInfo
    {

        public int MessageID { get; set; }

        public string Sender { get; set; }

        public string Recipients { get; set; }

        public string Message { get; set; }

        public DateTime Timestamp { get; set; }

        public DateTime RxTime { get; set; }

        public int StatusID { get; set; }

        public string Status { get; set; }

        public int AssetID { get; set; }

        public string Asset { get; set; }

        public int Flag { get; set; }

        public int CompanyID { get; set; }

        public string Company { get; set; }

        public string ErrorMessage { get; set; }

    }
}