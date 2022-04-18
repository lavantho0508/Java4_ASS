<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
if(session.getAttribute("admin")==null){
	response.sendRedirect("/Assigment1/user/404");
	return;
}%>
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
           <form action="" method="post">
               <label class="form-label" for="matheloai">Mã thể loại</label>
               <input class="form-control" type="text" name="matheloai" id="matheloai">
               <label class="form-label" for="matheloai">Tên thể loại</label>
               <input class="form-control" type="text" name="tentheloai" id="tentheloai">          
               <button class="btn btn-success mt-2" name="btn_add">Thêm mới</button>
           </form>
        </article>
		<footer class="bd-footer py-5 mt-5 bg-dark text-light h2 text-center">
			Lã Văn Thọ </footer>
	</div>
	
</body>
</html>