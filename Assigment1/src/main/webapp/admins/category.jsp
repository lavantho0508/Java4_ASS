
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="BussinessLayer.ServiceDAL.*"%>
<%@page import="BussinessLayer.entities.*"%>
<%
if(session.getAttribute("admin")==null){
	response.sendRedirect("/Assigment1/user/404");
	return;
}
ServiceCategory sc=new ServiceCategory();
List<Category> list=sc.selectAll();
List<Category> rs=new ArrayList<>();
for(Category x:list){
	if(x.getTrangthai()==0){
		rs.add(x);
	}
}
request.setAttribute("list_categories", rs);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Manager</title>

<link rel="stylesheet" href="../../../css/bootstrap.min.css">
<script src="../../../js/jquery.min.js"></script>
<script src="../../../js/popper.min.js"></script>
<script src="../../../js/bootstrap.min.js"></script>

</head>
<body>
	<div class="container">
		<header>
			<img src="../../../images/bannerAdmin.png" alt="" width="100%">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
             
                  <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                  </button>
                  <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                      <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/Assigment1/admin/index/category/home">Home</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/Assigment1/admin/index/category/create">Thêm mới</a>
                      </li>
                      <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                          Tài khoản
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                          <li><a class="dropdown-item" href="#">Xin chào </a></li>
                          <li><a class="dropdown-item" href="#">Another action</a></li>
                          <li><hr class="dropdown-divider"></li>
                          <li><a class="dropdown-item" href="#">Something else here</a></li>
                        </ul>
                      </li>
                      
                    </ul>
                    <form class="d-flex">
                      <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                      <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                  </div>
                </div>
              </nav>

		</header>
        <article>
         <div class="text-danger">Danh sách thể loại </div>
            <table class="table">
                <thead>
                    <th>ID</th>
                    <th>Mã thể loại </th>
                    <th>Tên thể loại</th>
                    <th>Hành động</th>
                </thead>
                <tbody>
                    <c:forEach items="${list_categories}" var="item">
                   <tr>
                    <td class="id">${item.id}</td>
                    <td class="matheloai">${item.matheloai} </td>
                    <td class="tentheloai">${item.tentheloai}</td>
                    <td> <button class="btn btn-danger delete">Xóa</button>
                    <button type="button" name="update"class="btn btn-primary edit">Sửa</button>
                    </td>
                   </tr>
                  
                    </c:forEach>
                </tbody>
            </table>
        </article>
		<footer class="bd-footer py-5 mt-5 bg-dark text-light h2 text-center">
			Lã Văn Thọ </footer>
	</div>
	<div class="modal fade" id="edit" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<form action="/Assigment1/admin/index/category/update" method="get" class="edit-modal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="staticBackdropLabel">Cập nhật</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<label for="id">ID</label> <input class="form-control m-1"
							type="text" id="id" placeholder="" name="id" readonly=""> 
							<label class="form-label" for="tentheloai">Mã thể loại</label>
							<input type="text" name="matheloai" id="matheloai" class="form-control" readonly="readonly">
                        	<label class="form-label" for="tentheloai">Tên thể loại</label>
							<input type="text" name="tentheloai" id="tentheloai" class="form-control">
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Đóng</button>
						<button type="submit" class="btn btn-primary">Lưu</button>
					</div>
				</div>
			</div>
		</form>
	</div>
	<script>
	$(document).ready(function() {
		$(document).on("click",".edit",function (){
			  var $id = $(this).closest("tr").find(".id").text();
			  var $matheloai=$(this).closest("tr").find(".matheloai").text();
			  var $tentheloai=$(this).closest("tr").find(".tentheloai").text();
			  $(".edit-modal").find("#id").val($id);
			  $(".edit-modal").find("#matheloai").val($matheloai);
			  $(".edit-modal").find("#tentheloai").val($tentheloai);
			$("#edit").modal("show");
		})
	})
	$(document).ready(function (){
		$(document).on("click",".delete",function(){
			 var $id = $(this).closest("tr").find(".id").text();
			 var que=confirm("Bạn có muốn xóa không ?");
			 if(que){
				 document.location='/Assigment1/admin/index/category/delete?id='+$id;
			 }
		})
	})
	</script>
	

</body>
</html>