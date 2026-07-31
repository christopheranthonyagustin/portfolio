using LogiVis.WebApi.Models.Auth;

namespace LogiVis.WebApi.Services.Interfaces;

public interface IJwtService
{
    string GenerateToken(ExternalAuthResponse user);
}
