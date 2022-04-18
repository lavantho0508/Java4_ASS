package BussinessLayer.ServiceInterface;

import java.util.List;

import BussinessLayer.entities.Category;
import BussinessLayer.entities.Product;

public interface IServiceCategory {
	public Category add(Category entity) throws Exception;
	public Category delete(Category entity) throws Exception;
	public Category update(Category entity) throws Exception;
	public Category findById(long id) throws Exception;
	public List<Category> selectAll() throws Exception;
	public Category findByProduct(String name)throws Exception;
}
