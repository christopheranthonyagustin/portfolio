using System;
using System.Collections.Generic;
using System.Text;

namespace ShopifyLarkTracker.Models
{
    public static class LarkFieldMap
    {
        public static readonly Dictionary<string, string> Fields = new()
        {
            // Chinese core fields
            ["订单号"] = "订单号",
            ["客户名称"] = "客户名称",
            ["发货日期"] = "发货日期",
            ["快递单号"] = "快递单号",
            ["物流公司"] = "物流公司",
            ["签收状态"] = "签收状态",
            ["多选"] = "多选",
            ["是否异常"] = "是否异常",
            ["负责人"] = "负责人",
            ["备注"] = "备注",
            ["更新时间"] = "更新时间",
            ["运单号"] = "运单号",

            // English overlay fields
            ["Order ID"] = "Order ID"
        };
    }
}
