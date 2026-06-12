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
    public class ImportStockMovementInfoController : ApiController
    {
        private static readonly IStockMovementRepository repository = new StockMovementRepository();

        public async Task<StockMovementInfo> PostImportStockMovement([FromBody] StockMovementInfo currStockMovement)
        {
            currStockMovement = await repository.AddImportAsync(currStockMovement);
            return currStockMovement;
        }

    }
}
