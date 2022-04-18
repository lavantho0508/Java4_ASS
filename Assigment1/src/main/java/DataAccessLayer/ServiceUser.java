package DataAccessLayer;

import java.util.HashMap;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import BussinessLayer.ServiceInterface.IServiceUser;
import BussinessLayer.Utils.JpaUtil;
import BussinessLayer.Utils.SecurityUtil;
import BussinessLayer.entities.User;

public class ServiceUser implements IServiceUser{
	public ServiceUser() {
		em=JpaUtil.createEntityManager();
	}
	EntityManager em;
	
	@Override
	public User add(User entity) throws Exception {
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
	public User delete(User entity) throws Exception {
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
	public User update(User entity) throws Exception {
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
	public User findById(int id) throws Exception {
		return em.find(User.class,id);
	}

	@Override
	public List<User> selectAll() throws Exception {
	String query="SELECT u FROM User u";
	TypedQuery<User> list=em.createQuery(query, User.class);
	return list.getResultList();
	}

	@Override
	public User findByUsername(String username) throws Exception {
		String query="SELECT u FROM User u WHERE u.username=:username";
		User u=em.createQuery(query,User.class).setParameter("username", username).getSingleResult();
		return u;
	}

	@Override
	public User login(String username,String password) throws Exception {
		String query="SELECT u FROM User u WHERE u.username=:username and u.password=:password";
		User u=em.createQuery(query,User.class).setParameter("username", username).
				setParameter("password", password).getSingleResult();
		return u;
	}

	@Override
	public HashMap<String, String> listError(User entity,String passwd) throws Exception {
		HashMap<String, String> list_error=new HashMap<>();
		if(entity.getUsername().isBlank()) {
			list_error.put("username_space", "Tài khoản không chứa khoảng trắng hoặc rỗng");
		}
		else if(entity.getUsername().length()<5) {
			list_error.put("username_length", "Tài khoản phải trên 5 ký tự");
		}
		else if(!entity.getUsername().matches("^[a-zA-Z0-9]+$")) {
			list_error.put("username_invalid", "Tài khoản không chứa  ký tự đặc biệt");
			
		}else if(SecurityUtil.isXSS(entity.getUsername())) {
			list_error.put("username_xss", "Tài khoản không đúng định dạng");
		}
		else if(isExistUsername(entity.getUsername())) {
			list_error.put("username_exist", "Tên đăng nhập đã tồn tại ");
		}else if(entity.getUsername().length()>20) {
			list_error.put("username_overflow", "Tên đăng nhập không quá 20 ký tự");
		}
		else if(passwd.isBlank()) {
			list_error.put("password_space", "Mật khẩu không chứa khoảng trắng hoặc rỗng");
		}
		else if(passwd.trim().length()<5) {
			list_error.put("password_length", "Mật khẩu phải trên 5 ký tự");
		}
		else if(SecurityUtil.isXSS(passwd)) {
			list_error.put("password_xss", "Mật khẩu không chứa ký tự đặc biệt");
		}
		else if(!passwd.trim().matches("^[a-zA-Z0-9]+$")) {
			list_error.put("password_invalid", "Mật khẩu không chứa  ký tự đặc biệt");
			
		}
		else if(entity.getDiachi().contains("<")) {
			list_error.put("diachi_invalid", "Địa chỉ không chứa  ký tự đặc biệt");
		}
		if(entity.getEmail().isBlank()) {
			list_error.put("email_space", "Email không được để trống hoặc chứa khoảng trắng");
		}else if(entity.getEmail().trim().length()<7) {
			list_error.put("email_length", "Email phải trên 7 ký tự");
		}else if(!entity.getEmail().trim().contains("@")) {
			list_error.put("email_invalid", "Email chưa đúng định dạng");		
		}else if(SecurityUtil.checkMailClone(entity.getEmail().trim(), selectAll())) {
			list_error.put("email_clone", "Email chưa được bảo mật");	
		}
		return list_error;
	}
	private boolean isExistUsername(String username) throws Exception {
		for(User x:selectAll()) {
			if(username.equals(x.getUsername()))
				return true;			
		}
		return false;
	}
	private boolean notActive(int trangthai) throws Exception {
		for(User x:selectAll()) {
			if(trangthai==2)
				return true;			
		}
		return false;
	}
	private boolean checkLogin(String username,String password) throws Exception {
		for(User x:selectAll()) {
			if(username.equals(x.getUsername())&&password.equals(x.getPassword()))
				return true;			
		}
		return false;
	}
	@Override
	public HashMap<String, String> checkError(String username,String passwd) throws Exception {
		HashMap<String, String>flagError=new HashMap<String, String>();
		if(username.isBlank()) {
			flagError.put("username_null", "Tài khoản không được để trống");
		}
		else if(username.length()<5) {
			flagError.put("username_length", "Tài khoảng phải lớn hơn 6 ký tự");
		}
		else if(!isExistUsername(username)) {
			flagError.put("username_exist", "Tài khoản  không tồn tại");
		}
		else if(passwd.isBlank()) {
			flagError.put("passwd_null", "Mật khẩu không được để trống");
		}
		else if(passwd.length()<5) {
			flagError.put("passwd_length", "mật khẩu phải lớn hơn 6 ký tự");
		}
		else if(!checkLogin(username, passwd)) {
			flagError.put("account_exist", "Tài khoản hoặc mật khẩu không chính xác");
		}else if(notActive(findByUsername(username).getTrangthai())) {
			flagError.put("account_notative", "Tài khoản của bạn đã bị khóa vui lòng liên hệ admin để hỗ trợ");
		}
		
		return flagError;
		
	}
	public static void main(String[] args) throws Exception {
		System.out.println(new ServiceUser().selectAll().size());
	}

}
