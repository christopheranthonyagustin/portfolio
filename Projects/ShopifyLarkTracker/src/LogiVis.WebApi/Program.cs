using System.Text;
using LogiVis.WebApi.Configuration;
using LogiVis.WebApi.Models.CloudFlare;
using LogiVis.WebApi.Services;
using LogiVis.WebApi.Services.Interfaces;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;

namespace LogiVis.WebApi
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            // --------------------------------------------------
            // Configuration
            // --------------------------------------------------

            builder.Services.Configure<GoogleAuthOptions>(
                builder.Configuration.GetSection(GoogleAuthOptions.SectionName));

            builder.Services.Configure<LarkAuthOptions>(
                builder.Configuration.GetSection(LarkAuthOptions.SectionName));

            builder.Services.Configure<JwtOptions>(
                builder.Configuration.GetSection(JwtOptions.SectionName));

            builder.Services.Configure<CloudflareOptions>(
                builder.Configuration.GetSection(CloudflareOptions.SectionName));

            builder.Services.Configure<ApplicationOptions>(
                builder.Configuration.GetSection(ApplicationOptions.SectionName));

            // --------------------------------------------------
            // JWT Configuration
            // --------------------------------------------------

            //var jwtOptions = builder.Configuration
            //    .GetSection(JwtOptions.SectionName)
            //    .Get<JwtOptions>()!;

            var jwtOptions = builder.Configuration
                .GetSection(JwtOptions.SectionName)
                .Get<JwtOptions>() ?? new JwtOptions();


            // --------------------------------------------------
            // Authentication
            // --------------------------------------------------

            builder.Services
                .AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
                .AddJwtBearer(options =>
                {
                    options.TokenValidationParameters = new TokenValidationParameters
                    {
                        ValidateIssuer = true,
                        ValidateAudience = true,
                        ValidateIssuerSigningKey = true,
                        ValidateLifetime = true,

                        ValidIssuer = jwtOptions.Issuer,
                        ValidAudience = jwtOptions.Audience,

                        IssuerSigningKey = new SymmetricSecurityKey(
                            Encoding.UTF8.GetBytes(jwtOptions.SecretKey)),

                        ClockSkew = TimeSpan.Zero
                    };

                    options.Events = new JwtBearerEvents
                    {
                        OnMessageReceived = context =>
                        {
                            Console.WriteLine("========================================");
                            Console.WriteLine("JWT RECEIVED");
                            Console.WriteLine(context.Token ?? "<NO TOKEN>");
                            Console.WriteLine("========================================");
                            return Task.CompletedTask;
                        },

                        OnTokenValidated = context =>
                        {
                            Console.WriteLine("========================================");
                            Console.WriteLine("JWT VALIDATED");

                            foreach (var claim in context.Principal!.Claims)
                            {
                                Console.WriteLine($"{claim.Type} = {claim.Value}");
                            }

                            Console.WriteLine("========================================");
                            return Task.CompletedTask;
                        },

                        OnAuthenticationFailed = context =>
                        {
                            Console.WriteLine("========================================");
                            Console.WriteLine("JWT AUTHENTICATION FAILED");
                            Console.WriteLine(context.Exception);
                            Console.WriteLine("========================================");
                            return Task.CompletedTask;
                        },

                        OnChallenge = context =>
                        {
                            Console.WriteLine("========================================");
                            Console.WriteLine("JWT CHALLENGE");
                            Console.WriteLine($"Error: {context.Error}");
                            Console.WriteLine($"Description: {context.ErrorDescription}");
                            Console.WriteLine("========================================");
                            return Task.CompletedTask;
                        }
                    };
                });

            builder.Services.AddAuthorization();

            // --------------------------------------------------
            // CORS
            // --------------------------------------------------

            var frontendUrl = builder.Configuration["Application:FrontendUrl"];

            builder.Services.AddCors(options =>
            {
                options.AddPolicy("Angular", policy =>
                {
                    policy
                        .WithOrigins(frontendUrl!)
                        .AllowAnyHeader()
                        .AllowAnyMethod();
                });
            });

            // --------------------------------------------------
            // HttpClient
            // --------------------------------------------------

            builder.Services.AddHttpClient<IGoogleAuthService, GoogleAuthService>();
            builder.Services.AddHttpClient<ILarkAuthService, LarkAuthService>();
            builder.Services.AddHttpClient<WorkerApiClient>();

            // --------------------------------------------------
            // Dependency Injection
            // --------------------------------------------------

            builder.Services.AddScoped<ILarkAuthService, LarkAuthService>();
            builder.Services.AddSingleton<IJwtService, JwtService>();

            // --------------------------------------------------
            // MVC
            // --------------------------------------------------

            builder.Services.AddControllers();

            // --------------------------------------------------
            // Swagger
            // --------------------------------------------------

            builder.Services.AddEndpointsApiExplorer();
            builder.Services.AddSwaggerGen();

            var app = builder.Build();

            // --------------------------------------------------
            // Middleware
            // --------------------------------------------------

            if (app.Environment.IsDevelopment())
            {
                app.UseSwagger();
                app.UseSwaggerUI();
            }

            app.UseHttpsRedirection();

            app.UseCors("Angular");

            app.UseAuthentication();

            app.UseAuthorization();

            app.MapControllers();

            app.Run();
        }
    }
}