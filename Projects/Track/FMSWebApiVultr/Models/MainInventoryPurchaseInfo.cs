using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    /// <summary>
    /// zone info
    /// </summary>
    public class MainInventoryPurchaseInfo
    {
        public long MainInventoryPurchaseID { get; set; }
        public long MainInventoryItemID { get; set; }
        public long SupplierID { get; set; }
        public DateTime Timestamp { get; set; }
        public DateTime RxTime { get; set; }
        public int CompanyID { get; set; }
        public int Quantity { get; set; }
    }
}