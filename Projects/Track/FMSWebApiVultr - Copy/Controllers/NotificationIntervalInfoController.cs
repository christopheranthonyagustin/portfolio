using MySql.Data.MySqlClient;
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
    public class NotificationIntervalInfoController : ApiController
    {
        private static readonly INotifRepository repository = new NotificationIntervalRepository();

        public IEnumerable<NotificationIntervalInfo> GetAssetsEx([FromUri]NotificationIntervalInfo param)
        {
            if (!string.IsNullOrEmpty(param.Description))
            {
                return repository.GetNotifInterval(param);
            }
            else
            {
                return repository.GetAll();
            }
        }
    }
}
