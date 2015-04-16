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
		  <li class="active">停车记录管理</li>
	  </ol>

  	<div style="margin:0 10px 0 10px;">

	<div class="panel panel-default">
	  <!-- Default panel contents -->
	  <div class="panel-heading">停车记录管理
	  <c:if test="${null ne role && 'admin' eq  role}">
		 <a href="toSave.action" style="float:right;">新增</a>
	  </c:if>
	 
	  </div>
	
	  <!-- Table -->
      <table class="table">
        <thead>
          <tr>
            <th>#</th>
            <th>车位编号</th>
            <th>所在位置</th>
            <th>所属业主</th>
            <th>状态</th>
            <th>备注</th>
            <c:if test="${null ne role && 'admin' eq  role}">
				 <th>操作</th>
			</c:if>
          </tr>
        </thead>
        <tbody>
        	<c:set var="count" value="0" scope="page" />
       	 	<c:forEach items="${parkingPlaceList}" var="parkingPlace">
       	 		<c:set var="count" value="${count + 1}" scope="page"/>
	            <tr>
					<th scope="row">${count}</th>
		            <td>
		            	<c:if test="${null ne parkingPlace.code && '' ne  parkingPlace.code}">
							<c:out value="${parkingPlace.code}" />
						</c:if>
						<c:if test="${null eq parkingPlace.code}">
							&nbsp;
						</c:if>
		            </td>
		            <td>
		            	<c:if test="${null ne parkingPlace.carplace && '' ne  parkingPlace.carplace}">
							<c:out value="${parkingPlace.carplace}" />
						</c:if>
						<c:if test="${null eq parkingPlace.carplace}">
							&nbsp;
						</c:if>
		            </td>
		            <td>
		            	<c:if test="${null ne parkingPlace.userName && '' ne  parkingPlace.userName}">
							<c:out value="${parkingPlace.userName}" />(<c:out value="${parkingPlace.userLoginId}" />)
						</c:if>
						<c:if test="${null eq parkingPlace.userName}">
							<strong style="color:red;">无所属业主</strong>
						</c:if>
		            </td>
		             <td>
		            	<c:if test="${'1' eq parkingPlace.status}">
							<strong style="color:red;">占用</strong>
						</c:if>
						<c:if test="${0 eq parkingPlace.status}">
							<strong style="color:green;">空车位</strong>
						</c:if>
					 </td>
		            <td>
		            	<c:if test="${null ne parkingPlace.remark && '' ne  parkingPlace.remark}">
							<c:out value="${parkingPlace.remark}" />
						</c:if>
						<c:if test="${null eq parkingPlace.remark}">
							&nbsp;
						</c:if>
		            </td>
		            <c:if test="${null ne role && 'admin' eq  role}">
						<td>
			            	<a href="toEdit.action?parkingPlaceId=<c:if test="${null ne parkingPlace.id && '' ne parkingPlace.id}"><c:out value="${parkingPlace.id}" /></c:if>" >修改</a>&nbsp;&nbsp;
			            	<a href="delete.action?parkingPlaceId=<c:if test="${null ne parkingPlace.id && '' ne parkingPlace.id}"><c:out value="${parkingPlace.id}" /></c:if>" >删除</a>
			            </td>
					</c:if>
		             
	            </tr>
      		</c:forEach>
        </tbody>
      </table>
	</div>

      

    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Recordd at the end of the document so the pages load faster -->

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
