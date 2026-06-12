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
    public class ContractAlertInfoController : ApiController
    {
        private static readonly IContractAlertRepository repository = new ContractAlertRepository();

        public IEnumerable<ContractAlertInfo> GetContractAlertFiltered([FromUri]ContractAlertInfo param)
        {
            if (param.ContractID > 0)
            {
                return repository.GetContractAlertFiltered(param);
            }
            else
            {
                return repository.GetAll();
            }
        }

        public ContractAlertInfo GetContractAlert(int id)
        {
            ContractAlertInfo currContract = repository.Get(id);
            if (currContract == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currContract;
        }

        public ContractAlertInfo PostContractAlert(ContractAlertInfo currContract)
        {
            currContract = repository.Add(currContract);
            return currContract;
        }

        public void PutContractAlert(int id, ContractAlertInfo currContract)
        {
            currContract.ContractAlertID = id;
            if (!repository.Update(currContract))
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
        }

        public void DeleteContractAlert(int id)
        {
            ContractAlertInfo currContract = repository.Get(id);
            if (currContract == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }

    }
}
