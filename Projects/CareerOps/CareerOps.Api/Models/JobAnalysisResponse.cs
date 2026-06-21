namespace CareerOps.Api.Models
{
    public class JobAnalysisResponse
    {
        public string CompanyIndustry { get; set; } = string.Empty;

        public string JobLevel { get; set; } = string.Empty; 

        public List<string> SkillsRequired { get; set; } = [];

        public string MarketFit { get; set; } = string.Empty;

        public string MarketFitReason { get; set; } = string.Empty;

        public List<string> MissingSkills { get; set; } = [];

        public int MatchPercentage { get; set; }
    }
}

