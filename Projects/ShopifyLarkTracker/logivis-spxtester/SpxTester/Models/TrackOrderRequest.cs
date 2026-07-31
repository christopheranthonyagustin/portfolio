using System.Text.Json.Serialization;

namespace SpxTester.Models;

public class TrackOrderRequest
{
    [JsonPropertyName("user_id")]
    public long UserId { get; set; }

    [JsonPropertyName("user_secret")]
    public string UserSecret { get; set; } = string.Empty;

    [JsonPropertyName("tracking_no_list")]
    public List<string> TrackingNoList { get; set; } = new();

    [JsonPropertyName("order_id_list")]
    public List<string> OrderIdList { get; set; } = new();
}