using LogiVis.WebApi.Models.Lark;

namespace LogiVis.WebApi.Services.Interfaces;

public interface ILarkAuthService
{
    string GetAuthorizationUrl(string state);

    Task<LarkUserInfo> ExchangeCodeAsync(string code);
}