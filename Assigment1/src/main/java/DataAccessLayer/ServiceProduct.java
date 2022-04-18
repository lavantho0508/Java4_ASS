package DataAccessLayer;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import BussinessLayer.ServiceInterface.IServiceProduct;
import BussinessLayer.Utils.JpaUtil;
import BussinessLayer.entities.Product;

public class ServiceProduct implements IServiceProduct{
 EntityManager em;
 public ServiceProduct() {
	em=JpaUtil.createEntityManager();
}
	@Override
	public Product add(Product entity) throws Exception {
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
	public Product delete(Product entity) throws Exception {
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
	public Product update(Product entity) throws Exception {
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
	public Product findById(long id) throws Exception {
		return em.find(Product.class,id);
	}

	@Override
	public List<Product> selectAll() throws Exception {
		String query="SELECT p FROM Product p";
		TypedQuery<Product> list=em.createQuery(query,Product.class);
		return list.getResultList();
	}
	@Override
	public Product selectByMa(String ma) throws Exception {
		String query="SELECT p FROM Product p WHERE p.masanpham=:masanpham";
		TypedQuery<Product> list=em.createQuery(query,Product.class).setParameter("masanpham", ma);
		return list.getSingleResult();
	}


}
