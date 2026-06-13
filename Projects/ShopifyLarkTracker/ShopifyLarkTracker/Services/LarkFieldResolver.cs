using System;
using System.Collections.Generic;
using System.Text;

namespace ShopifyLarkTracker.Services
{
    public static class LarkFieldResolver
    {
        // Map YOUR system → Lark actual field keys
        public static class Fields
        {
            public const string OrderId = "Order ID";
            public const string TrackingNo = "Tracking No";
            public const string Status = "Status";
            public const string Remarks = "Remarks";
            public const string LastUpdated = "Last Updated";
        }

        public static Dictionary<string, object> BuildCreatePayload(
            string orderId,
            string trackingNo,
            string status,
            string remarks,
            DateTime lastUpdated)
        {
            return new Dictionary<string, object>
            {
                { Fields.OrderId, orderId },
                { Fields.TrackingNo, trackingNo },
                { Fields.Status, status },
                { Fields.Remarks, remarks },
                { Fields.LastUpdated, lastUpdated.ToString("yyyy-MM-dd HH:mm:ss") }
            };
        }
    }
}
