<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
</head>
<body>
<div class="container-xl px-4 mt-4">
    <!-- Account page navigation-->
    <nav class="nav nav-borders">
        <a class="nav-link active ms-0" href="https://www.bootdey.com/snippets/view/bs5-edit-profile-account-details" target="__blank">Profile</a>
        <a class="nav-link" href="https://www.bootdey.com/snippets/view/bs5-profile-billing-page" target="__blank">Billing</a>
        <a class="nav-link" href="https://www.bootdey.com/snippets/view/bs5-profile-security-page" target="__blank">Security</a>
        <a class="nav-link" href="https://www.bootdey.com/snippets/view/bs5-edit-notifications-page"  target="__blank">Notifications</a>
    </nav>
    <hr class="mt-0 mb-4">
    <div class="row">
        <div class="col-xl-4">
            <!-- Profile picture card-->
            <div class="card mb-4 mb-xl-0">
                <div class="card-header">Profile Picture</div>
                <div class="card-body text-center">
                    <!-- Profile picture image-->
                   
                    <c:choose>
                    <c:when test="${!empty username.avarta }">
                      <img class="img-account-profile rounded-circle mb-2" src="/Assigment1/files/${username.avarta}" alt="" width="60%">
                    </c:when>
                    <c:when test="${!empty photo}">
                    <img class="img-account-profile rounded-circle mb-2" src="/Assigment1/files/${photo}" alt="" width="60%">
                    </c:when>
                    </c:choose>
                    <!-- Profile picture help block-->
                    <div class="small font-italic text-muted mb-4">JPG or PNG no larger than 5 MB</div>
                    <!-- Profile picture upload button-->
                    <form action="" method="POST" enctype="multipart/form-data">
                     
                    </form>
                   
                </div>
            </div>
        </div>
        <div class="col-xl-8">
            <!-- Account details card-->
            <div class="card mb-4">
                <div class="card-header">Account Details</div>
                <div class="card-body">
                    <form action="/Assigment1/user/profile?id=${username.id}" method="post" enctype="multipart/form-data" >
                        <div class="mb-3">
                    
                      <label for="formFile" class="form-label">Avarta</label>
                      <input class="form-control" type="file" id="formFile" name="avarta" value="${username.avarta}">
                    </div>
                        <div class="mb-3">
                          <label class="small mb-1" for="id">ID</label>
                          <input name="id" class="form-control" id="id" type="text" value="${username.id}" readonly="">
                      </div>
                        <div class="mb-3">
                            <label class="small mb-1" for="inputUsername">Username</label>
                            <input name="username" class="form-control" id="inputUsername" type="text" placeholder="Enter your username" value="${username.username}" readonly>
                        </div>
                        <!-- Form Row-->
                        <div class="row gx-3 mb-3">
                            <!-- Form Group (first name)-->
                            <div class="col-md-6">
                                <label class="small mb-1" for="sdt">SDT</label>
                                <input name="sdt" class="form-control" id="sdt" placeholder="Enter phone number" type="text" value="${username.sdt}">
                            </div>
                            <!-- Form Group (last name)-->
                            <div class="col-md-6">
                                <label class="small mb-1" for="diachi">Địa chỉ</label>
                                <input name="diachi" class="form-control" id="diachi" placeholder="Enter address" type="text" value="${username.diachi}">
                            </div>
                        </div>
                        <!-- Form Row        -->
                        <div class="row gx-3 mb-3">
                            <!-- Form Group (organization name)-->
                            <div class="col-md-6">
                                <label class="small mb-1" for="inputOrgName">Email</label>
                                <input name="email" class="form-control" id="inputOrgName" placeholder="Enter email" type="email" value="${username.email}">
                            </div>
                            <!-- Form Group (location)-->
                            <div class="col-md-6">
                              
                            </div>
                        </div>
                       
                        <!-- Save changes button-->
                        <button class="btn btn-primary" type="submit" name="save" value="save">Save</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
	<script src="../js/jquery.min.js"></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
</body>
</html>