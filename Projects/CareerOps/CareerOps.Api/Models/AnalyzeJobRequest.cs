namespace CareerOps.Api.Models
{
    public class AnalyzeJobRequest
    {
        public string Company { get; set; } = string.Empty;

        public string Position { get; set; } = string.Empty;

        public string Url { get; set; } = string.Empty;

        public string JobDescription { get; set; } = string.Empty;
    }

   public class GeminiResponse
    {
        public List<GeminiCandidate> Candidates { get; set; } = [];
    }

    public class GeminiCandidate
    {
        public GeminiContent Content { get; set; } = new();
    }
    public class GeminiRequest
    {
        public List<GeminiContent> Contents { get; set; } = [];
    }

    public class GeminiContent
    {
        public List<GeminiPart> Parts { get; set; } = [];

        public string Role { get; set; } = string.Empty;
    }

    public class GeminiPart
    {
        public string Text { get; set; } = string.Empty;
    }

}
