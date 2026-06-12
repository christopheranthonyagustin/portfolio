using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace FMSWebApi.Models
{
    /// <summary>
    /// zone info
    /// </summary>
    public class Decrypt
    {
        public string Value { get; set; }
        public string Secret { get; set; }
        public string Result { get; set; }

    }
}