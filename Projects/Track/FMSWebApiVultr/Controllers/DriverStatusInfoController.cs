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
    //[EnableCors(origins: "*", headers: "*", methods: "*")]
    public class DriverStatusInfoController : ApiController
    {
        private static readonly IDriverStatusRepository repository = new DriverStatusRepository();

        public IEnumerable<DriverStatusInfo> GetAllStatus()
        {
            return repository.GetAll();
        }

        public DriverStatusInfo GetDriverStatus(int id)
        {
            DriverStatusInfo currDriverStatus = repository.Get(id);
            if (currDriverStatus == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currDriverStatus;
        }

        public IEnumerable<DriverStatusInfo> GetStatusByName(string dsname)
        {
            return repository.GetAll().Where(
                c => string.Equals(c.DriverStatusDesc, dsname,
                         StringComparison.OrdinalIgnoreCase));
        }

        public DriverStatusInfo PostDriverStatus(DriverStatusInfo currDriverStatus)
        {
            currDriverStatus = repository.Add(currDriverStatus);
            return currDriverStatus;
        }

        public void PutDriverStatus(int id, DriverStatusInfo currDriverStatus)
        {
            currDriverStatus.DriverStatusID = id;
            if (!repository.Update(currDriverStatus))
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
        }

        public void DeleteDriverStatus(int id)
        {
            DriverStatusInfo currDriverStatus = repository.Get(id);
            if (currDriverStatus == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }

    }
}
