using System.Text.Json.Serialization;

namespace LogiVis.WebApi.Models.Lark;

public class LarkUserResponse
{
    [JsonPropertyName("code")]
    public int Code { get; set; }

    [JsonPropertyName("msg")]
    public string Message { get; set; } = string.Empty;

    [JsonPropertyName("data")]
    public LarkUserInfo Data { get; set; } = new();
}