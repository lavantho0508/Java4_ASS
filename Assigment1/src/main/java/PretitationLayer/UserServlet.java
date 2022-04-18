package PretitationLayer;

import java.io.IOException;

import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;


import BussinessLayer.ServiceDAL.ServiceUser;
import BussinessLayer.Utils.HashUtil;
import BussinessLayer.entities.User;

@WebServlet({
	"/user/login",
	"/admin/index",
	"/admin/create", 
	"/user/delete", 
	"/admin/update",
	"/user/create",
	"/user/index",
	"/user/logout",
	"/user/404"})

public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ServiceUser su;

	public UserServlet() {
		super();
		su = new ServiceUser();


	}

	private synchronized void login(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String btn_login = request.getParameter("login");
		if (btn_login != null) {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			HashMap<String, String> list_error = su.checkError(username, password);
			if (list_error.isEmpty()) {
				if (su.findByUsername(username).getTrangthai() == 0) {// trang thai =0 la admin
					HttpSession session = request.getSession();
					session.setAttribute("admin", su.findByUsername(username));
					request.setAttribute("username", su.findByUsername(username));
					request.getRequestDispatcher("/admins/index.jsp").forward(request, response);
        
				} else {
					HttpSession session = request.getSession();					
					session.setAttribute("user", username);
					request.setAttribute("user", username);
					request.setAttribute("username", su.findByUsername(username));
					request.getRequestDispatcher("/container/index.jsp").forward(request, response);
				}
			} else {
				for (Map.Entry<String, String> x : list_error.entrySet()) {
					request.setAttribute(x.getKey(), x.getValue());
				}
				request.getRequestDispatcher("/container/login.jsp").forward(request, response);
			}
		}

	}
	private synchronized void delete(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String uid=request.getParameter("id");
		int id=Integer.parseInt(uid);
		User u=su.findById(id);
		if (su.delete(u)!=null) {
			request.getRequestDispatcher("/admins/index.jsp").forward(request, response);
		}

		
	}
private synchronized void create(HttpServletRequest request, HttpServletResponse response)
			throws IllegalAccessException, InvocationTargetException {	
	      HttpSession session=request.getSession();
		String btn_add = request.getParameter("btn_add");	
		if (btn_add != null) {
			User u=new User();
			BeanUtils.populate(u,request.getParameterMap());
			String passwd=u.getPassword();
			u.setPassword(HashUtil.MD5(u.getPassword()));
			try {
				if (su.listError(u,passwd).isEmpty()) {				
					if (su.add(u) != null) {
						session.setAttribute("message", "thêm mới thành công");						
						request.getRequestDispatcher("/admins/index.jsp").forward(request, response);
						
					}
				} else {
					for (Map.Entry<String, String> x : su.listError(u,passwd).entrySet()) {
						request.setAttribute(x.getKey(), x.getValue());
					}
					
					session.setAttribute("error", "thêm mới Thất bại");
					request.getRequestDispatcher("/admins/index.jsp").forward(request, response);
				
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
public synchronized void createUser(HttpServletRequest request,HttpServletResponse response) throws IllegalAccessException, InvocationTargetException {
	User u=new User();
	BeanUtils.populate(u,request.getParameterMap());
	String passwd=u.getPassword();
   u.setTrangthai(1);
	
	try {
		if (su.listError(u,passwd).isEmpty()) {				
			if (su.add(u) != null) {
				request.getRequestDispatcher("/container/login.jsp").forward(request, response);
			}
		} else {
			for (Map.Entry<String, String> x : su.listError(u,passwd).entrySet()) {
				request.setAttribute(x.getKey(), x.getValue());
			}
			request.getRequestDispatcher("/container/create.jsp").forward(request, response);
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
}
private synchronized void adminUpdate(HttpServletRequest request,HttpServletResponse response) throws Exception {
  User u=new User();
  BeanUtils.populate(u, request.getParameterMap());
  User oldpass=su.findById(u.getId());
  u.setPassword(oldpass.getPassword());
  if(su.update(u)!=null) {
	  request.getRequestDispatcher("index").forward(request, response);
  }
 
}
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.getCharacterEncoding();
		String uri = request.getRequestURI();	
	
		if(uri.contains("login")) {
			request.getRequestDispatcher("/container/login.jsp").forward(request, response);
			
		}
		else if(uri.contains("admin/index")) {
			try {
				login(request, response);
				create(request, response);
				request.getRequestDispatcher("/admins/index.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		else if(uri.contains("delete")) {
			try {
				delete(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(uri.contains("user/create")) {
			request.getRequestDispatcher("/container/create.jsp").forward(request, response);
			
		}else if(uri.contains("user/index")) {
			request.getRequestDispatcher("/container/index.jsp").forward(request, response);
		}else if(uri.contains("logout")) {
			request.getRequestDispatcher("/container/logout.jsp").forward(request, response);
		}else if(uri.contains("404")) {
			request.getRequestDispatcher("/alert/404.jsp").forward(request, response);
		}else if(uri.contains("admin/update")) {
			try {
				adminUpdate(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.getCharacterEncoding();
		String uri = request.getRequestURI();
		try {	
			if(uri.contains("login")) {
				login(request, response);
			}
			else if(uri.contains("/admin/index")) {	
				login(request, response);
				create(request, response);				
			}else if(uri.contains("/user/delete")) {
				try {
					delete(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else if(uri.contains("user/create")) {
				createUser(request, response);			
			}else if(uri.contains("admin/update")) {
				
			}			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
