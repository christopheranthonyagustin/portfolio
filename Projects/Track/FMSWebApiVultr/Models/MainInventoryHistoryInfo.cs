using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    /// <summary>
    /// zone info
    /// </summary>
    public class MainInventoryHistoryInfo
    {
        public long MainInventoryHistoryID { get; set; }
        public long MainInventoryItemID { get; set; }
        public string Name { get; set; }
        public double PreviousQuantity { get; set; }
        public int Quantity { get; set; }
        public double TotalQuantity { get; set; }
        public DateTime Timestamp { get; set; }
        public DateTime RxTime { get; set; }
        public long PickupID { get; set; }
        public long DeliveryID { get; set; }
        public int Platform { get; set; }
        public int StockType { get; set; }
        public string Reference { get; set; }
        public int CompanyID { get; set; }
        public string Company { get; set; }
        public long AssetID { get; set; }
        public string Asset { get; set; }
        public int UserID { get; set; }
        public string UserName { get; set; }
        public long DriverID { get; set; }
        public int ItemCategory { get; set; }
        public string DriverName { get; set; }
        public string Image { get; set; }
        public string ImageFill { get; set; }

    }
}