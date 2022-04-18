<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    
    <style>
        body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, 
pre, form, fieldset, input, textarea, p, blockquote, th, td { 
  padding:0;
  margin:0;}

fieldset, img {border:0}

ol, ul, li {list-style:none}

:focus {outline:none}

body,
input,
textarea,
select {
  font-family: 'Open Sans', sans-serif;
  font-size: 16px;
  color: #4c4c4c;
}

p {
  font-size: 12px;
  width: 150px;
  display: inline-block;
  margin-left: 18px;
}
h1 {
  font-size: 32px;
  font-weight: 300;
  color: #4c4c4c;
  text-align: center;
  padding-top: 10px;
  margin-bottom: 10px;
}

html{
  background-color: #ffffff;
}

.testbox {
  margin: 20px auto;
  width: 343px; 
  -webkit-border-radius: 8px/7px; 
  -moz-border-radius: 8px/7px; 
  border-radius: 8px/7px; 
  background-color: #ebebeb; 
  -webkit-box-shadow: 1px 2px 5px rgba(0,0,0,.31); 
  -moz-box-shadow: 1px 2px 5px rgba(0,0,0,.31); 
  box-shadow: 1px 2px 5px rgba(0,0,0,.31); 
  border: solid 1px #cbc9c9;
}

input[type=radio] {
  visibility: hidden;
}

form{
  margin: 0 30px;
}

label.radio {
	cursor: pointer;
  text-indent: 35px;
  overflow: visible;
  display: inline-block;
  position: relative;
  margin-bottom: 15px;
}

label.radio:before {
  background: #3a57af;
  content:'';
  position: absolute;
  top:2px;
  left: 0;
  width: 20px;
  height: 20px;
  border-radius: 100%;
}

label.radio:after {
	opacity: 0;
	content: '';
	position: absolute;
	width: 0.5em;
	height: 0.25em;
	background: transparent;
	top: 7.5px;
	left: 4.5px;
	border: 3px solid #ffffff;
	border-top: none;
	border-right: none;

	-webkit-transform: rotate(-45deg);
	-moz-transform: rotate(-45deg);
	-o-transform: rotate(-45deg);
	-ms-transform: rotate(-45deg);
	transform: rotate(-45deg);
}

input[type=radio]:checked + label:after {
	opacity: 1;
}

hr{
  color: #a9a9a9;
  opacity: 0.3;
}

input[type=text],input[type=password]{
  width: 200px; 
  height: 39px; 
  -webkit-border-radius: 0px 4px 4px 0px/5px 5px 4px 4px; 
  -moz-border-radius: 0px 4px 4px 0px/0px 0px 4px 4px; 
  border-radius: 0px 4px 4px 0px/5px 5px 4px 4px; 
  background-color: #fff; 
  -webkit-box-shadow: 1px 2px 5px rgba(0,0,0,.09); 
  -moz-box-shadow: 1px 2px 5px rgba(0,0,0,.09); 
  box-shadow: 1px 2px 5px rgba(0,0,0,.09); 
  border: solid 1px #cbc9c9;
  margin-left: -5px;
  margin-top: 13px; 
  padding-left: 10px;
}

input[type=password]{
  margin-bottom: 25px;
}

#icon {
  display: inline-block;
  width: 30px;
  background-color: #3a57af;
  padding: 8px 0px 8px 15px;
  margin-left: 15px;
  -webkit-border-radius: 4px 0px 0px 4px; 
  -moz-border-radius: 4px 0px 0px 4px; 
  border-radius: 4px 0px 0px 4px;
  color: white;
  -webkit-box-shadow: 1px 2px 5px rgba(0,0,0,.09);
  -moz-box-shadow: 1px 2px 5px rgba(0,0,0,.09); 
  box-shadow: 1px 2px 5px rgba(0,0,0,.09); 
  border: solid 0px #cbc9c9;
}

.gender {
  margin-left: 30px;
  margin-bottom: 30px;
}

.accounttype{
  margin-left: 8px;
  margin-top: 20px;
}

