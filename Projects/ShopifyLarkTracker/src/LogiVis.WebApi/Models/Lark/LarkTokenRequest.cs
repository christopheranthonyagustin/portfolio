namespace LogiVis.WebApi.Models.Lark;

public class LarkTokenRequest
{
    public string GrantType { get; set; } = "authorization_code";

    public string Code { get; set; } = string.Empty;
}