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
  </head>
 <body>


      <s:include value="../common/navibar.jsp"></s:include>
      
      <!-- 导航条 -->
      <ol class="breadcrumb" style="margin:0 10px 10px 10px;">
		  <li><a href="#">首页</a></li>
		  <li><a href="list.action">业主管理</a></li>
		  <li class="active">新增</li>
	  </ol>

  	<div style="margin:0 10px 0 10px;">

	<div class="panel panel-default">
	  <!-- Default panel contents -->
	  <div class="panel-heading">修改密码
	  </div>
		
	  <div class="container">
			  <c:if test="${null ne message && '' ne  message}">
              		<div class="alert alert-warning alert-dismissible fade in" role="alert" style="width:50%;margin:0 auto;text-align:center;">
				      <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
				      <strong><c:out value="${message}" /></strong> 
				    </div>
              </c:if>
	    <form class="form-horizontal" action="changePwd.action" method="post" style="padding-top:20px;">
		  <div class="form-group">
		    <label for="inputname" class="col-sm-4 control-label">旧密码</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" name="password" id="inputname" placeholder="旧密码">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputloginid" class="col-sm-4 control-label">新密码</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control"  name="newPassword" id="inputloginid" placeholder="新密码">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputphone" class="col-sm-4 control-label">确认新密码</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control"  name="newPassword1" id="inputphone" placeholder="确认新密码">
		    </div>
		  </div>
		  <div class="form-group">
		    <div class="col-sm-offset-5 col-sm-10">
		      <button type="submit" class="btn btn-primary">保存</button>
		      <a href="javascript:history.go(-1)" class="btn btn-danger">取消</a>
		    </div>
		  </div>
		</form>

   	  </div> <!-- /container -->
	  
	</div>

      

    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
