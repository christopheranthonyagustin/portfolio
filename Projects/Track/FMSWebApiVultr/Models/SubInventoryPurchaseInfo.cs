using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    /// <summary>
    /// zone info
    /// </summary>
    public class SubInventoryPurchaseInfo
    {
        public long SubInventoryPurchaseID { get; set; }
        public long SubInventoryItemID { get; set; }
        public long SupplierID { get; set; }
        public DateTime Timestamp { get; set; }
        public DateTime RxTime { get; set; }
        public int CompanyID { get; set; }
        public int Quantity { get; set; }
    }
}