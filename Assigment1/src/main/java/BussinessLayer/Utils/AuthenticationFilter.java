package BussinessLayer.Utils;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import BussinessLayer.entities.User;


@WebFilter(
		urlPatterns = {"/user/index","/admin/*"}
		)
public class AuthenticationFilter extends HttpFilter implements Filter {

    public AuthenticationFilter() {
       
       
    }


	public void destroy() {

	}


	public void doFilter(ServletRequest request,
			ServletResponse response, 
			FilterChain chain
			) throws IOException, ServletException {
        HttpServletRequest req=(HttpServletRequest)request;
        HttpServletResponse res=(HttpServletResponse)response;
        HttpSession session=req.getSession();
     //   String user=(String) session.getAttribute("admin");
//        if(user==null) {
//        	res.sendRedirect("/Assigment/user/login");
//        	return;
//        }
		chain.doFilter(request, response);
	}

	
	public void init(FilterConfig fConfig) throws ServletException {
		
	}

}
