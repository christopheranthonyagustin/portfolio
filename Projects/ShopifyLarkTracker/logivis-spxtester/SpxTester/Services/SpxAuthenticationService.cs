using SpxTester.Config;
using System.Security.Cryptography;
using System.Text;

namespace SpxTester.Services;

public class SpxAuthenticationService
{
    private readonly SpxOptions _options;

    public SpxAuthenticationService(SpxOptions options)
    {
        _options = options;
    }

    public string GenerateSignature(long timestamp, long randomNumber, string payload)
    {
        var originalValue = $"{_options.AppId}_{timestamp}_{randomNumber}_{payload}";

        using var hmac = new HMACSHA256(Encoding.UTF8.GetBytes(_options.SecretKey));

        var hash = hmac.ComputeHash(Encoding.UTF8.GetBytes(originalValue));

        return Convert.ToHexString(hash).ToLowerInvariant();
    }
}