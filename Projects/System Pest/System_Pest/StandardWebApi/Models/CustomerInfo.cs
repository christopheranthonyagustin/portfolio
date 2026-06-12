using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    /// <summary>
    /// member info
    /// </summary>
    public class CustomerInfo
    {
      
        public int CustomerID { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public int Postal { get; set; }
        public string Unit { get; set; }
        public int ResellerID { get; set; }
        public int CompanyID { get; set; }
        public string CusCompany { get; set; }
        public string Remarks { get; set; }
        public string Image { get; set; }
        public string ImageFill { get; set; }
        public string ErrorMessage { get; set; }
    
    }
}