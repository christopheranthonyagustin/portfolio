using FMSWebApi.Models;
using FMSWebApi.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Cors;

namespace FMSWebApi.Controllers
{
    //[EnableCors(origins: "*", headers: "*", methods: "*")]
    public class ImportGoodsIssueInfoController : ApiController
    {
        private static readonly IBigSellerOrderRepository repository = new BigSellerOrderRepository();

        public async Task<BigSellerOrderInfo> PostImportGI([FromBody] BigSellerOrderInfo currOrder)
        {
            currOrder = await repository.SaveGI(currOrder);
            return currOrder;
        }

    }
}
