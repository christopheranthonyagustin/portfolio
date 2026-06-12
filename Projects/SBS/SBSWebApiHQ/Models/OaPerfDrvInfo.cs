using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    public class OaPerfDrvInfo
    {
        public int SessionID { get; set; }
        public int ParamID { get; set; }
        public int DrvNo { get; set; }
        public string ErrorMessage { get; set; }

    }
}