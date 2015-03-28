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
		  <li><a href="list.action">车辆管理</a></li>
		  <li class="active">修改</li>
	  </ol>

  	<div style="margin:0 10px 0 10px;">

	<div class="panel panel-default">
	  <!-- Default panel contents -->
	  <div class="panel-heading">修改车辆信息
	  </div>
		
	  <div class="container">

	    <form class="form-horizontal" action="save.action" method="post" style="padding-top:20px;">
	    	
	      <div class="form-group">
		    <label for="inputplatenumber" class="col-sm-4 control-label">车牌号</label>
		    <div class="col-sm-4">
		      <input type="hidden" class="form-control"  name="carVO.id" id="inputid" placeholder="用户id" value="<c:if test="${null ne carVO.id && '' ne  carVO.id}"><c:out value="${carVO.id}" /></c:if>">
		      <input type="text" class="form-control" name="carVO.platenumber" id="inputplatenumber" placeholder="车牌号" value="<c:if test="${null ne carVO.platenumber && '' ne  carVO.platenumber}"><c:out value="${carVO.platenumber}" /></c:if>">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputbrand" class="col-sm-4 control-label">品牌</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control"  name="carVO.brand" id="inputbrand" placeholder="品牌"  value="<c:if test="${null ne carVO.brand && '' ne  carVO.brand}"><c:out value="${carVO.brand}" /></c:if>">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputmodel" class="col-sm-4 control-label">型号</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control"  name="carVO.model" id="inputmodel" placeholder="型号"  value="<c:if test="${null ne carVO.model && '' ne  carVO.model}"><c:out value="${carVO.model}" /></c:if>">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputownerid" class="col-sm-4 control-label">所有人</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control"  name="carVO.ownerid" id="inputownerid" placeholder="所有人"  value="<c:if test="${null ne carVO.ownerid && '' ne  carVO.ownerid}"><c:out value="${carVO.ownerid}" /></c:if>">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputenginenumber" class="col-sm-4 control-label">发动机号</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control"  name="carVO.enginenumber" id="inputenginenumber" placeholder="发动机号"  value="<c:if test="${null ne carVO.enginenumber && '' ne  carVO.enginenumber}"><c:out value="${carVO.enginenumber}" /></c:if>">
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
