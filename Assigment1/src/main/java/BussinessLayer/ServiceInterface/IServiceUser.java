package BussinessLayer.ServiceInterface;

import java.util.HashMap;
import java.util.List;

import BussinessLayer.entities.User;

public interface IServiceUser {
	public User add(User entity) throws Exception;
	public User delete(User entity) throws Exception;
	public User update(User entity) throws Exception;
	public User findById(int id) throws Exception;
	public List<User> selectAll() throws Exception;
	public User findByUsername(String username)throws Exception;
	public User login(String username,String password)throws Exception;
	public HashMap<String, String> listError(User entity,String passwd) throws Exception;
	public HashMap<String,String>checkError(String username,String password)throws Exception;
}
