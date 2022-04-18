package PretitationLayer;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import BussinessLayer.ServiceDAL.ServiceBill;
import BussinessLayer.ServiceDAL.ServiceProduct;
import BussinessLayer.ServiceDAL.ServiceUser;
import BussinessLayer.entities.Bill;
import BussinessLayer.entities.Product;
import BussinessLayer.entities.User;

/**
 * Servlet implementation class BillServlet
 */
@WebServlet({"/bill/buy","/bill/delete","/bill/update"})
public class BillServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ServiceProduct sp;
	ServiceUser su;
	ServiceBill sb;
       
    public BillServlet() {
        super();
        sp=new  ServiceProduct();
        su=new ServiceUser();
        sb=new ServiceBill();
    }
    
    private synchronized void delete(HttpServletRequest request, HttpServletResponse response) {
        Long id =Long.parseLong(request.getParameter("id"));
         try {
			Bill b=sb.findById(id);
			if(sb.delete(b)!=null) {
				request.getRequestDispatcher("/container/index.jsp").forward(request, response);	
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
         
    }
    
    private synchronized void buy(HttpServletRequest request, HttpServletResponse response){
    	HttpSession session=request.getSession();
        Long id =Long.parseLong(request.getParameter("id"));
    	try {
			Product pr=sp.findById(id);
			User u=su.findByUsername(String.valueOf(session.getAttribute(("user"))));
			Bill bill=new Bill();
			BeanUtils.populate(bill, request.getParameterMap());
			bill.setUser(u);
			bill.setProduct(pr);
			bill.setTrangthai(1);
			if(sb.add(bill)!=null) {
				pr.setSoluong(pr.getSoluong()-bill.getSoluong());
				if(sp.update(pr)!=null) {
					request.getRequestDispatcher("/container/index.jsp").forward(request, response);	
				}
				
			}
			
			
		} catch (Exception e) {

			e.printStackTrace();
		}
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		String uri=request.getRequestURI();		
		if(uri.contains("bill/buy")) {
			buy(request, response);
		}else if(uri.contains("bill/delete")) {
			delete(request, response);
		}
	}	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
