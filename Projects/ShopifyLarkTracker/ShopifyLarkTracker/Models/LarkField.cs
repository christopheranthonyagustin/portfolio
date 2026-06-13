namespace ShopifyLarkTracker.Models
{
    /// <summary>
    /// Represents a single Lark Base field mapping
    /// </summary>
    public class LarkField
    {
        /// <summary>
        /// Logical name used in code (stable)
        /// Example: OrderId, TrackingNo
        /// </summary>
        public string Key { get; set; }

        /// <summary>
        /// Actual Lark field ID (IMPORTANT: used in API calls)
        /// Example: fld_xxxxxxxx
        /// </summary>
        public string FieldId { get; set; }

        /// <summary>
        /// Human readable label (for debugging only)
        /// Example: 运单号, Order ID
        /// </summary>
        public string Label { get; set; }
    }
}