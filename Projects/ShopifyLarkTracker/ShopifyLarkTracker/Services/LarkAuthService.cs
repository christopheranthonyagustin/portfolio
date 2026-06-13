using System.Net.Http.Json;
using System.Text.Json;

namespace ShopifyLarkTracker.Services;

public class LarkAuthService
{
    private readonly HttpClient _http;

    private string? _tenantToken;
    private DateTime _expireAt;

    public LarkAuthService(HttpClient http)
    {
        _http = http;
    }

    public async Task<string> GetTokenAsync(
        string appId,
        string appSecret)
    {
        if (!string.IsNullOrWhiteSpace(_tenantToken) &&
            DateTime.UtcNow < _expireAt)
        {
            return _tenantToken;
        }

        var response = await _http.PostAsJsonAsync(
            "https://open.larksuite.com/open-apis/auth/v3/tenant_access_token/internal",
            new
            {
                app_id = appId,
                app_secret = appSecret
            });

        var json = await response.Content.ReadAsStringAsync();

        Console.WriteLine("===== LARK AUTH RESPONSE =====");
        Console.WriteLine(json);

        response.EnsureSuccessStatusCode();

        using var doc = JsonDocument.Parse(json);

        var root = doc.RootElement;

        if (!root.TryGetProperty("code", out var code))
            throw new Exception("Invalid Lark auth response");

        if (code.GetInt32() != 0)
            throw new Exception($"Lark authentication failed: {json}");

        _tenantToken =
            root.GetProperty("tenant_access_token").GetString();

        var expireSeconds =
            root.GetProperty("expire").GetInt32();

        _expireAt =
            DateTime.UtcNow.AddSeconds(expireSeconds - 60);

        if (string.IsNullOrWhiteSpace(_tenantToken))
            throw new Exception("Lark returned empty token");

        return _tenantToken;
    }
}