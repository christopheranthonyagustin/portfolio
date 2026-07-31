using System.Text.Json;
using System.Text.Json.Serialization;

namespace SpxTester.Models;

public class TrackOrderResponse
{
    [JsonPropertyName("ret_code")]
    public int RetCode { get; set; }

    [JsonPropertyName("message")]
    public string Message { get; set; } = string.Empty;

    [JsonPropertyName("data")]
    public JsonElement Data { get; set; }
}