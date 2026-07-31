using LogiVis.WebApi.Models.Google;

namespace LogiVis.WebApi.Services.Interfaces;

public interface IGoogleAuthService
{
    string GetAuthorizationUrl(string state);

    Task<GoogleUserInfo> ExchangeCodeAsync(string code);
}