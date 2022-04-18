<%@page import="BussinessLayer.ServiceDAL.ServiceCategory"%>
<%@page import="BussinessLayer.entities.Category"%>
<%@page import="BussinessLayer.ServiceDAL.ServiceProduct"%>
<%@page import="java.util.ArrayList"%>
<%@page import="BussinessLayer.entities.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
if(session.getAttribute("admin")==null){
	response.sendRedirect("/Assigment1/user/404");
	return ;
}
ServiceProduct sp=new ServiceProduct();
ServiceCategory sc=new ServiceCategory();
List<Category>category=sc.selectAll();
List<Category>rs_list=new  ArrayList<>();
List<Product> list=sp.selectAll();
List<Product>rs=new  ArrayList<>();
for(Product x: list){
	if(x.getTrangthai()==0){
		rs.add(x);
	}
}
for(Category x: category){
	if(x.getTrangthai()==0){
		rs_list.add(x);
	}
}
request.setAttribute("list", rs);
request.setAttribute("category", rs_list);

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thêm mới</title>

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
                        <a class="nav-link active" aria-current="page" href="/Assigment1/admin/index/product/home">Home</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/Assigment1/admin/index/product/create">Thêm mới</a>
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
			<form action="/Assigment1/admin/index/product/create" method="post" enctype="multipart/form-data">
            <label for="matheloai" class="form-label">Thể loại</label>
            <select name="matheloai" id="matheloai" class="form-select">
            <c:forEach var="item" items="${category}">
            <option value="${item.matheloai }">${item.tentheloai}</option>
            </c:forEach>
            </select>
            <label for="masanpham">Mã sản phẩm</label>
               <input type="text" name="masanpham" id="masanpham" class="form-control">
               <label for="ten">Tên sản phẩm</label>
               <input type="text" name="ten" id="ten" class="form-control">
               <label for="soluong">Số lượng</label>
               <input type="number" name="soluong" id="soluong" class="form-control" step="1" min="1" max="500">
               <label for="dongia">Đơn giá</label>
               <input type="text" name="dongia" id="dongia" class="form-control">
               <label for="mausac">Màu sắc</label>
               <input type="text" name="mausac" id="mausac" class="form-control">
               <label for="id">Kích thước</label>
               <input type="text" name="kichthuoc" id="kichthuoc" class="form-control">
               <label for="images">Ảnh</label>
               <input type="file" name="images" id="images" class="form-control">
               <button class="btn btn-success mt-2" name="add" value="add">Thêm</button>
           </form>
		</article>
		<footer class="bd-footer py-5 mt-5 bg-dark text-light h2 text-center">
			Lã Văn Thọ </footer>
	</div>

</body>
</html>