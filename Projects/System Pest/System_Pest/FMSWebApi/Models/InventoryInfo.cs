using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    /// <summary>
    /// zone info
    /// </summary>
    public class InventoryInfo
    {
        public long InventoryID { get; set; }
        public string Name { get; set; }
        public int Quantity { get; set; }
        public string Unit { get; set; }
        public double Price { get; set; }
        public string Reference { get; set; }
        public int CompanyID { get; set; }
        public string Remarks { get; set; }
        public string Image { get; set; }
        public string ImageFill { get; set; }
    }
}