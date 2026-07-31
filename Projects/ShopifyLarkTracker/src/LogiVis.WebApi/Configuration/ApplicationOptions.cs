namespace LogiVis.WebApi.Configuration;

public class ApplicationOptions
{
    public const string SectionName = "Application";

    public string FrontendUrl { get; set; } = string.Empty;
}