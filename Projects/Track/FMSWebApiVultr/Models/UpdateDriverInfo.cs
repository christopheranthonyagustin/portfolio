using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    public class UpdateDriverInfo
    {
        public int DriverID { get; set; }
        public string Name { get; set; }
        public string Password { get; set; }
        public string LoginRetry { get; set; }
        public DateTime LastLogin { get; set; }
        public DateTime ModifiedDate { get; set; }

    }
}