using SpxTester.Config;
using SpxTester.Models;
using System.Net.Http;
using System.Text;
using System.Text.Json;

namespace SpxTester.Services;

public class SpxClient
{
    private readonly SpxOptions _options;
    private readonly SpxAuthenticationService _authentication;
    private readonly HttpClient _httpClient;

    public SpxClient(
        SpxOptions options,
        SpxAuthenticationService authentication)
    {
        _options = options;
        _authentication = authentication;

        _httpClient = new HttpClient
        {
            BaseAddress = new Uri(_options.BaseUrl)
        };
    }

    public async Task TrackOrderAsync(string trackingNumber)
    {
        //var request = new TrackOrderRequest
        //{
        //    UserId = _options.UserId,
        //    UserSecret = _options.UserSecret,
        //    TrackingNoList = new List<string>
        //{
        //    trackingNumber
        //},
        //    OrderIdList = new List<string>()
        //};

        var request = new TrackOrderRequest
        {
            UserId = _options.UserId,
            UserSecret = _options.UserSecret,

            TrackingNoList = new List<string>(),

            OrderIdList = new List<string>
        {
            "#14764"
        }
            };

        var result = await PostAsync<TrackOrderRequest, TrackOrderResponse>(
            "/open/api/v1/order/batch_search_order",
            request);

        Console.WriteLine();

        if (result == null)
        {
            Console.WriteLine("No response received.");
            return;
        }

        Console.WriteLine($"Result : {result.Message}");
        Console.WriteLine($"Return Code : {result.RetCode}");

        // Temporarily print the raw JSON until we model the response
        Console.WriteLine(result.Data.ToString());
    }

    public async Task VerifyAccountAsync()
    {
        var request = new VerifyAccountRequest
        {
            UserId = _options.UserId,
            UserSecret = _options.UserSecret
        };

        var result = await PostAsync<VerifyAccountRequest, VerifyAccountResponse>(
            "/open/api/v1/account/verify",
            request);

        Console.WriteLine();
        Console.WriteLine($"Verify Result : {result?.Message}");
    }

    private async Task<TResponse?> PostAsync<TRequest, TResponse>(
    string endpoint,
    TRequest request)
    {
        var payload = JsonSerializer.Serialize(request);

        var timestamp = DateTimeOffset.UtcNow.ToUnixTimeSeconds();
        var randomNumber = Random.Shared.NextInt64();

        var signature = _authentication.GenerateSignature(
            timestamp,
            randomNumber,
            payload);

        var httpRequest = new HttpRequestMessage(HttpMethod.Post, endpoint);

        httpRequest.Headers.Add("app-id", _options.AppId.ToString());
        httpRequest.Headers.Add("timestamp", timestamp.ToString());
        httpRequest.Headers.Add("random-num", randomNumber.ToString());
        httpRequest.Headers.Add("check-sign", signature);

        httpRequest.Content = new StringContent(
            payload,
            Encoding.UTF8,
            "application/json");

        Console.WriteLine("========================================");
        Console.WriteLine($"POST {endpoint}");
        Console.WriteLine("========================================");
        Console.WriteLine(payload);

        var response = await _httpClient.SendAsync(httpRequest);

        var responseBody = await response.Content.ReadAsStringAsync();

        Console.WriteLine();
        Console.WriteLine("========================================");
        Console.WriteLine("SPX RESPONSE");
        Console.WriteLine("========================================");
        Console.WriteLine($"HTTP {(int)response.StatusCode}");
        Console.WriteLine(responseBody);

        // Don't throw on business errors (ret_code != 0).
        // Only fail if the HTTP request itself failed.
        if (!response.IsSuccessStatusCode)
        {
            throw new HttpRequestException(
                $"SPX API returned HTTP {(int)response.StatusCode}: {responseBody}");
        }

        return JsonSerializer.Deserialize<TResponse>(
            responseBody,
            new JsonSerializerOptions
            {
                PropertyNameCaseInsensitive = true
            });
    }

}