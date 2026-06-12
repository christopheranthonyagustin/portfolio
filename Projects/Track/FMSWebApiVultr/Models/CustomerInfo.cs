using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    /// <summary>
    /// company info
    /// </summary>
    public class CustomerInfo
    {
        public int CustomerID { get; set; }
        public string Name { get; set; }
        public string BillingAddress { get; set; }
        public string BillingUnit { get; set; }
        public string BillingBuilding { get; set; }
        public string BillingPostal { get; set; }
        public string BillingPhone { get; set; }
        public string BillingMobile { get; set; }
        public string BillingEmail { get; set; }
        public string ShippingAddress { get; set; }
        public string ShippingUnit { get; set; }
        public string ShippingBuilding { get; set; }
        public string ShippingPostal { get; set; }
        public string ShippingPhone { get; set; }
        public string ShippingMobile { get; set; }
        public string ShippingEmail { get; set; }
        public string Website { get; set; }
        public int Category { get; set; }
        public int CompanyID { get; set; }
        public string Image { get; set; }
        public string ImageFill { get; set; }

    }
}