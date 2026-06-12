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
    public class MakeInfoController : ApiController
    {
        private static readonly IMakeRepository repository = new MakeRepository();

        public IEnumerable<MakeInfo> GetAllMake()
        {
            return repository.GetAll();
        }

        public MakeInfo GetMake(int id)
        {
            MakeInfo currMake = repository.Get(id);
            if (currMake == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currMake;
        }

        public MakeInfo PostMake(MakeInfo currMake)
        {
            currMake = repository.Add(currMake);
            return currMake;
        }

        public void PutMake(int id, MakeInfo currMake)
        {
            currMake.MakeID = id;
            if (!repository.Update(currMake))
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
        }

        public void DeleteMake(int id)
        {
            MakeInfo currMake = repository.Get(id);
            if (currMake == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }

    }
}
