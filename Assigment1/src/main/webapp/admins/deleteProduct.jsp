<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<%if(session.getAttribute("admin")==null){
	response.sendRedirect("/Assigment/user/404");
} %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="Assigment1/admin/index/product/delete" method="get">
<input type="text" name="id" value="">
</form>

</body>
</html>