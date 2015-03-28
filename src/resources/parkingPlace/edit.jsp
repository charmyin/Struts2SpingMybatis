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
		  <li><a href="list.action">车位管理</a></li>
		  <li class="active">修改</li>
	  </ol>

  	<div style="margin:0 10px 0 10px;">

	<div class="panel panel-default">
	  <!-- Default panel contents -->
	  <div class="panel-heading">修改车位信息
	  </div>
		
	  <div class="container">

	    <form class="form-horizontal" action="save.action" method="post" style="padding-top:20px;">
	    	
	    	
	      <div class="form-group">
		    <label for="inputcode" class="col-sm-4 control-label">编号</label>
		    <div class="col-sm-4">
		      <input type="hidden" class="form-control"  name="parkingPlaceVO.id" id="inputid" placeholder="用户id" value="<c:if test="${null ne parkingPlaceVO.id && '' ne  parkingPlaceVO.id}"><c:out value="${parkingPlaceVO.id}" /></c:if>">
		      <input type="text" class="form-control"  name="parkingPlaceVO.code" id="inputcode" placeholder="品牌"  value="<c:if test="${null ne parkingPlaceVO.code && '' ne  parkingPlaceVO.code}"><c:out value="${parkingPlaceVO.code}" /></c:if>">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputcarplace" class="col-sm-4 control-label">所在位置</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" name="parkingPlaceVO.carplace" id="inputcarplace" placeholder="所在位置"  value="<c:if test="${null ne parkingPlaceVO.carplace && '' ne  parkingPlaceVO.carplace}"><c:out value="${parkingPlaceVO.carplace}" /></c:if>">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputuserId" class="col-sm-4 control-label">所属业主</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control"  name="parkingPlaceVO.userid" id="inputuserId" placeholder="所属业主"  value="<c:if test="${null ne parkingPlaceVO.userid && '' ne  parkingPlaceVO.userid}"><c:out value="${parkingPlaceVO.userid}" /></c:if>">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputremark" class="col-sm-4 control-label">备注</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control"  name="parkingPlaceVO.remark" id="inputremark" placeholder="备注"  value="<c:if test="${null ne parkingPlaceVO.remark && '' ne  parkingPlaceVO.remark}"><c:out value="${parkingPlaceVO.remark}" /></c:if>">
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
