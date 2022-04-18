package BussinessLayer.ServiceDAL;

import java.util.List;

import BussinessLayer.ServiceInterface.IServiceProduct;
import BussinessLayer.entities.Product;

public class ServiceProduct implements IServiceProduct{
	DataAccessLayer.ServiceProduct sp;
	public ServiceProduct() {
		sp=new DataAccessLayer.ServiceProduct();
	}

	@Override
	public Product add(Product entity) throws Exception {
		return sp.add(entity);
	}

	@Override
	public Product delete(Product entity) throws Exception {
		return sp.delete(entity);
	}

	@Override
	public Product update(Product entity) throws Exception {
		return sp.update(entity);
	}

	@Override
	public Product findById(long id) throws Exception {
	    return sp.findById(id);
	}

	@Override
	public List<Product> selectAll() throws Exception {
		return sp.selectAll();
	}

	@Override
	public Product selectByMa(String ma) throws Exception {
		// TODO Auto-generated method stub
		return sp.selectByMa(ma);
	}

}
