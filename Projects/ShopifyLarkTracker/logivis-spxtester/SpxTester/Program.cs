using Microsoft.Extensions.Configuration;
using SpxTester.Config;
using SpxTester.Services;

try
{
    // Load configuration
    var configuration = new ConfigurationBuilder()
        .SetBasePath(AppContext.BaseDirectory)
        .AddJsonFile("appsettings.json", optional: false, reloadOnChange: true)
        .Build();

    var options = configuration
        .GetSection("Spx")
        .Get<SpxOptions>()
        ?? throw new InvalidOperationException("SPX configuration is missing.");

    // Create services
    var authentication = new SpxAuthenticationService(options);
    var spxClient = new SpxClient(options, authentication);

    // -------------------------------------------------
    // Test Scenario
    // -------------------------------------------------

    // 1. Verify credentials
    //await spxClient.VerifyAccountAsync();

    // 2. Track an order (uncomment when you have a valid tracking number)
    // await spxClient.TrackOrderAsync("SF0257314392716");

    await spxClient.TrackOrderAsync("SPXSG060845045896");
}
catch (Exception ex)
{
    Console.ForegroundColor = ConsoleColor.Red;
    Console.WriteLine("========================================");
    Console.WriteLine("ERROR");
    Console.WriteLine("========================================");
    Console.WriteLine(ex.Message);
    Console.ResetColor();
}