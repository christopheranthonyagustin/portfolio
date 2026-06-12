using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    /// <summary>
    /// company info
    /// </summary>
    public class SearchDriver
    {
      
        public int DriverID { get; set; }
        public string Name { get; set; }
        public int AssetID { get; set; }
        public string Asset { get; set; }
        public string Email { get; set; }
        public string Address { get; set; }
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
        public string ErrorMessage { get; set; }
    
    }
}