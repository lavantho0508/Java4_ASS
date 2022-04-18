package BussinessLayer.ServiceDAL;

import java.util.List;

import BussinessLayer.ServiceInterface.IServiceCategory;
import BussinessLayer.entities.Category;

public class ServiceCategory implements IServiceCategory{
	DataAccessLayer.ServiceCategory sc;
  public ServiceCategory() {
	sc=new DataAccessLayer.ServiceCategory();
}
	@Override
	public Category add(Category entity) throws Exception {
		return sc.add(entity);
	}

	@Override
	public Category delete(Category entity) throws Exception {
		return sc.delete(entity);
	}

	@Override
	public Category update(Category entity) throws Exception {
		return sc.update(entity);
	}

	@Override
	public Category findById(long id) throws Exception {
		return sc.findById(id);
	}

	@Override
	public List<Category> selectAll() throws Exception {
		return sc.selectAll();
	}
	@Override
	public Category findByProduct(String name) throws Exception {
	return sc.findByProduct(name);
	}

}
