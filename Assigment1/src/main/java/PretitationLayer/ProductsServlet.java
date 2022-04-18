package PretitationLayer;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.*;
import BussinessLayer.entities.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import BussinessLayer.ServiceDAL.*;
import BussinessLayer.Utils.SecurityUtil;
@MultipartConfig
@WebServlet({"/admin/index/product/home","/admin/index/product/create","/admin/index/product/update","/admin/index/product/delete"})
public class ProductsServlet extends HttpServlet {
	ServiceProduct sp;
	ServiceCategory sc;
	private static final long serialVersionUID = 1L;  
    public ProductsServlet() {
        super();
        sp=new ServiceProduct();
        sc=new ServiceCategory();
    }
 private synchronized void update(HttpServletRequest request, HttpServletResponse response) {
  if(request.getParameter("btn_add")!=null) {
	 try {
		
		  Product old=sp.findById(Long.parseLong(request.getParameter("id")));
		
			Product pr=new Product();
			BeanUtils.populate(pr, request.getParameterMap());
			pr.setCategory(old.getCategory());
			File dir = new File(request.getServletContext().getRealPath("/files"));
			if(!dir.exists()) {
				dir.mkdir();
			}
			Part photo=request.getPart("images");
			File photoFile=new File(dir,photo.getSubmittedFileName());
			photo.write(photoFile.getAbsolutePath());
			pr.setImages(photoFile.getName());
		    pr.setTrangthai(0);
			if(sp.update(pr)!=null) {
				request.getRequestDispatcher("/admins/product.jsp").forward(request, response);
			}
	} catch (Exception e) {
		e.printStackTrace();
		
	}
  }
	
	 
 }
 private synchronized void  create(HttpServletRequest request, HttpServletResponse response) {
	 try {
		Product pr=new Product();
		BeanUtils.populate(pr, request.getParameterMap());
		pr.setCategory(sc.findByProduct(request.getParameter("matheloai")));
		File dir = new File(request.getServletContext().getRealPath("/files"));
		if(!dir.exists()) {
			dir.mkdir();
		}
		Part photo=request.getPart("images");
		File photoFile=new File(dir,photo.getSubmittedFileName());
		photo.write(photoFile.getAbsolutePath());
		pr.setImages(photoFile.getName());
	    pr.setTrangthai(0);
	    if(sp.add(pr)!=null) {
	    	request.getRequestDispatcher("/admins/product.jsp").forward(request, response);
	    }
	} catch (Exception e) {
		e.printStackTrace();
	}
	
}
	private synchronized void delete(HttpServletRequest request, HttpServletResponse response) {
		try {
			long id=Long.parseLong(request.getParameter("id"));
			Product pr=sp.findById(id);
			pr.setTrangthai(3);
			if(sp.update(pr)!=null) {
				request.getRequestDispatcher("/admin/index/product/home").forward(request, response);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	protected  void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String uri=request.getRequestURI();
	request.setCharacterEncoding("utf-8");
	response.getCharacterEncoding();
	if(uri.contains("product/home")) {
		request.getRequestDispatcher("/admins/product.jsp").forward(request, response);
	}else if(uri.contains("product/update")) {
		request.getRequestDispatcher("/admins/product.jsp").forward(request, response);
	}
	else if(uri.contains("product/create")) {
		request.getRequestDispatcher("/admins/createProduct.jsp").forward(request, response);
		
	}else if(uri.contains("product/delete")) {
		delete(request, response);
	}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.getCharacterEncoding();
		String uri=request.getRequestURI();
		if(uri.contains("product/update")) {
			try {
				update(request, response);
			} catch (Exception e) {
				// TODO: handle exception
			}
		}else if(uri.contains("product/create")) {
			try {
				create(request, response);
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
	}

}
