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
		  <li class="active">车位管理</li>
	  </ol>

  	<div style="margin:0 10px 0 10px;">

	<div class="panel panel-default">
	  <!-- Default panel contents -->
	  <div class="panel-heading">车位管理
	   <c:if test="${null ne role && 'admin' eq  role}">
				<a href="toSave.action" style="float:right;">新增</a>
	   </c:if>
	  
	  </div>
	
	  <!-- Table -->
      <table class="table">
        <thead>
          <tr>
            <th>#</th>
            <th>车牌号</th>
            
            <th>所属业主</th>
            <th>所在停车位</th>
            <th>出库/入库</th>
            <th>费用</th>
            <th>出入库时间</th>
            <c:if test="${null ne role && 'admin' eq  role}">
				 <th>操作</th>
			</c:if>
          </tr>
        </thead>
        <tbody>
        	<c:set var="count" value="0" scope="page" />
       	 	<c:forEach items="${parkingRecordList}" var="parkingRecord">
       	 		<c:set var="count" value="${count + 1}" scope="page"/>
	            <tr>
					<th scope="row">${count}</th>
		            <td>
		            	<c:if test="${null ne parkingRecord.platenumber && '' ne  parkingRecord.platenumber}">
							<c:out value="${parkingRecord.platenumber}" />
						</c:if>
						<c:if test="${null eq parkingRecord.platenumber}">
							&nbsp;
						</c:if>
		            </td>
		            <td>
		            	<c:if test="${null ne parkingRecord.userName && '' ne  parkingRecord.userName}">
							<c:out value="${parkingRecord.userName}" />(<c:out value="${parkingRecord.userLoginId}" />)
						</c:if>
						<c:if test="${null eq parkingRecord.userName}">
							<strong style="color:red;">外部车辆</strong>
						</c:if>
		            </td>
		            <td>
		            	<c:if test="${null ne parkingRecord.parkingplaceid && '' ne  parkingRecord.parkingplaceid}">
							<c:out value="${parkingRecord.parkingplaceid}" />
						</c:if>
						<c:if test="${null eq parkingRecord.parkingplaceid}">
							&nbsp;
						</c:if>
		            </td>
		            <td>
		            	<c:if test="${ 1 eq parkingRecord.inorout}">
							入库
						</c:if>
						<c:if test="${ 0 eq parkingRecord.inorout}">
							出库
						</c:if>
		            </td>
		            <td>
		            	<c:if test="${null ne parkingRecord.fee && '' ne  parkingRecord.fee}">
							<c:out value="${parkingRecord.fee}" />
						</c:if>
						<c:if test="${null eq parkingRecord.fee}">
							&nbsp;
						</c:if>
		            </td>
		            <td>
		            	<c:if test="${null ne parkingRecord.happentime && '' ne  parkingRecord.happentime}">
		            		<fmt:formatDate value="${parkingRecord.happentime}" var="formattedDate" type="date" pattern="yyyy-MM-dd HH:mm:ss" />
		            		${formattedDate}
						</c:if>
						<c:if test="${null eq parkingRecord.happentime}">
							&nbsp;
						</c:if>
		            </td>
		            <c:if test="${null ne role && 'admin' eq  role}">
						    <td>
				             	<a href="toEdit.action?parkingRecordId=<c:if test="${null ne parkingRecord.id && '' ne parkingRecord.id}"><c:out value="${parkingRecord.id}" /></c:if>" >修改</a>&nbsp;&nbsp;
				            	<a href="delete.action?parkingRecordId=<c:if test="${null ne parkingRecord.id && '' ne parkingRecord.id}"><c:out value="${parkingRecord.id}" /></c:if>" >删除</a>
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
