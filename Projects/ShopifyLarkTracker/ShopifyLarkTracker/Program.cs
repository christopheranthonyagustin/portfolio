using Microsoft.Extensions.Configuration;
using ShopifyLarkTracker.Services;
using System.Diagnostics;
using System.Net.Http;

class Program
{
    static async Task Main(string[] args)
    {
        var totalTimer =
            Stopwatch.StartNew();

        Console.WriteLine(
            "====================================");

        Console.WriteLine(
            $"START : {DateTime.Now:yyyy-MM-dd HH:mm:ss}");

        var config = new ConfigurationBuilder()
            .SetBasePath(
                Directory.GetCurrentDirectory())
            .AddJsonFile(
                "appsettings.json",
                optional: false)
            .Build();

        var httpClient =
            new HttpClient();

        var auth =
            new LarkAuthService(
                httpClient);

        var lark =
            new LarkBaseService(
                auth,
                config,
                httpClient);

        var shopify =
            new ShopifyService(
                config);

        var processor =
            new ShipmentProcessor(
                lark);

        Console.WriteLine(
            "Loading Lark records once...");

        var larkDoc =
            await lark.ListRecordsAsync();

        var lastSync =
            lark.GetLatestUpdateTime(
                larkDoc);

        Console.WriteLine(
            $"LAST SYNC : {lastSync}");

        var orders =
            await shopify.GetOrdersAsync(
                lastSync);

        Console.WriteLine(
            $"SHOPIFY ORDERS LOADED : {orders.Count}");

        var processTimer =
            Stopwatch.StartNew();

        await processor.ProcessAsync(
            orders,
            larkDoc);

        processTimer.Stop();

        Console.WriteLine(
            $"PROCESSING TIME : {processTimer.Elapsed.TotalSeconds:F2}s");

        totalTimer.Stop();

        Console.WriteLine(
            $"TOTAL TIME : {totalTimer.Elapsed.TotalSeconds:F2}s");

        Console.WriteLine(
            $"END : {DateTime.Now:yyyy-MM-dd HH:mm:ss}");

        Console.WriteLine(
            "====================================");

        Console.WriteLine(
            "DONE");
    }
}