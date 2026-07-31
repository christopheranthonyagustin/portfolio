using System.Net.Http.Json;
using System.Text.Json;
using Microsoft.Extensions.Options;
using LogiVis.WebApi.Models.Auth;
using LogiVis.WebApi.Models.CloudFlare;

namespace LogiVis.WebApi.Services;

public class WorkerApiClient
{
    private readonly HttpClient _httpClient;
    private readonly CloudflareOptions _options;

    public WorkerApiClient(
        HttpClient httpClient,
        IOptions<CloudflareOptions> options)
    {
        _httpClient = httpClient;
        _options = options.Value;
    }

    public async Task<AuthResponse?> ExternalLoginAsync(
        ExternalAuthRequest request)
    {
        var url = $"{_options.WorkerUrl}/internal/auth/external";

        Console.WriteLine("========== CLOUDFLARE ==========");
        Console.WriteLine($"WorkerUrl : {_options.WorkerUrl}");
        Console.WriteLine($"POST URL  : {url}");
        Console.WriteLine("================================");

        var response = await _httpClient.PostAsJsonAsync(url, request);

        var json = await response.Content.ReadAsStringAsync();

        Console.WriteLine("========== WORKER REQUEST ==========");
        Console.WriteLine(JsonSerializer.Serialize(request, new JsonSerializerOptions
        {
            WriteIndented = true
        }));

        Console.WriteLine("========== WORKER RESPONSE ==========");
        Console.WriteLine($"Status: {(int)response.StatusCode} {response.StatusCode}");
        Console.WriteLine(json);
        Console.WriteLine("=====================================");

        if (!response.IsSuccessStatusCode)
        {
            throw new Exception(
                $"Worker API Error ({(int)response.StatusCode} {response.StatusCode}){Environment.NewLine}{json}");
        }

        return JsonSerializer.Deserialize<AuthResponse>(
            json,
            new JsonSerializerOptions
            {
                PropertyNameCaseInsensitive = true
            });
    }

    public async Task<AuthResponse?> LarkExternalLoginAsync(
        LarkAuthRequest request)
    {
        var url = $"{_options.WorkerUrl}/internal/auth/external";

        Console.WriteLine("========== CLOUDFLARE ==========");
        Console.WriteLine($"WorkerUrl : {_options.WorkerUrl}");
        Console.WriteLine($"POST URL  : {url}");
        Console.WriteLine("================================");

        var response = await _httpClient.PostAsJsonAsync(url, request);

        Console.WriteLine(response.StatusCode);
        Console.WriteLine(response.IsSuccessStatusCode);
        if (response.Content == null)
        {
            throw new Exception("Response.Content is null.");
        }

        Console.WriteLine($"Status: {response.StatusCode}");

        var json = await response.Content.ReadAsStringAsync();

        Console.WriteLine($"Body: '{json}'");

        Console.WriteLine("========== WORKER REQUEST ==========");
        Console.WriteLine(JsonSerializer.Serialize(request, new JsonSerializerOptions
        {
            WriteIndented = true
        }));

        Console.WriteLine("========== WORKER RESPONSE ==========");
        Console.WriteLine($"Status: {(int)response.StatusCode} {response.StatusCode}");
        Console.WriteLine(json);
        Console.WriteLine("=====================================");

        if (!response.IsSuccessStatusCode)
        {
            throw new Exception(
                $"Worker API Error ({(int)response.StatusCode} {response.StatusCode}){Environment.NewLine}{json}");
        }

        return JsonSerializer.Deserialize<AuthResponse>(
            json,
            new JsonSerializerOptions
            {
                PropertyNameCaseInsensitive = true
            });
    }

    public async Task<T?> GetAsync<T>(
    string endpoint,
    Action<HttpRequestMessage>? configure = null)
    {
        var request = new HttpRequestMessage(
            HttpMethod.Get,
            $"{_options.WorkerUrl}{endpoint}");

        configure?.Invoke(request);

        var response = await _httpClient.SendAsync(request);

        var json = await response.Content.ReadAsStringAsync();

        Console.WriteLine("========== WORKER RESPONSE ==========");
        Console.WriteLine($"GET {endpoint}");
        Console.WriteLine($"Status: {(int)response.StatusCode} {response.StatusCode}");
        Console.WriteLine(json);
        Console.WriteLine("=====================================");

        if (!response.IsSuccessStatusCode)
        {
            throw new Exception(
                $"Worker API Error ({(int)response.StatusCode} {response.StatusCode}){Environment.NewLine}{json}");
        }

        return JsonSerializer.Deserialize<T>(
            json,
            new JsonSerializerOptions
            {
                PropertyNameCaseInsensitive = true
            });
    }
}