package PretitationLayer;

import java.io.File;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.nio.file.Files;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import BussinessLayer.ServiceDAL.ServiceUser;
import BussinessLayer.Utils.SecurityUtil;
import BussinessLayer.entities.User;

@MultipartConfig
@WebServlet("/user/profile")
public class uploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ServiceUser su;
   
    public uploadServlet() {
        super();
        su=new ServiceUser();
      
    }

	private synchronized void profile(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String uid=request.getParameter("id");
		int id=Integer.parseInt(uid);
		User uold=su.findById(id);
		request.setAttribute("username", uold);

	}
	private synchronized void update(HttpServletRequest request,HttpServletResponse response) throws Exception {
		String uid=request.getParameter("id");
		int id=Integer.parseInt(uid);
		User uold=su.findById(id);
		User u=new User();
		BeanUtils.populate(u, request.getParameterMap());
		u.setPassword(uold.getPassword());
		u.setTrangthai(uold.getTrangthai());
		File dir = new File(request.getServletContext().getRealPath("/files"));
		if(!dir.exists()) {
			dir.mkdir();
		}
		Part photo=request.getPart("avarta");
		File photoFile=new File(dir,photo.getSubmittedFileName());
		photo.write(photoFile.getAbsolutePath());
		u.setAvarta(photoFile.getName());
		request.setAttribute("photo", photoFile.getName());
		if(su.update(u)!=null) {
			
			request.getRequestDispatcher("/container/profile.jsp").forward(request, response);
		}
		
	}
	protected synchronized void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			profile(request, response);
			request.getRequestDispatcher("/container/profile.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("save")!=null) {
			try {
				update(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}

}
