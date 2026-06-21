using CareerOps.Api.Models;

namespace CareerOps.Api.Services;

public interface IOpenAiService
{
    Task<JobAnalysisResponse>
        AnalyzeJobAsync(
            AnalyzeJobRequest request);
}