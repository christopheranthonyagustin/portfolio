namespace CareerOps.Api.Models;

public class CandidateProfile
{
    public string Name { get; set; } = string.Empty;

    public int YearsOfExperience { get; set; }

    public int ProjectManagementYears { get; set; }

    public int SoftwareEngineeringYears { get; set; }

    public string EducationLevel { get; set; } = string.Empty;

    public string EnglishLevel { get; set; } = string.Empty;

    public List<string> Skills { get; set; } = [];

    public List<string> Industries { get; set; } = [];

    public List<string> DomainExperience { get; set; } = [];

    public List<string> Strengths { get; set; } = [];

    public List<string> Certifications { get; set; } = [];

    public List<string> KnownGaps { get; set; } = [];

    public List<RolePreference> RolePreferences { get; set; } = [];
}

public class RolePreference
{
    public string Role { get; set; } = string.Empty;

    public int Weight { get; set; }
}