<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
if( session.getAttribute("admin")!=null){
	session.removeAttribute("admin");
	response.sendRedirect("/Assigment1/user/login");
}
else if(session.getAttribute("user")!=null){
	session.removeAttribute("user");
	response.sendRedirect("/Assigment1/user/login");
}

%>