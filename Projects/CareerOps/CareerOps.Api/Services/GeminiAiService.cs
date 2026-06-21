using CareerOps.Api.Models;
using Microsoft.Extensions.Options;
using System.Text.Json;

namespace CareerOps.Api.Services;

public class GeminiService
    : IGeminiAiService
{
    private readonly HttpClient _httpClient;
    private readonly GeminiAiOptions _options;
    private readonly CandidateProfileService _candidateProfileService;
    private readonly ILogger<GeminiService> _logger;

    public GeminiService(
    HttpClient httpClient,
    IOptions<GeminiAiOptions> options,
    CandidateProfileService candidateProfileService,
    ILogger<GeminiService> logger)
    {
        _httpClient = httpClient;
        _options = options.Value;
        _candidateProfileService = candidateProfileService;
        _logger = logger;
    }

    public async Task<JobAnalysisResponse>
AnalyzeJobAsync(
AnalyzeJobRequest request)
    {
        try
        {
            _logger.LogInformation(
            "Starting job analysis for Company: {Company}, Position: {Position}",
            request.Company,
            request.Position);


    //--------------------------------------------------
    // LOAD PROFILE
    //--------------------------------------------------

    var profile =
        await _candidateProfileService
            .GetProfileAsync();

            var profileSummary = new
            {
                profile.YearsOfExperience,
                profile.ProjectManagementYears,
                profile.SoftwareEngineeringYears,
                profile.RolePreferences,
                profile.Skills,
                profile.Industries,
                profile.KnownGaps
            };

            var profileJson =
                JsonSerializer.Serialize(
                    profileSummary,
                    new JsonSerializerOptions
                    {
                        WriteIndented = true
                    });

            //--------------------------------------------------
            // PROMPT
            //--------------------------------------------------

            var prompt = $$"""
                You are an expert recruitment analyst.
                Analyze the job against the candidate profile.
                Return ONLY valid JSON.
                Do not use markdown.
                Do not use code fences.

                Schema:
                {
                "companyIndustry":"",
                "jobLevel":"",
                "marketFit":"",
                "marketFitReason":"",
                "skillsRequired":[],
                "missingSkills":[],
                "matchPercentage":0
                }

                Candidate Profile:

                {{profileJson}}

                Job Information:

                Company:
                {{request.Company}}

                Position:
                {{request.Position}}

                Job Description:
                {{request.JobDescription}}

                Instructions:

                1. Identify company industry.
                2. Determine job level.
                3. Compare job requirements against candidate profile.
                4. Calculate match percentage from 0-100.
                5. Identify missing skills.
                6. Explain market fit.
                7. Return valid JSON only.

                Scoring Rules:

                100 = Perfect match with all required skills, industry experience, certifications, and direct role experience.
                90-99 = Excellent match with minor gaps.
                80-89 = Strong match with a few gaps.
                70-79 = Good match with several gaps.
                60-69 = Moderate match.
                Below 60 = Weak match.

                Do not give 100 unless the candidate is an almost perfect match.

                skillsRequired must contain concise skill keywords only.

                Use 1-3 word phrases.
                Do not return job responsibilities.

                Examples:

                Good:

                * Agile
                * Scrum
                * REST API
                * Stakeholder Management
                * System Integration

                Bad:

                * Cross-functional Software Delivery
                * Project Scope Management
                * Timeline Management

                missingSkills should include:
                - Skills explicitly required by the job but not found in the candidate profile.
                - Relevant items from the candidate's knownGaps list.
                - Certifications or methodologies requested by the job but not demonstrated by the candidate.

                Do not return an empty missingSkills array unless the candidate fully satisfies all requirements.
                """;


    //--------------------------------------------------
    // GEMINI REQUEST
    //--------------------------------------------------

    var requestBody =
        new GeminiRequest
        {
            Contents =
            [
                new GeminiContent
                {
                    Parts =
                    [
                        new GeminiPart
                        {
                            Text = prompt
                        }
                    ]
                }
            ]
        };

            //--------------------------------------------------
            // CALL GEMINI
            //--------------------------------------------------

            _logger.LogInformation(
                "Calling Gemini Model: {Model}",
                _options.Model);

            HttpResponseMessage? response = null;

            var url =
            $"https://generativelanguage.googleapis.com/v1beta/models/{_options.Model}:generateContent?key={_options.ApiKey}";


            for (int attempt = 1; attempt <= 3; attempt++)
            {
                _logger.LogInformation(
                "Gemini Attempt {Attempt}/3",
                attempt);


            response =
                await _httpClient.PostAsJsonAsync(
                    url,
                    requestBody);

                if (response.IsSuccessStatusCode)
                {
                    _logger.LogInformation(
                        "Gemini request succeeded on attempt {Attempt}",
                        attempt);

                    break;
                }

                var error =
                    await response.Content
                        .ReadAsStringAsync();

                _logger.LogWarning(
                    "Gemini Attempt {Attempt} failed. Status: {StatusCode}. Error: {Error}",
                    attempt,
                    response.StatusCode,
                    error);

                if (
                        response.StatusCode == System.Net.HttpStatusCode.ServiceUnavailable ||
                        response.StatusCode == System.Net.HttpStatusCode.TooManyRequests
                    )
                {
                    if (attempt < 3)
                    {
                        await Task.Delay(
                            TimeSpan.FromSeconds(
                                attempt * 3));

                        continue;
                    }

                    return new JobAnalysisResponse
                    {
                        CompanyIndustry = "",
                        JobLevel = "",
                        MarketFit = "Unavailable",
                        MarketFitReason =
                            "Gemini service temporarily unavailable.",
                        SkillsRequired = [],
                        MissingSkills = [],
                        MatchPercentage = 0
                    };
                }

                throw new Exception(
                    $"Gemini Error: {error}");

            }

            if (response == null)
            {
                throw new Exception(
                "Gemini response is null.");
            }


            //--------------------------------------------------
            // READ RESPONSE
            //--------------------------------------------------

            var rawResponse =
                await response.Content
                    .ReadAsStringAsync();

            _logger.LogDebug(
                "Gemini Raw Response: {Response}",
                rawResponse);

            //--------------------------------------------------
            // DESERIALIZE GEMINI RESPONSE
            //--------------------------------------------------

            var geminiResponse =
                JsonSerializer.Deserialize<GeminiResponse>(
                    rawResponse,
                    new JsonSerializerOptions
                    {
                        PropertyNameCaseInsensitive = true
                    });

            if (geminiResponse == null)
            {
                throw new Exception(
                    "Unable to deserialize Gemini response.");
            }

            //--------------------------------------------------
            // EXTRACT AI TEXT
            //--------------------------------------------------

            var aiText =
                geminiResponse
                    .Candidates?
                    .FirstOrDefault()?
                    .Content?
                    .Parts?
                    .FirstOrDefault()?
                    .Text;

            if (string.IsNullOrWhiteSpace(aiText))
            {
                throw new Exception(
                    "Gemini returned empty content.");
            }

            //--------------------------------------------------
            // CLEAN RESPONSE
            //--------------------------------------------------

            aiText = aiText
                .Replace("```json", "")
                .Replace("```", "")
                .Trim();

            _logger.LogInformation(
                "Gemini response successfully parsed.");

            //--------------------------------------------------
            // DESERIALIZE RESULT
            //--------------------------------------------------

            var result =
                JsonSerializer.Deserialize<JobAnalysisResponse>(
                    aiText,
                    new JsonSerializerOptions
                    {
                        PropertyNameCaseInsensitive = true
                    });

            if (result == null)
            {
                throw new Exception(
                    $"Unable to deserialize AI JSON: {aiText}");
            }

            _logger.LogInformation(
                "Analysis completed. Match Percentage: {MatchPercentage}, Market Fit: {MarketFit}",
                result.MatchPercentage,
                result.MarketFit);

            return result;
        }
        catch (Exception ex)
        {
            _logger.LogError(
                ex,
                "Error analyzing Company: {Company}, Position: {Position}",
                request.Company,
                request.Position);

            throw;
        }


    }

}