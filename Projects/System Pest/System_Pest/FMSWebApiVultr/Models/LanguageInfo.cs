using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    /// <summary>
    /// zone info
    /// </summary>
    public class LanguageInfo
    {
        public int LanguageID { get; set; }
        public string Name { get; set; }
        public string Culture { get; set; }
        public string ErrorMessage { get; set; }

    }
}