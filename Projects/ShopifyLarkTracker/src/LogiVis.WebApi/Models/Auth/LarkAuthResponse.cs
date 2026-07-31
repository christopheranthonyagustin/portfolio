namespace LogiVis.WebApi.Models.Auth;

public class LarkAuthResponse
{
    public string Provider { get; set; } = string.Empty;

    public string ProviderUserId { get; set; } = string.Empty;

    // Empty until email permission is approved
    public string? Email { get; set; }

    // Lark currently returns the full name here
    public string DisplayName { get; set; } = string.Empty;

    // Optional until you decide to split the name
    public string? FirstName { get; set; }

    public string? LastName { get; set; }

    public string? PictureUrl { get; set; }
}

