namespace LogiVis.WebApi.Models.CloudFlare
{
    public class CloudflareOptions
    {
        public const string SectionName = "Cloudflare";
        public string WorkerUrl { get; set; } = string.Empty;
        public string ApiKey { get; set; } = string.Empty;
    }
}
