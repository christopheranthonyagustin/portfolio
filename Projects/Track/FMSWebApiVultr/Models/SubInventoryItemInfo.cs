using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    /// <summary>
    /// zone info
    /// </summary>
    public class SubInventoryItemInfo
    {
        public long SubInventoryItemID { get; set; }
        public long CompanyID { get; set; }
        public long SupplierID { get; set; }
        public long BranchID { get; set; }
        public DateTime Timestamp { get; set; }
        public DateTime RxTime { get; set; }
        public string ReferenceNo { get; set; }
        public string ItemName { get; set; }
        public string Description { get; set; }
        public double Price { get; set; }
        public double Weight { get; set; }
        public double Width { get; set; }
        public double Height { get; set; }
        public double Length { get; set; }
        public double Volume { get; set; }
        public string Unit { get; set; }
        public int Quantity { get; set; }
        public string Remarks { get; set; }
        public string FeatureID { get; set; }
        public int ItemCategory { get; set; }
        public int Flag { get; set; }
        public string Image { get; set; }
        public string ImageFill { get; set; }
    }
}