using System.Collections.Generic;
using myproject.Entities;

namespace myproject.Business.Abstract
{
    public interface ISubCategoryService: IValidator<SubCategory>
    {
        SubCategory GetById(int id);
        // SubCategory GetByCategoryId(int id);

        SubCategory GetByIdWithProducts(int subCategoryId);

        List<SubCategory> GetAll();

        void Create(SubCategory entity);

        void Update(SubCategory entity);
        void Delete(SubCategory entity);
        void DeleteFromSubCategory(int productId,int subCategoryId);
    }
}