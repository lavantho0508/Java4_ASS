package DataAccessLayer;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import BussinessLayer.ServiceInterface.IServiceCategory;
import BussinessLayer.Utils.JpaUtil;
import BussinessLayer.entities.Category;

public class ServiceCategory implements IServiceCategory{
	EntityManager em;
	public ServiceCategory() {
		em=JpaUtil.createEntityManager();
		// TODO Auto-generated constructor stub
	}

	@Override
	public Category add(Category entity) throws Exception {
		try {
			em.getTransaction().begin();
			em.persist(entity);
			em.flush();
			em.getTransaction().commit();
			return entity;
		} catch (Exception e) {
			e.printStackTrace();
			em.getTransaction().rollback();
			throw e;
		}
	}

	@Override
	public Category delete(Category entity) throws Exception {
		try {
			em.getTransaction().begin();
			em.remove(entity);
			em.flush();
			em.getTransaction().commit();
			return entity;
		} catch (Exception e) {
			e.printStackTrace();
			em.getTransaction().rollback();
			throw e;
		}
	}

	@Override
	public Category update(Category entity) throws Exception {
		try {
			em.getTransaction().begin();
			em.merge(entity);
			em.flush();
			em.getTransaction().commit();
			return entity;
		} catch (Exception e) {
			e.printStackTrace();
			em.getTransaction().rollback();
			throw e;
		}
	}

	@Override
	public Category findById(long id) throws Exception {
		return em.find(Category.class,id);
	}

	@Override
	public List<Category> selectAll() throws Exception {
		String query="SELECT c FROM Category c ";
		TypedQuery<Category>list=em.createQuery(query,Category.class);
		return list.getResultList();
	}

	@Override
	public Category findByProduct(String name) throws Exception {
	for(Category x:selectAll()) {
		if(name.equals(x.getMatheloai())) {
			return x;
		}
	}
	throw new Exception();
	}

}
