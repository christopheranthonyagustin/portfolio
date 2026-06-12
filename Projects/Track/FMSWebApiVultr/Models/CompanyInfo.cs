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
        public string Unit { get; set; }
        public string Building { get; set; }
        public string Postal { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Reports { get; set; }
        public string Categories { get; set; }
        public int Flag { get; set; }
        public int ResellerID { get; set; }
        public string Reseller { get; set; }
        public int UserLimit { get; set; }
        public int ZoneLimit { get; set; }
        public int AssetLimit { get; set; }
        public int CreditLimit { get; set; }
        public int SmsLimit { get; set; }
        public int isSHN { get; set; }
        public int isDirections { get; set; }
        public int isTSP { get; set; }
        public int isVRP { get; set; }
        public int isLocation { get; set; }
        public int isTraffic { get; set; }
        public int isCarpark { get; set; }
        public int isErp { get; set; }
        public int isWeather { get; set; }
        public int isStreetview { get; set; }
        public int isHeatmap { get; set; }
        public int isGPS { get; set; }
        public int SessionTimeout { get; set; }
        public int ReportDuration { get; set; }
        public int ReportRange { get; set; }
        public int NotificationInterval { get; set; }
        public int NotifyCustomer { get; set; }
        public int NotifyFinalInvoice { get; set; }
        public string OMUsername { get; set; }
        public string OMPassword { get; set; }
        public string Token { get; set; }
        public string SMTPUsername { get; set; }
        public string SMTPPassword { get; set; }
        public int SMTPPort { get; set; }
        public string SMTPHost { get; set; }
        public int isSecured { get; set; }
        public int SubscriptionID { get; set; }
        public string Image { get; set; }
        public string ImageFill { get; set; }
        public string ErrorMessage { get; set; }
    
    }
}