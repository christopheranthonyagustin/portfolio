using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    public class OaPerfParamsInfo
    {
        public int SessionID { get; set; }
        public int ParamID { get; set; }
        public DateTime Timestamp { get; set; }
        public DateTime RxTime { get; set; }
        public string ErrorMessage { get; set; }

    }
}