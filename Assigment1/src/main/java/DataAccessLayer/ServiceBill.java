package DataAccessLayer;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import org.apache.catalina.tribes.util.Arrays;

import BussinessLayer.ServiceInterface.IServiceBill;
import BussinessLayer.Utils.JpaUtil;
import BussinessLayer.entities.Bill;
import BussinessLayer.entities.Product;
import BussinessLayer.entities.User;

public class ServiceBill  implements IServiceBill{
EntityManager em;
public ServiceBill() {
	em=JpaUtil.createEntityManager();
	// TODO Auto-generated constructor stub
}
	@Override
	public Bill add(Bill entity) throws Exception {
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
	public Bill delete(Bill entity) throws Exception {
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
	public Bill update(Bill entity) throws Exception {
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
	public Bill findById(Long id) throws Exception {
		return em.find(Bill.class,id);
	}

	@Override
	public List<Bill> selectAll() throws Exception {
	String query="SELECT b FROM Bill b ";
	TypedQuery<Bill>list=em.createQuery(query,Bill.class);
	return list.getResultList();
	}
	@Override
	public List<Bill> selectByUsername(String username) throws Exception {
		List<Bill> list_rs=new ArrayList<>();
		String query="select b.product.masanpham,b.dongia,b.mota,b.trangthai,sum(b.soluong) as Soluong,b.user.username from Bill b "
				+ " WHERE b.user.username=:username "
				+ "GROUP BY b.product.masanpham,b.dongia,b.mota,b.trangthai,b.user.username ";
		TypedQuery<Object[]>list=em.createQuery(query,Object[].class).setParameter("username", username);
      for(Object[] x:list.getResultList()) {
    	  Bill b=new Bill();
    	  b.setProduct(new ServiceProduct().selectByMa((String)x[0]));
    	  b.setDongia((Float)x[1]);
    	  b.setMota((String)x[2]);
    	  b.setTrangthai((Integer)x[3]);
    	  b.setSoluong((Long)x[4]);
    	  b.setUser(new ServiceUser().findByUsername((String) x[5]));
    	  list_rs.add(b);
      }
      return list_rs;
		
	}
	@Override
	public List<Bill> selectNotGroupBy(String username) throws Exception {
		String query="SELECT b FROM Bill b WHERE b.user.username=:username";
		TypedQuery<Bill>list=em.createQuery(query,Bill.class).setParameter("username", username);
		return list.getResultList();
	}

   public static void main(String[] args) {
	try {
		System.out.println(new ServiceBill().selectByUsername("tholv").size());
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
   }
	
	

}
