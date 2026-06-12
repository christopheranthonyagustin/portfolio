using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    /// <summary>
    /// company info
    /// </summary>
    public class DriverInfo
    {
      
        public long DriverID { get; set; }
        public string Name { get; set; }
        public string LoginName { get; set; }
        public string Password { get; set; }
        public long AssetID { get; set; }
        public string Asset { get; set; }
        public string Email { get; set; }
        public string Address { get; set; }
        public string Unit { get; set; }
        public string Building { get; set; }
        public string Postal { get; set; }
        public string Phone { get; set; }
        public DateTime DateOfBirth { get; set; }
        public string RelativePhone { get; set; }
        public string RelativeName { get; set; }
        public int RFIDID { get; set; }
        public string RFID { get; set; }
        public int ResellerID { get; set; }
        public int CompanyID { get; set; }
        public string Company { get; set; }
        public int BloodType { get; set; }
        public DateTime LastTap { get; set; }
        public string Remarks { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime ModifiedDate { get; set; }
        public int CreatedBy { get; set; }
        public int ModifiedBy { get; set; }
        public string CreatedByName { get; set; }
        public string ModifiedByName { get; set; }
        public string Image { get; set; }
        public string ImageFill { get; set; }
        public string ImageCompany { get; set; }
        public string ImageCompanyFill { get; set; }
        public string ErrorMessage { get; set; }
        public string Token { get; set; }
        public string TempPassword { get; set; }
        public string LoginRetry { get; set; }
        public int LoginCount { get; set; }
        public int PasswordExpiration { get; set; }
        public DateTime LastLogin { get; set; }
        public int DriverExpiration { get; set; }
        public int DriverStatusID { get; set; }
        public string DriverStatus { get; set; }
        public int DepartmentID { get; set; }
        public string DriverFilter { get; set; }
        public int isTSP { get; set; }
        public int isVRP { get; set; }
        public int isGPS { get; set; }
        public int SessionTimeout { get; set; }
        public int ReportDuration { get; set; }
        public int ReportRange { get; set; }
        public int NotifyFinalInvoice { get; set; }
        public string SMTPUsername { get; set; }
        public string SMTPPassword { get; set; }
        public int SMTPPort { get; set; }
        public string SMTPHost { get; set; }
        public int isSecured { get; set; }
        public int SubscriptionID { get; set; }
    }
}