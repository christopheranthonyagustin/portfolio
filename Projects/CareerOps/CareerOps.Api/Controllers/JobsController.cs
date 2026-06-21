using CareerOps.Api.Models;
using CareerOps.Api.Services;
using Microsoft.AspNetCore.Mvc;

namespace CareerOps.Api.Controllers;

[ApiController]
[Route("api/jobs")]
public class JobsController : ControllerBase
{
    //private readonly IOpenAiService _openAiService;
    private readonly IGeminiAiService _geminiAiService;

    //public JobsController(
    //    IOpenAiService openAiService)
    //{
    //    _openAiService = openAiService;
    //}

    //[HttpPost("analyze")]
    //public async Task<IActionResult> Analyze(
    //    AnalyzeJobRequest request)
    //{
    //    var response =
    //        await _openAiService
    //            .AnalyzeJobAsync(request);

    //    return Ok(response);
    //}

    public JobsController(
      IGeminiAiService geminiAiService)
    {
        _geminiAiService = geminiAiService;
    }

    [HttpPost("analyze")]
    public async Task<IActionResult> Analyze(
        AnalyzeJobRequest request)
    {
        try
        {
            var response =
                await _geminiAiService
                    .AnalyzeJobAsync(request);

            return Ok(response);
        }
        catch (Exception ex)
        {
            return BadRequest(
                ex.Message);
        }
    }

    [HttpGet("health")]
    public IActionResult Health()
    {
        return Ok(
            new
            {
                status = "healthy"
            });
    }
}