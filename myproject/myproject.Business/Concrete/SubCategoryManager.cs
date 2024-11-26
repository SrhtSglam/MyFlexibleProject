using System.Collections.Generic;
using myproject.Business.Abstract;
using myproject.Data.Abstract;
using myproject.Entities;

namespace myproject.Business.Concrete
{
    public class SubCategoryManager : ISubCategoryService
    {
        private ISubCategoryRepository _subCategoryRepository;
        public SubCategoryManager(ISubCategoryRepository subCategoryRepository)
        {
            _subCategoryRepository=subCategoryRepository;
        }

        public string ErrorMessage { get => throw new System.NotImplementedException(); set => throw new System.NotImplementedException(); }

        public void Create(SubCategory entity)
        {
            _subCategoryRepository.Create(entity);
        }

        public void Delete(SubCategory entity)
        {
            _subCategoryRepository.Delete(entity);
        }

        public void DeleteFromSubCategory(int productId, int subCategoryId)
        {
            _subCategoryRepository.DeleteFromSubCategory(productId,subCategoryId);
        }

        public List<SubCategory> GetAll()
        {
            return _subCategoryRepository.GetAll();
        }

        public SubCategory GetById(int id)
        {
           return _subCategoryRepository.GetById(id);
        }

        public SubCategory GetByIdWithProducts(int subCategoryId)
        {
            return _subCategoryRepository.GetByIdWithProducts(subCategoryId);
        }

        public void Update(SubCategory entity)
        {
            _subCategoryRepository.Update(entity);
        }

        public bool Validation(SubCategory entity)
        {
            throw new System.NotImplementedException();
        }
    }
}