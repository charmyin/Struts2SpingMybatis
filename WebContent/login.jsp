<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!-- <form action="sys/testConnection.action" method="POST" target="_blank">
	<input type="submit" value="测试" />
</form> -->

<!DOCTYPE html>
<html>
  <head>
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
  <!--   <link rel='stylesheet' href='/stylesheets/style.css' /> -->
    <link rel="stylesheet" type="text/css" href="/proj/public/vendors/bootstrap/css/bootstrap.css">
    <script type="text/javascript" src="/proj/public/vendors/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="/proj/public/vendors/bootstrap/js/bootstrap.min.js"></script>
    <style type="text/css">
   		body {
		  padding-top: 40px;
		  padding-bottom: 40px;
		  background-color: #eee;
		}
		
		.form-signin {
		  max-width: 330px;
		  padding: 15px;
		  margin: 0 auto;
		}
		.form-signin .form-signin-heading,
		.form-signin .checkbox {
		  margin-bottom: 10px;
		}
		.form-signin .checkbox {
		  font-weight: normal;
		}
		.form-signin .form-control {
		  position: relative;
		  height: auto;
		  -webkit-box-sizing: border-box;
		     -moz-box-sizing: border-box;
		          box-sizing: border-box;
		  padding: 10px;
		  font-size: 16px;
		}
		.form-signin .form-control:focus {
		  z-index: 2;
		}
		.form-signin input[type="email"] {
		  margin-bottom: -1px;
		  border-bottom-right-radius: 0;
		  border-bottom-left-radius: 0;
		}
		.form-signin input[type="password"] {
		  margin-bottom: 10px;
		  border-top-left-radius: 0;
		  border-top-right-radius: 0;
		}
		h2{
			text-align:center;
		}
    </style>
  </head>
 <body>


     <div class="container">
      <c:if test="${null ne message && '' ne  message}">
      	<div class="alert alert-warning alert-dismissible fade in" role="alert" style="width:50%;margin:0 auto;text-align:center;">
	      <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
	      <strong><c:out value="${message}" /></strong> 
	    </div>
      </c:if>
       <form class="form-signin" method="post" action="/proj/user/login.action">
	        <h2 class="form-signin-heading">欢迎使用车库管理系统</h2>
	        <label for="inputEmail" class="sr-only">账号</label>
	        <input type="text" id="inputEmail" class="form-control" placeholder="账号" name="loginid" required autofocus>	       
	        <label for="inputPassword" class="sr-only">密码</label>
	        <input type="password" id="inputPassword" class="form-control" placeholder="密码" name="password" required>
	        <button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
     	</form>
      </div>
  </body>
</html>
