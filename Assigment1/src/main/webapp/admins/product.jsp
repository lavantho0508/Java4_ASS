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
}
ServiceProduct sp=new ServiceProduct();
List<Product> list=sp.selectAll();
List<Product>rs=new  ArrayList<>();
for(Product x: list){
	if(x.getTrangthai()!=3){
		rs.add(x);
	}
}
request.setAttribute("list", rs);

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
			<table class="table">
				<thead>
					<th>ID</th>
					<th>Mã sản phẩm</th>
					<th>Tên sản phẩm</th>
					<th>Số lượng</th>
					<th>Đơn giá</th>
					<th>Màu sắc</th>
					<th>Kích thước</th>
					<th>Ảnh</th>
					<th>Hành động</th>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="item">
						<tr>
							<td class="id">${item.id}</td>
							<td class="masanpham">${item.masanpham}</td>
							<td class="ten">${item.ten}</td>
							<td class="soluong">${item.soluong}</td>
							<td class="dongia">${item.dongia}</td>
							<td class="mausac">${item.mausac}</td>
							<td class="kichthuoc">${item.kichthuoc}</td>
							<td class="images">
							<img src="/Assigment1/files/${item.images}" alt="Loading ..." width="100px">
							</td>
							<td><a href="/Assigment1/admin/index/product/delete?id=${item.id}" class="btn btn-danger">Xóa</a>
							   <button class="btn btn-primary edit">Sửa</button>
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
		<form action="/Assigment1/admin/index/product/update" method="post" class="edit-modal" enctype="multipart/form-data">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="staticBackdropLabel">Cập nhật</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
		  <label for="id">Id</label>
          <input type="text" name="id" id="id" class="form-control" readonly="readonly">
          <label for="masanpham">Mã sản phẩm</label>
          <input type="text" name="masanpham" id="masanpham" class="form-control" readonly="readonly">
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
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Đóng</button>
						<button class="btn btn-primary" name="btn_add" value="add">Lưu</button>
					</div>
				</div>
			</div>
		</form>
	</div>
	<script type="text/javascript">
	$(document).ready(function () {
		$(document).on("click",".edit",function (){
			  var $id = $(this).closest("tr").find(".id").text(); 
			  var $masanpham = $(this).closest("tr").find(".masanpham").text(); 
			  var $ten = $(this).closest("tr").find(".ten").text(); 
			  var $soluong = $(this).closest("tr").find(".soluong").text(); 
			  var $dongia = $(this).closest("tr").find(".dongia").text(); 
			  var $mausac = $(this).closest("tr").find(".mausac").text(); 
			  var $kichthuoc = $(this).closest("tr").find(".kichthuoc").text(); 
			//  var $images = $(this).closest("tr").find(".images").text(); 
			  $(".edit-modal").find("#id").val($id);
			  $(".edit-modal").find("#masanpham").val($masanpham);
			  $(".edit-modal").find("#ten").val($ten);
			  $(".edit-modal").find("#soluong").val($soluong);
			  $(".edit-modal").find("#dongia").val($dongia);
			  $(".edit-modal").find("#mausac").val($mausac);
			  $(".edit-modal").find("#kichthuoc").val($kichthuoc);
			//  $(".edit-modal").find("#images").val($id);
			$("#edit").modal('show');
		})
		
	})
	</script>
</body>
</html>