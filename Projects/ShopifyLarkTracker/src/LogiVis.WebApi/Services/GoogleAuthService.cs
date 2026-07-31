using Google.Apis.Auth;
using System.Net.Http.Json;
using LogiVis.WebApi.Configuration;
using LogiVis.WebApi.Models.Google;
using LogiVis.WebApi.Services.Interfaces;
using Microsoft.Extensions.Options;

namespace LogiVis.WebApi.Services;

public class GoogleAuthService : IGoogleAuthService
{
    private readonly GoogleAuthOptions _options;
    private readonly HttpClient _httpClient;

    public GoogleAuthService(
        IOptions<GoogleAuthOptions> options,
        HttpClient httpClient)
    {
        _options = options.Value;
        _httpClient = httpClient;
    }

    public string GetAuthorizationUrl(string state)
    {
        var query = new Dictionary<string, string>
        {
            ["client_id"] = _options.ClientId,
            ["redirect_uri"] = _options.RedirectUri,
            ["response_type"] = "code",
            ["scope"] = "openid email profile",
            ["access_type"] = "offline",
            ["prompt"] = "consent",
            ["state"] = state
        };

        var parameters = string.Join("&",
            query.Select(x =>
                $"{Uri.EscapeDataString(x.Key)}={Uri.EscapeDataString(x.Value)}"));

        return $"https://accounts.google.com/o/oauth2/v2/auth?{parameters}";
    }

    public async Task<GoogleUserInfo> ExchangeCodeAsync(string code)
    {
        var form = new Dictionary<string, string>
        {
            ["code"] = code,
            ["client_id"] = _options.ClientId,
            ["client_secret"] = _options.ClientSecret,
            ["redirect_uri"] = _options.RedirectUri,
            ["grant_type"] = "authorization_code"
        };

        var response = await _httpClient.PostAsync(
            "https://oauth2.googleapis.com/token",
            new FormUrlEncodedContent(form));

        var content = await response.Content.ReadAsStringAsync();

        Console.WriteLine("========== GOOGLE TOKEN ==========");
        Console.WriteLine(content);
        Console.WriteLine("==================================");

        response.EnsureSuccessStatusCode();

        var token = System.Text.Json.JsonSerializer.Deserialize<GoogleTokenResponse>(
            content,
            new System.Text.Json.JsonSerializerOptions
            {
                PropertyNameCaseInsensitive = true
            });

        if (token == null)
            throw new Exception("Unable to retrieve Google token.");

        var payload = await GoogleJsonWebSignature.ValidateAsync(token.IdToken);

        return new GoogleUserInfo
        {
            Subject = payload.Subject,
            Email = payload.Email,
            Name = payload.Name,
            GivenName = payload.GivenName,
            FamilyName = payload.FamilyName,
            Picture = payload.Picture,
            EmailVerified = payload.EmailVerified
        };
    }
}