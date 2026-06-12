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
    public class CategoryInfoController : ApiController
    {
        private static readonly ICategoryRepository repository = new CategoryRepository();

        public IEnumerable<CategoryInfo> GetAllCategories()
        {
            return repository.GetAll();
        }

        public CategoryInfo GetAsset(int categoryID)
        {
            CategoryInfo currCategory = repository.Get(categoryID);
            if (currCategory == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return currCategory;
        }

        public IEnumerable<CategoryInfo> GetCategoryByName(string categoryname)
        {
            return repository.GetAll().Where(
                c => string.Equals(c.CategoryDesc, categoryname,
                         StringComparison.OrdinalIgnoreCase));
        }

        public CategoryInfo PostAsset(CategoryInfo currCategory)
        {
            currCategory = repository.Add(currCategory);
            return currCategory;
        }

        public void PutCategory(int categoryID, CategoryInfo currCategory)
        {
            currCategory.CategoryID = categoryID;
            if (!repository.Update(currCategory))
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
        }

        public void DeleteCategory(int categoryID)
        {
            CategoryInfo currCategory = repository.Get(categoryID);
            if (currCategory == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            repository.Remove(categoryID);
        }

    }
}
