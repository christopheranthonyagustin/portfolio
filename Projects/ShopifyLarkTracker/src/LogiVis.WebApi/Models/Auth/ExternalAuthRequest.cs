namespace LogiVis.WebApi.Models.Auth
{
    public class ExternalAuthRequest
    {
        public string Provider { get; set; } = string.Empty;
        public string ProviderUserId { get; set; } = string.Empty;
        public string Email { get; set; } = string.Empty;
        public string FirstName { get; set; } = string.Empty;
        public string LastName { get; set; } = string.Empty;
        public string? PictureUrl { get; set; }
    }
}
