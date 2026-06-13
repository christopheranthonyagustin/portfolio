namespace ShopifyLarkTracker.Models;

public class Shipment
{
    public string OrderNo { get; set; } = "";

    public long ShopifyId { get; set; }

    public string? CustomerName { get; set; }

    public string? Channel { get; set; }

    public string? TrackingNo { get; set; }

    public string? Status { get; set; }

    public bool IsException { get; set; }

    public string? Remarks { get; set; }

    public DateTime? OrderCreatedDate { get; set; }

    public DateTime? FulfillmentDate { get; set; }

    public DateTime LastUpdated { get; set; }

    public bool HasTracking =>
        !string.IsNullOrWhiteSpace(TrackingNo);
}