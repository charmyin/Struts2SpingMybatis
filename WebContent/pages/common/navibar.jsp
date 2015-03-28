<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <!-- Static navbar -->
      <nav class="navbar navbar-default" style="margin-bottom:2px;">
        <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">社区停车场管理系统</a>
          </div>
          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
              <c:if test="${null ne role && 'admin' eq  role}">
              	<li id="userNavBar"><a href="/proj/user/list.action">业主管理</a></li>
              </c:if>
              
              <li id="carNavBar"><a href="/proj/car/list.action">车辆管理</a></li>
              <li id="placeNavBar"><a href="/proj/parkingPlace/list.action">车位管理</a></li>
              <li id="recordNavBar"><a href="/proj/parkingRecord/list.action">停车记录</a></li>
              <!-- <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Dropdown <span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                  <li><a href="#"></a></li>
                  <li><a href="#">车辆管理</a></li>
                  <li><a href="#">车位管理</a></li>
                  <li><a href="#"></a></li>
                  <li class="divider"></li>
                  <li class="dropdown-header">Nav header</li>
                  <li><a href="#">Separated link</a></li>
                  <li><a href="#">One more separated link</a></li>
                </ul>
              </li> -->
            </ul>
            <ul class="nav navbar-nav navbar-right">
             <!--  <li class="active"><a href="./">Default <span class="sr-only">(current)</span></a></li> -->
              <li><a href="/proj/user/loginIndex.action">退出</a></li>
              <!-- <li><a href="../navbar-fixed-top/">Fixed top</a></li> -->
            </ul>
          </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
      </nav>
      
      <script type="text/javascript">
      	$(function(){
      		$("#<c:if test="${null ne navname && '' ne  navname}"><c:out value="${navname}" />NavBar</c:if><c:if test="${null eq navname}">userNavBar</c:if>").addClass("active");
      	});
      	
      </script>