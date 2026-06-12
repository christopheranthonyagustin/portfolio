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
    public class AssetFeatureInfo
    {
        public int FeatureID { get; set; }
        public string FeatureDesc { get; set; }
        [IgnoreDataMember]
        public string Features { get; set; }
        public string ErrorMessage { get; set; }

    }
}