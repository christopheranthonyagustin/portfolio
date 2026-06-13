using ShopifyLarkTracker.Models;
using System.Text.Json;

namespace ShopifyLarkTracker.Services;

public class ShipmentProcessor
{
    private readonly ExceptionEngine _rules = new();
    private readonly LarkBaseService _lark;

    public ShipmentProcessor(
        LarkBaseService lark)
    {
        _lark = lark;
    }

    public async Task ProcessAsync(
        List<ShopifyOrder> orders,
        JsonDocument larkDoc)
    {
        var root =
            larkDoc.RootElement;

        if (root.GetProperty("code")
                .GetInt32() != 0)
        {
            Console.WriteLine(
                "Failed loading Lark records");

            return;
        }

        var items =
            root.GetProperty("data")
                .GetProperty("items");

        var recordMap =
            BuildRecordMap(items);

        Console.WriteLine(
            $"Loaded {recordMap.Count} existing Lark records");

        var semaphore =
            new SemaphoreSlim(50);

        var tasks =
            new List<Task>();

        foreach (var order in orders)
        {
            var shipment = new Shipment
            {
                ShopifyId =
                    order.ShopifyId,

                OrderNo =
                    order.OrderNumber,

                Channel =
                    NormalizeChannel(
                        order.SourceName),

                CustomerName =
                    order.ShippingAddress?.Name
                    ??
                    $"{order.Customer?.FirstName} {order.Customer?.LastName}"
                        .Trim(),

                Status =
                    order.Status,

                OrderCreatedDate =
                    order.CreatedAt,

                LastUpdated =
                    DateTime.Now
            };

            if (order.Fulfillments?.Any() == true)
            {
                shipment.TrackingNo =
                    order.Fulfillments[0]
                        .TrackingNumber;

                shipment.FulfillmentDate =
                    order.Fulfillments[0]
                        .CreatedAt;
            }

            _rules.Evaluate(shipment);

            if (string.IsNullOrWhiteSpace(
                shipment.OrderNo))
            {
                continue;
            }

            recordMap.TryGetValue(
                shipment.OrderNo,
                out var recordId);

            tasks.Add(
                ProcessOrderAsync(
                    shipment,
                    recordId,
                    semaphore));
        }

        await Task.WhenAll(tasks);

        Console.WriteLine(
            $"Finished processing {tasks.Count} orders");
    }

    private async Task ProcessOrderAsync(
        Shipment shipment,
        string? recordId,
        SemaphoreSlim semaphore)
    {
        await semaphore.WaitAsync();

        try
        {
            var fields =
                BuildFields(shipment);

            if (string.IsNullOrWhiteSpace(
                    recordId))
            {
                Console.WriteLine(
                    $"CREATE -> {shipment.OrderNo}");

                await _lark.CreateRecordAsync(
                    fields);
            }
            else
            {
                Console.WriteLine(
                    $"UPDATE -> {shipment.OrderNo}");

                await _lark.UpdateRecordAsync(
                    recordId,
                    fields);
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine(
                $"ERROR [{shipment.OrderNo}] : {ex.Message}");
        }
        finally
        {
            semaphore.Release();
        }
    }

    private Dictionary<string, string>
        BuildRecordMap(
            JsonElement items)
    {
        var map =
            new Dictionary<string, string>(
                StringComparer.OrdinalIgnoreCase);

        foreach (var item in
            items.EnumerateArray())
        {
            if (!item.TryGetProperty(
                    "fields",
                    out var fields))
            {
                continue;
            }

            if (!fields.TryGetProperty(
                    "订单号",
                    out var orderField))
            {
                continue;
            }

            var orderNo =
                orderField.ToString()?.Trim();

            if (string.IsNullOrWhiteSpace(
                    orderNo))
            {
                continue;
            }

            var recordId =
                item.GetProperty("record_id")
                    .GetString();

            if (!string.IsNullOrWhiteSpace(
                    recordId))
            {
                map[orderNo] =
                    recordId;
            }
        }

        return map;
    }

    private string NormalizeChannel(
        string? source)
    {
        source =
            source?.Trim()
                  .ToLower()
            ?? "";

        return source switch
        {
            "web" => "Online Store",
            "pos" => "POS",
            _ => source
        };
    }

    private Dictionary<string, object>
        BuildFields(
            Shipment shipment)
    {
        return new Dictionary<string, object>
        {
            ["订单号"] =
                shipment.OrderNo,

            ["客户名称"] =
                shipment.CustomerName ?? "",

            ["快递单号"] =
                shipment.TrackingNo ?? "",

            ["运单号"] =
                shipment.ShopifyId.ToString(),

            ["物流公司"] =
                GetCourier(
                    shipment.TrackingNo),

            ["签收状态"] =
                string.IsNullOrWhiteSpace(
                    shipment.Status)
                    ? "Pending"
                    : shipment.Status,

            ["多选"] =
                string.IsNullOrWhiteSpace(
                    shipment.Channel)
                ? Array.Empty<string>()
                : new[]
                {
                    shipment.Channel
                },

            ["是否异常"] =
                shipment.IsException
                    ? "Yes"
                    : "No",

            ["发货日期"] =
                shipment.FulfillmentDate?
                    .ToString("yyyy/MM/dd")
                ??
                shipment.OrderCreatedDate?
                    .ToString("yyyy/MM/dd")
                ?? "",

            ["AWB创建时间"] =
                shipment.FulfillmentDate?
                    .ToString(
                        "yyyy/MM/dd HH:mm:ss")
                ??
                shipment.OrderCreatedDate?
                    .ToString(
                        "yyyy/MM/dd HH:mm:ss")
                ?? "",

            ["更新时间"] =
                DateTime.UtcNow.ToString(
                    "yyyy-MM-ddTHH:mm:ssZ"),

            ["备注"] =
                shipment.Remarks ?? ""
        };
    }

    private string GetCourier(
        string? trackingNo)
    {
        if (string.IsNullOrWhiteSpace(
                trackingNo))
        {
            return "To Ship";
        }

        trackingNo =
            trackingNo.Trim()
                .ToUpper();

        if (trackingNo.StartsWith("SPX"))
            return "SPX";

        if (trackingNo.StartsWith("SP"))
            return "SPX";

        if (trackingNo.StartsWith("JT"))
            return "J&T";

        return "Unknown";
    }
}