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
		  <li class="active">业主管理</li>
	  </ol>

  	<div style="margin:0 10px 0 10px;">

	<div class="panel panel-default">
	  <!-- Default panel contents -->
	  <div class="panel-heading">业主管理
	  <a href="toSave.action" style="float:right;">新增</a>
	  </div>
	
	  <!-- Table -->
      <table class="table">
        <thead>
          <tr>
            <th>#</th>
            <th>用户名</th>
            <th>登录名</th>
            <th>手机</th>
            <th>住址</th>
            <th>操作</th>
          </tr>
        </thead>
        <tbody>
        	<c:set var="count" value="0" scope="page" />
       	 	<c:forEach items="${userList}" var="user">
       	 		<c:set var="count" value="${count + 1}" scope="page"/>
	            <tr>
					<th scope="row">${count}</th>
		            <td>
		            	<c:if test="${null ne user.name && '' ne  user.name}">
							<c:out value="${user.name}" />
						</c:if>
						<c:if test="${null eq user.name}">
							&nbsp;
						</c:if>
		            </td>
		            <td>
		            	<c:if test="${null ne user.loginid && '' ne  user.loginid}">
							<c:out value="${user.loginid}" />
						</c:if>
						<c:if test="${null eq user.loginid}">
							&nbsp;
						</c:if>
		            </td>
		            <td>
		            	<c:if test="${null ne user.phone && '' ne  user.phone}">
							<c:out value="${user.phone}" />
						</c:if>
						<c:if test="${null eq user.phone}">
							&nbsp;
						</c:if>
		            </td>
		            <td>
		            	<c:if test="${null ne user.address && '' ne  user.address}">
							<c:out value="${user.address}" />
						</c:if>
						<c:if test="${null eq user.address}">
							&nbsp;
						</c:if>
		            </td>
		             <td>
		            	<a href="toEdit.action?userId=<c:if test="${null ne user.id && '' ne user.id}"><c:out value="${user.id}" /></c:if>" >修改</a>&nbsp;&nbsp;
		            	<a href="delete.action?userId=<c:if test="${null ne user.id && '' ne user.id}"><c:out value="${user.id}" /></c:if>" >删除</a>
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
