using LogiVis.WebApi.Configuration;
using LogiVis.WebApi.Models.Auth;
using LogiVis.WebApi.Services;
using LogiVis.WebApi.Services.Interfaces;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;

namespace LogiVis.WebApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class AuthController : ControllerBase
{
    private readonly IGoogleAuthService _google;
    private readonly ILarkAuthService _lark;
    private readonly WorkerApiClient _worker;
    private readonly IJwtService _jwt;
    private readonly ApplicationOptions _applicationOptions;

    public AuthController(
        IGoogleAuthService google,
        ILarkAuthService lark,
        WorkerApiClient worker,
        IJwtService jwt,
        IOptions<ApplicationOptions> applicationOptions)
    {
        _google = google;
        _lark = lark;
        _worker = worker;
        _jwt = jwt;
        _applicationOptions = applicationOptions.Value;
    }

    #region Google

    [HttpGet("google/login")]
    public IActionResult GoogleLogin()
    {
        var state = Guid.NewGuid().ToString();
        var url = _google.GetAuthorizationUrl(state);

        return Redirect(url);
    }

    [HttpGet("google/callback")]
    public async Task<IActionResult> GoogleCallback(
        [FromQuery] string code,
        [FromQuery] string state)
    {

        try
        {
            var googleUser = await _google.ExchangeCodeAsync(code);

            var request = new ExternalAuthRequest
            {
                Provider = "Google",
                ProviderUserId = googleUser.Subject,
                Email = googleUser.Email,
                FirstName = googleUser.GivenName,
                LastName = googleUser.FamilyName,
                PictureUrl = googleUser.Picture
            };

            var workerUser = await _worker.ExternalLoginAsync(request);


            if (workerUser is null)
            {
                return Redirect(
                    $"{_applicationOptions.FrontendUrl}/auth/callback?error=authentication_failed");
            }

            ExternalAuthResponse worker = new ExternalAuthResponse();
            worker.UserId = Guid.NewGuid();
            worker.Email = workerUser.User.Email;
            worker.FirstName = workerUser.User.FirstName;
            worker.LastName = workerUser.User.LastName;

            var token = _jwt.GenerateToken(worker);

            return Redirect(
                $"{_applicationOptions.FrontendUrl}/auth/callback?token={Uri.EscapeDataString(token)}&userId={workerUser.User.Id}");

        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.ToString());
            return StatusCode(500, ex.ToString());
        }       
    }

    #endregion

    #region Lark

    [HttpGet("lark/login")]
    public IActionResult LarkLogin()
    {
        var state = Guid.NewGuid().ToString();
        var url = _lark.GetAuthorizationUrl(state);

        return Redirect(url);
    }

    [HttpGet("lark/callback")]
    public async Task<IActionResult> LarkCallback(
    [FromQuery] string code,
    [FromQuery] string state)
    {
        try
        {
            var larkUser = await _lark.ExchangeCodeAsync(code);

            Console.WriteLine("========== LARK USER ==========");
            Console.WriteLine($"OpenId    : {larkUser.OpenId}");
            Console.WriteLine($"Email     : {larkUser.Email}");
            Console.WriteLine($"Name      : {larkUser.Name}");
            Console.WriteLine($"AvatarUrl : {larkUser.AvatarUrl}");
            Console.WriteLine("===============================");

            var request = new LarkAuthRequest
            {
                Provider = "Lark",
                ProviderUserId = larkUser.OpenId,
                Email = string.IsNullOrWhiteSpace(larkUser.Email) ? null : larkUser.Email.Trim(),
                DisplayName = larkUser.Name,
                FirstName = larkUser.Name,
                LastName = null,
                PictureUrl = larkUser.AvatarUrl
            };

            Console.WriteLine("========== LARK REQUEST ==========");
            Console.WriteLine(
                System.Text.Json.JsonSerializer.Serialize(
                    request,
                    new System.Text.Json.JsonSerializerOptions
                    {
                        WriteIndented = true
                    }));
            Console.WriteLine("==================================");

            var workerUser = await _worker.LarkExternalLoginAsync(request);


            Console.WriteLine("========== WORKER RESPONSE ==========");
            Console.WriteLine(
                System.Text.Json.JsonSerializer.Serialize(
                    workerUser,
                    new System.Text.Json.JsonSerializerOptions
                    {
                        WriteIndented = true
                    }));
            Console.WriteLine("=====================================");

            if (workerUser is null)
            {
                return Redirect(
                    $"{_applicationOptions.FrontendUrl}/auth/callback?error=authentication_failed");
            }


            ExternalAuthResponse worker = new ExternalAuthResponse();
            worker.UserId = Guid.NewGuid();
            worker.Email = workerUser.User.Email;
            worker.FirstName = workerUser.User.FirstName;
            worker.LastName = workerUser.User.LastName;

            var token = _jwt.GenerateToken(worker);

            return Redirect(
                $"{_applicationOptions.FrontendUrl}/auth/callback?token={Uri.EscapeDataString(token)}&userId={workerUser.User.Id}");
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.ToString());
            return StatusCode(500, ex.ToString());
        }
        
    }

    #endregion

    [HttpGet("health")]
    public IActionResult Health()
    {
        return Ok(new
        {
            Status = "Healthy"
        });
    }
}