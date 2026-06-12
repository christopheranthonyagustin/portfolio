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
    public class DepartmentInfoController : ApiController
    {
        private static readonly IDepartmentRepository repository = new DepartmentRepository();

        public IEnumerable<DepartmentInfo> GetAllDepartment()
        {
            return repository.GetAll();
        }

        public DepartmentInfo GetDepartment(int id)
        {
            DepartmentInfo currDepartment = repository.Get(id);
            if (currDepartment == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currDepartment;
        }

        public IEnumerable<DepartmentInfo> GetDescByName(string descname)
        {
            return repository.GetAll().Where(
                c => string.Equals(c.DepartmentDesc, descname,
                         StringComparison.OrdinalIgnoreCase));
        }

        public DepartmentInfo PostDepartment(DepartmentInfo currDepartment)
        {
            currDepartment = repository.Add(currDepartment);
            return currDepartment;
        }

        public void PutDepartment(int id, DepartmentInfo currDepartment)
        {
            currDepartment.DepartmentID = id;
            if (!repository.Update(currDepartment))
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
        }

        public void DeleteDepartment(int id)
        {
            DepartmentInfo currDepartment = repository.Get(id);
            if (currDepartment == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(id);
        }

    }
}
