using FMSWebApi.Models;
using FMSWebApi.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;


namespace FMSWebApi.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class RoleInfoController : ApiController
    {
        private static readonly IRoleRepository repository = new RoleRepository();

        //public IEnumerable<RoleInfo> GetAll()
        //{
        //    return repository.GetAll();
        //}

        public IEnumerable<RoleInfo> GetByRoleID([FromUri]RoleInfo param)
        {


            if ((param.RoleID > 0))
            {
                Logger.LogEvent(string.Format("Enter Role Controller"), System.Diagnostics.EventLogEntryType.Information);
                return repository.GetByRoleID(param);
            }
            else
            {
                //Logger.LogEvent(string.Format("PARAM IS null"), System.Diagnostics.EventLogEntryType.Information);
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

        //public IEnumerable<RoleInfo> GetRoleByName(string rolename)
        //{
        //    return repository.GetAll().Where(
        //        c => string.Equals(c.RoleDesc, rolename,
        //                 StringComparison.OrdinalIgnoreCase));
        //}

        public RoleInfo PostAsset([FromBody]RoleInfo currRole)
        {
            Logger.LogEvent(string.Format("Enter PostRole: {0}", currRole.RoleDesc), System.Diagnostics.EventLogEntryType.Information);//testing
            currRole = repository.Add(currRole);

            Logger.LogEvent(string.Format("Exit PostRole: {0}", currRole.ErrorMessage), System.Diagnostics.EventLogEntryType.Information);//testing
            return currRole;
        }

        public void PutProduct(int id, [FromBody]RoleInfo currRole)
        {
            Logger.LogEvent(string.Format("Enter RoleInfo: {0}, ID: {1}", currRole.RoleDesc, id), System.Diagnostics.EventLogEntryType.Information);//testing
            currRole.RoleID = id;
            if (!repository.Update(currRole))
                Logger.LogEvent("PutProduct Success", System.Diagnostics.EventLogEntryType.Information);//testing
            else
                Logger.LogEvent("PutProduct Failed", System.Diagnostics.EventLogEntryType.Information);//testing
        }

        public void DeleteProduct(int id)
        {
            Logger.LogEvent(string.Format("Enter DeleteRole: {0}", id), System.Diagnostics.EventLogEntryType.Information);//testing

            RoleInfo currRole = repository.Get(id);
            if (currRole == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }

    }
}
