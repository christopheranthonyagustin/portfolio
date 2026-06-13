using System.Text.Json.Serialization;

namespace ShopifyLarkTracker.Models;

public class ShopifyOrder
{
    [JsonPropertyName("id")]
    public long ShopifyId { get; set; }

    [JsonPropertyName("order_number")]
    public string OrderNumber { get; set; } = "";
    
    [JsonPropertyName("source_name")]
    public string? SourceName { get; set; }

    [JsonPropertyName("created_at")]
    public DateTime CreatedAt { get; set; }

    [JsonPropertyName("fulfillment_status")]
    public string? Status { get; set; }

    [JsonPropertyName("customer")]
    public ShopifyCustomer? Customer { get; set; }

    [JsonPropertyName("shipping_address")]
    public ShopifyShippingAddress? ShippingAddress { get; set; }

    [JsonPropertyName("fulfillments")]
    public List<ShopifyFulfillment>? Fulfillments { get; set; }
}

public class ShopifyCustomer
{
    [JsonPropertyName("first_name")]
    public string? FirstName { get; set; }

    [JsonPropertyName("last_name")]
    public string? LastName { get; set; }
}

public class ShopifyShippingAddress
{
    [JsonPropertyName("name")]
    public string? Name { get; set; }
}

public class ShopifyFulfillment
{
    [JsonPropertyName("tracking_number")]
    public string? TrackingNumber { get; set; }

    [JsonPropertyName("created_at")]
    public DateTime CreatedAt { get; set; }
}