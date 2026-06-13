namespace ShopifyLarkTracker.Services;

public class TokenCache
{
    private string? _token;
    private DateTime _expiry;

    public bool IsValid()
        => !string.IsNullOrEmpty(_token) && DateTime.UtcNow < _expiry;

    public void Set(string token, int expireSeconds)
    {
        _token = token;
        _expiry = DateTime.UtcNow.AddSeconds(expireSeconds - 60);
    }

    public string Get() => _token!;
}