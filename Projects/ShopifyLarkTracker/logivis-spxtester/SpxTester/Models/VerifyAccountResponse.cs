using System.Text.Json.Serialization;

namespace SpxTester.Models;

public class VerifyAccountResponse
{
    [JsonPropertyName("ret_code")]
    public int RetCode { get; set; }

    [JsonPropertyName("message")]
    public string Message { get; set; } = string.Empty;

    [JsonPropertyName("data")]
    public VerifyAccountData? Data { get; set; }
}

public class VerifyAccountData
{
    [JsonPropertyName("match_result")]
    public bool MatchResult { get; set; }
}