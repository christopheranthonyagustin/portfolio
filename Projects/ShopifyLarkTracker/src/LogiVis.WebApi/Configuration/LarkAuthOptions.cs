namespace LogiVis.WebApi.Configuration
{
    public class LarkAuthOptions
    {
        public const string SectionName = "Authentication:Lark";

        public string AppId { get; set; } = string.Empty;
        public string AppSecret { get; set; } = string.Empty;
        public string RedirectUri { get; set; } = string.Empty;
    }
}
