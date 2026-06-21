using System.Text.Json;
using CareerOps.Api.Models;

namespace CareerOps.Api.Services
{
    public class CandidateProfileService
    {
        private readonly IWebHostEnvironment _environment;

        public CandidateProfileService(
            IWebHostEnvironment environment)
        {
            _environment = environment;
        }

        public async Task<CandidateProfile>
            GetProfileAsync()
        {
            var path =
                Path.Combine(
                    _environment.ContentRootPath,
                    "Profiles",
                    "candidate-profile.json");

            var json =
                await File.ReadAllTextAsync(
                    path);

            return JsonSerializer.Deserialize<CandidateProfile>(
                json,
                new JsonSerializerOptions
                {
                    PropertyNameCaseInsensitive = true
                })!;
        }
    }
}
