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
    public class ServicingInfoController : ApiController
    {
        private static readonly IServicingRepository repository = new ServicingRepository();

        public IEnumerable<ServicingInfo> GetServiceFiltered([FromUri]ServicingInfo param)
        {
            if (param.CompanyID > 0)
            {
                return repository.GetByCompany(param);
            }
            else
            {
                return repository.GetAll();
            }
        }

        public ServicingInfo GetService(int id)
        {
            ServicingInfo currService = repository.Get(id);
            if (currService == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currService;
        }

        public ServicingInfo PostService(ServicingInfo currService)
        {
            currService = repository.Add(currService);
            return currService;
        }

        public void PutService(int id, ServicingInfo currService)
        {
            currService.ServiceID = id;
            if (!repository.Update(currService))
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
        }

        public void DeleteService(int id)
        {
            ServicingInfo currService = repository.Get(id);
            if (currService == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }

    }
}
