using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    /// <summary>
    /// zone info
    /// </summary>
    public class StockMovementInfo
    {
        public long StockMovementID { get; set; }
        public string UploadNo { get; set; }
        public string MerchantSKU { get; set; }   
        public string Title { get; set; }
        public string StoreNickname { get; set; }
        public string StoreName { get; set; }
        public string Warehouse { get; set; }
        public string ShelfName { get; set; }
        public DateTime Timestamp { get; set; }
        public DateTime RxTime { get; set; }
        public int Original { get; set; }
        public int Movement { get; set; }
        public int Latest { get; set; }
        public string Type { get; set; }
        public string CombinationSKU { get; set; }
        public string MovementNo { get; set; }
        public string TransfersNo { get; set; }
        public string PurchaseNo { get; set; }
        public string PackageNo { get; set; }
        public double OriginalCost { get; set; }
        public double StockOutPrice { get; set; }
        public double StockInPrice { get; set; }
        public double NewCost { get; set; }
        public int StockOutNo { get; set; }
        public int StockInNo { get; set; }
        public string OrderNo { get; set; }
        public string Account { get; set; }
        public string Note { get; set; }
        public int CompanyID { get; set; }
        public string ErrorMessage { get; set; }
    }
}