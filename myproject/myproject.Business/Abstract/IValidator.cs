namespace myproject.Business.Abstract
{
    public interface IValidator<T>
    {
        string ErrorMessage{get;set;}
        bool Validation(T entity);
    }
}