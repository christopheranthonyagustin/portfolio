using CareerOps.Api.Models;
using Microsoft.Extensions.Options;

namespace CareerOps.Api.Services;

public class OpenAiService
    : IOpenAiService
{

    private readonly HttpClient _httpClient;
    private readonly OpenAiOptions _options;

    public OpenAiService(
    HttpClient httpClient,
    IOptions<OpenAiOptions> options)
    {
        _httpClient = httpClient;
        _options = options.Value;
    }

    public async Task<JobAnalysisResponse>
        AnalyzeJobAsync(
            AnalyzeJobRequest request)
    {
        return await Task.FromResult(
            new JobAnalysisResponse
            {
                CompanyIndustry = "Software / SaaS",
                JobLevel = "Mid-Level",
                MarketFit = "Strong",
                MarketFitReason = "Stub Response",
                SkillsRequired =
                [
                    "Sales",
                    "CRM"
                ]
            });
    }
}