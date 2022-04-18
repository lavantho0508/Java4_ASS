<%@page import="BussinessLayer.entities.Bill"%>
<%@page import="java.util.ArrayList"%>
<%@page import="BussinessLayer.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="BussinessLayer.ServiceDAL.ServiceProduct"%>
<%@page import="BussinessLayer.ServiceDAL.ServiceBill"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
ServiceBill sb=new ServiceBill();
ServiceProduct sp=new ServiceProduct();
List<Product>list=sp.selectAll();
List<Product>rs=new ArrayList<>();
for(Product x:list){
	if(x.getTrangthai()!=3)rs.add(x);
}
request.setAttribute("list", rs);
List<Bill>bill=sb.selectNotGroupBy(session.getAttribute("user").toString());
request.setAttribute("bill", bill);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="../css/bootstrap.min.css">
<script src="../js/jquery.min.js"></script>
<script src="../js/popper.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<style>
.product{
  display: flex;

a .disabled {
  pointer-events: none;
  cursor: default;
}

}

</style>
</head>
<body>
	  <div class="container">
		<header>
			<img src="../images/bannerweb.png" alt="" width="100%">
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
				<div class="container-fluid">
					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav me-auto mb-2 mb-lg-0">
							<li class="nav-item"><a class="nav-link active"
								aria-current="page" href="#">Trang chủ</a></li>
							<li class="nav-item"><a class="nav-link active" href="#">Giới
									thiệu</a></li>
							<li class="nav-item"><a class="nav-link active" href="#">Danh
									mục</a></li>
							<li class="nav-item dropdown  "><a
								class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
								role="button" data-bs-toggle="dropdown" aria-expanded="false">
									Tài khoản </a> <c:choose>
									<c:when test="${!empty user}">
										<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
											<li><a class="dropdown-item" href="#">Xin chào : <b>${user}</b></a></li>
											<li><a class="dropdown-item" href="/Assigment1/user/profile?id=${username.id}">Thông tin tài khỏan</a></li>
											<li><a class="dropdown-item show-cart" href="#">Giỏ hàng</a></li>
											<li><hr class="dropdown-divider"></li>
											<li><a class="dropdown-item"
												href="/Assigment1/user/logout">Đăng xuất</a></li>
										</ul>
									</c:when>
									<c:when test="${empty user }">
										<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
											<li><a class="dropdown-item" href="/Assigment1/user/login">Đăng nhập</a></li>
											<li><a class="dropdown-item" href="/Assigment1/user/create">Đăng ký</a></li>
										</ul>
									</c:when>
								</c:choose></li>
						</ul>
						<form class="d-flex">
							<input class="form-control me-2" type="search"
								placeholder="Search" aria-label="Search">
							<button class="btn btn-outline-success" type="submit">Search</button>
						</form>
					</div>
				</div>
			</nav>
		</header>
		<div class="row">
			<div class="col-9 product">
				<c:forEach items="${list}" var="item">
				<form action="/Assigment1/bill/buy" method="get">
				<div class="card m-2" style="width: 18rem;">
				
					<img src="/Assigment1/files/${item.images}" class="card-img-top" alt="..." height="150px">
					<div class="card-body">
					<input type="text" name="id" value="${item.id}" hidden="">
						<h5 class="card-title text-danger">${item.ten}</h5>
						<p class="card-text">Mô tả :<br>
						     - Kích thước : ${item.kichthuoc}<br>
						     - Số lượng :<input type="number" name="soluong" id="" max="${item.soluong}" step="1" min="0" value='0' /><br>
						     - Màu sắc : ${item.mausac}
						     <div style="color:red;"> <div style="color:black;">- Đơn giá :</div> <input type="text" name="dongia" value="${item.dongia}" rea></div>
						
						<button class="btn btn-primary" name="">Thêm vào giỏ hàng</button>
					</div>
				</div>
				</form>
				</c:forEach>


			</div>
			<div class="col-3">
				<div class="list-group mt-3">
					<a href="#" class="list-group-item list-group-item-action disabled h3 text-danger"
						aria-current="true"> Menu </a> <a href="#"
						class="list-group-item list-group-item-action">Sản phẩm phổ
						biến</a> <a href="#" class="list-group-item list-group-item-action">Đang
						hạ giá</a> <a href="#" class="list-group-item list-group-item-action">Hàng
						theo danh mục</a> <a href="#"
						class="list-group-item list-group-item-action">Sản phẩm hết
						hàng</a>
				</div>
			</div>
		</div>
		<footer class="bd-footer py-5 mt-5 bg-dark text-light h2 text-center">
			Lã Văn Thọ </footer>
	</div>  
	<div class="modal fade" id="cart" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="staticBackdropLabel">Cart</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
					<table class="table">
						<thead>
							<th>ID</th>
							<th>Mã</th>
							<th>Số lượng</th>
							<th>Đơn giá</th>
							<th>Trạng thái</th>
							<th>Hành động</th>
						</thead>
						<tbody>
							<c:forEach var="item" items="${bill}">
								<tr>
									<td class="id">${item.id}</td>
									<td class="masanpham">${item.product.masanpham}</td>
									<td class="soluong">${item.soluong}</td>
									<td class="dongia">${item.dongia}</td>
									<td class="trangthai">${item.trangthai=='0'?'Đã thanh toán':'Chưa thanh toán'}</td>
									<td><button class="btn btn-danger delete" type="button">Xóa</button></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>


				</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Đóng</button>
					</div>
				</div>
			</div>
	</div>
	<script>
		$(document).ready(function() {
			$(document).on('click', '.show-cart', function() {
				$("#cart").modal('show')
			})
		})
		$(document).ready(function(){
			$(document).on("click",".delete",function(){
				let a =confirm("bạn có muốn xóa hóa đơn này không");
			if(a){
			  var $id=$(this).closest("tr").find(".id").text();
			  document.location="/Assigment1/bill/delete?id="+$id;
			  $("#cart").modal('show')
			}
			
			})
		})
	</script>
	
</body>
</html>