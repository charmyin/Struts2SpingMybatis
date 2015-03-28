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
		  <li><a href="list.action">停车记录管理</a></li>
		  <li class="active">修改</li>
	  </ol>

  	<div style="margin:0 10px 0 10px;">

	<div class="panel panel-default">
	  <!-- Default panel contents -->
	  <div class="panel-heading">修改停车记录
	  </div>
		
	  <div class="container">

	    <form class="form-horizontal" action="save.action" method="post" style="padding-top:20px;">
	      <div class="form-group">
		    <label for="inputplatenumber" class="col-sm-4 control-label">车牌号</label>
		    <div class="col-sm-4">
		   	  <input type="hidden" class="form-control"  name="parkingRecordVO.id" id="inputid" placeholder="用户id" value="<c:if test="${null ne parkingRecordVO.id && '' ne  parkingRecordVO.id}"><c:out value="${parkingRecordVO.id}" /></c:if>">
		      <input type="text" class="form-control"  name="parkingRecordVO.platenumber" id="inputplatenumber" placeholder="车牌号"  value="<c:if test="${null ne parkingRecordVO.id && '' ne  parkingRecordVO.id}"><c:out value="${parkingRecordVO.id}" /></c:if>">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputcarid" class="col-sm-4 control-label">车辆信息</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control"  name="parkingRecordVO.carid" id="inputcarid" placeholder="车辆信息"  value="<c:if test="${null ne parkingRecordVO.carid && '' ne  parkingRecordVO.carid}"><c:out value="${parkingRecordVO.carid}" /></c:if>">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputuserid" class="col-sm-4 control-label">所属业主</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control"  name="parkingRecordVO.userid" id="inputuserid" placeholder="所属业主"  value="<c:if test="${null ne parkingRecordVO.userid && '' ne  parkingRecordVO.userid}"><c:out value="${parkingRecordVO.userid}" /></c:if>">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputparkingparkingplaceid" class="col-sm-4 control-label">所在停车位</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control"  name="parkingRecordVO.parkingparkingplaceid" id="inputparkingparkingplaceid" placeholder="所在停车位"  value="<c:if test="${null ne parkingRecordVO.parkingplaceid && '' ne  parkingRecordVO.parkingplaceid}"><c:out value="${parkingRecordVO.parkingplaceid}" /></c:if>">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputinorout" class="col-sm-4 control-label">出库/入库</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control"  name="parkingRecordVO.inorout" id="inputinorout" placeholder="出库/入库  "  value="<c:if test="${null ne parkingRecordVO.inorout && '' ne  parkingRecordVO.inorout}"><c:out value="${parkingRecordVO.inorout}" /></c:if>">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputfee" class="col-sm-4 control-label">费用</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control"  name="parkingRecordVO.fee" id="inputfee" placeholder="费用"  value="<c:if test="${null ne parkingRecordVO.fee && '' ne  parkingRecordVO.fee}"><c:out value="${parkingRecordVO.fee}" /></c:if>">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputhappentime" class="col-sm-4 control-label">出入库时间</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control"  name="parkingRecordVO.happentime" id="inputhappentime" placeholder="出入库时间"  value="<c:if test="${null ne parkingRecordVO.happentime && '' ne  parkingRecordVO.happentime}"><c:out value="${parkingRecordVO.happentime}" /></c:if>">
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
