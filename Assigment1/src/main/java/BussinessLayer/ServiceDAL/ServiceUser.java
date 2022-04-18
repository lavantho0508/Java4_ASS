package BussinessLayer.ServiceDAL;

import java.util.HashMap;
import java.util.List;

import BussinessLayer.ServiceInterface.IServiceUser;
import BussinessLayer.entities.User;

public class ServiceUser implements IServiceUser{
	DataAccessLayer.ServiceUser su;
	public ServiceUser() {
		su=new DataAccessLayer.ServiceUser();
	}

	@Override
	public User add(User entity) throws Exception {
		return su.add(entity);
	}

	@Override
	public User delete(User entity) throws Exception {
		return su.delete(entity);
	}

	@Override
	public User update(User entity) throws Exception {
		return su.update(entity);
	}

	@Override
	public User findById(int id) throws Exception {
		return su.findById(id);
	}

	@Override
	public List<User> selectAll() throws Exception {
		return su.selectAll();
	}

	@Override
	public User findByUsername(String username) throws Exception {
		return su.findByUsername(username);
	}

	@Override
	public User login(String username,String password) throws Exception {
		return su.login(username,password);
	}

	@Override
	public HashMap<String, String> listError(User entity,String passwd) throws Exception {
		return su.listError(entity,passwd);
	}

	@Override
	public HashMap<String, String> checkError(String username, String password) throws Exception {
		return su.checkError(username, password);
	}

}
