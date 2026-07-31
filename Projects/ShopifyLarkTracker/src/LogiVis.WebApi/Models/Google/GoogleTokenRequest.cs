namespace LogiVis.WebApi.Models.Google;

public class GoogleTokenRequest
{
    public string Code { get; set; } = string.Empty;

    public string ClientId { get; set; } = string.Empty;

    public string ClientSecret { get; set; } = string.Empty;

    public string RedirectUri { get; set; } = string.Empty;

    public string GrantType { get; set; } = "authorization_code";
}