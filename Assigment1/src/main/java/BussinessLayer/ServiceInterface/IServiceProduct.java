package BussinessLayer.ServiceInterface;

import java.util.List;

import BussinessLayer.entities.Product;

public interface IServiceProduct {
	public Product add(Product entity) throws Exception;
	public Product delete(Product entity) throws Exception;
	public Product update(Product entity) throws Exception;
	public Product findById(long id) throws Exception;
	public List<Product> selectAll() throws Exception;
	public Product selectByMa(String ma) throws Exception;
}
