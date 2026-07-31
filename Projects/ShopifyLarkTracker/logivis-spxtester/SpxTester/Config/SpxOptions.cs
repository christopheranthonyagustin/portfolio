namespace SpxTester.Config;

public class SpxOptions
{
    public string BaseUrl { get; set; } = string.Empty;

    public long AppId { get; set; }

    public string SecretKey { get; set; } = string.Empty;

    public long UserId { get; set; }

    public string UserSecret { get; set; } = string.Empty;
}