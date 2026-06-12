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
    public class ContractAlertInfoExController : ApiController
    {
        private static readonly IContractAlertRepository repository = new ContractAlertRepository();

        public void DeleteContractAlertEx(int id)
        {
            ContractAlertInfo currContract = repository.Get(id);
            if (currContract == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.RemoveContract(id);
        }

    }
}
