using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    /// <summary>
    /// zone info
    /// </summary>
    public class InventoryHistoryInfo
    {
        public long InventoryHistoryID { get; set; }
        public long InventoryID { get; set; }
        public string Name { get; set; }
        public double PreviousQuantity { get; set; }
        public double Quantity { get; set; }
        public double TotalQuantity { get; set; }
        public DateTime Timestamp { get; set; }
        public DateTime RxTime { get; set; }
        public int DriverID { get; set; }
        public int AssetID { get; set; }
        public int UserID { get; set; }
        public int Platform { get; set; }
        public int StockType { get; set; }
        public string Reference { get; set; }
        public int CompanyID { get; set; }
        public string Asset { get; set; }
        public string UserName { get; set; }
        public string DriverName { get; set; }
        public string Image { get; set; }
        public string ImageFill { get; set; }

    }
}