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
    public class DriverScheduleInfoController : ApiController
    {
        private static readonly IDriverScheduleRepository repository = new DriverScheduleRepository();

        //public IEnumerable<DriverScheduleInfo> GetAllSchedule()
        //{
        //    return repository.GetAll();
        //}


        public IEnumerable<DriverScheduleInfo> GetByDriver([FromUri]DriverScheduleInfo param)
        {

            if ((param.DriverID > 0))
            {

                return repository.GetByDriver(param);
            }
            else
            {
                return repository.GetAll();
            }
        }

        public DriverScheduleInfo GetDriverSchedule(int id)
        {
            DriverScheduleInfo currDriverSchedule = repository.Get(id);
            if (currDriverSchedule == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currDriverSchedule;
        }


        public DriverScheduleInfo PostDriverSchedule(DriverScheduleInfo currDriverSchedule)
        {
            currDriverSchedule = repository.Add(currDriverSchedule);
            return currDriverSchedule;
        }

        public void PutDriverSchedule(int id, DriverScheduleInfo currDriverSchedule)
        {
            currDriverSchedule.ScheduleID = id;
            if (!repository.Update(currDriverSchedule))
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
        }

        public void DeleteDriverSchedule(int id)
        {
            DriverScheduleInfo currDriverSchedule = repository.Get(id);
            if (currDriverSchedule == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }

    }
}
