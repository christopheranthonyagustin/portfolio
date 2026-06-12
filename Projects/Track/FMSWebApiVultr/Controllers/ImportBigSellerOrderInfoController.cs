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
    public class ImportBigSellerOrderInfoController : ApiController
    {
        private static readonly IBigSellerOrderRepository repository = new BigSellerOrderRepository();

        public async Task<BigSellerOrderInfo> PostImportOrder([FromBody] BigSellerOrderInfo currOrder)
        {
            currOrder = await repository.AddImportAsync(currOrder);
            return currOrder;
        }

    }
}
