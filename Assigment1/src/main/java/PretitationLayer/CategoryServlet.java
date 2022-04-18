package PretitationLayer;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import BussinessLayer.ServiceDAL.ServiceCategory;
import BussinessLayer.entities.Category;
import BussinessLayer.entities.User;

@WebServlet({"/admin/index/category/home","/admin/index/category/create","/admin/index/category/update","/admin/index/category/delete"})
public class CategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       ServiceCategory sc;
   
    public CategoryServlet() {
        super();
        sc=new ServiceCategory();
   
    }
    private synchronized void update(HttpServletRequest request, HttpServletResponse response)throws Exception{
    	String uid=request.getParameter("id");
    	Category oldC=sc.findById(Long.parseLong(uid));
    	Category c=new Category();
    	BeanUtils.populate(c, request.getParameterMap());
    	c.setTrangthai(0);
    	c.setUser(oldC.getUser());
    	if(sc.update(c)!=null) {
    		request.getRequestDispatcher("/admin/index/category/home").forward(request, response);
    	}
    }
    private synchronized void create(HttpServletRequest request, HttpServletResponse response)throws Exception{
    if(request.getParameter("btn_add")!=null) {
    	HttpSession session=request.getSession();
    	User u=(User)session.getAttribute("admin");
    	Category c =new Category();
    	BeanUtils.populate(c, request.getParameterMap());
    	c.setTrangthai(0);
    	c.setUser(u);
    	if(sc.add(c)!=null) {
    		request.getRequestDispatcher("/admins/category.jsp").forward(request, response);
    	}
    }
    	
    }
    private synchronized void delete(HttpServletRequest request, HttpServletResponse response) throws Exception{
    	String uid=request.getParameter("id");
    
    	long id=Long.parseLong(uid);
        Category c=sc.findById(id);
        c.setTrangthai(1);
        
        if(sc.update(c)!=null) {
        	request.getRequestDispatcher("/admin/index/category/home").forward(request, response);
        }
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.getCharacterEncoding();
		String uri=request.getRequestURI();
		
		if(uri.contains("category/home")){
			request.getRequestDispatcher("/admins/category.jsp").forward(request, response);
		}
		else if(uri.contains("category/create")) {
			request.getRequestDispatcher("/admins/createCategory.jsp").forward(request, response);
		}else if(uri.contains("category/delete")) {
			try {
				delete(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(uri.contains("category/update")) {
			try {
				update(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.getCharacterEncoding();
		String uri=request.getRequestURI();
		if(uri.contains("category/create")) {
		 try {
				
			    create(request, response);
			//    request.getRequestDispatcher("/admins/category.jsp").forward(request, response);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
	}

}
