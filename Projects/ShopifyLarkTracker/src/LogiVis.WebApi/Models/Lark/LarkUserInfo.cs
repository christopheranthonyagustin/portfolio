using System.Text.Json.Serialization;

namespace LogiVis.WebApi.Models.Lark;

public class LarkUserInfo
{
    [JsonPropertyName("open_id")]
    public string OpenId { get; set; } = string.Empty;

    [JsonPropertyName("union_id")]
    public string UnionId { get; set; } = string.Empty;

    [JsonPropertyName("user_id")]
    public string UserId { get; set; } = string.Empty;

    [JsonPropertyName("name")]
    public string Name { get; set; } = string.Empty;

    [JsonPropertyName("en_name")]
    public string EnName { get; set; } = string.Empty;

    [JsonPropertyName("email")]
    public string Email { get; set; } = string.Empty;

    [JsonPropertyName("mobile")]
    public string Mobile { get; set; } = string.Empty;

    [JsonPropertyName("avatar_url")]
    public string AvatarUrl { get; set; } = string.Empty;

    [JsonPropertyName("avatar_thumb")]
    public string AvatarThumb { get; set; } = string.Empty;

    [JsonPropertyName("avatar_middle")]
    public string AvatarMiddle { get; set; } = string.Empty;

    [JsonPropertyName("avatar_big")]
    public string AvatarBig { get; set; } = string.Empty;

    [JsonPropertyName("tenant_key")]
    public string TenantKey { get; set; } = string.Empty;
}