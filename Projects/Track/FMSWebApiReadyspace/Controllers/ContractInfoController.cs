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
    public class ContractInfoController : ApiController
    {
        private static readonly IContractRepository repository = new ContractRepository();

        public IEnumerable<ContractInfo> GetContractFiltered([FromUri]ContractInfo param)
        {
            if (param.CompanyID > 0)
            {
                return repository.GetContractFiltered(param);
            }
            else
            {
                return repository.GetAll();
            }
        }

        public ContractInfo GetContract(int id)
        {
            ContractInfo currContract = repository.Get(id);
            if (currContract == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currContract;
        }

        public ContractInfo PostContract(ContractInfo currContract)
        {
            currContract = repository.Add(currContract);
            return currContract;
        }

        public void PutContract(int id, ContractInfo currContract)
        {
            currContract.ContractID = id;
            if (!repository.Update(currContract))
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
        }

        public void DeleteContract(int id)
        {
            ContractInfo currContract = repository.Get(id);
            if (currContract == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }

    }
}
