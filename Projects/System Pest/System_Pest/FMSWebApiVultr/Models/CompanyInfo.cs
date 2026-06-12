using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    /// <summary>
    /// company info
    /// </summary>
    public class CompanyInfo
    {
        public int CompanyID { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Reports { get; set; }
        public string Categories { get; set; }
        public Enums.Status Flag { get; set; }
        public int ResellerID { get; set; }
        public string Reseller { get; set; }
        public int UserLimit { get; set; }
        public int ZoneLimit { get; set; }
        public int AssetLimit { get; set; }
        public int SmsLimit { get; set; }
        public string Image { get; set; }
        public string ImageFill { get; set; }
        //public string Flag { get; set; }
        public string ErrorMessage { get; set; }
    
    }
}