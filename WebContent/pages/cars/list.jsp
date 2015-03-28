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
		  <li class="active">车辆管理</li>
	  </ol>

  	<div style="margin:0 10px 0 10px;">

	<div class="panel panel-default">
	  <!-- Default panel contents -->
	  <div class="panel-heading">车辆管理
	  <a href="toSave.action" style="float:right;">新增</a>
	  </div>
	
	  <!-- Table -->
      <table class="table">
        <thead>
          <tr>
            <th>#</th>
            <th>车牌号</th>
            <th>品牌</th>
            <th>型号</th>
            <th>所有人</th>
            <th>发动机号</th>
            <th>操作</th>
          </tr>
        </thead>
        <tbody>
        	<c:set var="count" value="0" scope="page" />
       	 	<c:forEach items="${carList}" var="car">
       	 		<c:set var="count" value="${count + 1}" scope="page"/>
	            <tr>
					<th scope="row">${count}</th>
		            <td>
		            	<c:if test="${null ne car.platenumber && '' ne  car.platenumber}">
							<c:out value="${car.platenumber}" />
						</c:if>
						<c:if test="${null eq car.platenumber}">
							&nbsp;
						</c:if>
		            </td>
		            <td>
		            	<c:if test="${null ne car.brand && '' ne  car.brand}">
							<c:out value="${car.brand}" />
						</c:if>
						<c:if test="${null eq car.brand}">
							&nbsp;
						</c:if>
		            </td>
		            <td>
		            	<c:if test="${null ne car.model && '' ne  car.model}">
							<c:out value="${car.model}" />
						</c:if>
						<c:if test="${null eq car.model}">
							&nbsp;
						</c:if>
		            </td>
		            <td>
		            	<c:if test="${null ne car.ownerid && '' ne  car.ownerid}">
							<c:out value="${car.ownerid}" />
						</c:if>
						<c:if test="${null eq car.ownerid}">
							&nbsp;
						</c:if>
		            </td>
		            <td>
		            	<c:if test="${null ne car.enginenumber && '' ne  car.enginenumber}">
							<c:out value="${car.enginenumber}" />
						</c:if>
						<c:if test="${null eq car.enginenumber}">
							&nbsp;
						</c:if>
		            </td>
		             <td>
		            	<a href="toEdit.action?carId=<c:if test="${null ne car.id && '' ne car.id}"><c:out value="${car.id}" /></c:if>" >修改</a>&nbsp;&nbsp;
		            	<a href="delete.action?carId=<c:if test="${null ne car.id && '' ne car.id}"><c:out value="${car.id}" /></c:if>" >删除</a>
		            </td>
	            </tr>
      		</c:forEach>
        </tbody>
      </table>
	</div>

      

    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
