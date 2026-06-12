using FMSWebApi.Models;
using FMSWebApi.Repository;
using ForceSSL.Modules;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;


namespace FMSWebApi.Controllers
{
    //[RequireHttps]
    //[Authorize] // Require authenticated requests.
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class RecommendationsInfoController : ApiController
    {
        private static readonly IRecommendationsRepository repository = new RecommendationsRepository();

        public IEnumerable<RecommendationsInfo> GetAllRecommendations()
        {
            return repository.GetAll();
        }

        public RecommendationsInfo GetRecommendations(int recommendID)
        {
            RecommendationsInfo currRecommendation = repository.Get(recommendID);
            if (currRecommendation == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currRecommendation;
        }

        public IEnumerable<RecommendationsInfo> GetRecommendationByName(string aoc)
        {
            return repository.GetAll().Where(
                c => string.Equals(c.Recommendation, aoc,
                         StringComparison.OrdinalIgnoreCase));
        }

    }
}