button {
  font-size: 14px;
  font-weight: 600;
  color: white;
  padding: 6px 25px 0px 20px;
  margin: 10px 8px 20px 0px;
  display: inline-block;
  float: right;
  text-decoration: none;
  width: 90px; height: 27px; 
  -webkit-border-radius: 5px; 
  -moz-border-radius: 5px; 
  border-radius: 5px; 
  background-color: #3a57af; 
  -webkit-box-shadow: 0 3px rgba(58,87,175,.75); 
  -moz-box-shadow: 0 3px rgba(58,87,175,.75); 
  box-shadow: 0 3px rgba(58,87,175,.75);
  transition: all 0.1s linear 0s; 
  top: 0px;
  position: relative;
}
.inf{
 position: relative;
 bottom: 25px;
    }
button:hover {
  top: 3px;
  background-color:#2e458b;
  -webkit-box-shadow: none; 
  -moz-box-shadow: none; 
  box-shadow: none;
  
}
li{
height: 70px;
}
    </style>
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600' rel='stylesheet' type='text/css'>
<link href="//netdna.bootstrapcdn.com/font-awesome/3.1.1/css/font-awesome.css" rel="stylesheet">
</head>
<body>
   
   <div class="testbox">
    <h1>Registration</h1>
  
    <form action="/Assigment1/user/create" method="post">
        <div class="card" style="width: 18rem;">
            <ul class="list-group list-group-flush">
              <li class="list-group-item">
                <label id="icon" for="email"><i class="bi bi-envelope "></i></label>
                <input type="text" name="email" id="email" placeholder="Email" required/>
              </li>
          
                <c:choose>
                    <c:when test="${!empty email_space }">
                    <small class="text-danger">${email_space }</small>
                    </c:when>
                      <c:when test="${!empty email_length }">
                    <small class="text-danger">${email_length }</small>
                    </c:when>
                      <c:when test="${!empty email_invalid }">
                    <small class="text-danger">${email_invalid}</small>
                    </c:when>
                    </c:choose>
            
              <li class="list-group-item">
                <label id="icon" for="username"><i class="bi bi-person-circle"></i></label>
                <input type="text" name="username" id="username" placeholder="Username" required/>
              </li>
             
                <c:choose>
                    <c:when test="${!empty username_space}">
                    <small class="text-danger">${username_space}</small>
                    </c:when>
                     <c:when test="${!empty username_length}">
                    <small class="text-danger">${username_length}</small>
                    </c:when>
                     <c:when test="${!empty username_exist}">
                    <small class="text-danger">${username_exist}</small>
                    </c:when>
                     <c:when test="${!empty username_overflow}">
                    <small class="text-danger">${username_overflow}</small>
                    </c:when>
                    </c:choose>
            
              <li class="list-group-item">
                <label id="icon" for="password"><i class="bi bi-shield-lock"></i></label>
                <input type="password" name="password" id="password" placeholder="Password" required/>
              </li>
             
                <c:choose>
                    <c:when test="${!empty password_space }">
                    <small class="text-danger">${password_space }</small>
                    </c:when>
                     <c:when test="${!empty password_length }">
                    <small class="text-danger">${password_length}</small>
                    </c:when>
                     <c:when test="${!empty password_invalid}">
                    <small class="text-danger">${password_invalid}</small>
                    </c:when>
                    </c:choose>
              
              <li class="list-group-item">
                <label id="icon" for="sdt"><i class="bi bi-phone-vibrate"></i></label>
                <input type="text" name="sdt" id="sdt" placeholder="Số điện thoại" required/>
              </li>
              <li class="list-group-item">
                <label id="icon" for="diachi"><i class="bi bi-house-fill"></i></label>
                <input type="text" name="diachi" id="diachi" placeholder="Địa chỉ" required/>
              </li>
           
                <c:if test="${!empty diachi_invalid }">
                    <small class="text-danger">${diachi_invalid }</small>
                    </c:if>
                  
            </ul>
        </div>
     <p>By clicking Register, you agree on our <a href="#">terms and condition</a>.</p>
     <button class="button">Register</button>
    </form>
  </div>
</body>
</html>