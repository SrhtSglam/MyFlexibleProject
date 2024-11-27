using System.Collections.Generic;
using myproject.Entities;

namespace myproject.Data.Abstract
{
    public interface ISubCategoryRepository: IRepository<SubCategory>
    {
        SubCategory GetByIdWithProducts(int subCategoryId);


        void DeleteFromSubCategory(int productId,int subCategoryId);
    }
}