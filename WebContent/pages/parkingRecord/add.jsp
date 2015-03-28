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
		  <li class="active">新增</li>
	  </ol>

  	<div style="margin:0 10px 0 10px;">

	<div class="panel panel-default">
	  <!-- Default panel contents -->
	  <div class="panel-heading">新增停车记录
	  </div>
		
	  <div class="container">

	    <form class="form-horizontal" action="save.action" method="post" style="padding-top:20px;">
	      <div class="form-group">
		    <label for="inputplatenumber" class="col-sm-4 control-label">车牌号</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control"  name="parkingRecordVO.platenumber" id="inputplatenumber" placeholder="车牌号">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputcarid" class="col-sm-4 control-label">车辆信息</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control"  name="parkingRecordVO.carid" id="inputcarid" placeholder="车辆信息">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputuserid" class="col-sm-4 control-label">所属业主</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control"  name="parkingRecordVO.userid" id="inputuserid" placeholder="所属业主">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputparkingplaceid" class="col-sm-4 control-label">所在停车位</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control"  name="parkingRecordVO.parkingplaceid" id="inputparkingplaceid" placeholder="所在停车位">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputinorout" class="col-sm-4 control-label">出库/入库</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control"  name="parkingRecordVO.inorout" id="inputinorout" placeholder="出库/入库">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputfee" class="col-sm-4 control-label">费用</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control"  name="parkingRecordVO.fee" id="inputfee" placeholder="费用">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputhappentime" class="col-sm-4 control-label">出入库时间</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control"  name="parkingRecordVO.happentime" id="inputhappentime" placeholder="出入库时间">
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
