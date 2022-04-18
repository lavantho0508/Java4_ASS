<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		 <div class="row">
           <div class="col-3"></div>
           <div class="col-6"> 
               <form action="/Assigment1/admin/index" method="post">
                <div class="card">
                    <div class="card-header">
                      Featured
                    </div>
                    <ul class="list-group list-group-flush">
                      <li class="list-group-item">
                           <label for="username" class="form-label">
                            Username
                        </label>
                       </li>
                     
                      <li class="list-group-item">
                        <input type="text" class="form-control" name="username" value="${username}" id="username" required placeholder="username">
                      </li>
                       <c:choose>
                      <c:when test="${!empty username_null}">
                      <jsp:include page="/alert/alertDanger.jsp">
                      <jsp:param value="${username_null}" name="message"/>
                      </jsp:include>
                      </c:when>
                       <c:when test="${!empty username_exist}">
                      <jsp:include page="/alert/alertDanger.jsp">
                      <jsp:param value="${username_exist}" name="message"/>
                      </jsp:include>
                      </c:when>
                      
                      </c:choose>
                      <li class="list-group-item"> <label for="password" class="form-label">
                        Password
                    </label>
                   </li>
                   <li class="list-group-item">
                    <input type="password" class="form-control" name="password" value="${username}" id="password" required placeholder="*******">
                    
               </li>
               <c:choose>
                      <c:when test="${!empty passwd_null}">
                      <jsp:include page="/alert/alertDanger.jsp">
                      <jsp:param value="${passwd_null}" name="message"/>
                      </jsp:include>
                      </c:when>
                       <c:when test="${!empty passwd_length}">
                      <jsp:include page="/alert/alertDanger.jsp">
                      <jsp:param value="${passwd_length}" name="message"/>
                      </jsp:include>
                      </c:when>
                        <c:when test="${!empty account_exist}">
                      <jsp:include page="/alert/alertDanger.jsp">
                      <jsp:param value="${account_exist}" name="message"/>
                      </jsp:include>
                      </c:when>
                       <c:when test="${!empty account_notative}">
                      <jsp:include page="/alert/alertDanger.jsp">
                      <jsp:param value="${account_notative}" name="message"/>
                      </jsp:include>
                      </c:when>
                    </c:choose>
                    </ul>
                  </div>
                  <!--  -->      
              
                <button class="btn btn-success mt-2" name="login" value="login">Đăng nhập</button><br>
                <p class="text-dark">Chưa có tài khoản <a href="/Assigment1/user/create" class="text-danger text-decoration-none">Đăng ký ngay ?</a></p>
        </form></div>
	</div>
	<script src="../js/jquery.min.js"></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
</body>
</html>