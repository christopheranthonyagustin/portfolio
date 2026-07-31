using System.Text.Json.Serialization;

namespace SpxTester.Models;

public class VerifyAccountRequest
{
    [JsonPropertyName("user_id")]
    public long UserId { get; set; }

    [JsonPropertyName("user_secret")]
    public string UserSecret { get; set; } = string.Empty;
}