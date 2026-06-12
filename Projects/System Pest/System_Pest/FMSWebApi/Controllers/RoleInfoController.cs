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
    public class RoleInfoController : ApiController
    {
        private static readonly IRoleRepository repository = new RoleRepository();

        public IEnumerable<RoleInfo> GetByRoleID([FromUri]RoleInfo param)
        {


            if ((param.RoleID > 0))
            {
                return repository.GetByRoleID(param);
            }
            else
            {
                return repository.GetByRoleID(param);
            }
        }

        public RoleInfo GetAsset(int id)
        {
            RoleInfo currRole = repository.Get(id);
            if (currRole == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currRole;
        }


        public RoleInfo PostAsset([FromBody]RoleInfo currRole)
        {
            currRole = repository.Add(currRole);
            return currRole;
        }

        public void PutProduct(int id, [FromBody]RoleInfo currRole)
        {
            currRole.RoleID = id;
            if (!repository.Update(currRole))
                Logger.LogEvent("PutProduct Success", System.Diagnostics.EventLogEntryType.Information);//testing
            else
                Logger.LogEvent("PutProduct Failed", System.Diagnostics.EventLogEntryType.Information);//testing
        }

        public void DeleteProduct(int id)
        {
            RoleInfo currRole = repository.Get(id);
            if (currRole == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }

    }
}
