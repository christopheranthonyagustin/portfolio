using CareerOps.Api.Models;

namespace CareerOps.Api.Services;

public interface IGeminiAiService
{
    Task<JobAnalysisResponse>
        AnalyzeJobAsync(AnalyzeJobRequest request);
}