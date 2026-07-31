using System.Net.Http.Headers;
using System.Net.Http.Json;
using System.Text.Json;
using LogiVis.WebApi.Configuration;
using LogiVis.WebApi.Models.Lark;
using LogiVis.WebApi.Services.Interfaces;
using Microsoft.Extensions.Options;

namespace LogiVis.WebApi.Services;

public class LarkAuthService : ILarkAuthService
{
    private readonly HttpClient _http;
    private readonly LarkAuthOptions _options;

    public LarkAuthService(
        HttpClient http,
        IOptions<LarkAuthOptions> options)
    {
        _http = http;
        _options = options.Value;
    }

    public string GetAuthorizationUrl(string state)
    {
        return
            $"https://accounts.larksuite.com/open-apis/authen/v1/authorize" +
            $"?app_id={Uri.EscapeDataString(_options.AppId)}" +
            $"&redirect_uri={Uri.EscapeDataString(_options.RedirectUri)}" +
            $"&response_type=code" +
            $"&scope=contact:user.base:readonly" +
            $"&state={Uri.EscapeDataString(state)}";
    }

    public async Task<LarkUserInfo> ExchangeCodeAsync(string code)
    {
        var tokenRequest = new
        {
            grant_type = "authorization_code",
            client_id = _options.AppId,
            client_secret = _options.AppSecret,
            code,
            redirect_uri = _options.RedirectUri
        };

        var tokenResponse = await _http.PostAsJsonAsync(
            "https://open.larksuite.com/open-apis/authen/v2/oauth/token",
            tokenRequest);

        var tokenJson = await tokenResponse.Content.ReadAsStringAsync();

        if (!tokenResponse.IsSuccessStatusCode)
        {
            throw new Exception(tokenJson);
        }

        var token = JsonSerializer.Deserialize<LarkTokenResponse>(
            tokenJson,
            new JsonSerializerOptions
            {
                PropertyNameCaseInsensitive = true
            });

        if (token == null || token.Code != 0)
        {
            throw new Exception(tokenJson);
        }

        using var profileRequest = new HttpRequestMessage(
            HttpMethod.Get,
            "https://open.larksuite.com/open-apis/authen/v1/user_info");

        profileRequest.Headers.Authorization =
            new AuthenticationHeaderValue("Bearer", token.AccessToken);

        var profileResponse = await _http.SendAsync(profileRequest);

        var profileJson = await profileResponse.Content.ReadAsStringAsync();


        if (!profileResponse.IsSuccessStatusCode)
        {
            throw new Exception(profileJson);
        }

        var profile = JsonSerializer.Deserialize<LarkUserResponse>(
            profileJson,
            new JsonSerializerOptions
            {
                PropertyNameCaseInsensitive = true
            });

        if (profile == null || profile.Code != 0)
        {
            throw new Exception(profileJson);
        }

        return profile.Data;
    }
}