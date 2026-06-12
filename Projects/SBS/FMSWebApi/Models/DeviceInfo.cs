using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    /// <summary>
    /// user info
    /// </summary>
    public class DeviceInfo
    {
        public int DeviceID { get; set; }
        public int DeviceTypeID { get; set; }
        public string DeviceType { get; set; }
        public string Name { get; set; }
        public string Imei { get; set; }
        public string Phone { get; set; }
        public int Interval { get; set; }
        public int Port { get; set; }
        public string APN{ get; set; }
        public DateTime InstallDate { get; set; }
        public DateTime ModifiedTimestamp { get; set; }
        public string Remarks { get; set; }
        public int isSentOut { get; set; }
        public string Image { get; set; }
        public string ImageFill { get; set; }
        public string ErrorMessage { get; set; }
        public int AssetID { get; set; }
        public string Asset { get; set; }
        public int CompanyID { get; set; }
        public string Company { get; set; }
        public int ResellerID { get; set; }
        public string Reseller { get; set; }

    }
}