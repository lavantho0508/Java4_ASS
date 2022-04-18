<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="BussinessLayer.entities.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="BussinessLayer.ServiceDAL.*"%>
<%
if(session.getAttribute("admin")==null){
	response.sendRedirect("/Assigment1/user/404");
	return;
}
SimpleDateFormat fm=new SimpleDateFormat("mm/dd/yyyy");
ServiceUser su=new ServiceUser();
List<User>list_admin=su.selectAll();
List<User>list_user=new ArrayList<>();
for(User x:list_admin){
	if(x.getTrangthai()!=0){
		list_user.add(x);
	}
}
request.setAttribute("user",list_user);
request.setAttribute("date", new Date());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Manager</title>

<link rel="stylesheet" href="../css/bootstrap.min.css">
<script src="../js/jquery.min.js"></script>
<script src="../js/popper.min.js"></script>
<script src="../js/bootstrap.min.js"></script>

</head>
<body>
	<div class="container">
		<header>
			<img src="../images/bannerAdmin.png" alt="" width="100%">
			<div class="row">
				<div class="col-10">
					<ul class="nav nav-tabs" id="myTab" role="tablist">
						<li class="nav-item" role="presentation">
							<button class="nav-link active" id="home-tab"
								data-bs-toggle="tab" data-bs-target="#home" type="button"
								role="tab" aria-controls="home" aria-selected="true">Danh
								sách nhân viên</button>
						</li>
						<li class="nav-item" role="presentation">
							<button class="nav-link" id="profile-tab" data-bs-toggle="tab"
								data-bs-target="#profile" type="button" role="tab"
								aria-controls="profile" aria-selected="false">Quản lý nhân viên</button>
						</li>
						<li class="nav-item" role="presentation">
							<button class="nav-link" id="donhang-tab" data-bs-toggle="tab"
								data-bs-target="#donhang" type="button" role="tab"
								aria-controls="donhang" aria-selected="false">Đơn hàng</button>
						</li>
					</ul>
				</div>
				<div class="col-2">
					<a class="nav-link dropdown-toggle " href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
						Tài khoản </a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
						<li><p class="dropdown-item">
								xin chào <b>${username.username}</b>
							</p></li>
						<li><a class="dropdown-item" href="/Assigment1/user/profile?id=${username.id}">Thông tin tài khoản</a></li>
                        <li><a class="dropdown-item" href="/Assigment1/admin/index/category/home">Quản lý thể loại</a></li>
                        <li><a class="dropdown-item" href="/Assigment1/admin/index/product/home">Quản lý Sản phẩm</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="/Assigment1/user/logout">Đăng
								xuất</a></li>
					</ul>

				</div>
			</div>
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="home" role="tabpanel"
					aria-labelledby="home-tab">
					<!-- code -->
					<label for="" class="h3 text-danger mt-4">Danh sách nhân
						viên</label>
					<table class="table">
						<thead>
							<th>ID</th>
							<th>Tài khoản</th>
							<th>Số điện thoại</th>
							<th>Địa chỉ</th>
							<th>Email</th>
							<th>Trạng thái</th>
							<th>Xóa</th>
						</thead>
						<tbody>
							<c:forEach items="${user}" var="item">
								<tr>
									<td class="id">${item.id}</td>
									<td class="username">${item.username}</td>							
									<td class="sdt">${item.sdt }</td>
									<td class="diachi">${item.diachi }</td>
									<td class="email">${item.email }</td>
									<td class="trangthai">${item.trangthai==1?'Đang hoạt động':'Chưa được kích hoạt'}</td>
									<th><a href="/Assigment1/user/delete?id=${item.id}"
										class="btn btn-danger">Xóa</a></th>
									<th>
                 						<button type="button" name="update"
												class="btn btn-primary edit">Sửa</button>

									</th>
								</tr>
							</c:forEach>
						</tbody>
					</table>

				</div>
				<div class="tab-pane fade" id="profile" role="tabpanel"
					aria-labelledby="profile-tab">
					<form action="/Assigment1/admin/index" method="post">
						<div class="card">
							<div class="card-header">Featured</div>
							<ul class="list-group list-group-flush">
								<li class="list-group-item"><label for="username"
									class="form-label"> Username </label></li>
								<li class="list-group-item"><input type="text"
									name="username" id="username" class="form-control"></li>
								<c:choose>
									<c:when test="${!empty username_space }">
										<li class="list-group-item"><small class="text-danger">${username_space}</small></li>
									</c:when>
									<c:when test="${!empty username_length }">
										<li class="list-group-item"><small class="text-danger">${username_length}</small></li>
									</c:when>
									<c:when test="${!empty username_invalid }">
										<li class="list-group-item"><small class="text-danger">${username_invalid}</small></li>
									</c:when>
									<c:when test="${!empty username_exist }">
										<li class="list-group-item"><small class="text-danger">${username_exist}</small></li>
									</c:when>
									<c:when test="${!empty username_overflow }">
										<li class="list-group-item"><small class="text-danger">${username_overflow}</small></li>
									</c:when>
								</c:choose>
								<li class="list-group-item"><label for="username"
									class="form-label"> Password </label></li>
								<li class="list-group-item"><input type="password"
									name="password" id="password" class="form-control"></li>
								<c:choose>
									<c:when test="${!empty password_space }">
										<li class="list-group-item"><small class="text-danger">${password_space}</small></li>
									</c:when>
									<c:when test="${!empty password_length }">
										<li class="list-group-item"><small class="text-danger">${password_length}</small></li>
									</c:when>
									<c:when test="${!empty password_invalid }">
										<li class="list-group-item"><small class="text-danger">${password_invalid}</small></li>
									</c:when>
								</c:choose>
								<li class="list-group-item"><label for="sdt"
									class="form-label"> Điện thoại </label></li>
								<li class="list-group-item"><input type="text" name="sdt"
									id="sdt" class="form-control"></li>
								<li class="list-group-item"><label for="diachi"
									class="form-label"> Địa chỉ </label></li>
								<li class="list-group-item"><input type="text"
									name="diachi" id="diachi" class="form-control"></li>
								<c:choose>
									<c:when test="${!empty diachi_invalid }">
										<li class="list-group-item"><small class="text-danger">${diachi_invalid}</small></li>
									</c:when>
								</c:choose>
								<li class="list-group-item"><label for="email"
									class="form-label"> Email </label></li>
								<li class="list-group-item"><input type="email"
									name="email" id="email" class="form-control"></li>
								<c:choose>
									<c:when test="${!empty email_space }">
										<li class="list-group-item"><small class="text-danger">${email_space}</small></li>
									</c:when>
									<c:when test="${!empty email_length }">
										<li class="list-group-item"><small class="text-danger">${email_length}</small></li>
									</c:when>
									<c:when test="${!empty email_invalid }">
										<li class="list-group-item"><small class="text-danger">${email_invalid}</small></li>
									</c:when>
								</c:choose>
								<li class="list-group-item"><label for="trangthai"
									class="form-label">Trạng thái</label></li>
								<li class="list-group-item">
								<select name="trangthai"
									id="trangthai" class="form-select">
										<option value="" disabled selected>Mời bạn chọn trạng
											thái</option>
										<option value="1">Đã được kích hoat</option>
										<option value="2">Chưa được kích hoạt</option>
								</select></li>
							</ul>
						</div>
						<c:choose>
							<c:when test="${!empty sessionScope.message }">
								<li class="list-group-item">
									<div class="alert alert-success">${sessionScope.message}
									</div> <c:remove var="message" scope="session" />
								</li>
							</c:when>
							<c:when test="${!empty sessionScope.error }">
								<li class="list-group-item">
									<div class="alert alert-danger">${sessionScope.error}</div> <c:remove
										var="error" scope="session" />
								</li>
							</c:when>
						</c:choose>
						<button class="btn btn-success mt-4" name="btn_add" value="add">Thêm
							mới</button>

					</form>

				</div>
				<div class="tab-pane fade" id="donhang" role="tabpanel"
					aria-labelledby="donhang-tab">
					<!-- Code -->
					</div>
			</div>


		</header>
		<footer class="bd-footer py-5 mt-5 bg-dark text-light h2 text-center">
			Lã Văn Thọ </footer>
	</div>
	<!-- Button trigger modal -->
	<div class="modal fade" id="edit" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<form action="/Assigment1/admin/update" method="get">
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
							<label for="username">Username</label>
						<input class="form-control m-1" type="text" id="username"
							placeholder="" name="username" value="" readonly="readonly"> <label
							for="sdt">Số điện thoại</label> <input type="text" id="sdt"
							name="sdt" class="form-control m-1" required value=""> <label
							for="diachi">Địa chỉ</label> <input type="text" id="diachi"
							name="diachi" class="form-control m-1" required value="">
						<label for="email">Email</label> <input type="email" id="email"
							name="email" class="form-control m-1" required
							placeholder="example@email.com" value=""> <label
							for="trangthai">Trạng thái</label> <select name="trangthai"
							id="trangthai" class="form-select">
							<option value="1">Đang hoạt động</option>
							<option value="2">Chưa được kích hoạt</option>
						</select>


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

		<script type="text/javascript">
		$(document).ready(function(){
			  $(document).on("click",".edit",function(){
			   
			    var $id = $(this).closest("tr").find(".id").text();   
			    var $username = $(this).closest("tr").find(".username").text(); 
			    var $sdt = $(this).closest("tr").find(".sdt").text(); 
			    var $diachi = $(this).closest("tr").find(".diachi").text(); 
			    var $email = $(this).closest("tr").find(".email").text(); 
			    var $trangthai = $(this).closest("tr").find(".trangthai").text()=="Đang hoạt động"?"1":"2"; 
			    $('form').find("#id").val($id);
			    $('form').find("#username").val($username);
			    $('form').find("#sdt").val($sdt);
			    $('form').find("#diachi").val($diachi);
			    $('form').find("#email").val($email);
			    $('form').find("#trangthai").val($trangthai);
			    $('#edit').modal('show');
			  })
			})
		</script>			
</body>
</html>