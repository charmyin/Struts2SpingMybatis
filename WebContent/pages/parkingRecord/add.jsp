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
    <link rel="stylesheet" type="text/css" href="/proj/public/vendors/bootstrap/datetimepicker/css/bootstrap-datetimepicker.css">
    <script type="text/javascript" src="/proj/public/vendors/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="/proj/public/vendors/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/proj/public/vendors/bootstrap/datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
    <script type="text/javascript" src="/proj/public/vendors/bootstrap/datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>
    <link rel='stylesheet' href='/proj/public/vendors/bootstrap/typeahead/typeahead.css' />
    <script type="text/javascript" src="/proj/public/vendors/bootstrap/typeahead/typeahead.bundle.js"></script>
    <script type="text/javascript">
    	
    	$(function(){
    		
    		//时间选择控件
    		$(".form_datetime").datetimepicker({
    			language:"zh-CN",
    	        format: "yyyy-mm-dd hh:ii:ss",
    	        pickerPosition:"top-right"
    	    });
    		
    		
    		
    		//自动填充用户
    		var substringMatcher = function(objs) {
    			  return function findMatches(q, cb) {
    			    var matches, substrRegex;
    			 	//清除原有数据
    			 	$("#inputuseridvalue").val("");
    			    // an array that will be populated with substring matches
    			    matches = [];
    			    
    			    // regex used to determine if a string contains the substring `q`
    			    substrRegex = new RegExp(q, 'i');
    			 
    			    // iterate through the pool of strings and for any string that
    			    // contains the substring `q`, add it to the `matches` array
    			    $.each(objs, function(i, obj) {
    			      if (substrRegex.test(obj.name)) {
    			        // the typeahead jQuery plugin expects suggestions to a
    			        // JavaScript object, refer to typeahead docs for more info
    			        matches.push({ value: obj.name+"--"+obj.loginid ,id:obj.id});
    			      }
    			    });
    			    
    			    cb(matches);
    			    
    			  };
    			};
    			 
    			var states =<c:out value="${typeaheadString}" escapeXml="false"/>
    			 
    			$('#the-basics .typeahead').typeahead({
    			  hint: true,
    			  highlight: true,
    			  minLength: 1
    			 
    			},
    			{
    			  name: 'states',
    			  displayKey: 'value',
    			  source: substringMatcher(states)
    			}).on("typeahead:selected", function(e, obj, name){
    				$("#inputuseridvalue").val(obj.id);
    			}).on("typeahead:closed", function(){
    				var inputownerid = $("#inputuseridvalue").val();
    				if(inputownerid==""){
    					$("#inputuserid").val("");
    				}
    			});
    			
    			
    			
    			//自动填充车位
        		var substringMatcher1 = function(objs) {
        			  return function findMatches(q, cb) {
        			    var matches, substrRegex;
        			 	//清除原有数据
        			 	$("#inputparkingvalue").val("");
        			 	$("#parkingplaceid").val("");
        			    // an array that will be populated with substring matches
        			    matches = [];
        			    
        			    // regex used to determine if a string contains the substring `q`
        			    substrRegex = new RegExp(q, 'i');
        			 
        			    // iterate through the pool of strings and for any string that
        			    // contains the substring `q`, add it to the `matches` array
        			    $.each(objs, function(i, obj) {
        			      if (substrRegex.test(obj.code)) {
        			        // the typeahead jQuery plugin expects suggestions to a
        			        // JavaScript object, refer to typeahead docs for more info
        			        matches.push({ value: obj.code+"--"+obj.carplace ,id:obj.id});
        			      }
        			    });
        			    
        			    cb(matches);
        			    
        			  };
        			};
        			//占用 
        			var states1 =<c:out value="${typeaheadStringParking}" escapeXml="false"/>
        			//未占用
        			var states0 =<c:out value="${typeaheadStringParkingNot}" escapeXml="false"/>
        			
        			function changetypeahead(statusparam){
        				$('#typeaheadparking').typeahead('destroy');
        				//$('#typeaheadparking').typeahead("destory");
        				$('#typeaheadparking').typeahead({
              			  hint: true,
              			  highlight: true,
              			  minLength: 1
              			},
              			{
              			  name: 'carplace',
              			  displayKey: 'value',
              			  source: substringMatcher1(statusparam)
              			}).on("typeahead:selected", function(e, obj, name){
              				$("#parkingplaceid").val(obj.id);
              				
              			}).on("typeahead:closed", function(){
              				var inputownerid = $("#parkingplaceid").val();
              				if(inputownerid==""){
              					$("#typeaheadparking").val("");
              				}
              			});
        			}
        			
        			//初始化为0，展示空车位
        			changetypeahead(states0);
        			

        			$("select").change(function(e){
        				$("#typeaheadparking").val("");
        				$("#parkingplaceid").val("");
        				if($(this).val()=="0"){
        					changetypeahead(states1);
        				}else{
        					changetypeahead(states0);
        				}
        			});
        			
        			//表单提交事件
        			$("form").submit(function(event){
        				if($("#parkingplaceid").val()){
        					return;
        				}else{
        					alert("请输入所属车位！")
           				 	event.preventDefault();
        				}
        				
       				});
    	});
    </script>
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
		  <!-- <div class="form-group">
		    <label for="inputcarid" class="col-sm-4 control-label">车辆信息</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control"  name="parkingRecordVO.carid" id="inputcarid" placeholder="车辆信息">
		    </div>
		  </div> -->
		  <div class="form-group">
		    <label for="inputuserid" class="col-sm-4 control-label">所属业主</label>
		    <div class="col-sm-4">
		      <div id="the-basics">
				  <input class="typeahead form-control" type="text" id="inputuserid" placeholder="所属业主" value="">
				  <input type="hidden" name="parkingRecordVO.userid" id="inputuseridvalue" value="" />
			  </div>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="typeaheadparking" class="col-sm-4 control-label">所在停车位</label>
		    <div class="col-sm-4">
		      <input type="text" class="typeahead form-control" name="" id="typeaheadparking" placeholder="所在停车位">
			  <input type="hidden" name="parkingRecordVO.parkingplaceid" id="parkingplaceid" value="" />
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputinorout" class="col-sm-4 control-label">出库/入库</label>
		    <div class="col-sm-4">
		      <select class="form-control" name="parkingRecordVO.inorout" >
			  		<option value="0" >出库</option>
			  		<option value="1" selected>入库</option>
			  </select>
		    </div>
		  </div>
		 <!--  <div class="form-group">
		    <label for="inputfee" class="col-sm-4 control-label">费用</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control"  name="parkingRecordVO.fee" id="inputfee" placeholder="费用">
		    </div>
		  </div> -->
		  <div class="form-group">
		    <label for="inputhappentime" class="col-sm-4 control-label">出入库时间</label>
		    <div class="col-sm-4">
			    
				
				<div class="input-group date form_datetime" data-date="2015-01-01T00:00:00Z" data-date-format="yyyy-mm-dd hh:ii:ss" data-link-field="dtp_input1">
                    <input class="form-control" size="16" type="text" value="" readonly>
                   <%--  <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span> --%>
					<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                </div>
				<input type="hidden" id="dtp_input1" name="parkingRecordVO.happentime"  value="" /><br/>
				
				
		    	<!-- <input class="datepicker" name="parkingRecordVO.happentime" id="inputhappentime" placeholder="出入库时间"> -->
		     <!--  <input type="text" class="form-control"  name="parkingRecordVO.happentime" id="inputhappentime" placeholder="出入库时间"> -->
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
<%--     <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script> --%>
  </body>
</html>
