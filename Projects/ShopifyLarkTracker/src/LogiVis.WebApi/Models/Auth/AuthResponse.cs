namespace LogiVis.WebApi.Models.Auth;

public class AuthResponse
{
    public UserInfo User { get; set; } = new();
    public CompanyInfo Company { get; set; } = new();
    public List<string> Roles { get; set; } = [];
    public List<string> Permissions { get; set; } = [];
}

public class UserInfo
{
    public int Id { get; set; }
    public string Email { get; set; } = string.Empty;
    public string FirstName { get; set; } = string.Empty;
    public string LastName { get; set; } = string.Empty;
    public string DisplayName { get; set; } = string.Empty;
}

public class CompanyInfo
{
    public int Id { get; set; }
    public string Name { get; set; } = string.Empty;
}