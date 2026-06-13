using Microsoft.Extensions.Configuration;
using System.Diagnostics;
using System.Net.Http.Headers;
using System.Text;
using System.Text.Json;

namespace ShopifyLarkTracker.Services;

public class LarkBaseService
{
    private readonly LarkAuthService _auth;
    private readonly IConfiguration _config;
    private readonly HttpClient _http;

    private readonly string _appId;
    private readonly string _appSecret;
    private readonly string _baseId;
    private readonly string _tableId;

    public LarkBaseService(
        LarkAuthService auth,
        IConfiguration config,
        HttpClient http)
    {
        _auth = auth;
        _config = config;
        _http = http;

        _appId = config["Lark:AppId"]
            ?? throw new Exception("Lark AppId missing");

        _appSecret = config["Lark:AppSecret"]
            ?? throw new Exception("Lark AppSecret missing");

        _baseId = config["Lark:BaseId"]
            ?? throw new Exception("Lark BaseId missing");

        _tableId = config["Lark:TableId"]
            ?? throw new Exception("Lark TableId missing");
    }

    private async Task<HttpRequestMessage> CreateRequestAsync(
        HttpMethod method,
        string url)
    {
        var token =
            await _auth.GetTokenAsync(
                _appId,
                _appSecret);

        var request =
            new HttpRequestMessage(
                method,
                url);

        request.Headers.Authorization =
            new AuthenticationHeaderValue(
                "Bearer",
                token);

        return request;
    }

    public async Task<JsonDocument> ListRecordsAsync()
    {
        var url =
            $"https://open.larksuite.com/open-apis/bitable/v1/apps/{_baseId}/tables/{_tableId}/records?page_size=500";

        var request =
            await CreateRequestAsync(
                HttpMethod.Get,
                url);

        var timer =
            Stopwatch.StartNew();

        var response =
            await _http.SendAsync(request);

        timer.Stop();

        Console.WriteLine(
            $"LARK LIST TIME = {timer.Elapsed.TotalSeconds:F2}s");

        Console.WriteLine(
            $"LARK STATUS CODE = {(int)response.StatusCode}");

        var json =
            await response.Content.ReadAsStringAsync();

        Console.WriteLine(
            $"LARK RESPONSE SIZE = {json.Length:N0} chars");

        response.EnsureSuccessStatusCode();

        return JsonDocument.Parse(json);
    }

    public async Task<string> CreateRecordAsync(
        Dictionary<string, object> fields)
    {
        var url =
            $"https://open.larksuite.com/open-apis/bitable/v1/apps/{_baseId}/tables/{_tableId}/records";

        var request =
            await CreateRequestAsync(
                HttpMethod.Post,
                url);

        var payload = new
        {
            fields
        };

        var jsonBody =
            JsonSerializer.Serialize(payload);

        request.Content =
            new StringContent(
                jsonBody,
                Encoding.UTF8,
                "application/json");

        var timer =
            Stopwatch.StartNew();

        var response =
            await _http.SendAsync(request);

        timer.Stop();

        Console.WriteLine(
            $"LARK CREATE TIME = {timer.Elapsed.TotalSeconds:F2}s");

        Console.WriteLine(
            $"LARK CREATE STATUS = {(int)response.StatusCode}");

        var result =
            await response.Content.ReadAsStringAsync();

        response.EnsureSuccessStatusCode();

        return result;
    }

    public async Task<string> UpdateRecordAsync(
        string recordId,
        Dictionary<string, object> fields)
    {
        var url =
            $"https://open.larksuite.com/open-apis/bitable/v1/apps/{_baseId}/tables/{_tableId}/records/{recordId}";

        var request =
            await CreateRequestAsync(
                HttpMethod.Put,
                url);

        var payload = new
        {
            fields
        };

        var jsonBody =
            JsonSerializer.Serialize(payload);

        request.Content =
            new StringContent(
                jsonBody,
                Encoding.UTF8,
                "application/json");

        var timer =
            Stopwatch.StartNew();

        var response =
            await _http.SendAsync(request);

        timer.Stop();

        Console.WriteLine(
            $"LARK UPDATE TIME = {timer.Elapsed.TotalSeconds:F2}s");

        Console.WriteLine(
            $"LARK UPDATE STATUS = {(int)response.StatusCode}");

        var result =
            await response.Content.ReadAsStringAsync();

        response.EnsureSuccessStatusCode();

        return result;
    }

    public async Task<DateTime?>
        GetLatestUpdateTimeAsync()
    {
        var doc =
            await ListRecordsAsync();

        var root =
            doc.RootElement;

        if (root.GetProperty("code")
                .GetInt32() != 0)
        {
            return null;
        }

        var items =
            root.GetProperty("data")
                .GetProperty("items");

        DateTime? latest = null;

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
                    "更新时间",
                    out var updateField))
            {
                continue;
            }

            var value =
                updateField.ToString();

            if (!DateTime.TryParse(
                    value,
                    out var date))
            {
                continue;
            }

            if (latest == null ||
                date > latest)
            {
                latest = date;
            }
        }

        if (latest != null)
        {
            latest =
                latest.Value.AddMinutes(-5);
        }

        Console.WriteLine(
            $"Latest Sync From Lark = {latest}");

        return latest;
    }

    public DateTime?
    GetLatestUpdateTime(
        JsonDocument doc)
    {
        var root =
            doc.RootElement;

        if (root.GetProperty("code")
                .GetInt32() != 0)
        {
            return null;
        }

        var items =
            root.GetProperty("data")
                .GetProperty("items");

        DateTime? latest = null;

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
                    "更新时间",
                    out var updateField))
            {
                continue;
            }

            var value =
                updateField.ToString();

            if (!DateTime.TryParse(
                    value,
                    out var date))
            {
                continue;
            }

            if (latest == null ||
                date > latest)
            {
                latest = date;
            }
        }

        if (latest != null)
        {
            latest =
                latest.Value.AddMinutes(-5);
        }

        Console.WriteLine(
            $"Latest Sync From Lark = {latest}");

        return latest;
    }
}