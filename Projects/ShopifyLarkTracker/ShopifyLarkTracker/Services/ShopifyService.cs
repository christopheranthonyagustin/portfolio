using Microsoft.Extensions.Configuration;
using ShopifyLarkTracker.Models;
using System.Diagnostics;
using System.Net.Http.Headers;
using System.Text.Json;

namespace ShopifyLarkTracker.Services;

public class ShopifyService
{
    private readonly IConfiguration _config;
    private readonly HttpClient _http;

    public ShopifyService(IConfiguration config)
    {
        _config = config;
        _http = new HttpClient();
    }

    public async Task<List<ShopifyOrder>> GetOrdersAsync(
        DateTime? updatedAfter = null)
    {
        var store =
            _config["Shopify:StoreUrl"];

        var token =
            _config["Shopify:AccessToken"];

        if (string.IsNullOrWhiteSpace(store))
            throw new Exception(
                "Shopify StoreUrl missing");

        if (string.IsNullOrWhiteSpace(token))
            throw new Exception(
                "Shopify AccessToken missing");

        var url =
            $"{store}/admin/api/2025-01/orders.json?status=any&limit=250";

        if (updatedAfter.HasValue)
        {
            url +=
                $"&updated_at_min={Uri.EscapeDataString(
                    updatedAfter.Value
                        .ToUniversalTime()
                        .ToString("O"))}";
        }

        Console.WriteLine(
            $"SHOPIFY URL = {url}");

        var request =
            new HttpRequestMessage(
                HttpMethod.Get,
                url);

        request.Headers.Add(
            "X-Shopify-Access-Token",
            token);

        request.Headers.Accept.Add(
            new MediaTypeWithQualityHeaderValue(
                "application/json"));

        var apiTimer =
            Stopwatch.StartNew();

        var response =
            await _http.SendAsync(request);

        apiTimer.Stop();

        Console.WriteLine(
            $"SHOPIFY API TIME = {apiTimer.Elapsed.TotalSeconds:F2}s");

        Console.WriteLine(
            $"SHOPIFY STATUS CODE = {(int)response.StatusCode}");

        var json =
            await response.Content.ReadAsStringAsync();

        Console.WriteLine(
            $"SHOPIFY RESPONSE SIZE = {json.Length:N0} chars");

        response.EnsureSuccessStatusCode();

        var parseTimer =
            Stopwatch.StartNew();

        using var doc =
            JsonDocument.Parse(json);

        var result =
            new List<ShopifyOrder>();

        if (!doc.RootElement.TryGetProperty(
                "orders",
                out var orders))
        {
            return result;
        }

        foreach (var order in
            orders.EnumerateArray())
        {
            result.Add(
                new ShopifyOrder
                {
                    ShopifyId =
                        long.TryParse(
                            GetString(order, "id"),
                            out var shopifyId)
                                ? shopifyId
                                : 0,

                    OrderNumber =
                        GetString(
                            order,
                            "order_number"),

                    SourceName =
                        GetString(
                            order,
                            "source_name"),

                    Status =
                        GetFulfillmentStatus(
                            order),

                    CreatedAt =
                        GetDate(
                            order,
                            "created_at"),

                    Customer =
                        ExtractCustomer(
                            order),

                    ShippingAddress =
                        ExtractShippingAddress(
                            order),

                    Fulfillments =
                        ExtractFulfillments(
                            order)
                });
        }

        parseTimer.Stop();

        Console.WriteLine(
            $"Loaded {result.Count} Shopify orders");

        Console.WriteLine(
            $"SHOPIFY PARSE TIME = {parseTimer.Elapsed.TotalSeconds:F2}s");

        return result;
    }

    private ShopifyCustomer? ExtractCustomer(
        JsonElement order)
    {
        if (!order.TryGetProperty(
                "customer",
                out var customer))
        {
            return null;
        }

        if (customer.ValueKind ==
            JsonValueKind.Null)
        {
            return null;
        }

        return new ShopifyCustomer
        {
            FirstName =
                GetString(
                    customer,
                    "first_name"),

            LastName =
                GetString(
                    customer,
                    "last_name")
        };
    }

    private ShopifyShippingAddress?
        ExtractShippingAddress(
        JsonElement order)
    {
        if (!order.TryGetProperty(
                "shipping_address",
                out var address))
        {
            return null;
        }

        if (address.ValueKind ==
            JsonValueKind.Null)
        {
            return null;
        }

        return new ShopifyShippingAddress
        {
            Name =
                GetString(
                    address,
                    "name")
        };
    }

    private List<ShopifyFulfillment>
        ExtractFulfillments(
        JsonElement order)
    {
        var result =
            new List<ShopifyFulfillment>();

        if (!order.TryGetProperty(
                "fulfillments",
                out var fulfillments))
        {
            return result;
        }

        foreach (var f in
            fulfillments.EnumerateArray())
        {
            result.Add(
                new ShopifyFulfillment
                {
                    TrackingNumber =
                        GetString(
                            f,
                            "tracking_number"),

                    CreatedAt =
                        GetDate(
                            f,
                            "created_at")
                });
        }

        return result;
    }

    private string GetFulfillmentStatus(
        JsonElement order)
    {
        if (order.TryGetProperty(
                "fulfillment_status",
                out var status))
        {
            return status.ToString();
        }

        return "unknown";
    }

    private DateTime GetDate(
        JsonElement element,
        string property)
    {
        if (!element.TryGetProperty(
                property,
                out var value))
        {
            return DateTime.UtcNow;
        }

        if (DateTime.TryParse(
                value.ToString(),
                out var date))
        {
            return date;
        }

        return DateTime.UtcNow;
    }

    private string GetString(
        JsonElement element,
        string property)
    {
        if (element.ValueKind !=
            JsonValueKind.Object)
        {
            return "";
        }

        if (!element.TryGetProperty(
                property,
                out var value))
        {
            return "";
        }

        switch (value.ValueKind)
        {
            case JsonValueKind.String:
                return value.GetString() ?? "";

            case JsonValueKind.Number:
                return value.ToString();

            case JsonValueKind.True:
                return "true";

            case JsonValueKind.False:
                return "false";

            case JsonValueKind.Null:
                return "";

            default:
                return value.ToString();
        }
    }
}