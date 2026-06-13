using System;
using System.Collections.Generic;
using System.Text;

namespace ShopifyLarkTracker.Models
{

    public static class LarkPayloadBuilder
    {
        public static Dictionary<string, object> Build(
            string orderId,
            string trackingNo,
            string status,
            string remarks,
            DateTime updatedAt)
        {
            return new Dictionary<string, object>
            {
                { LarkFieldMap.Fields["Order ID"], orderId },
                { LarkFieldMap.Fields["运单号"], trackingNo },
                { LarkFieldMap.Fields["备注"], remarks },
                { LarkFieldMap.Fields["更新时间"], updatedAt.ToString("yyyy-MM-dd HH:mm:ss") }
            };
        }
    }
}
