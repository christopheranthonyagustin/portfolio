using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    /// <summary>
    /// user info
    /// </summary>
    public class UserInfo
    {
        public long UserID { get; set; }
        public string Name { get; set; }
        public string User { get; set; }
        public string Password { get; set; }
        public int RoleID { get; set; }
        public string Phone{ get; set; }
        public string Email { get; set; }
        public int CompanyID { get; set; }
        public string Assets { get; set; }
        public string Notifications { get; set; }
        public string LoginRetry { get; set; }
        public int LoginCount { get; set; }
        public string Reports { get; set; }
        public int LanguageID { get; set; }
        public string ApiKey { get; set; }
        public int ResellerID { get; set; }
        public string ResellerDesc { get; set; }
        public string RoleDesc { get; set; }
        public string Company { get; set; }
        public string CompanyAddress { get; set; }
        public string CompanyUnit { get; set; }
        public string CompanyBuilding { get; set; }
        public string CompanyPostal { get; set; }
        public string Language { get; set; }
        public string Culture { get; set; }
        public string TempPassword { get; set; }
        public string URL { get; set; }
        public string Image { get; set; }
        public string ImageFill { get; set; }
        public string ErrorMessage { get; set; }
        public string reCaptcha { get; set; }
        public decimal Score { get; set; }
        public string Hostname { get; set; }
        public bool Success { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime ModifiedDate { get; set; }
        public int PasswordExpiration { get; set; }
        public DateTime LastLogin { get; set; }
        public int UserExpiration { get; set; }
        public int UserLimit { get; set; }
        public int ZoneLimit { get; set; }
        public int AssetLimit { get; set; }
        public int CreditLimit { get; set; }
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
        public int SubscriptionID { get; set; }
    }
}