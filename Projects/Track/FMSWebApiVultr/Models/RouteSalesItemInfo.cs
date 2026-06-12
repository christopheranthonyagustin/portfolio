using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FMSWebApi.Models
{
    /// <summary>
    /// zone info
    /// </summary>
    public class RouteSalesItemInfo
    {
        public long SalesItemID { get; set; }
        public long SalesOrderID { get; set; }
        public string ReferenceNo { get; set; }
        public string Item { get; set; }
        public string Description { get; set; }
        public double Quantity { get; set; }
        public double Price { get; set; }
        public double TotalPrice { get; set; }


    }
}