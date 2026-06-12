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
    public class MaintenanceInfoController : ApiController
    {
        private static readonly IMaintenanceRepository repository = new MaintenanceRepository();

        public IEnumerable<MaintenanceInfo> GetMaintenance([FromUri]MaintenanceInfo param)
        {           
            if  ((param.CompanyID > 0))
            {
                return repository.GetMaintenance(param);
            }
            else
            {
                return repository.GetAllEx();
            }
        }
		
        // GET: api/MaintenanceInfo
        public MaintenanceInfo Get(int id)
        {
            MaintenanceInfo currMaintenance = repository.Get(id);
            if (currMaintenance == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currMaintenance;
        }


        public MaintenanceInfo PostMaintenance([FromBody]MaintenanceInfo currMaintenance)
        {
            currMaintenance = repository.Add(currMaintenance);
            return currMaintenance;
        }

        public bool PutMaintenance(int id, [FromBody]MaintenanceInfo currMaintenance)
        {

            currMaintenance.MaintenanceID = id;
            if (!repository.Update(currMaintenance))
            {
                return false;
            }
            return true;
        }

        public void DeleteMaintenance(int id)
        {
            MaintenanceInfo currMaintenance = repository.Get(id);
            if (currMaintenance == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }

    }
}
