using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    public class UpdateUserInfo
    {
        public int UserID { get; set; }
        public string User { get; set; }
        public string Password { get; set; }
        public string LoginRetry { get; set; }
        public DateTime LastLogin { get; set; }
        public DateTime ModifiedDate { get; set; }

    }
}